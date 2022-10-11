package com.dozip.Controller;

import com.dozip.service.DozipService;
import com.dozip.vo.MemberVO;
import com.dozip.vo.QnaVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Member;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/dozip/*") //컨트롤러 자체 URL 매핑주소 등록
public class DozipController {

    @Autowired
    private DozipService dozipService;

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
                out.println("opener.parent.location.href='/admin/home';"); //admin 쪽 controller로 연결 (아직 연결X)
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

    @GetMapping("find_login")//아이디, 비번찾기 이동
    public String findLogin() { return "/dozip/common/find_id_pwd"; }

    @PostMapping("find_id")//아이디 찾기
    public String findID(HttpServletRequest request, HttpServletResponse response) throws IOException {
        MemberVO vo = new MemberVO();
        vo.setMem_name(request.getParameter("mem_name2"));
        vo.setMem_tel(request.getParameter("mem_tel2"));

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String mem_id = this.dozipService.getFindID(vo);

        if(mem_id != null) {
            out.println("<script>");
            out.println("alert('고객님의 아이디는 "+mem_id+" 입니다.');");
            out.println("history.back();");
            out.println("</script>");
        }else {
            out.println("<script>");
            out.println("alert('입력하신 정보와 일치하는 아이디가 없습니다.');");
            out.println("history.back();");
            out.println("</script>");
        }
        return null;
    }

    @GetMapping("mypage") //마이페이지로 이동
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

    @GetMapping("mypage_test") //기존 마이페이지 (나중에 삭제예정)
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

    @GetMapping("my_qna") //마이페이지-관리자 문의글 목록
    public ModelAndView myQna(ModelAndView mv, QnaVO q, HttpServletRequest request) throws Exception {

        HttpSession session=request.getSession();
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

    @RequestMapping(value = "/dozip/port")
    public String port() {return "/dozip/portfolio/port_main";}

    @RequestMapping(value = "/dozip/port_detail")
    public String detail(){return "/dozip/portfolio/port_detail";}

    @RequestMapping(value = "/dozip/comp_detail")
    public String comp(){return "/dozip/portfolio/comp_detail";}
 
 
}
