package com.dozip.config;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Enumeration;

@RestController
@RequestMapping("/comm")
public class Con_comm {

    /* 세션 정보 확인 */
    @GetMapping("/sessionInfo")
    public String doSession(HttpServletRequest req){

        /* setSession
            1. getSession(), getSession(true)
               - HttpSession이 존재하면 현재 HttpSession을 반환하고 존재하지 않으면 새로이 세션을 생성합니다
            2. getSession(false)
               - HttpSession이 존재하면 현재 HttpSession을 반환하고 존재하지 않으면 새로이 생성하지 않고 그냥 null을 반환합니다
        */

        String strReturn="";
        HttpSession session = req.getSession();

        // 세션 ID 가져오기
        String strSessionId = session.getId();
        strReturn= "session ID : "+strSessionId+"<br>";
        //System.out.println("session ID : " + strSessionId);

        // 세션의 값을 배열에 넣는다.
        Enumeration<String> names = session.getAttributeNames();

        // 세션값 저장소 -> Enumeration 추출
        String strSession="";
        while(names.hasMoreElements()){
            strSession = names.nextElement();
            strReturn += session.getAttribute(strSession) +"</br>";
            //System.out.println(strSession +" : "+ session.getAttribute(strSession));
        }

        return strReturn;
    }

}