package com.dozip.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DozipController {

    @RequestMapping(value = "/dozip")
    public String dozip(){
        return "/dozip/index";
    };
}
