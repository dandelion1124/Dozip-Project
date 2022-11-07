package com.dozip.controller.dozip.mypage;

import com.dozip.service.dozip.bid.BidService;
import com.dozip.service.dozip.estimate.EstimateService;
import com.dozip.utils.Paging;
import com.dozip.vo.BidVO;
import com.dozip.vo.EstimateVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/dozip/*")
public class BIdController {
    @Autowired
    private EstimateService estimateService;
    @Autowired
    private BidService bidService;

    @GetMapping("my_est2") //마이페이지-견적서 리스트(입찰)
    public ModelAndView myEst2(ModelAndView mv, EstimateVO e, HttpServletRequest request, HttpSession session) {
        e.setMem_id((String)session.getAttribute("id"));
        int count=this.estimateService.getListCount(e.getMem_id());

        Paging paging;
        if(request.getParameter("page") == null) {
            paging = new Paging(1, 5, count);
        }else{
            int page = Integer.parseInt(request.getParameter("page"));
            paging = new Paging(page, 5, count);
        }
        mv.addObject("p",paging);

        //리스트 출력
        List<EstimateVO> elist = new ArrayList<EstimateVO>();
        e.setStartrow(paging.getStartrow());
        e.setEndrow(paging.getEndrow());
        elist = this.estimateService.getElist(e);
        mv.addObject("elist", elist);

        List<String> estNum = new ArrayList<>();
        estNum = this.estimateService.getEstNum(e.getMem_id());
        mv.addObject("estNum", estNum);

        mv.setViewName("/dozip/mypage/mypage_est2");
        return mv;
    }

    @RequestMapping(value="/my_est2/{est_num}",produces="application/json")
    @ResponseBody //입찰리스트 불러오기
    public List<BidVO> bidList(@PathVariable("est_num") String est_num){
        List<BidVO> list = new ArrayList<BidVO>();
        list = this.bidService.getBidList(est_num); //입찰 리스트
        System.out.println(list.toString());
        return list;
    }

    @RequestMapping(value = "my_bid_reject") //입찰 업체 거절하기
    @ResponseBody
    public void bidReject(String bid_num) {
        this.bidService.updateReject(bid_num);
    }

}
