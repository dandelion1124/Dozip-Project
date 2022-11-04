package com.dozip.controller.partners;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("partners/*")
public class IndexController {

    @RequestMapping(value = "/main") //파트너스 메인
    public String partners() {
        return "/partners/index";
    }

    /*    요금제
     *
     *   */
    //요금제
    @GetMapping("/planning")
    public String setPlan() {
        return "/partners/interior_Plan/plan";

    }//setPlan()

    //월정액 요금제
    @GetMapping("/plan_monthly")
    public String plan_monthly() {
        return "/partners/interior_Plan/monthly";
    }//plan_monthly()

    //부분 시공 요금제
    @GetMapping("/plan_part")
    public String plan_part() {
        return "/partners/interior_Plan/part";
    }//plan_part()

    /*광고 관리
     *
     * */
    @RequestMapping(value = "/marketing")
    public String marketing() {
        return "/partners/marketing/marketing";
    }

}
