package com.dozip.controller.partners.estimate;

import com.dozip.service.partners.estimate.BiddingService;
import com.dozip.service.partners.estimate.EstService;
import com.dozip.utils.ConvertAddr;
import com.dozip.vo.EstimateVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/partners/*")
public class EstController {
    @Autowired
    EstService estService;

    @Autowired
    BiddingService biddingService; //민우랑 얘기해야함
    
    

    
    @RequestMapping(value = "/construct_request") //시공요청
    public ModelAndView construct_request(EstimateVO e, HttpSession session, HttpServletRequest request) throws Exception {
        String businessNum = (String) session.getAttribute("businessNum");

        int page=1;//쪽번호
        int limit=5;//한페이지에 보여지는 목록개수
        if(request.getParameter("page") != null) {
            page=Integer.parseInt(request.getParameter("page"));
        }
        int listcount = this.estService.getElistCount(businessNum); //전체 레코드 개수 또는 검색전후 레코드 개수
        System.out.println("총 시공요청 개수:"+listcount+"개");

        e.setBusinessNum(businessNum);
        e.setStartrow((page-1)*5+1);//시작행번호
        e.setEndrow(e.getStartrow()+limit-1);//끝행번호
        System.out.println(e.toString());

        int maxpage=(int)((double)listcount/limit+0.95);//총페이지수
        int startpage=(((int)((double)page/5+0.9))-1)*5+1;//현재 페이지에 보여질 시작페이지 수(1,11,21)
        int endpage=maxpage;//현재 페이지에 보여줄 마지막 페이지 수(10,20,30)
        if(endpage > startpage+5-1) endpage=startpage+5-1;

        ModelAndView m = new ModelAndView();
        m.addObject("page", page);
        m.addObject("startpage", startpage);
        m.addObject("endpage", endpage);
        m.addObject("maxpage", maxpage);
        m.addObject("listcount", listcount);

        List<EstimateVO> ereqlist = this.estService.selectEstimateListBnum(e);
        //System.out.println(ereqlist.toString());
        //System.out.println(ereqlist.get(0).getEst_addr());

        for (int i = 0; i < ereqlist.size(); i++) {
            ConvertAddr convert= new ConvertAddr(ereqlist.get(i).getEst_addr());
            ereqlist.get(i).setAddr( convert.convert());

        }
        m.addObject("ereq", ereqlist);
        m.setViewName("/partners/estimate_request/construct_request");
        return m;
    }
    @RequestMapping(value = "/construct_request_select")
    @ResponseBody
    public void bidSelect(String est_num,String est_check,EstimateVO e) {

        e.setEst_num(est_num); //ajax의 data에 넣은 값을 가져옴
        e.setEst_check(est_check);
        this.estService.updateEstimate2(e);
    }
    @RequestMapping(value = "/request_detail") //시공요청 상세목록
    public String construct_request_detail(Model m, @RequestParam("no") String est_num, HttpServletResponse response) throws Exception {
        //response.setContentType("text/html;charset=UTF-8");

        EstimateVO e = this.biddingService.selectEstimate(est_num); //견적서 번호 기준으로 데이터 가져오기


        m.addAttribute("e", e);

        return "/partners/estimate_request/construct_request_detail";
    }
}
