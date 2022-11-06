package com.dozip.controller.dozip;

import com.dozip.service.dozip.qna.QnaService;
import com.dozip.utils.Paging;
import com.dozip.vo.QnaVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
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
    @RequestMapping(value = "qna_write_ok")
    @ResponseBody
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

        Paging paging;
        if(q.getMem_id()!=null) { //로그인이 된 상태면 문의글 보여줌
            int count = this.qnaService.getListCount(q.getMem_id());
            if(request.getParameter("page") == null) {
                paging = new Paging(1, 5, count);
            }else{
                int page = Integer.parseInt(request.getParameter("page"));
                paging = new Paging(page, 5, count);
            }
            mv.addObject("p",paging);

            //문의 리스트 출력(관리자)
            List<QnaVO> qlist = new ArrayList<QnaVO>();
            q.setStartrow(paging.getStartrow());
            q.setEndrow(paging.getEndrow());
            qlist = this.qnaService.getQlist(q);
            mv.addObject("qlist", qlist);
        }
        mv.setViewName("/dozip/counsel/counsel_main");
        return mv;
    }

    @GetMapping("my_qna") //마이페이지-관리자 문의글 목록
    public ModelAndView myQna(ModelAndView mv, QnaVO q, HttpServletRequest request, HttpSession session) throws Exception {
        String id = (String)session.getAttribute("id");
        int count=this.qnaService.getListCount(id);

        Paging paging;
        if(request.getParameter("page") == null) {
            paging = new Paging(1, 5, count);
        }else{
            int page = Integer.parseInt(request.getParameter("page"));
            paging = new Paging(page, 5, count);
        }
        mv.addObject("p",paging);

        //문의 리스트 출력(관리자)
        List<QnaVO> qlist = new ArrayList<QnaVO>();
        q.setMem_id(id);
        q.setStartrow(paging.getStartrow());
        q.setEndrow(paging.getEndrow());
        qlist = this.qnaService.getQlist(q); //문의글(관리자) 리스트
        mv.addObject("qlist", qlist);

        mv.setViewName("/dozip/mypage/mypage_qna");
        return mv;
    }

    @GetMapping("my_Pqna") //마이페이지-업체 문의글 목록
    public ModelAndView myPQna(ModelAndView mv, QnaVO q, HttpServletRequest request, HttpSession session) throws Exception {
        String id = (String)session.getAttribute("id");
        int count=this.qnaService.getPListCount(id);

        Paging paging;
        if(request.getParameter("page") == null) {
            paging = new Paging(1, 5, count);
        }else{
            int page = Integer.parseInt(request.getParameter("page"));
            paging = new Paging(page, 5, count);
        }
        mv.addObject("p",paging);

        //문의 리스트 출력(업체)
        List<QnaVO> qlist = new ArrayList<QnaVO>();
        q.setMem_id(id);
        q.setStartrow(paging.getStartrow());
        q.setEndrow(paging.getEndrow());
        qlist = this.qnaService.getPlist(q);
        mv.addObject("qlist", qlist);

        mv.setViewName("/dozip/mypage/mypage_Pqna");
        return mv;
    }

    @RequestMapping("select_qna/{qna_no}") //문의글 내용확인
    @ResponseBody
    public QnaVO selectQna(@PathVariable("qna_no") int qna_no){
        QnaVO q = this.qnaService.getQan(qna_no);
        //q.setQna_cont(q.getQna_cont().replace("\r\n","<br/>"));
        System.out.println("qna확인"+q);
        return q;
    }
}
