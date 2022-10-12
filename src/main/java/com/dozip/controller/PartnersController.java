package com.dozip.controller;

import com.dozip.service.PartnersService;
import com.dozip.vo.PartnersVO;
import com.dozip.vo.Partners_subVO;
import com.dozip.vo.PortfolioVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@Controller
@RequestMapping("partners/*") //컨트롤러 자체 URL 매핑주소 등록
public class PartnersController {

    @Autowired
    private PartnersService partnersService;


    @RequestMapping(value = "/main") //파트너스 메인
    public String partners() {
        return "/partners/index";
    }


    /*회원가입, 로그인, 아이디 비번 찾기 관련 메서드
     *
     * */

    //회원가입 페이지
    @GetMapping("/signup")
    public String partners_signup(Model model) {
        String[] email = {"직접입력", "gmail.com", "naver.com", "hanmail.net", "nate.com"};
        model.addAttribute("email", email);
        return "/partners/join/signup";
    }// partners_signup()

    //회원 가입시 아이디 체크
    @PostMapping("/partners_idCheck")
    public void id_check(String pId, HttpServletResponse response) throws Exception {
        PrintWriter out = response.getWriter();
        PartnersVO vo = partnersService.getPartnersInfo(pId);

        int re = -1;
        if (vo != null) re = 1;
        out.print(re);
    }//id_check()

    //회원가입
    @PostMapping("partners_join_ok")
    public String partners_join_ok(PartnersVO pv,HttpServletResponse response) throws Exception {
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out =response.getWriter();
        partnersService.insertPartners(pv);

        out.println("<script>");
        out.println("alert('회원가입에 성공하였습니다.')");
        out.println("location='/partners/main';");
        out.println("</script>");
        return null;
    }//partners_join_ok

    //파트너스 아이디찾기
    @PostMapping("/partners_findid")
    public String partners_findid(String findid_business_num, String findid_pTel, String findid_email,
                                  HttpServletResponse response) throws Exception {
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();

        //넘어온정보 알맞게 가공한후 (전화번호)
        findid_pTel = findid_pTel.replaceAll("-", "");

        //사업자 번호를 기준으로 db를 통해 정보 조회한후
        PartnersVO fv = partnersService.getPartnersInfo2(findid_business_num);

        //넘어온 정보와 db 값 비교
        try {
            //이메일 정보를 가공한후
            String dbEmail = fv.getPMailId() + "@" + fv.getPMailDomain();
            String db_business_num = fv.getBusinessNum();
            String db_pTel = fv.getPTel();

            String email_id = fv.getPMailId();
            String email_domain = fv.getPMailDomain();
            String db_email = email_id + "@" + email_domain;

            if (db_business_num.equals(findid_business_num) && db_pTel.equals(findid_pTel) && db_email.equals(findid_email)) {
                out.println("<script>");
                out.println("alert('당신의 아이디는 " + fv.getPId() + " 입니다.')");
                out.println("location='/partners/main'");
                out.println("</script>");
            } else {
                out.println("<script>");
                out.println("alert('일치하는 정보가 없습니다!')");
                out.println("location='/partners/main'");
                out.println("</script>");
            }
        } catch (Exception e) {
            out.println("<script>");
            out.println("alert('일치하는 정보가 없습니다!')");
            out.println("location='/partners/main'");
            out.println("</script>");
        }
        return null;
    }//partners_findid()

    //로그인 인증
    @RequestMapping(value = "/login_ok")
    public ModelAndView partners_login_ok(PartnersVO vo, HttpServletResponse response, HttpSession session) throws IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        PartnersVO pInfo = partnersService.getPartnersInfo(vo.getPId()); //파트너스 아이디를 기준으로 파트너스 정보를 가져옴


        if (pInfo == null) {
            out.println("<script>");
            out.println("alert('존재하지 않는 아이디입니다')");
            out.println("history.back()");
            out.println("</script>");
        } else {
            if (!pInfo.getPPw().equals(vo.getPPw())) {
                out.println("<script>");
                out.println("alert('비밀번호가 일치하지 않습니다')");
                out.println("history.back()");
                out.println("</script>");
            } else {
                session.setAttribute("id", pInfo.getPId());
                session.setAttribute("businessName", pInfo.getBusinessName());
                session.setAttribute("business_num", pInfo.getBusinessNum());
                session.setMaxInactiveInterval(-1);   //세션을 통해 로그인 시간 설정
                return new ModelAndView("redirect:/partners/main");
            }
        }
        return null;
    }//partners_login_ok

    //파트너스 정보 찾기 페이지
    @GetMapping("partners_findinfo")
    public String partners_findinfo(){
        return "/partners/join/find_info";
    }//partners_findinfo()

    //로그아웃
    @RequestMapping("/logout")
    public ModelAndView partners_logout(HttpSession session) {
        session.invalidate();
        return new ModelAndView("redirect:/partners/main");
    }//partners_logout



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
    public String plan_monthly(){
        return "/partners/interior_Plan/monthly";
    }//plan_monthly()

    //부분 시공 요금제
    @GetMapping("/plan_part")
    public String plan_part(){
        return "/partners/interior_Plan/part";
    }//plan_part()



    /*견적 의뢰
     *
     */
    @RequestMapping(value = "/bid") //입찰의뢰
    public String bid() {
        return "/partners/estimate_request/bid";
    }

    @RequestMapping(value = "/bid_detail") //입찰 상세목록
    public String bid_detail() {
        return "/partners/estimate_request/bid_detail";
    }

    @RequestMapping(value = "/my_bid") //내 입찰
    public String my_bid() {
        return "/partners/estimate_request/my_bid";
    }

    @RequestMapping(value = "/construct_request") //시공요청
    public String construct_request() {
        return "/partners/estimate_request/construct_request";
    }

    @RequestMapping(value = "/request_detail") //시공요청 상세목록
    public String construct_request_detail() {
        return "/partners/estimate_request/construct_request_detail";
    }

    /*견적 관리
     *
     *
     *  */
    @RequestMapping(value = "/estimate_list")
    public String estimate_list() {  // 견적목록 
        return "/partners/estimate/estimate_list";
    }
    /*내 공사
     *
     *
     * */


    @RequestMapping(value = "/interior_list")
    public String interior_list() {
        return "/partners/myinterior/interior_List";
    }

    @RequestMapping(value = "/schedule_list")
    public String schedule_list() {
        return "/partners/myinterior/schedule_List";
    }

    @RequestMapping(value = "/balance_details")
    public String balance_details() {
        return "/partners/myinterior/balance_details";
    }


    /* 시공사례 관리
     *
     */
    @RequestMapping(value = "/upload")
    public String portfolioUpload() {  // 포트폴리오 페이지
        return "/partners/portfolio/p_upload";
    }

    @RequestMapping(value = "/upload_photo") // 포트폴리오 등록
    public String portfolioUpload_photo(PortfolioVO pv, HttpSession session, HttpServletResponse response,
                                        HttpServletRequest request) {
        pv.setBusinessNum((String) session.getAttribute("business_num"));
        if (pv.getPf_addr2().isEmpty()) {
            pv.setPf_addr2(" ");
        }
        Cookie cookie = new Cookie("pf_no", String.valueOf(partnersService.addPortfolio(pv)));
        response.addCookie(cookie);
        return "/partners/portfolio/p_upload_photo";
    }

    //포트폴리오 사진등록
    @RequestMapping(value = "/upload_photo_ok")
    public String upload_photo_ok(PortfolioVO pv, @RequestParam List<MultipartFile> photos,
                                  HttpServletResponse response, HttpServletRequest request) throws IOException {
        response.setContentType("text/html;charset=UTF-8");

        int pf_no = 0;
        Cookie[] cookies = request.getCookies();
        for (Cookie c : cookies) {
            if (c.getName().equals("pf_no")) {
                pf_no = Integer.parseInt(c.getValue()); //쿠키에서 포트폴리오 번호 가져옴 -> 사진 삽입 위해
            }
        }

        String uploadPath = "C:/dozip/portfolio/" + pf_no;
        File dir = new File(uploadPath);

        if (!dir.isDirectory()) { //폴더가 없다면 생성
            dir.mkdirs();
        }
        int i = 1;
        for (MultipartFile photo : photos) {

            System.out.println(photo.getOriginalFilename());
            photo.transferTo(new File(uploadPath+ "/photo0" + i + ".jpg"));
            if(i==1){
                pv.setPf_photo1(uploadPath+ "/photo0" + i + ".jpg");
            }
            if(i==2){
                pv.setPf_photo2(uploadPath+ "/photo0" + i + ".jpg");
            }
            if(i==3){
                pv.setPf_photo3(uploadPath+ "/photo0" + i + ".jpg");
            }
            if(i==4){
                pv.setPf_photo4(uploadPath+ "/photo0" + i + ".jpg");
            }
            if(i==5){
                pv.setPf_photo5(uploadPath+ "/photo0" + i + ".jpg");
            }
            i++;
        }
        System.out.println(uploadPath+ "/photo0" + i + ".jpg");

        pv.setPf_no(pf_no);
        partnersService.insertPort_Photos(pv);
        return "/partners/index";
    }//upload_photo_ok


    @RequestMapping(value = "/portfolio_list")  //견적목록
    public String portfolio_list() {
        return "/portfolio/p_list";
    }


    /*광고 관리
     *
     * */
    @RequestMapping(value = "/marketing")
    public String marketing() {  // 고객문의 글 보기
        return "/partners/marketing/marketing";
    }


    /*고객 관리
     *
     * */
    @RequestMapping(value = "/qna")
    public String customerQna() {  // 고객문의 글 보기
        return "/partners/customer/qna";
    }

    @RequestMapping(value = "/review")
    public String customerReview() {  // 고객문의 글 보기
        return "/partners/customer/review";
    }


    /*My page
    *
    */
    @RequestMapping(value="/data_manage")
    public ModelAndView data_manage(HttpServletResponse response, HttpSession session) throws Exception {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out=response.getWriter();

        String businessNum=(String)session.getAttribute("businessNum");
//        if(business_num==null) {
//            out.println("<script>");
//            out.println("alert('다시 로그인하세요!');");
//            out.println("location='/partners';");
//            out.println("</script>");
//        }else {

        PartnersVO p=this.partnersService.getMember(businessNum);//사업자번호에 해당하는 회원정보를 DB로부터 가져옴.
        Partners_subVO ps=this.partnersService.getPartnersSub(businessNum);
                
            ModelAndView m=new ModelAndView();
            m.addObject("p", p);//p 키이름에 p객체 저장
            m.addObject("ps",ps);//ps 키이름에 ps객체 저장
            m.setViewName("/partners/mypage/data_manage");
            return m;
//        }
    }//data_manage()

    @RequestMapping(value="/data_manage_edit_ok")
    public String data_manage_edit_ok(HttpServletResponse response,HttpServletRequest request,
        HttpSession session, Partners_subVO p) throws Exception {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String business_num = (String)session.getAttribute("business_num");
//        if(business_num == null) {
//            out.println("<script>");
//            out.println("alert('다시 로그인 하세요!');");
//            out.println("location='index';");
//            out.println("</script>");
//        }else {

//        }
        return null;
    }
    @RequestMapping(value="/pw_change")
    public String pw_change() { return "/partners/mypage/pw_change"; }




}
