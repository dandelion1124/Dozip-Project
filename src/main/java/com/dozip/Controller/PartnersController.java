package com.dozip.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PartnersController {
    @RequestMapping(value = "/index")
    public String toHome(){
        return "/partners/index";
    }
}
