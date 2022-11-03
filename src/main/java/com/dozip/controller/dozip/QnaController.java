package com.dozip.controller.dozip;

import com.dozip.service.dozip.qna.QnaService;
import com.dozip.vo.QnaVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/dozip/*")
public class QnaController {
    @Autowired
    private QnaService qnaService;

    @GetMapping("qna_write") //(관리자)문의글 작성 페이지 이동
    public String qnaWrite(){ return "/dozip/counsel/counsel_write"; }

    @GetMapping("pqna_write") //업체 문의글 작성 페이지 이동
    public String pqnaWrite(){ return "/dozip/counsel/counsel_partner_write"; }

    @GetMapping("find_partners") //문의글 - 업체 검색 리스트
    public ModelAndView findPartners(ModelAndView mv) {
        List<String> list = new ArrayList<String>();
        list = this.qnaService.getPartners();
        mv.addObject("list",list);
        mv.setViewName("/dozip/counsel/counsel_find_partner");
        return mv;
    }

    //문의글 등록 완료
    @RequestMapping(value = "qna_write_ok",  method = RequestMethod.POST, produces = "application/json")
    public void qnaWriteOK(QnaVO q, HttpSession session) throws Exception {
        q.setMem_id((String)session.getAttribute("id"));

        if(q.getBusinessName()!=null){ //업체문의 등록시 businessNum 가져옴
            q.setBusinessNum(this.qnaService.getBnum(q.getBusinessName()));
        }

        this.qnaService.insertQna(q); //문의글 등록
    }

    @GetMapping("counsel_main") //문의메인페이지 이동
    public ModelAndView counselMain(ModelAndView mv, QnaVO q, HttpServletRequest request, HttpSession session){
        q.setMem_id((String)session.getAttribute("id"));

        if(q.getMem_id()!=null) {
            //쪽나누기
            int page = 1; //현재 쪽번호
            int limit = 5; //한 페이지에 보여지는 개수

            if (request.getParameter("page") != null) {
                page = Integer.parseInt(request.getParameter("page"));
            }

            int listcount = this.qnaService.getListCount(q.getMem_id());
            int maxpage = (int) ((double) listcount / limit + 0.95); //총페이지
            int startpage = (((int) ((double) page / 5 + 0.9)) - 1) * 5 + 1; //시작페이지
            int endpage = maxpage; //마지막페이지

            if (endpage > startpage + 5 - 1) endpage = startpage + 5 - 1;

            mv.addObject("page", page);
            mv.addObject("startpage", startpage);
            mv.addObject("endpage", endpage);
            mv.addObject("maxpage", maxpage);
            mv.addObject("listcount", listcount);

            //문의 리스트 출력(관리자)
            List<QnaVO> qlist = new ArrayList<QnaVO>();
            q.setStartrow((page - 1) * 5 + 1);
            q.setEndrow(q.getStartrow() + limit - 1);
            qlist = this.qnaService.getQlist(q);
            mv.addObject("qlist", qlist);
        }
        mv.setViewName("/dozip/counsel/counsel_main");
        return mv;
    }

    @GetMapping("my_qna") //마이페이지-관리자 문의글 목록
    public ModelAndView myQna(ModelAndView mv, QnaVO q, HttpServletRequest request, HttpSession session) throws Exception {

        String id = (String)session.getAttribute("id");

        //쪽나누기
        int page = 1; //현재 쪽번호
        int limit = 5; //한 페이지에 보여지는 개수

        if(request.getParameter("page")!=null) {
            page=Integer.parseInt(request.getParameter("page"));
        }

        int listcount=this.qnaService.getListCount(id); //문의글(관리자) 개수확인
        int maxpage = (int)((double)listcount/limit+0.95); //총페이지
        int startpage = (((int)((double)page/5+0.9))-1)*5+1; //시작페이지
        int endpage = maxpage; //마지막페이지

        if(endpage>startpage+5-1) endpage=startpage+5-1;

        mv.addObject("page", page);
        mv.addObject("startpage", startpage);
        mv.addObject("endpage",endpage);
        mv.addObject("maxpage",maxpage);
        mv.addObject("listcount",listcount);

        //문의 리스트 출력(관리자)
        List<QnaVO> qlist = new ArrayList<QnaVO>();
        q.setMem_id(id);
        q.setStartrow((page-1)*5+1);
        q.setEndrow(q.getStartrow()+limit-1);
        qlist = this.qnaService.getQlist(q); //문의글(관리자) 리스트
        mv.addObject("qlist", qlist);

        mv.setViewName("/dozip/mypage/mypage_qna");
        return mv;
    }

    @GetMapping("my_Pqna") //마이페이지-업체 문의글 목록
    public ModelAndView myPQna(ModelAndView mv, QnaVO q, HttpServletRequest request) throws Exception {
        HttpSession session=request.getSession();
        String id = (String)session.getAttribute("id");

        //쪽나누기
        int page = 1; //현재 쪽번호
        int limit = 5; //한 페이지에 보여지는 개수

        if(request.getParameter("page")!=null) {
            page=Integer.parseInt(request.getParameter("page"));
        }

        int listcount=this.qnaService.getPListCount(id);
        int maxpage = (int)((double)listcount/limit+0.95); //총페이지
        int startpage = (((int)((double)page/5+0.9))-1)*5+1; //시작페이지
        int endpage = maxpage; //마지막페이지

        if(endpage>startpage+5-1) endpage=startpage+5-1;

        mv.addObject("page", page);
        mv.addObject("startpage", startpage);
        mv.addObject("endpage",endpage);
        mv.addObject("maxpage",maxpage);
        mv.addObject("listcount",listcount);

        //문의 리스트 출력(업체)
        List<QnaVO> qlist = new ArrayList<QnaVO>();
        q.setMem_id(id);
        q.setStartrow((page-1)*5+1);
        q.setEndrow(q.getStartrow()+limit-1);
        qlist = this.qnaService.getPlist(q);
        mv.addObject("qlist", qlist);

        mv.setViewName("/dozip/mypage/mypage_Pqna");
        return mv;
    }


}
