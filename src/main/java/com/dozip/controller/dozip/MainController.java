package com.dozip.controller.dozip;

import com.dozip.service.dozip.portfolio.PortfolioService;
import com.dozip.service.dozip.review.ReviewService;
import com.dozip.vo.PortfolioVO;
import com.dozip.vo.ReviewVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/dozip/*")
public class MainController {
    @Autowired
    private PortfolioService portfolioService;
    @Autowired
    private ReviewService reviewService;

    @RequestMapping(value = "home")//두집 메인 홈 화면
    public ModelAndView dozip(ModelAndView mv){

        List<PortfolioVO> plist = new ArrayList<PortfolioVO>();
        List<ReviewVO> reviewList = new ArrayList<ReviewVO>();
        plist = this.portfolioService.getAllList();
        reviewList = this.reviewService.getAllReview();
        mv.addObject("plist",plist);
        mv.addObject("reviewList",reviewList);
        mv.setViewName("/dozip/index");
        return mv;
    }
}
