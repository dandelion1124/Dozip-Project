package com.dozip.Controller;

import com.dozip.service.PartnersService;
import com.dozip.vo.PartnersVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@Controller
@RequestMapping("partners/*") //컨트롤러 자체 URL 매핑주소 등록
public class PartnersController {

    @Autowired
    private PartnersService partnersService;


    @RequestMapping(value = "/") //파트너스 메인
    public String partners(){
        return "/partners/index";
    }


    /*회원가입, 로그인, 아이디 비번 찾기 메서드
    *
    * */


    @RequestMapping(value = "/login_ok")
    public String partners_login_ok(PartnersVO vo, HttpServletResponse response, HttpSession session) throws IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();




        PartnersVO pInfo = partnersService.getPartnersInfo(vo.getPId());
        //파트너스 아이디를 기준으로 파트너스 정보를 가져옴

/*

        vo.setPId(login_pId); vo.setPPw(login_pPw);
        //로그인 체크 아이디가 없는경우 0, 비번이 일치하지 않는경우 2, 로그인 성공 1
        int result = partnersService.loginCheck(vo);

        if(result==0) {
            out.println("<script>");
            out.println("alert('존재하지 않는 아이디입니다')");
            out.println("history.back()");
            out.println("</script>");
        }
        else {

            if(result==2) {
                out.println("<script>");
                out.println("alert('비밀번호가 일치하지 않습니다')");
                out.println("history.back()");
                out.println("</script>");
            }
            else if(result==1) {
                session.setAttribute("id", login_pId);
                session.setAttribute("businessName", vo.getBusinessName());
                session.setAttribute("business_num", vo.getBusiness_num());


                session.setMaxInactiveInterval(600);   //세션을 통해 로그인 시간 설정


                return "/partners/interior_plan/plan";
            }
        } */
        return null;
    }




    /*    요금제
    *
    *   */


    @GetMapping("/planning")
    public String setPlan(){
        return "/partners/interior_Plan/plan";

    }










    /*견적 의뢰
    *
    */
    @RequestMapping(value="/bid") //입찰의뢰
    public String bid() { return "/partners/estimate_request/bid"; }
    @RequestMapping(value="/bid_detail") //입찰 상세목록
    public String bid_detail() { return "/partners/estimate_request/bid_detail"; }
    @RequestMapping(value="/my_bid") //내 입찰
    public String my_bid() { return "/partners/estimate_request/my_bid"; }
    @RequestMapping(value="/construct_request") //시공요청
    public String construct_request() { return "/partners/estimate_request/construct_request";}
    @RequestMapping(value="/request_detail") //시공요청 상세목록
    public String construct_request_detail() { return "/partners/estimate_request/construct_request_detail";}

    /*견적 관리
    *
    *
    *  */
    @RequestMapping(value="/estimate_list")
    public String estimate_list(){  // 포트폴리오 등록
        return "/partners/estimate/estimate_list";
    }
    /*내 공사
    *
    *
    * */


    @RequestMapping(value="/interior_list")
    public String interior_list(){  // 포트폴리오 등록
        return "/partners/myinterior/interior_List";
    }
    @RequestMapping(value="/schedule_list")
    public String schedule_list(){  // 포트폴리오 등록
        return "/partners/myinterior/schedule_List";
    }
    @RequestMapping(value="/balance_details")
    public String balance_details(){  // 포트폴리오 등록
        return "/partners/myinterior/balance_details";
    }


   /* 시공사례 관리
    *
    */
   @RequestMapping(value="/upload")
   public String portfolioUpload(){  // 포트폴리오 등록
       return "/partners/portfolio/p_upload";
   }

    @RequestMapping(value="/upload_photo")
    public String portfolioUpload_photo(){  // 포트폴리오 사진등록
        return "/partners/portfolio/p_upload_photo";
    }


    @RequestMapping(value="/portfolio_list")
    public String portfolio_list(){  // 포트폴리오 사진등록
        return "/partners/portfolio/p_list";
    }


    /*광고 관리
    *
    * */
    @RequestMapping(value="/marketing")
    public String marketing(){  // 고객문의 글 보기
        return "/partners/marketing/marketing";
    }



    /*고객 관리
    *
    * */
    @RequestMapping(value="/qna")
    public String customerQna(){  // 고객문의 글 보기
        return "/partners/customer/qna";
    }

    @RequestMapping(value="/review")
    public String customerReview(){  // 고객문의 글 보기
        return "/partners/customer/review";
    }


    /*My page
    *
    */
    @RequestMapping(value="/data_manage")
    public String data_manage() {

        return "/partners/mypage/data_manage"; }


    @RequestMapping(value="/pw_change")
    public String pw_change() { return "/partners/mypage/pw_change"; }











}
