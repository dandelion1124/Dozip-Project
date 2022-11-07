package com.dozip.controller.dozip.mypage;

import com.dozip.service.dozip.contract.ContractService;
import com.dozip.service.dozip.pay.PayService;
import com.dozip.service.partners.estimate.BiddingService;
import com.dozip.service.partners.estimate.EstService;
import com.dozip.service.partners.myEstimate.MyEstimateService;
import com.dozip.utils.Paging;
import com.dozip.vo.ContractVO;
import com.dozip.vo.EstimateVO;
import com.dozip.vo.PayVO;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/dozip/*")
public class ContractController {
    @Autowired
    private ContractService contractService;
    @Autowired
    private PayService payService;
    @Autowired
    MyEstimateService myEstimateService;
    @Autowired
    BiddingService biddingService;

    @GetMapping("my_cont") //마이페이지-계약 리스트
    public ModelAndView myCont(ModelAndView mv, ContractVO c, HttpServletRequest request, HttpSession session){
        c.setMem_id((String)session.getAttribute("id"));
        int count=this.contractService.getCListCount(c.getMem_id());

        Paging paging;
        if(request.getParameter("page") == null) {
            paging = new Paging(1, 5, count);
        }else{
            int page = Integer.parseInt(request.getParameter("page"));
            paging = new Paging(page, 5, count);
        }
        mv.addObject("p",paging);

        //리스트 출력
        List<ContractVO> clist = new ArrayList<ContractVO>();
        c.setStartrow(paging.getStartrow());
        c.setEndrow(paging.getEndrow());
        clist = this.contractService.getContList(c); //계약서 목록
        mv.addObject("clist", clist);

        for(ContractVO n : clist){
            System.out.println(n);
        }
        mv.setViewName("/dozip/mypage/mypage_cont");
        return mv;
    }

    @GetMapping("my_cont_view") //마이페이지-계약서확인
    public ModelAndView myContView(ModelAndView mv, String cont_no){
        ContractVO c = this.contractService.getCont(cont_no); //계약서 정보
        System.out.println("getCustomer_number"+c.getCustomer_number());
        mv.addObject("c",c);
        mv.setViewName("/dozip/mypage/contract");
        return mv;
    }
    @GetMapping("my_est_view") //마이페이지-견적서확인
    public ModelAndView myEstView(ModelAndView mv, String est_num){
        EstimateVO e = this.biddingService.selectEstimate(est_num);
        mv.addObject("e",e);
        mv.setViewName("/dozip/mypage/estimate");
        return mv;
    }

    @RequestMapping(value="contract_ok") //마이페이지-계약서 동의 (estT, bidT 상태변경 + payT생성)
    @ResponseBody
    public RedirectView contractOK(@RequestParam String data) throws Exception {
        ObjectMapper mapper = new ObjectMapper().configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        ContractVO c = mapper.readValue(data, ContractVO.class);

        System.out.println("cont_no"+c.getCont_no());
        this.contractService.contractOK(c); //계약동의
        
        myEstimateService.insertSchedule(c.getCont_no()); //호철 스케쥴 테이블 컬럼 insert 메서드

        RedirectView rv = new RedirectView();
        rv.setUrl("/dozip/my_cont_view?cont_no="+c.getCont_no());
        return rv;
    }

    @GetMapping("my_contD") //마이페이지 - 계약상세 (공사진행상황)
    public ModelAndView myContD(ModelAndView mv, String cont_no){
        System.out.println("번호확인:"+cont_no);

        ContractVO cont = this.contractService.getCont(cont_no); //계약서 정보
        PayVO pay = this.payService.getPay(cont_no); //결제정보
        EstimateVO e = this.biddingService.selectEstimate(cont.getEst_num());
        mv.addObject("e",e);
        mv.addObject("c", cont);
        mv.addObject("p", pay);
        mv.setViewName("/dozip/mypage/mypage_cont_detail");
        return mv;
    }
}
