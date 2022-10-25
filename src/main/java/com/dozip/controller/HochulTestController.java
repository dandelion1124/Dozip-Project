package com.dozip.controller;

import com.dozip.service.DozipService;
import com.dozip.service.PartnersService;
import com.dozip.vo.BidVO;
import com.dozip.vo.ContractVO;
import com.dozip.vo.EstimateVO;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Objects;

@Controller
@RequestMapping("/partners/*")
//@RequestMapping("/dozip/*")
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



    @RequestMapping("/write_contract") //계약서 보기
    public String write_contract(int est_num, EstimateVO ev, Model model, HttpSession session){
        /* 계약서에 담을 내용들을 불러와서 model 객체에 담아야함 */
        String businessNum = (String)session.getAttribute("businessNum");
        //est_num, 계약 요청 기준으로 select
        ev=partnersService.write_contract(est_num);
        model.addAttribute("ev", ev);
        model.addAttribute("businessNum",businessNum);

     return "/partners/estimate/contract";  //계약서 view 페이지
    }

    @RequestMapping("/write_contract_ok") //계약서 작성 확인메서드
    @ResponseBody
    public HashMap<String, Object> write_contract_ok(@RequestParam String data) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<>();
        //계약서 테이블에 정보 저장후. 계약 완료로 변경해야함
        //고객정보는 안넣어야함
        ObjectMapper mapper = new ObjectMapper();
        ContractVO cv = mapper.readValue(data, ContractVO.class);
        cv.setCustomer_number(" ");
        int result=partnersService.insertContract(cv);
        resultMap.put("status", result);
//        resultMap.put("status", "안녕하세요");
        return resultMap;
    }

    @RequestMapping("load_info")
    public String load_info(Model model) {
        model.addAttribute("cost", 40);
        return "/partners/portfolio/load_info";
    }
}