package com.dozip.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
    @RequestMapping(value = "/admin")
    public String dozip(){
        return "/admin/index";
    };

    @RequestMapping(value = "/admin/mem")
    public String admin() {return "/admin/memberList";};

    @RequestMapping(value = "/admin/write")
    public String write(){return "/admin/writingList";};
}
