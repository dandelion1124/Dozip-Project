package com.dozip.controller;

import com.dozip.service.DozipService;
import com.dozip.service.PartnersService;
import com.dozip.vo.EstimateVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

@Controller
//@RequestMapping("/partners/*")
@RequestMapping("/dozip/*")
public class HochulTestController {
    @Autowired
    private PartnersService partnersService;

    @Autowired
    private DozipService dozipService;

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


    @RequestMapping("/test")
    public String p_upload_photo() {
        return "/partners/portfolio/p_upload_photo";
    }


    @RequestMapping(value = "/estimate_list")
    public String estimate_list(EstimateVO ev, Model model) {  // 견적목록














        return "/partners/estimate/estimate_list";
    }



}