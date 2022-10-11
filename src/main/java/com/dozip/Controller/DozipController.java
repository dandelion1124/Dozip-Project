package com.dozip.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DozipController {

    @RequestMapping(value = "/dozip")
    public String dozip(){
        return "/dozip/index";
    }

    @RequestMapping(value = "/dozip/port")
    public String port() {return "/dozip/portfolio/port_main";}

    @RequestMapping(value = "/dozip/port_detail")
    public String detail(){return "/dozip/portfolio/port_detail";}

    @RequestMapping(value = "/dozip/comp_detail")
    public String comp(){return "/dozip/portfolio/comp_detail";}
}
