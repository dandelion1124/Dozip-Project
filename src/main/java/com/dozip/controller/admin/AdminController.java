package com.dozip.controller.admin;

import com.dozip.service.dozip.qna.QnaService;
import com.dozip.service.partners.customer.CustomerService;
import com.dozip.utils.Paging;
import com.dozip.vo.QnaVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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

    @RequestMapping(value = "/")
    public String dozip(){
        return "/admin/index";
    };

    @RequestMapping(value = "mem")
    public String admin() {return "/admin/memberList";}

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
