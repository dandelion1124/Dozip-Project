package com.dozip.security;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

public class LoginSuccessHandler implements AuthenticationSuccessHandler {

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
                                        Authentication authentication) throws IOException, ServletException {

        // 기존의 세션값으로 작동하는 기능들이 제대로 작동되게 session을 사용
        HttpSession session = request.getSession();
        session.setAttribute("id", authentication.getName()); // 뷰페이지에서 ${id} 로 호출하면 현재 로그인 된 아이디 값이 뜬다.

        // controller에서 session 값 가져와서 사용할때,
        // session.getId(); (getId:00B41C866D0BC3F549D03926C6C1BF56)
        // session.getAttribute("id") (getAttribute(id):mem01)

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out=response.getWriter();
        out.println("<script>");
        out.println("opener.parent.location.reload();");
        out.println("window.close();");
        out.println("</script>");

        /*response.sendRedirect("/dozip/home"); //로그인 후 이동할 페이지 지정 */
    }
}