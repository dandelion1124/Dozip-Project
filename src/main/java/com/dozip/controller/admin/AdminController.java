package com.dozip.controller.admin;

import com.dozip.service.admin.AdminMemService;
import com.dozip.service.dozip.qna.QnaService;
import com.dozip.service.partners.customer.CustomerService;
import com.dozip.utils.Paging;
import com.dozip.vo.MemberVO;
import com.dozip.vo.PartnersVO;
import com.dozip.vo.QnaVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.Banner;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

    @Autowired
    private QnaService qnaService;
    @Autowired
    private CustomerService customerService;
    @Autowired
    private AdminMemService adminMemService;

    @RequestMapping(value = "/")
    public String dozip(){
        return "/admin/index";
    };

    @RequestMapping(value = "mem") //전체 고객 리스트 불러오기
    public ModelAndView admin(MemberVO m) {
        List<MemberVO>mlist = new ArrayList<>();
        mlist = this.adminMemService.getMemList(); //회원 리스트

        ModelAndView mv = new ModelAndView();
        mv.addObject("mlist",mlist);
        mv.setViewName("/admin/memberList");
        return mv;
    }
    @RequestMapping(value = "part")
    public ModelAndView part(PartnersVO p){
        List<PartnersVO>plist = new ArrayList<>();
        plist = this.adminMemService.getPartList(); //파트너스 리스트

        ModelAndView mv = new ModelAndView();
        mv.addObject("plist",plist);
        mv.setViewName("/admin/memberList");
        return mv;
    }
    @RequestMapping(value = "mem_del") //해당 회원 삭제시키기
    public ModelAndView mdel(ModelAndView mv,HttpServletRequest request){
        String mem_id = request.getParameter("mem_id");
        this.adminMemService.delMem(mem_id);

        return new ModelAndView("redirect:/admin/mem");
    }

    @RequestMapping(value = "write")
    public String write(){return "/admin/writingList";}

    @RequestMapping("contract")
    public String contract(){return "/admin/contractList";}

    @RequestMapping("qna")
    public ModelAndView qna(HttpServletRequest request, HttpSession session){
        ModelAndView mv = new ModelAndView();
        QnaVO q = new QnaVO();
        q.setMem_id((String)session.getAttribute("id"));

        Paging paging;
        if(q.getMem_id()!=null) { //로그인이 된 상태면 문의글 보여줌
            int count = this.qnaService.adminQnaCount();
            if(request.getParameter("page") == null) {
                paging = new Paging(1, 15, count);
            }else{
                int page = Integer.parseInt(request.getParameter("page"));
                paging = new Paging(page, 15, count);
            }
            mv.addObject("p",paging);

            //문의 리스트 출력(관리자)
            List<QnaVO> qlist = new ArrayList<>();
            q.setStartrow(paging.getStartrow());
            q.setEndrow(paging.getEndrow());
            qlist = this.qnaService.adminQnaList(q);
            mv.addObject("qlist", qlist);
        }

        mv.setViewName("/admin/qnaList");
        return mv;
    }

    @RequestMapping("qna_cont")
    public ModelAndView selectQna(int qna_no){
        ModelAndView mv = new ModelAndView();
        QnaVO q = this.qnaService.getQan(qna_no);
        mv.addObject("q", q);
        //q.setQna_cont(q.getQna_cont().replace("\r\n","<br/>"));
        mv.setViewName("/admin/qna_detail");
        return mv;
    }

    @PostMapping("admin_qnaReply")
    public void adminQnaReply(QnaVO q){
        int result = customerService.insertQna(q);
        if(result==1) {
            System.out.println("답글작성 성공");
        }
    }
}
