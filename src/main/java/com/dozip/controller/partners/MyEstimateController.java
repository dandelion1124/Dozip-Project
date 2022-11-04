package com.dozip.controller.partners;

import com.dozip.service.partners.myEstimate.MyEstimateService;
import com.dozip.vo.ContractVO;
import com.dozip.vo.EstimateVO;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.HashMap;

@Controller
@RequestMapping("partners/*")
public class MyEstimateController {
    @Autowired
    MyEstimateService myEstimateService;
    /*
    견적목록
     */
    @RequestMapping(value = "/estimate_list")
    public ModelAndView estimate_list(HttpSession session) {  // 견적목록보기
        String businessNum =(String)session.getAttribute("businessNum");

        ModelAndView mv = new ModelAndView("/partners/estimate/estimate_list");

        mv.addObject("plist",myEstimateService.getpayList(businessNum)); //EstimateVO
        mv.addObject("clist",myEstimateService.getContractList(businessNum)); //ContractVO
        mv.addObject("elist",myEstimateService.getAllEstList(businessNum)); //PayVO
        return mv;
    }
    
    @RequestMapping("/detail") //견적 상세정보
    public ModelAndView estimate_detail(@RequestParam String est_num){
        ModelAndView mv = new ModelAndView("/partners/estimate/estimate_detail");
        mv.addObject("bv", myEstimateService.getOneBid(est_num)); //BidVO
        mv.addObject("ev", myEstimateService.getOneEst(est_num)); //EstimateVO
        return mv;
    }

    @RequestMapping("/write_contract") //계약서 보기
    public String write_contract(String est_num, EstimateVO ev, Model model, HttpSession session){

        ev=myEstimateService.write_contract(est_num);
        ev.setEst_start(ev.getEst_start().substring(0,10)); //view 에서 가공해도됨
        ev.setEst_end(ev.getEst_end().substring(0,10));
        model.addAttribute("ev", ev);
        model.addAttribute("businessNum",(String)session.getAttribute("businessNum"));
        return "/partners/estimate/contract";
    }

    @RequestMapping("/write_contract_ok") //계약서 작성 확인메서드
    @ResponseBody
    public HashMap<String, Object> write_contract_ok(@RequestParam String data) throws Exception {

        HashMap<String, Object> resultMap = new HashMap<>();
        //계약서 테이블에 정보 저장후. 계약 완료로 변경해야함

        //고객정보는 안넣어야함
        ObjectMapper mapper = new ObjectMapper();
        ContractVO cv = mapper.readValue(data, ContractVO.class);

        cv.setCont_area(cv.getCont_area().replaceAll(",",""));
        cv.setCont_total(cv.getCont_total().replaceAll(",",""));
        cv.setCont_cost1(cv.getCont_cost1().replaceAll(",",""));
        cv.setCont_cost2(cv.getCont_cost2().replaceAll(",",""));
        cv.setCont_cost3(cv.getCont_cost3().replaceAll(",",""));
        cv.setCustomer_number(" ");

        int result=myEstimateService.insertContract(cv);
        resultMap.put("status", result);

        return resultMap;
    }
}
