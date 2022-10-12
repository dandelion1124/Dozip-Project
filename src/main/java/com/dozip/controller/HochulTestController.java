package com.dozip.controller;

import com.dozip.service.PartnersService;
import com.dozip.vo.QnaVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.List;

@Controller
@RequestMapping("/partners/*")
public class HochulTestController {
    @Autowired
    private PartnersService partnersService;

    @GetMapping("/test_upload")
    public String test() {
        return "/partners/portfolio/p_upload_photo";
    }

    //파트너스 비번찾기
    @PostMapping("/partners_findpwd")
    public String partners_findpwd(String findpwd_business_num, String findpwd_pId, String findpwd_pName,
                                   HttpServletResponse response) throws Exception {
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();

        out.println("<script>");
        out.println("alert('Spring 코드로 바꿀예정입니다')");
        out.println("location='/partners/main'");
        out.println("</script>");

        return null;
    }//partners_findpwd()

    //고객문의글 답변

    @ResponseBody
    @PostMapping("/customer_reply_ok")
    public String customer_reply_ok(HttpSession session, QnaVO qv) {
        qv.setBusinessNum((String) session.getAttribute("business_num")); //사업자번호
        qv.setQna_title(" "); //마이바티스 널값 insert 시 오류로 인해 추가

        int result=partnersService.insertQna(qv);
        System.out.println(result);

        return null;
    }//customer_reply_ok


    //고객문의글 삭제
    @ResponseBody
    @GetMapping("/customer_qna_del_ok")
    public String customer_qna_del_ok(QnaVO dv){
        int result=partnersService.deleteReply(dv);

        int r = partnersService.selqnaRef(dv);
        if(r==1){
            partnersService.returnState(dv);
        }
        System.out.println(result);

        return null;
        /*
        삭제시 아작스 실행 확인해야함
        
        
        
         */
    }//customer_qna_del_ok()

}
