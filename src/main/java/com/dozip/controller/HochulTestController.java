package com.dozip.controller;

import com.dozip.service.DozipService;
import com.dozip.service.PartnersService;
import com.dozip.vo.BidVO;
import com.dozip.vo.EstimateVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.List;

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

    @RequestMapping(value = "/estimate_list")
    public String estimate_list(Model model) {  // 견적목록
        //est_check 이 대기중이 아니라면 견적 목록 가져옴
        List<EstimateVO> elist = partnersService.getAllEstList();
        //bid_state 이 계약요청인 목록을 가져옴 (견적서의 기본키와 1:1 매칭됨)
        List<BidVO> blist = partnersService.getBidList();
        model.addAttribute("blist",blist);
        model.addAttribute("elist",elist);
        return "/partners/estimate/estimate_list";
    }

    @RequestMapping("/write_contract") //계약서 보기
    public String write_contract(int est_num,EstimateVO ev, Model model){
        /* 계약서에 담을 내용들을 불러와서 model 객체에 담아야함 */

        //est_num, 계약 요청 기준으로 select
        ev=partnersService.write_contract(est_num);
        model.addAttribute("ev", ev);

     return "/partners/estimate/contract";  //계약서 view 페이지
    }

    @PostMapping("/write_contract_ok")
    public String write_contract_ok(){
        //계약서 테이블에 정보 저장후. 계약 완료로 변경해야함

        return null;
    }



}