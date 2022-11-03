package com.dozip.controller.dozip;

import com.dozip.service.dozip.member.MemberService;
import com.dozip.service.dozip.portfolio.PortfolioService;
import com.dozip.service.dozip.review.ReviewService;
import com.dozip.vo.MemberVO;
import com.dozip.vo.PortfolioVO;
import com.dozip.vo.ReviewVO;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/dozip/*")
public class MemberController {
    @Autowired
    private MemberService memberService;

    @GetMapping("login")//로그인페이지 이동
    public String login() { return "/dozip/common/login"; }

    @GetMapping("id_login")//아이디로 로그인 페이지 이동
    public String idLogin() { return "/dozip/common/id_login"; }

    @GetMapping("loginGo2")//아이디로 로그인페이지 이동 - 시큐리티
    public void login(HttpServletResponse response) throws Exception {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out=response.getWriter();

        out.println("<script>");
        out.println("window.location.href='/dozip/home';");
        out.println("window.open('/dozip/id_login', '_blank', 'toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=550, height=750, left=0, top=0');");
        out.println("</script>");
    }

    @RequestMapping("member_join") //회원가입창 이동
    public String memberJoin(){ return "/dozip/common/mem_join"; }

    @RequestMapping(value="member_join_ok") //회원가입 완료
    @ResponseBody
    public HashMap<String, String> memberJoinOK(@RequestParam String data) throws IOException {
        ObjectMapper mapper = new ObjectMapper().configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        MemberVO m = mapper.readValue(data, MemberVO.class);

        HashMap<String, String> map = new HashMap<String, String>();
        int res = this.memberService.insertMem(m);

        if(res == 1) {
            map.put("message", "가입이 완료되었습니다.");
        } else {
            map.put("message", "회원가입에 실패했습니다.");
        }
        return map;
    }

    @RequestMapping(value = "mIDcheck",  method = RequestMethod.POST, produces = "application/json")
    @ResponseBody //회원가입 - 아이디중복체크
    public int mIDcheck(HttpServletRequest request){
        String id = request.getParameter("mem_id");
        int res = this.memberService.checkID(id);
        return res;
    }

    @RequestMapping("find_login")//아이디, 비번찾기 이동
    public String findLogin() { return "/dozip/common/find_id_pwd"; }

    @RequestMapping("find_id")//아이디 찾기
    @ResponseBody
    public String findID(MemberVO m) throws Exception {
        String mem_id = this.memberService.getFindID(m);
        return mem_id;
    }

    @RequestMapping("find_pwd") //비밀번호 찾기
    @ResponseBody
    public HashMap<String,Object> findPwd(@RequestParam String data) throws Exception {
        ObjectMapper mapper = new ObjectMapper().configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        MemberVO m = mapper.readValue(data, MemberVO.class);

        int res = this.memberService.checkInfo(m); //작성한 내용과 db의 정보가 일치하는지 확인

        HashMap<String,Object> map = new HashMap<>();

        if(res==1) { //일치하면 임시비밀번호 생성
            String imsiPwd = "";
            for (int i = 0; i < 12; i++) {
                imsiPwd += (char) ((Math.random() * 26) + 97);
            }
            m.setMem_pwd(imsiPwd);
            map = this.memberService.findPwd(m,imsiPwd); //비밀번호 변경 + 메일로 전송
        }else{
            map.put("res", 3);
            map.put("message", "입력하신 정보와 일치하는 회원이 없습니다.");
        }
        return map;
    }

    @GetMapping("logout_ok") //로그아웃
    public String logoutOk(HttpSession session, HttpServletResponse response) throws Exception {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out=response.getWriter();

        session.removeAttribute("id"); // "id" 세션만 삭제
        //session.invalidate();//모든 세션 만료 => 로그아웃

        out.println("<script>");
        out.println("alert('로그아웃 되었습니다.');");
        out.println("location='/dozip/home';");
        out.println("</script>");
        out.close();

        return null;
    }

}
