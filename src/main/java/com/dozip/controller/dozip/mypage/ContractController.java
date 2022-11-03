package com.dozip.controller.dozip.mypage;

import com.dozip.service.dozip.contract.ContractService;
import com.dozip.service.dozip.pay.PayService;
import com.dozip.vo.ContractVO;
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

    @GetMapping("my_cont") //마이페이지-계약 리스트
    public ModelAndView myCont(ModelAndView mv, ContractVO c, HttpServletRequest request, HttpSession session){
        c.setMem_id((String)session.getAttribute("id"));

        //쪽나누기
        int page = 1; //현재 쪽번호
        int limit = 5; //한 페이지에 보여지는 개수

        if(request.getParameter("page")!=null) {
            page=Integer.parseInt(request.getParameter("page"));
        }

        int listcount=this.contractService.getCListCount(c.getMem_id()); //계약서 개수
        int maxpage = (int)((double)listcount/limit+0.95); //총페이지
        int startpage = (((int)((double)page/5+0.9))-1)*5+1; //시작페이지
        int endpage = maxpage; //마지막페이지

        if(endpage>startpage+5-1) endpage=startpage+5-1;

        mv.addObject("page", page);
        mv.addObject("startpage", startpage);
        mv.addObject("endpage",endpage);
        mv.addObject("maxpage",maxpage);
        mv.addObject("listcount",listcount);

        //리스트 출력
        List<ContractVO> clist = new ArrayList<ContractVO>();
        c.setStartrow((page-1)*5+1);
        c.setEndrow(c.getStartrow()+limit-1);
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
        System.out.println("출력"+cont_no);
        ContractVO c = this.contractService.getCont(cont_no); //계약서 정보
        System.out.println("getCustomer_number"+c.getCustomer_number());
        mv.addObject("c",c);
        mv.setViewName("/dozip/mypage/contract");
        return mv;
    }

    @RequestMapping(value="contract_ok") //마이페이지-계약서 동의 (estT, bidT 상태변경 + payT생성)
    @ResponseBody
    public RedirectView contractOK(@RequestParam String data) throws Exception {
        ObjectMapper mapper = new ObjectMapper().configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        ContractVO c = mapper.readValue(data, ContractVO.class);

        System.out.println("cont_no"+c.getCont_no());
        this.contractService.contractOK(c); //계약동의

        RedirectView rv = new RedirectView();
        rv.setUrl("/dozip/my_cont_view?cont_no="+c.getCont_no());
        return rv;
    }

    @GetMapping("my_contD") //마이페이지 - 계약상세 (공사진행상황)
    public ModelAndView myContD(ModelAndView mv, String cont_no){
        System.out.println("번호확인:"+cont_no);

        ContractVO cont = this.contractService.getCont(cont_no); //계약서 정보
        PayVO pay = this.payService.getPay(cont_no); //결제정보

        mv.addObject("c", cont);
        mv.addObject("p", pay);
        mv.setViewName("/dozip/mypage/mypage_cont_detail");
        return mv;
    }








}
