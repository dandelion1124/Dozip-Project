package com.dozip.controller.partners.estimate;

import com.dozip.service.partners.estimate.BiddingService;
import com.dozip.utils.ConvertAddr;
import com.dozip.utils.Paging;
import com.dozip.vo.BidVO;
import com.dozip.vo.EstimateVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/partners/*")
public class BiddingController {
    @Autowired
    BiddingService biddingService;


    @RequestMapping(value = "/bid") //입찰의뢰
    public ModelAndView bid(EstimateVO e,BidVO b, HttpServletRequest request, HttpServletResponse response, HttpSession session)
            throws Exception {
        response.setContentType("text/html;charset=UTF-8");
        String businessNum = (String) session.getAttribute("businessNum");

//        Paging paging;
//        if(request.getParameter("page") == null){
//            paging = new Paging(1,5,count);
//        }else{
//            int page=Integer.parseInt(request.getParameter("page"));
//            paging = new Paging(page, 5, count);
//        }
        String find_name=request.getParameter("find_name");//검색어
        String find_field=request.getParameter("find_field");//검색필드

        e.setFind_name("%"+find_name+"%"); //%는 오라클 와일드 카드 문자로서 하나이상의 임의의 문자와 매핑 대응
        e.setFind_field(find_field);
        //System.out.println(e.getFind_name()+" "+e.getFind_field());

        //int count = this.partnersService.countestimate(est_num); //견적테이블 견적 개수 카운트

        List<EstimateVO> elist = this.biddingService.selectEstimateList(businessNum); //estimate 테이블에 있는 db 전부 가져오기.

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date now = new Date();
        for (int i = 0; i < elist.size(); i++) {
            ConvertAddr convertAddr = new ConvertAddr(elist.get(i).getEst_addr());
            elist.get(i).setAddr( convertAddr.convert());

            Date parseddate = formatter.parse(elist.get(i).getEst_dateEnd());
            long remaindate = (parseddate.getTime() - now.getTime());
            elist.get(i).setRemaindate(remaindate/(24*60*60*1000));
        }
        System.out.println("변경된 elist 출력 " + elist);
        ModelAndView m = new ModelAndView();
        m.addObject("elist", elist);//e 키이름에 e객체 저장
        m.addObject("find_name", find_name);
        m.addObject("find_field",find_field);
        //m.addObject("countlist",countlist);
        //m.addObject("ecount",ecount);
        //m.addObject("p",paging);
        m.setViewName("/partners/estimate_request/bid");
        return m;
    }

    @RequestMapping(value = "/bid_detail") //입찰 상세목록
    public String bid_detail(Model m, @RequestParam("no") String est_num, HttpServletResponse response, HttpSession session) throws Exception {
        response.setContentType("text/html;charset=UTF-8");

        EstimateVO e=this.biddingService.selectEstimate(est_num); //견적테이블에서 각 견적서 번호 기준으로 가져오기
        BidVO b = new BidVO();
        b.setBusinessNum((String)session.getAttribute("businessNum"));
        b.setEst_num(est_num);
        int bcount=this.biddingService.countBid(est_num); // 해당 입찰을 신청한 파트너스 수 가져오기
        int res=this.biddingService.checkBid(b);  // 이미 입찰 신청한 파트너스는 신청할 수 없게
        //System.out.println(res);

        ConvertAddr convertAddr = new ConvertAddr(e.getEst_addr());
        e.setAddr(convertAddr.convert());

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date now = new Date();
        Date parseddate = formatter.parse(e.getEst_dateEnd())   ;
        long remaindate = (parseddate.getTime() - now.getTime());
        e.setRemaindate(remaindate/(24*60*60*1000));
        //System.out.println(remaindate);
        m.addAttribute("e",e);
        m.addAttribute("bcount",bcount);
        m.addAttribute("res",res);

        return "/partners/estimate_request/bid_detail";
    }

    @RequestMapping(value = "/bid_detail_ok") //입찰 신청
    public String bid_detail_ok(BidVO bid, @RequestParam("no") String est_num, HttpServletRequest request, HttpServletResponse response, HttpSession session)
            throws Exception {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String businessNum = (String) session.getAttribute("businessNum");
        EstimateVO e = this.biddingService.selectEstimate(est_num); //견적서 테이블에서 est_num을 가져와야 하므로

        bid.setBusinessNum(businessNum);
        bid.setEst_num(e.getEst_num());

        bid.setBid_price(Integer.parseInt(request.getParameter("bid_price"))); //가져온 string값을 int로 형변환해줘야
        bid.setBid_start(request.getParameter("bid_start")); //주소 부분 api로 변경해줄것
        bid.setBid_end(request.getParameter("bid_end"));
        bid.setBid_detail(request.getParameter("bid_detail"));

        this.biddingService.insertbid(bid); // 입찰신청하기 입찰 DB에 insert

        out.println("<script>");
        out.println("alert('입찰 신청 완료!');");
        out.println("location='/partners/bid_detail?no="+bid.getEst_num()+"'"); //location=에 매핑주소 자체를 넣는 것
        out.println("</script>");
        return null;
    }

    @RequestMapping(value = "/my_bid") //내 입찰
    public ModelAndView my_bid(EstimateVO e, HttpServletResponse response, HttpServletRequest request, HttpSession session) throws Exception {
        response.setContentType("text/html;charset=UTF-8");
        String businessNum = (String) session.getAttribute("businessNum");

        int page=1;//쪽번호
        int limit=5;//한페이지에 보여지는 목록개수
        if(request.getParameter("page") != null) {
            page=Integer.parseInt(request.getParameter("page"));
        }
        int listcount = this.biddingService.getBlistCount2(businessNum); //전체 레코드 개수 또는 검색전후 레코드 개수
        System.out.println("총 입찰 개수:"+listcount+"개");

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

        List<BidVO> list = this.biddingService.selectJoinList(e); //bid테이블 기준으로 estimate테이블 조인해서 가져오기
        for (int i = 0; i < list.size(); i++) {
            ConvertAddr convertAddr = new ConvertAddr(list.get(i).getEst_addr());
            list.get(i).setAddr(convertAddr.convert());
        }
        System.out.println(list.toString());
        m.addObject("list", list);

        m.setViewName("/partners/estimate_request/my_bid");
        return m;
    }

}
