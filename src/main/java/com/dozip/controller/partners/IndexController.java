package com.dozip.controller.partners;

import com.dozip.service.partners.index.IndexService;
import com.dozip.vo.InfoVO;
import com.dozip.vo.PayVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("partners/*")
public class IndexController {

    @Autowired
    private IndexService indexService;

    @RequestMapping(value = "/main") //파트너스 메인
    public ModelAndView partners(HttpSession session) {

        ModelAndView mv = new ModelAndView("/partners/index");
        if(session.getAttribute("businessNum")!= null){
            String bNum =(String)session.getAttribute("businessNum");
            String status;

            /*매출 내역 */
            PayVO pv = indexService.montly_sales(bNum);

            /*등록된 포트폴이오 개수 */
            int portfolioCount = indexService.portfolioCount(bNum);

            /*파트너스 정보 등록 확인 */
            InfoVO iv = indexService.partnersInfoCheck(bNum);
            if(iv.getAddr_check()==0 || iv.getPhoto_check()==0){
                status="0";
            }
            else{
                status="1";
            }

            /*미답변 문의 갯수 */
            int qnaCount = indexService.newQnaCount(bNum);








            mv.addObject("pv",pv);
            mv.addObject("status",status);
            mv.addObject("qnaCount",qnaCount);
            mv.addObject("portfolioCount",portfolioCount);
        }

        //월별 정산내역



       return mv;
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
