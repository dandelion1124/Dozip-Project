package com.dozip.controller.dozip.mypage;

import com.dozip.service.dozip.pay.PayService;
import com.dozip.vo.PayVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;

@Controller
@EnableScheduling
@RequestMapping("/dozip/*")
public class PayController {
    @Autowired
    private PayService payService;

    @RequestMapping("pay_view") //결제창 이동
    public ModelAndView payView(ModelAndView mv, String cont_no, String name, String cost){
        mv.addObject("cont_no", cont_no);
        mv.addObject("name", name);
        mv.addObject("cost", cost);
        mv.setViewName("/dozip/mypage/pay");
        return mv;
    }

    @RequestMapping("pay_ok") // 결제상태 변경
    @ResponseBody
    public HashMap<String, String> payOK(String cont_no, String name, String cost){
        HashMap<String, String> map = new HashMap<String, String>();

        PayVO p = new PayVO();
        p.setCont_no(cont_no);

        if(name.equals("계약금")){
            p.setPay_cost1(cost);
        }else if(name.equals("중도금")){
            p.setPay_cost2(cost);
        }else if(name.equals("잔금")){
            p.setPay_cost3(cost);
        }

        int res = this.payService.payState(p);
        if(res==1) {
            map.put("res", "결제가 완료되었습니다.");
        }else{
            map.put("res", "결제에 실패했습니다.");
        }
        return map;
    }

    @Scheduled(cron = "0 0 0/1 * * ?") //1식간마다 실행 (빨리 상태 보고 싶을땐 "0/15 * * * * ?" 15초마다로 변경해서 확인)
    public void payStateUpdate(){
        System.out.println("스케줄러 실행!");
        try{
            this.payService.updateState(); //해당일자가 되면 요청상태로 변경
        } catch (Exception e){
            e.printStackTrace();
        }
    }
}
