package com.dozip.controller;

import com.dozip.service.PartnersService;
import com.dozip.vo.*;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.HandlerMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("partners/*") //컨트롤러 자체 URL 매핑주소 등록
public class PartnersController {

    @Autowired
    private PartnersService partnersService;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @RequestMapping(value = "/main") //파트너스 메인
    public String partners() {
        return "/partners/index";
    }


    /*회원가입, 로그인, 아이디 비번 찾기 관련 메서드
     *
     * */

    //회원가입 페이지
    @RequestMapping("/signup")
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
    @ResponseBody
    public HashMap<String, Object> partners_join_ok(@RequestParam String data) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<>();
        ObjectMapper mapper = new ObjectMapper();
        PartnersVO pv = mapper.readValue(data, PartnersVO.class);
        pv.setP_Pw(passwordEncoder.encode(pv.getP_Pw())); //비밀번호 암호화
        int result = partnersService.checkBusinessNum(pv);

        if (result == 1) {
            resultMap.put("status", 1);
            resultMap.put("message", "이미 가입된 사업자번호가 있습니다 \\ n다시 회원가입을 진행해주세요");

        } else {
            resultMap.put("status", 0);
            resultMap.put("message", "회원가입에 성공하였습니다");
            partnersService.insertPartners(pv);
        }
        return resultMap;
    }//partners_join_ok

    //파트너스 정보 찾기 페이지
    @RequestMapping("partners_findinfo")
    public String partners_findinfo() {
        return "/partners/join/find_info";
    }//partners_findinfo()

    //파트너스 아이디찾기
    @ResponseBody
    @RequestMapping("/partners_findid")
    public HashMap<String,Object> partners_findid(String findid_business_num, String findid_pTel, String findid_email, HttpServletResponse response) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<>();
        //넘어온정보 알맞게 가공한후 (전화번호)
        findid_pTel = findid_pTel.replaceAll("-", "");

        //사업자 번호를 기준으로 db를 통해 정보 조회한후
        PartnersVO fv = partnersService.getPartnersInfo2(findid_business_num);

        if(fv==null || !findid_pTel.equals(fv.getP_Tel()) || !findid_email.equals(fv.getP_MailId() + "@" + fv.getP_MailDomain())) {
            resultMap.put("status",0);
            resultMap.put("message", "일치하는 정보 없음");
        }
        else{
            resultMap.put("status",1);
            resultMap.put("message", "당신의 아이디는 " + fv.getP_Id() + " 입니다");
        }
        return resultMap;
    }//partners_findid()

    //로그인 인증
    @ResponseBody
    @RequestMapping(value = "/login_ok")
    public HashMap<String, Object> partners_login_ok(@RequestParam String data, HttpSession session) throws IOException {

        HashMap<String, Object> resultMap = new HashMap<>();
        ObjectMapper mapper = new ObjectMapper();
        PartnersVO pv = mapper.readValue(data, PartnersVO.class);
        PartnersVO pInfo = partnersService.getPartnersInfo(pv.getP_Id()); //파트너스 아이디를 기준으로 파트너스 정보를 가져옴
        boolean pw_check =passwordEncoder.matches(pv.getP_Pw(),pInfo.getP_Pw());//인코딩전 비밀번호와 인코딩된비밀번호를 비교

        if (pInfo == null) {
            resultMap.put("status", 1);
        } else {
            if (!pw_check) {
                resultMap.put("status", 2);
            } else {
                resultMap.put("status", 0);
                session.setAttribute("p_id", pInfo.getP_Id());
                session.setAttribute("businessName", pInfo.getBusinessName());
                session.setAttribute("businessNum", pInfo.getBusinessNum());
                session.setMaxInactiveInterval(-1);   //세션을 통해 로그인 시간 설정
            }
        }
        return resultMap;
    }//partners_login_ok

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
    public String plan_monthly() {
        return "/partners/interior_Plan/monthly";
    }//plan_monthly()

    //부분 시공 요금제
    @GetMapping("/plan_part")
    public String plan_part() {
        return "/partners/interior_Plan/part";
    }//plan_part()


    /*견적 의뢰
     *
     */
    @RequestMapping(value = "/bid") //입찰의뢰
    public ModelAndView bid(EstimateVO vo, HttpServletResponse response, HttpSession session) throws Exception {
        //String requestUrl = (String)request.getAttribute(HandlerMapping.PATH_WITHIN_HANDLER_MAPPING_ATTRIBUTE);
        response.setContentType("text/html;charset=UTF-8");
        //String p_id=(String) session.getAttribute("p_id");

        List<EstimateVO> elist = this.partnersService.selectEstimateList(); //estimate 테이블에 있는 db 전부 가져오기.

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date now = new Date();

        //System.out.println(elist.toString());
        for (int i = 0; i < elist.size(); i++) {
            elist.get(i).setAddr(est_addr_change(elist.get(i).getEst_addr()));

            Date parseddate = formatter.parse(elist.get(i).getEst_dateEnd());
            long remaindate = (parseddate.getTime() - now.getTime());
            elist.get(i).setRemaindate(remaindate/(24*60*60*1000));
        }
        System.out.println("변경된 elist 출력 " + elist);
        ModelAndView m = new ModelAndView();
        m.addObject("elist", elist);//e 키이름에 e객체 저장

        m.setViewName("/partners/estimate_request/bid");
        return m;
    }

    private String est_addr_change(String est_addr) {
        String str[] = est_addr.split(" ");
        if (est_addr.contains("서울") || est_addr.contains("부산") || est_addr.contains("대구") || est_addr.contains("인천") || est_addr.contains("광주") ||
                est_addr.contains("대전") || est_addr.contains("울산") || est_addr.contains("부산") || est_addr.contains("세종")) {
            //System.out.println("광역시 테스트");
            est_addr = str[0] + " " + str[1];
        } else {
            //System.out.println("그외 테스트");
            est_addr = str[1] + " " + str[2];
        }
        return est_addr;
    }//주소 변환

    @RequestMapping(value = "/bid_detail") //입찰 상세목록
    public String bid_detail(Model m, @RequestParam("no") String est_num, HttpServletResponse response, HttpSession session) throws Exception {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        EstimateVO e=this.partnersService.selectEstimate(est_num); //
        //System.out.println(e.toString());
        BidVO b = new BidVO();
        b.setBusinessNum((String)session.getAttribute("businessNum"));
        //System.out.println(b.getBusinessNum());
        b.setEst_num(est_num);
        int bcount=this.partnersService.countBid(est_num); // 해당 입찰을 신청한 파트너스 수 가져오기
        int res=this.partnersService.checkBid(b);  //
        System.out.println(res);
        //System.out.println(bcount);

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date now = new Date();
        Date parseddate = formatter.parse(e.getEst_dateEnd());
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
        EstimateVO e = this.partnersService.selectEstimate(est_num);

        bid.setBusinessNum(businessNum);
        bid.setEst_num(e.getEst_num());

        //bid.setBid_num();
        bid.setBid_price(Integer.parseInt(request.getParameter("bid_price"))); //가져온 string값을 int로 형변환해줘야
        bid.setBid_start(request.getParameter("bid_start")); //주소 부분 api로 변경해줄것
        bid.setBid_end(request.getParameter("bid_end"));
        bid.setBid_detail(request.getParameter("bid_detail"));

        this.partnersService.insertbid(bid);

        //System.out.println(bid.toString());

        //int listcount=this.partnersService.getListCount2(businessNum);

//        System.out.println(res);
//        if(res==0) {
//            this.partnersService.insertPartnersSub(ps);
//
//        }else{
//            this.partnersService.updatePartnersSub(ps);
//        }

        out.println("<script>");
        out.println("alert('입찰 성공!');");
        out.println("history.back();");
        out.println("</script>");

        return null;
    }

    @RequestMapping(value = "/my_bid") //내 입찰
    public ModelAndView my_bid(EstimateVO e, HttpServletResponse response, HttpServletRequest request, HttpSession session) throws Exception {
        response.setContentType("text/html;charset=UTF-8");

        String businessNum = (String) session.getAttribute("businessNum");
        //List<EstimateVO> elist=this.partnersService.selectEstimateListBnum(businessNum);


        int page=1;//쪽번호
        int limit=5;//한페이지에 보여지는 목록개수
        if(request.getParameter("page") != null) {
            page=Integer.parseInt(request.getParameter("page"));
        }
//        String find_name=request.getParameter("find_name");//검색어
//        String find_field=request.getParameter("find_field");//검색
//        //필드
//        e.setFind_field(find_field);
//        e.setFind_name("%"+find_name+"%");
//        //%는 오라클 와일드 카드 문자로서 하나이상의 임의의 문자와
//        //매핑 대응

        int listcount = this.partnersService.getListCount2(businessNum);
        //전체 레코드 개수 또는 검색전후 레코드 개수
        System.out.println("총 입찰 개수:"+listcount+"개");

        e.setBusinessNum(businessNum);
        e.setStartrow((page-1)*5+1);//시작행번호
        e.setEndrow(e.getStartrow()+limit-1);//끝행번호
        //System.out.println(e.toString());

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
//        m.addObject("find_field",find_field);
//        m.addObject("find_name", find_name);

        List<BidVO> list = this.partnersService.selectJoinList(e);
        System.out.println(list.toString());
        m.addObject("list", list);

        m.setViewName("/partners/estimate_request/my_bid");
        return m;
    }

    @RequestMapping(value = "/construct_request") //시공요청
    public ModelAndView construct_request(HttpSession session) throws Exception {
        String businessNum = (String) session.getAttribute("businessNum");

        List<EstimateVO> ereqlist = this.partnersService.selectEstimateListBnum(businessNum);

        for (int i = 0; i < ereqlist.size(); i++) {
            ereqlist.get(i).setAddr(est_addr_change(ereqlist.get(i).getEst_addr()));
        }
        //System.out.println(ereqlist.toString());
        //System.out.println(ereqlist.get(0).getAddr());

        ModelAndView m = new ModelAndView();
        m.addObject("ereq", ereqlist);

        m.setViewName("/partners/estimate_request/construct_request");
        return m;
    }

    @RequestMapping(value = "/request_detail") //시공요청 상세목록
    public String construct_request_detail(Model m, @RequestParam("no") String est_num, HttpServletResponse response) throws Exception {
        //response.setContentType("text/html;charset=UTF-8");

        EstimateVO e = this.partnersService.selectEstimate(est_num);

        m.addAttribute("e", e);

        return "/partners/estimate_request/construct_request_detail";
    }

    /*견적 관리
     *
     *
     *  */


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
    // 포트폴리오 페이지
    @RequestMapping(value = "/upload")
    public String portfolioUpload() {
        return "/partners/portfolio/p_upload";
    }

    // 포트폴리오 등록
    @RequestMapping(value = "/upload_photo")
    public String portfolioUpload_photo(PortfolioVO pv, HttpSession session, HttpServletResponse response,
                                        HttpServletRequest request) {
        pv.setBusinessNum((String) session.getAttribute("businessNum"));
        if (pv.getPf_addr2().isEmpty())  //마이바티스에 널 값 insert시 오류나서 문자열 처리
            pv.setPf_addr2(" ");

        if (pv.getPf_subtype().contains(",")) {

            String[] str = pv.getPf_subtype().split(",");
            if (pv.getPf_type().equals("주거공간")) {
                pv.setPf_subtype(str[0]);
                System.out.println("주거공간 //" + str[0]);
            } else if (pv.getPf_type().equals("상업공간")) {
                pv.setPf_subtype(str[1]);
                System.out.println("상업공간 //" + str[1]);
            }
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




    /* 중요!!! 이미지 파일 업로드하고 html 로 불러오기 위한 작업
        1. 아래 uploadPath 주소를 자신의 프로젝트 주소의 upload 폴더로 바꿉니다.

            String uploadPath = "upload폴더 경로 주소" + pf_no;
        2. 사진 등록후 서버 한번 재시작 해야 포트폴리오가 불러와집니다
        3. 작업 하신후에 upload 폴더안에 있는 내용들은 깃에 올리지 말아주세요~~ (**삭제 혹은 무시**)
        */

        String uploadPath = "C:\\workspace\\dozip\\src\\main\\resources\\static\\upload\\" + pf_no + "\\";  //호철 학원 PC upload 경로
//       String uploadPath = "D:\\DoZip\\src\\main\\resources\\static\\upload\\" + pf_no+"\\";  //지혜 학원 PC upload 경로
//       String uploadPath = "D:\\DoZip\\src\\main\\resources\\static\\upload\\" + pf_no+"\\";  //민우 학원 PC upload 경로
//       String uploadPath = "D:\\DoZip\\src\\main\\resources\\static\\upload\\" + pf_no+"\\";  //수환 학원 PC upload 경로
        //String uploadPath = "C:\\DoZip\\src\\main\\resources\\static\\upload\\" + pf_no+"\\";  //동민 학원 PC upload 경로


        String uploadDBPath = "/upload/" + pf_no + "/";
        File dir = new File(uploadPath);

        if (!dir.isDirectory()) { //폴더가 없다면 생성
            dir.mkdirs();
        }
        System.out.println("등록된 사진 수: " + photos.size());

        String dbFilename[] = new String[5];
        String saveFilename[] = new String[5];

        for (int i = 1; i <= photos.size(); i++) {
            dbFilename[i - 1] = uploadDBPath + "photo0" + i + ".jpg";   //String 객체에 DB(html에서 불러올) 파일명 저장
            saveFilename[i - 1] = uploadPath + "photo0" + i + ".jpg";   //String 객체에 실제 파일명 저장
            photos.get(i - 1).transferTo(new File(saveFilename[i - 1])); //실제 파일저장.
            System.out.println(dbFilename[i - 1]);
        }
        pv.setPf_photo1(dbFilename[0]);
        pv.setPf_photo2(dbFilename[1]);
        pv.setPf_photo3(dbFilename[2]);
        pv.setPf_photo4(dbFilename[3]);
        pv.setPf_photo5(dbFilename[4]);

        pv.setPf_no(pf_no);
        partnersService.insertPort_Photos(pv);
        return "redirect:/partners/main";
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


    // 검색 전,후 고객문의 글 보기
    @RequestMapping(value = "/customer_qna")
    public String customerQna(Model model, HttpSession session, HttpServletRequest request, QnaVO findQ) throws Exception {
        request.setCharacterEncoding("UTF-8");
        // 로그인한 파트너스 사업자 번호(세션에 저장되 있음) 불러오기
        String businessNum = (String) session.getAttribute("businessNum");

        int page = 1; //쪽번호
        int limit = 8; //한페이지에 보여질 개수

        String find_field = null;
        String find_text = null;
        String answer = null;

        if (request.getParameter("page") != null)
            page = Integer.parseInt(request.getParameter("page"));
        if (request.getParameter("answer") != null)
            answer = request.getParameter("answer");

        System.out.println("answer : " + request.getParameter("answer"));

        if (request.getParameter("find_text") != null && request.getParameter("find_field") != null) {
            find_text = request.getParameter("find_text").trim();
            find_field = request.getParameter("find_field");
            if (find_field.equals("customer_name")) {
                findQ.setFind_text(find_text);
            } else if (find_field.equals("qna_type")) {
                findQ.setFind_text("%" + find_text + "%");
            }
        }
        findQ.setFind_field(find_field);
        findQ.setAnswer(answer);
        findQ.setBusinessNum(businessNum);

        int listcount = partnersService.getListCount(findQ); //검색전후 레코드 개수

        int startrow = (page - 1) * 8 + 1; //읽기 시작할 행번호
        int endrow = startrow + limit - 1; //읽을 마지막 행번호
        findQ.setStartrow(startrow);
        findQ.setEndrow(endrow);

        List<QnaVO> qlist = partnersService.getQnaList(findQ); // 검색 전후 목록

        int maxpage = (int) ((double) listcount / limit + 0.95); //총 페이지 수
        System.out.println("============================");
        int startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1; //시작 페이지
        int endpage = maxpage; //마지막 페이지

        if (endpage > startpage + 10 - 1) endpage = startpage + 10 - 1;

        model.addAttribute("page", page);
        model.addAttribute("startpage", startpage);
        model.addAttribute("endpage", endpage);
        model.addAttribute("maxpage", maxpage);
        model.addAttribute("listcount", listcount); //레코드 개수
        model.addAttribute("answer", answer);
        model.addAttribute("find_text", find_text);
        model.addAttribute("find_field", find_field);
        model.addAttribute("qlist", qlist);

        return "/partners/customer/qna";
    }//customerQna()

    //고객문의글 답변
    @ResponseBody
    @PostMapping("/customer_reply_ok")
    public String customer_reply_ok(HttpSession session, QnaVO qv) {
        qv.setBusinessNum((String) session.getAttribute("businessNum"));
        int result = partnersService.insertQna(qv);
        System.out.println(result);
        return null;
    }//customer_reply_ok

    //고객문의글 삭제
    @ResponseBody
    @GetMapping("/customer_qna_del_ok")
    public String customer_qna_del_ok(QnaVO dv) {
        partnersService.deleteReply(dv);
        int r = partnersService.selqnaRef(dv);
        if (r == 1) partnersService.returnState(dv);
        return null;

    }//customer_qna_del_ok()

    @RequestMapping(value = "/review")
    public String customerReview() {  // 고객문의 글 보기
        return "/partners/customer/review";
    }

    /*My page
     *
     */
    @RequestMapping(value = "/data_manage", method = RequestMethod.GET)
    public ModelAndView data_manage(HttpServletResponse response, HttpServletRequest request, HttpSession session) throws Exception {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String businessNum = (String) session.getAttribute("businessNum");
//        if(businessNum==null) {
//            out.println("<script>");
//            out.println("alert('다시 로그인하세요!');");
//            out.println("location='/partners';");
//            out.println("</script>");
//        }else {
        //System.out.println(businessNum);
        //this.partnersService.insertPartnersSub(businessNum);
        PartnersVO p = this.partnersService.getMember(businessNum);//사업자번호에 해당하는 회원정보를 DB로부터 가져옴.
        Partners_subVO ps = this.partnersService.getPartnersSub(businessNum);

//        String pf_addr1=request.getParameter("pf_addr1");
//        String pf_addr2=request.getParameter("pf_addr2");
//        String pf_addr3=request.getParameter("pf_addr3");

        //System.out.println(p.toString());
        //System.out.println(p.getP_Name()+" "+p.getP_Tel());
        //System.out.println(p.getP_Address());
        //System.out.println(pf_addr1);

        ModelAndView m = new ModelAndView();
        m.addObject("p", p);//p 키이름에 p객체 저장
        m.addObject("ps", ps);

        //m.addObject("pName",p.getP_Name());
        //m.addObject("pTel",p.getP_Tel());
        //m.addObject("pShortstate",0);


        //m.addObject("");

        m.setViewName("/partners/mypage/data_manage");
        return m;
//        }
    }//data_manage()

    @RequestMapping(value = "/data_manage_ok", method = RequestMethod.POST) //data_manage
    public String data_manage_ok(Model m, Partners_subVO ps, HttpServletResponse response, HttpServletRequest request,
                                 HttpSession session) throws Exception {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        //String businessNum = (String)session.getAttribute("businessNum");
/*
        String pAddress=request.getParameter("pAddress");

        String pBusinessNum=request.getParameter("businessNum");
        String pShortstate=request.getParameter("pShortstate");
        String pHomepg=request.getParameter("pHomepg");
        String pRes_person_name=request.getParameter("pRes_person_name");
        String pRes_person_tel=request.getParameter("pRes_person_tel");
        String pCom_person_name=request.getParameter("pCom_person_name");
        String pCom_person_tel=request.getParameter("pCom_person_tel");
        //Int pBalance=Integer.parseInt(request.getParameter("pBalance"));
        String pAccount_bank=request.getParameter("pAccount_bank");
        String pAccount_name=request.getParameter("pAccount_name");
        String pAccount_num=request.getParameter("pAccount_num");

        //System.out.println(pAddress);
        //System.out.println(pShortstate);System.out.println(pHomepg);System.out.println(pRes_person_name);

        PartnersVO p=new PartnersVO();
        //Partners_subVO ps=new Partners_subVO();

       p.setP_Address(pAddress);
        ps.setBusinessNum(pBusinessNum);
        ps.setP_Shortstate(pShortstate); ps.setP_Homepg(pHomepg); ps.setP_Res_person_tel(pRes_person_name);
        ps.setP_Res_person_tel(pRes_person_tel); ps.setP_Com_person_name(pCom_person_name); ps.setP_Com_person_tel(pCom_person_tel);
        //ps.setPBalance(pBalance);
        ps.setP_Account_bank(pAccount_bank); ps.setP_Account_name(pAccount_name); ps.setP_Account_num(pAccount_num);
*/
        //System.out.println(p.getPAddress());
        //System.out.println(ps.getPShortstate());//+" "+ps.getPHomepg());
        //System.out.println(ps.toString());

        PartnersVO p = new PartnersVO();
//        System.out.println(p.getBusinessNum());
//        String[] p_Service = {};
//        String[] p_Res_build_type = {};
//        String[] p_Res_space_type = {};
//        String[] p_Com_build_type = {};
//        String[] p_Com_space_type = {};
//
//        p_Service= request.getParameterValues("p_Service");
//        p_Res_build_type=request.getParameterValues("p_Res_build_type");
//        p_Res_space_type=request.getParameterValues("p_Res_space_type");
//        p_Com_build_type=request.getParameterValues("p_Com_build_type");
//        p_Com_space_type=request.getParameterValues("p_Com_space_type");

        //ps.setP_Service( request.getParameterValues("p_Service"));
//        System.out.println(p_Service);
//        String pservice="";
//        for(int i=0;i<p_Service.length;i++){
//            pservice+=p_Service[i]+";";
//        }
//        System.out.println(pservice);
//
//        String pRes_build_type="";
//        for(int i=0;i<p_Res_build_type.length;i++){
//            pRes_build_type+=p_Res_build_type[i]+";";
//        }
//        System.out.println(pRes_build_type);
//
//        String pRes_space_type="";
//        for(int i=0;i<p_Res_space_type.length;i++){
//            pRes_space_type+=p_Res_space_type[i]+";";
//        }
//        System.out.println(pRes_space_type);
//
//        String pCom_build_type="";
//        for(int i=0;i<p_Res_space_type.length;i++){
//            pservice+=p_Res_space_type[i]+";";
//        }
//        System.out.println(pCom_build_type);
//
//        String pCom_space_type="";
//        for(int i=0;i<p_Com_space_type.length;i++){
//            pCom_space_type+=p_Com_space_type[i]+"/";
//        }
//        System.out.println(pCom_space_type);

        if (request.getParameter("p_Addr1") != null) {

            //p.setP_Address(request.getParameter("p_Address"));
            p.setP_Addr1(request.getParameter("p_Addr1"));
            p.setP_Addr2(request.getParameter("p_Addr2"));
            p.setP_Addr3(request.getParameter("p_Addr3"));
            p.setBusinessNum(ps.getBusinessNum());
            //System.out.println(p.getP_Addr1()+p.getP_Addr2()+p.getP_Addr3());
            this.partnersService.updatePartners(p);
        }

        int res = this.partnersService.checkSub(ps.getBusinessNum());
        System.out.println(res);
        if (res == 0) {
            this.partnersService.insertPartnersSub(ps);

        } else {
            this.partnersService.updatePartnersSub(ps);
        }

        m.addAttribute("ps", ps);

        out.println("<script>");
        out.println("alert('정보 입력 성공!');");
        out.println("history.back();");
        out.println("</script>");

        return null;
        // return "redirect:/partners/data_manage;";
        //return new ModelAndView("redirect:/partners/data_manage;");

    }

    @RequestMapping(value = "/pw_change")
    public String pw_change() {
        return "/partners/mypage/pw_change";
    }


}
