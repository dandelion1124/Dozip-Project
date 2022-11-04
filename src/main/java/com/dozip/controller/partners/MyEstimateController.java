package com.dozip.controller.partners;

import com.dozip.service.partners.myEstimate.MyEstimateService;
import com.dozip.vo.BidVO;
import com.dozip.vo.ContractVO;
import com.dozip.vo.EstimateVO;
import com.dozip.vo.PayVO;
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
import java.util.List;

@Controller
@RequestMapping("partners/*")
public class MyEstimateController {
    @Autowired
    MyEstimateService myEstimateService;


    /*견적 관리
     *
     *
     *  */

    @RequestMapping(value = "/estimate_list")
    public ModelAndView estimate_list(HttpSession session) {  // 견적목록
        String businessNum =(String)session.getAttribute("businessNum");
        //est_check 이 대기중이 아니라면 견적 목록 가져옴
        List<EstimateVO> elist = myEstimateService.getAllEstList(businessNum);
        List<ContractVO> clist = myEstimateService.getContractList(businessNum);
        List<PayVO> plist = myEstimateService.getpayList(businessNum);
        ModelAndView mv = new ModelAndView("/partners/estimate/estimate_list");
        System.out.println(elist);
        System.out.println(elist.size());
        System.out.println("=======================");
        System.out.println(clist);
        System.out.println(clist.size());
        System.out.println("=======================");
        System.out.println(plist);

        mv.addObject("plist",plist);
        mv.addObject("clist",clist);
        mv.addObject("elist",elist);
        return mv;
    }
    @RequestMapping("/detail") //견적 상세정보
    public ModelAndView estimate_detail(@RequestParam String est_num){
        BidVO bv=myEstimateService.getOneBid(est_num);
        EstimateVO ev=myEstimateService.getOneEst(est_num);

        ModelAndView mv = new ModelAndView("/partners/estimate/estimate_detail");
        mv.addObject("bv", bv);
        mv.addObject("ev", ev);
        return mv;
    }

    @RequestMapping("/write_contract") //계약서 보기
    public String write_contract(String est_num, EstimateVO ev, Model model, HttpSession session){
        /* 계약서에 담을 내용들을 불러와서 model 객체에 담아야함 */
        System.out.println(est_num);
        String businessNum = (String)session.getAttribute("businessNum");
        //est_num, 계약 요청 기준으로 select
        ev=myEstimateService.write_contract(est_num);
        ev.setEst_start(ev.getEst_start().substring(0,10));
        ev.setEst_end(ev.getEst_end().substring(0,10));
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
        System.out.println(cv.getCont_cost1());

        cv.setCont_area(cv.getCont_area().replaceAll(",",""));
        cv.setCont_total(cv.getCont_total().replaceAll(",",""));
        cv.setCont_cost1(cv.getCont_cost1().replaceAll(",",""));
        cv.setCont_cost2(cv.getCont_cost2().replaceAll(",",""));
        cv.setCont_cost3(cv.getCont_cost3().replaceAll(",",""));

        cv.setCustomer_number(" ");
        int result=myEstimateService.insertContract(cv);
        resultMap.put("status", result);
//        resultMap.put("status", "안녕하세요");
        return resultMap;
    }
}
