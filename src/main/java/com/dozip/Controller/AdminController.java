package com.dozip.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("admin/*") //컨트롤러 자체 URL 매핑주소 등록
public class AdminController {
    @RequestMapping(value = "/")
    public String dozip(){
        return "/admin/index";
    };

    @RequestMapping(value = "/admin/mem")
    public String admin() {return "/admin/memberList";};

    @RequestMapping(value = "/admin/write")
    public String write(){return "/admin/writingList";};
}
