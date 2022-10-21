package com.dozip.controller;

import com.dozip.service.DozipService;
import com.dozip.service.EstimateService;
import com.dozip.service.PortfolioService;
import com.dozip.service.ReviewService;
import com.dozip.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/dozip/*") //컨트롤러 자체 URL 매핑주소 등록
public class DozipController {

    @Autowired
    private DozipService dozipService;
    @Autowired
    private PortfolioService portfolioService;
    @Autowired
    private EstimateService estimateService;

    @Autowired
    private ReviewService reviewService;

    @RequestMapping(value = "home") //두집 홈 화면
    public String dozip(){
        return "/dozip/index";
    }

    @GetMapping("login")//로그인페이지 이동
    public String login() { return "/dozip/common/login"; }

    @GetMapping("id_login")//아이디로 로그인 페이지 이동
    public String idLogin() { return "/dozip/common/id_login"; }

    @PostMapping("login_ok")//아이디 로그인
    public String loginOk(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String mem_id = request.getParameter("mem_id");
        String mem_pwd = request.getParameter("mem_pwd");
        String db_pwd = this.dozipService.loginCheck(mem_id);

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out=response.getWriter();

        if(db_pwd == null) { //일치하는 아이디가 없다면
            out.println("<script>");
            out.println("alert('가입되어 있지 않은 아이디 입니다.');");
            out.println("history.back();");
            out.println("</script>");
        } else if(!db_pwd.equals(mem_pwd)) { //해당 아이디의 비번과 일치하지 않는다면
            out.println("<script>");
            out.println("alert('비밀번호를 확인해주세요.');");
            out.println("history.back();");
            out.println("</script>");
        } else { //비밀번호가 일치한다면
            HttpSession session=request.getSession();
            session.setAttribute("id",mem_id); //세션에 로그인 된 아이디를 저장

            if(mem_id.equals("admin")) { //로그인 된 아이디가 admin 관리자 아이디라면 관리자 페이지로 이동한다.
                session.invalidate();//세션 만료 => 로그아웃

                out.println("<script>");
                out.println("opener.parent.location.href='/admin/';"); //admin 쪽 controller로 연결
                out.println("window.close();");
                out.println("</script>");
            } else { //일반 회원이라면 창을 닫고 메인화면을 새로고침 한다.
                out.println("<script>");
                out.println("opener.parent.location.reload();");
                out.println("window.close();");
                out.println("</script>");
            }
        }
        return null;
    }

    @GetMapping("member_join") //회원가입창 이동
    public String memberJoin(){ return "/dozip/common/mem_join"; }

    @PostMapping("member_join_ok") //회원가입 완료
    public void memberJoinOK(MemberVO m, HttpServletResponse response) throws IOException {
        int res = this.dozipService.insertMem(m);

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out=response.getWriter();

        if(res == 1) { //회원가입 성공시 창을 닫는다.
            out.println("<script>");
            out.println("alert('가입이 완료되었습니다.');");
            out.println("window.close();");
            out.println("</script>");
        } else { //회원가입 실패시
            out.println("<script>");
            out.println("alert('회원가입에 실패했습니다.');");
            out.println("history.back();");
            out.println("</script>");
        }
    }

    @RequestMapping(value = "mIDcheck",  method = RequestMethod.POST, produces = "application/json")//회원가입-아이디중복체크
    @ResponseBody
    public int mIDcheck(HttpServletRequest request){
        String id = request.getParameter("mem_id");
        System.out.println("아이디값:"+id);
        int res = this.dozipService.checkID(id);
        return res;
    }

    @GetMapping("find_login")//아이디, 비번찾기 이동
    public String findLogin() { return "/dozip/common/find_id_pwd"; }

    @PostMapping("find_id")//아이디 찾기
    public String findID(HttpServletRequest request, HttpServletResponse response) throws Exception {
        MemberVO vo = new MemberVO();
        vo.setMem_name(request.getParameter("mem_name2"));
        vo.setMem_tel(request.getParameter("mem_tel2"));

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String mem_id = this.dozipService.getFindID(vo);

        if(mem_id != null) {
            out.println("<script>");
            out.println("alert('고객님의 아이디는 "+mem_id+" 입니다.');");
            out.println("location='/dozip/id_login';");
            out.println("</script>");
        }else {
            out.println("<script>");
            out.println("alert('입력하신 정보와 일치하는 아이디가 없습니다.');");
            out.println("history.back();");
            out.println("</script>");
        }
        return null;
    }

    @PostMapping("find_pwd") //비밀번호 찾기
    public String findPwd(MemberVO m, HttpServletResponse response) throws Exception {
        int res = this.dozipService.checkInfo(m); //작성한 내용과 db의 정보가 일치하는지 확인

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out=response.getWriter();

        if(res==1) {
            String imsiPwd = "";
            for (int i = 0; i < 12; i++) {
                imsiPwd += (char) ((Math.random() * 26) + 97);
            }
            m.setMem_pwd(imsiPwd);

            int result = this.dozipService.updatePwd(m);
            if(result==1) {
                try {
                    this.dozipService.sendEmail(m);
                    out.println("<script>");
                    out.println("alert('임시비밀번호가 메일로 발송되었습니다.');");
                    out.println("location='/dozip/id_login';");
                    out.println("</script>");
                }catch (Exception e){
                    System.out.println("메일발송 실패 : " + e);
                    out.println("<script>");
                    out.println("alert('메일발송에 실패했습니다.');");
                    out.println("history.back();");
                    out.println("</script>");
                }
            }
        }else {
            out.println("<script>");
            out.println("alert('입력하신 정보와 일치하는 정보가 없습니다.');");
            out.println("history.back();");
            out.println("</script>");
        }
        return null;
    }

    @GetMapping("mypage") // 기존 마이페이지 (나중에 삭제예정)
    public String mypage() { return "/dozip/mypage/mypage_main"; }

    @GetMapping("logout_ok") //로그아웃
    public String logoutOk(HttpServletRequest request, HttpServletResponse response) throws Exception {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out=response.getWriter();

        HttpSession session=request.getSession();//세션 객체 생성
        session.invalidate();//세션 만료 => 로그아웃

        out.println("<script>");
        out.println("alert('로그아웃 되었습니다.');");
        out.println("location='/dozip/home';");
        out.println("</script>");
        out.close();

        return null;
    }

    @GetMapping("mypage_main") //마이페이지 메인화면
    public String mypagetest() { return "/dozip/mypage/mypage"; }

    @GetMapping("my_edit") //마이페이지-회원정보수정 이동(로그인된 정보 불러오기)
    public ModelAndView myEdit(HttpSession session) throws Exception{
        String id = (String)session.getAttribute("id");

        MemberVO m = this.dozipService.getMemberInfo(id);

        ModelAndView mv = new ModelAndView();
        mv.addObject("m",m);
        mv.setViewName("/dozip/mypage/mypage_edit");
        return mv;
    }

    @PostMapping("my_edit_ok") //마이페이지-회원정보수정완료
    public String myEditOK(MemberVO m, HttpServletResponse response) throws Exception {

        int res = this.dozipService.updateMember(m);

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out=response.getWriter();

        if(res ==1) {
            out.println("<script>");
            out.println("alert('회원정보가 수정되었습니다.');");
            out.println("history.back();");
            out.println("</script>");
        } else {
            out.println("<script>");
            out.println("alert('회원정보가 수정에 실패했습니다.');");
            out.println("history.back();");
            out.println("</script>");
        }
        return null;
    }

    @GetMapping("my_pwd") //마이페이지-비밀번호수정 이동
    public String myPwd() { return "/dozip/mypage/mypage_pwd"; }

    @PostMapping("edit_pwd_ok") //마이페이지-비밀번호수정완료
    public void editPwdOK(HttpServletRequest request, HttpSession session, HttpServletResponse response) throws Exception {

        MemberVO m = new MemberVO();
        m.setMem_id((String)session.getAttribute("id")); //현재 로그인 되어있는 세션의 아이디 값
        String current_pwd = request.getParameter("current_pwd"); //기존 비번
        m.setMem_pwd(request.getParameter("new_pwd"));//새 비번

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        int res = 0;

        if(current_pwd.equals(this.dozipService.loginCheck(m.getMem_id()))){//아이디로 비번찾아오기(로그인에 사용한 쿼리문 재사용)
            res = this.dozipService.updatePwd(m);//비밀번호 변경
            if(res==1) {
                out.println("<script>");
                out.println("alert('비밀번호 변경이 완료되었습니다.');");
                out.println("location.href = '/dozip/my_pwd';");
                out.println("</script>");
            }else {
                out.println("<script>");
                out.println("alert('변경에 실패했습니다.');");
                out.println("history.back();");
                out.println("</script>");
            }
        }else{
            out.println("<script>");
            out.println("alert('기존 비밀번호를 확인해주세요.');");
            out.println("history.back();");
            out.println("</script>");
        }
    }

    @GetMapping("my_est") //마이페이지-견적서 리스트
    public ModelAndView myEst(ModelAndView mv, EstimateVO e,HttpServletRequest request,HttpSession session) {
        e.setMem_id((String)session.getAttribute("id"));

        //쪽나누기
        int page = 1; //현재 쪽번호
        int limit = 5; //한 페이지에 보여지는 개수

        if(request.getParameter("page")!=null) {
            page=Integer.parseInt(request.getParameter("page"));
        }

        int listcount=this.estimateService.getPListCount(e.getMem_id());
        int maxpage = (int)((double)listcount/limit+0.95); //총페이지
        int startpage = (((int)((double)page/5+0.9))-1)*5+1; //시작페이지
        int endpage = maxpage; //마지막페이지

        if(endpage>startpage+5-1) endpage=startpage+5-1;

        mv.addObject("page", page);
        mv.addObject("startpage", startpage);
        mv.addObject("endpage",endpage);
        mv.addObject("maxpage",maxpage);
        mv.addObject("listcount",listcount);

        //리스트 출력
        List<EstimateVO> elist = new ArrayList<EstimateVO>();
        e.setStartrow((page-1)*5+1);
        e.setEndrow(e.getStartrow()+limit-1);
        elist = this.estimateService.getPElist(e);
        mv.addObject("elist", elist);

        mv.setViewName("/dozip/mypage/mypage_est");
        return mv;
    }

    @GetMapping("my_est2") //마이페이지-견적서 리스트(입찰)
    public ModelAndView myEst2(ModelAndView mv, EstimateVO e, HttpServletRequest request, HttpSession session) {
        e.setMem_id((String)session.getAttribute("id"));

        //쪽나누기
        int page = 1; //현재 쪽번호
        int limit = 5; //한 페이지에 보여지는 개수

        if(request.getParameter("page")!=null) {
            page=Integer.parseInt(request.getParameter("page"));
        }

        int listcount=this.estimateService.getListCount(e.getMem_id());
        int maxpage = (int)((double)listcount/limit+0.95); //총페이지
        int startpage = (((int)((double)page/5+0.9))-1)*5+1; //시작페이지
        int endpage = maxpage; //마지막페이지

        if(endpage>startpage+5-1) endpage=startpage+5-1;

        mv.addObject("page", page);
        mv.addObject("startpage", startpage);
        mv.addObject("endpage",endpage);
        mv.addObject("maxpage",maxpage);
        mv.addObject("listcount",listcount);

        //리스트 출력
        List<EstimateVO> elist = new ArrayList<EstimateVO>();
        e.setStartrow((page-1)*5+1);
        e.setEndrow(e.getStartrow()+limit-1);
        elist = this.estimateService.getElist(e);
        mv.addObject("elist", elist);

        //견적서 번호를 담음 (입찰업체 확인에 사용)
        List<String> numlist = new ArrayList<>();
        for(int i=0; i<elist.size(); i++){
            numlist.add(elist.get(i).getEst_num());
        }
        mv.addObject("numlist",numlist);

        mv.setViewName("/dozip/mypage/mypage_est2");
        return mv;
    }

    @RequestMapping(value="/my_est2/{est_num}",produces="application/json") //입찰리스트 불러오기
    @ResponseBody
    public List<BidVO> bidList(@PathVariable("est_num") String est_num){
        List<BidVO> list = new ArrayList<BidVO>();
        list = this.estimateService.getBidList(est_num);
        System.out.println(list.toString());
        return list;
    }//bidList()

    @RequestMapping(value="port_search", method = RequestMethod.GET, produces="application/json") //포트폴리오 검색
    @ResponseBody
    public List<PortfolioVO> pSearchList(HttpServletRequest request){
        PortfolioVO p = new PortfolioVO();
        String pf_subtype1 = request.getParameter("pf_subtype1");
        String pf_subtype2 = request.getParameter("pf_subtype2");
        p.setPf_concept(request.getParameter("pf_concept"));
        p.setPf_cost(Integer.parseInt(request.getParameter("pf_cost")));
        p.setPf_area(Integer.parseInt(request.getParameter("pf_area")));

        if(pf_subtype1.equals("주거유형") && !pf_subtype2.equals("상업유형")){
            p.setPf_subtype(pf_subtype2);
        }else if(pf_subtype2.equals("상업유형") && !pf_subtype1.equals("주거유형")){
            p.setPf_subtype(pf_subtype1);
        }else if(pf_subtype1.equals("주거유형") && pf_subtype2.equals("상업유형")){
            p.setPf_subtype(null);
        }
        //System.out.println(p.getPf_concept());
        //System.out.println(p.getPf_cost());
        //System.out.println(p.getPf_area());

        System.out.println("확인" + p);
        
        List<PortfolioVO> list = new ArrayList<PortfolioVO>();
        list = this.portfolioService.getSearchList(p);
        System.out.println("리스트 값" + list.toString());
        return list;
    }//searchList()

    //입찰업체 중 하나를 선택하면 선택한 업체는 상태가 계약요청으로, 나머지는 거절 상태로 변경되도록 함 + 견적서테이블의 상태도 계약요청으로 변경
    @RequestMapping(value = "my_est2_select",  method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public void bidSelect(String bid_num) {
        System.out.println("출력 : "+bid_num);
        this.estimateService.updateState(bid_num);
    }

    @GetMapping("my_qna") //마이페이지-관리자 문의글 목록
    public ModelAndView myQna(ModelAndView mv, QnaVO q, HttpServletRequest request, HttpSession session) throws Exception {

        String id = (String)session.getAttribute("id");

        //쪽나누기
        int page = 1; //현재 쪽번호
        int limit = 5; //한 페이지에 보여지는 개수

        if(request.getParameter("page")!=null) {
            page=Integer.parseInt(request.getParameter("page"));
        }

        int listcount=this.dozipService.getListCount(id);
        int maxpage = (int)((double)listcount/limit+0.95); //총페이지
        int startpage = (((int)((double)page/5+0.9))-1)*5+1; //시작페이지
        int endpage = maxpage; //마지막페이지

        if(endpage>startpage+5-1) endpage=startpage+5-1;

        mv.addObject("page", page);
        mv.addObject("startpage", startpage);
        mv.addObject("endpage",endpage);
        mv.addObject("maxpage",maxpage);
        mv.addObject("listcount",listcount);

        //문의 리스트 출력(관리자)
        List<QnaVO> qlist = new ArrayList<QnaVO>();
        q.setMem_id(id);
        q.setStartrow((page-1)*5+1);
        q.setEndrow(q.getStartrow()+limit-1);
        qlist = this.dozipService.getQlist(q);
        mv.addObject("qlist", qlist);

        mv.setViewName("/dozip/mypage/mypage_qna");
        return mv;
    }

    @GetMapping("qna_write") //(관리자)문의글 작성 페이지 이동
    public String qnaWrite(){ return "/dozip/counsel/counsel_write"; }

    @RequestMapping(value = "qna_write_ok",  method = RequestMethod.POST, produces = "application/json") //문의글 등록 완료
    public void qnaWriteOK(QnaVO q, HttpSession session) throws Exception {
        q.setMem_id((String)session.getAttribute("id"));

        if(q.getBusinessName()!=null){ //업체문의등록
            q.setBusinessNum(this.dozipService.getBnum(q.getBusinessName()));
        }

        this.dozipService.insertQna(q);
    }

    @GetMapping("my_Pqna") //마이페이지-업체 문의글 목록
    public ModelAndView myPQna(ModelAndView mv, QnaVO q, HttpServletRequest request) throws Exception {
        HttpSession session=request.getSession();
        String id = (String)session.getAttribute("id");

        //쪽나누기
        int page = 1; //현재 쪽번호
        int limit = 5; //한 페이지에 보여지는 개수

        if(request.getParameter("page")!=null) {
            page=Integer.parseInt(request.getParameter("page"));
        }

        int listcount=this.dozipService.getPListCount(id);
        int maxpage = (int)((double)listcount/limit+0.95); //총페이지
        int startpage = (((int)((double)page/5+0.9))-1)*5+1; //시작페이지
        int endpage = maxpage; //마지막페이지

        if(endpage>startpage+5-1) endpage=startpage+5-1;

        mv.addObject("page", page);
        mv.addObject("startpage", startpage);
        mv.addObject("endpage",endpage);
        mv.addObject("maxpage",maxpage);
        mv.addObject("listcount",listcount);

        //문의 리스트 출력(업체)
        List<QnaVO> qlist = new ArrayList<QnaVO>();
        q.setMem_id(id);
        q.setStartrow((page-1)*5+1);
        q.setEndrow(q.getStartrow()+limit-1);
        qlist = this.dozipService.getPlist(q);
        mv.addObject("qlist", qlist);

        mv.setViewName("/dozip/mypage/mypage_Pqna");
        return mv;
    }

    @GetMapping("pqna_write") //업체 문의글 작성 페이지 이동
    public String pqnaWrite(){ return "/dozip/counsel/counsel_partner_write"; }

    @GetMapping("find_partners") //업체 검색
    public ModelAndView findPartners(ModelAndView mv) {
        List<String> list = new ArrayList<String>();
        list = this.dozipService.getPartners();
        mv.addObject("list",list);
        mv.setViewName("/dozip/counsel/counsel_find_partner");
        return mv;
    }

    @GetMapping("counsel_main") //문의메인페이지 이동
    public ModelAndView counselMain(ModelAndView mv, QnaVO q, HttpServletRequest request, HttpSession session){
        q.setMem_id((String)session.getAttribute("id"));

        if(q.getMem_id()!=null) {
            //쪽나누기
            int page = 1; //현재 쪽번호
            int limit = 5; //한 페이지에 보여지는 개수

            if (request.getParameter("page") != null) {
                page = Integer.parseInt(request.getParameter("page"));
            }

            int listcount = this.dozipService.getListCount(q.getMem_id());
            int maxpage = (int) ((double) listcount / limit + 0.95); //총페이지
            int startpage = (((int) ((double) page / 5 + 0.9)) - 1) * 5 + 1; //시작페이지
            int endpage = maxpage; //마지막페이지

            if (endpage > startpage + 5 - 1) endpage = startpage + 5 - 1;

            mv.addObject("page", page);
            mv.addObject("startpage", startpage);
            mv.addObject("endpage", endpage);
            mv.addObject("maxpage", maxpage);
            mv.addObject("listcount", listcount);

            //문의 리스트 출력(관리자)
            List<QnaVO> qlist = new ArrayList<QnaVO>();
            q.setStartrow((page - 1) * 5 + 1);
            q.setEndrow(q.getStartrow() + limit - 1);
            qlist = this.dozipService.getQlist(q);
            mv.addObject("qlist", qlist);
        }
        mv.setViewName("/dozip/counsel/counsel_main");
        return mv;
    }

    //포트폴리오 리스트 출력
    @GetMapping(value = "port") //get으로 접근하는 매핑주소 처리
    public ModelAndView port(ModelAndView mv)  {

        List<PortfolioVO> plist = new ArrayList<PortfolioVO>();
        plist = this.portfolioService.getAllList();
        mv.addObject("plist",plist);
        mv.setViewName("/dozip/portfolio/port_main");


        return mv;
    }

    @GetMapping(value = "port_detail")
    public ModelAndView detail(@RequestParam("pf_no") int pf_no, HttpServletRequest request) throws Exception{

        PortfolioVO pf = this.portfolioService.getOnelist(pf_no);
        PartnersVO pt = this.portfolioService.getComplist(pf_no);

        ModelAndView mv = new ModelAndView();
        mv.addObject("pf",pf);
        mv.addObject("pt",pt);


        mv.setViewName("/dozip/portfolio/port_detail");
        return mv;
    }

    @GetMapping(value = "comp_detail")
    public ModelAndView comp(@RequestParam("businessName") String businessName, HttpServletRequest request, PartnersVO p) throws Exception{

        PartnersVO pc = this.portfolioService.getOnecomp(businessName);

        ModelAndView mv = new ModelAndView();
        mv.addObject("pc",pc);
        mv.setViewName("/dozip/portfolio/comp_detail");
        return mv;
    }


    /*
    견적신청

     */


    @RequestMapping("/apply")
    public ModelAndView apply(ModelAndView mv){
        int count = this.estimateService.counter();

        mv.addObject("count",count);
        mv.setViewName("/dozip/apply/applicationSheet");
        return mv;
    }

    //근처에 존재하는 파트너스 목록
    @RequestMapping(value = "/search_part/{est_addr}")
    public ResponseEntity<List<PartnersVO>> search_part(@PathVariable("est_addr") String est_addr) {

        String p_address=est_addr_change(est_addr);
        ResponseEntity<List<PartnersVO>> entity = null;
        try {
            entity = new ResponseEntity<>(this.dozipService.search_part(p_address), HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
        return entity;
    }//search_part()


    //근처에 있는 파트너스 숫자
    @ResponseBody
    @RequestMapping("/count_partners")
    public String count_partners(String est_addr) {
        int count = 0;

        String p_address=est_addr_change(est_addr);

        count = dozipService.count_partners(p_address);
        System.out.println("검색어 :" + "%" + est_addr + "%");
        System.out.println("검색된 개수 :" + count);
        System.out.println(count);

        String result=String.valueOf(count);
        return result;
    }//count_partners()

    //주소 변환 함수
    private String est_addr_change(String est_addr) {
        String str[]=est_addr.split(" ");
        if(est_addr.contains("서울") || est_addr.contains("부산") || est_addr.contains("대구") || est_addr.contains("인천") || est_addr.contains("광주") ||
                est_addr.contains("대전") || est_addr.contains("울산") || est_addr.contains("부산") || est_addr.contains("세종")){
            System.out.println("광역시 테스트");
            est_addr=str[0]+" "+str[1];
        }
        else{
            System.out.println("그외 테스트");
            est_addr=str[1]+" "+str[2];
        }
        return "%" + est_addr + "%";
    }//est_addr_change

    @RequestMapping("apply_ok")
    public String apply_ok(HttpServletRequest request,HttpServletResponse response, HttpSession session) throws Exception{

        response.setContentType("text/html;charset=UTF-8");
        EstimateVO e = new EstimateVO();
        PrintWriter out=response.getWriter();
        e.setMem_id((String) session.getAttribute("id")); //현재 로그인된 세션의 아이디 값



        e.setEst_zoning(request.getParameter("est_zoning"));
        e.setEst_use(request.getParameter("est_use"));
        e.setEst_areaP(request.getParameter("areaP"));
        e.setEst_areaM(request.getParameter("areaM"));
        e.setEst_detail(request.getParameter("d")); //배열
        e.setEst_detail01(request.getParameter("group_wallpaper_item"));
        e.setEst_detail02(request.getParameter("group_floor_item"));
        e.setEst_detail03(request.getParameter("d3")); //배열
        e.setEst_detail04(request.getParameter("d4")); //배열
        e.setEst_detail05(request.getParameter("d5")); //배열
        e.setEst_detail06(request.getParameter("group_window_item"));
        e.setEst_detail07(request.getParameter("group_light_item"));
        e.setEst_detail08(request.getParameter("group_door_item"));

        e.setEst_bud(request.getParameter("est_bud"));
        e.setEst_start(request.getParameter("est_start"));
        e.setEst_end(request.getParameter("est_end"));

        e.setEst_name(request.getParameter("name"));
        e.setEst_phone(request.getParameter("phone"));
        e.setEst_addr(request.getParameter("pf_addr1"));
        e.setEst_desc(request.getParameter("paragraph"));

        String bn = request.getParameter("bNum");
        System.out.println("선택한 회사 : "+bn);

        if(bn != null) {
            String[] array=bn.split("/");
            for (int i = 0; i < array.length; i++) {
                e.setBusinessNum(array[i]);
                this.estimateService.applyOk(e);
            }
        }
        else {
            this.estimateService.applyOk(e);
        }

//        int count = this.estimateService.counter();
//        e.setStartrow(count);
//        System.out.println(count);

        out.println("<script>");
        out.println("alert('견적 신청이 완료되었습니다.');");
        out.println("location.href = '/dozip/home';");
        out.println("</script>");

        System.out.println(e.toString());

        return null;
    }


    //고객후기
    @GetMapping("review_main") //고객 후기 메인페이지
    public ModelAndView review_main(ModelAndView mv) throws Exception {

        List<ReviewVO> reviewList = new ArrayList<ReviewVO>();
        reviewList = this.reviewService.getAllReview();
        System.out.println(reviewList);
        mv.addObject("reviewList",reviewList);

        mv.setViewName("/dozip/review/review_main");
        return mv;
    }

    @GetMapping("review_detail")
    public ModelAndView review_detail(ModelAndView mv, HttpSession session, HttpServletRequest request) throws Exception{
        String id = (String) session.getAttribute("id");

        mv.setViewName("/dozip/review/review_detail");
        return mv;
    }

    @GetMapping("review_write")
    public ModelAndView review_write(ModelAndView mv, HttpSession session, HttpServletRequest request) throws Exception{
        String id = (String) session.getAttribute("id");

        mv.setViewName("/dozip/review/review_write");
        return mv;
    }
    
    //나의 계약서 불러오기
    @RequestMapping ("myall_contract")
    public ModelAndView myall_contract(ModelAndView mv,HttpSession session,HttpServletRequest request) throws Exception{

        String id = (String) session.getAttribute("id");
        ContractVO c = new ContractVO();



        List<ContractVO> clist = new ArrayList<ContractVO>();
        clist = this.reviewService.getClist(id);
        mv.addObject("clist", clist);
        System.out.println(clist);
        mv.setViewName("/dozip/review/myall_contract");
        return mv;
    }

    //계약번호를 기준으로 계약정보 불러오기

    @RequestMapping(value="search_cont", method = RequestMethod.GET, produces="application/json")
    @ResponseBody
    public ContractVO cSearchList(String cont_no){
        System.out.println("넘어왔나" + cont_no);
        ContractVO cv = this.reviewService.getOneCont(cont_no);
        System.out.println("cv값"+cv.toString());

        return cv;
    }
}//DozipController
