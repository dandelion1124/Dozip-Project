package com.dozip.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/*")
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
