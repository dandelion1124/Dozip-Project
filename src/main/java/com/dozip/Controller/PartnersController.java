package com.dozip.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PartnersController {
    @RequestMapping(value = "/partners")
    public String partners(){
        return "/partners/index";
    }
}
