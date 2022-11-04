package com.dozip.controller.partners;

import com.dozip.service.partners.myInterior.MyInteriorService;
import com.dozip.vo.ContractVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("partners/*")
public class MyInteriorController {
    @Autowired
    MyInteriorService myInteriorService;

    @RequestMapping(value = "/interior_list")
    public ModelAndView interior_list(String est_check, String pay_state, HttpSession session) {
        String businessNum =(String)session.getAttribute("businessNum");
        List<ContractVO> clist = myInteriorService.getContract_interior(businessNum);
        if(est_check != null){
            System.out.println(est_check);
        }
        if(pay_state != null){
            System.out.println(pay_state);
        }
        System.out.println(clist);
        ModelAndView mv = new ModelAndView( "/partners/myinterior/interior_List");
        mv.addObject("clist", clist);
        return mv;
    }
    @RequestMapping(value = "/show_contract")
    public ModelAndView show_contract(String cont_no){
        ContractVO cv = myInteriorService.show_contract(cont_no);
        ModelAndView mv = new ModelAndView("/partners/myinterior/contract_res");
        mv.addObject("cv",cv);
        return mv;
    }
    @RequestMapping(value = "/schedule_list")
    public String schedule_list() {
        return "/partners/myinterior/schedule_List";
    }

    @RequestMapping(value = "/balance_details")
    public String balance_details() {
        return "/partners/myinterior/balance_details";
    }
}
