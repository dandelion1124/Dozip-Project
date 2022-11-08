package com.dozip.controller.partners;

import com.dozip.service.dozip.member.MemberService;
import com.dozip.service.partners.partner.PartnerService;
import com.dozip.vo.ContractVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@Controller
@RequestMapping("partners/*")
//@RequestMapping("/dozip/*")
public class HochulTestController {
 

    @Autowired
    private PartnerService partnerService;

    @Autowired
    private MemberService memberService;
    private String schemaFilePath;

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


    @RequestMapping("/load_info")
    public String load_info(Model model, HttpSession session) {

        //파트너스 번호로 계약서 불러오기
        String businessNum = (String) session.getAttribute("businessNum");

        List<ContractVO> clist = partnerService.getContractList_port(businessNum);

        System.out.println(clist);
        model.addAttribute("clist", clist);
        return "/partners/portfolio/load_info";
    }
}