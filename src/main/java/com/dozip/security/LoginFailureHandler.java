package com.dozip.security;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class LoginFailureHandler implements AuthenticationFailureHandler {
    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
                                        AuthenticationException exception) throws IOException, ServletException {

        System.out.println("------로그인 실패 확인------");

        String errmsg = exception.getMessage();

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out=response.getWriter();

        out.println("<script>");
        if(errmsg == null){
            out.println("alert('해당 아이디는 존재하지 않습니다.');");
            out.println("history.back();");
        }else {
            if (errmsg.equals("자격 증명에 실패하였습니다.")) {
                out.println("alert('비밀번호가 일치하지 않습니다.');");
                out.println("history.back();");
            } else {
                out.println("alert('로그인에 실패했습니다.');");
                out.println("history.back();");
            }
            System.out.println("erromsg :"+errmsg);
        }
        out.println("</script>");

        //request.getRequestDispatcher("/dozip/id_login"); //실패시 이동할 url 지정
    }
}
