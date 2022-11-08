package com.dozip.controller.dozip;

import com.dozip.service.dozip.portfolio.MainPortfolioService;
import com.dozip.vo.PartnersVO;
import com.dozip.vo.PortfolioVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/dozip/*")
public class MainPortfolioController {
    @Autowired
    private MainPortfolioService mainPortfolioService;

    @GetMapping(value = "port") //포트폴리오 리스트 출력
    public ModelAndView port(ModelAndView mv)  {
        List<PortfolioVO> plist = new ArrayList<PortfolioVO>();
        plist = this.mainPortfolioService.getAllList(); //포트폴리오 전체 리스트
        mv.addObject("plist",plist);
        mv.setViewName("/dozip/portfolio/port_main");
        return mv;
    }

    @GetMapping(value = "port_detail") //포트폴리오 상세
    public ModelAndView detail(@RequestParam("pf_no") int pf_no, HttpServletRequest request) throws Exception{

        PortfolioVO pf = this.mainPortfolioService.getOnelist(pf_no); //pf_no에 해당하는 글
        PartnersVO pt = this.mainPortfolioService.getComplist(pf_no); //파트너스 정보

        ModelAndView mv = new ModelAndView();
        mv.addObject("pf",pf);
        mv.addObject("pt",pt);

        mv.setViewName("/dozip/portfolio/port_detail");
        return mv;
    }

    @GetMapping(value = "comp_detail") //업체정보 상세
    public ModelAndView comp(@RequestParam("businessName") String businessName, HttpServletRequest request, PartnersVO p) throws Exception{
        PartnersVO pc = this.mainPortfolioService.getOnecomp(businessName); //파트너스 정보

        ModelAndView mv = new ModelAndView();
        mv.addObject("pc",pc);
        mv.setViewName("/dozip/portfolio/comp_detail");
        return mv;
    }

    @RequestMapping(value="port_search", method = RequestMethod.GET, produces="application/json")
    @ResponseBody //포트폴리오 검색
    public List<PortfolioVO> pSearchList(HttpServletRequest request){
        PortfolioVO p = new PortfolioVO();
        String pf_subtype1 = request.getParameter("pf_subtype1");
        String pf_subtype2 = request.getParameter("pf_subtype2");
        p.setPf_concept(request.getParameter("pf_concept"));


        if(pf_subtype1.equals("주거유형") && !pf_subtype2.equals("상업유형")){
            p.setPf_subtype(pf_subtype2);
        }else if(pf_subtype2.equals("상업유형") && !pf_subtype1.equals("주거유형")){
            p.setPf_subtype(pf_subtype1);
        }else if(pf_subtype1.equals("주거유형") && pf_subtype2.equals("상업유형")){
            p.setPf_subtype(null);
        }

        System.out.println("확인" + p);

        List<PortfolioVO> list = new ArrayList<PortfolioVO>();
        list = this.mainPortfolioService.getSearchList(p);
        System.out.println("리스트 값" + list.toString());
        return list;
    }
}
