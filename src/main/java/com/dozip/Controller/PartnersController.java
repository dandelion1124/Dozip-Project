package com.dozip.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("partners/*") //컨트롤러 자체 URL 매핑주소 등록
public class PartnersController {
    @RequestMapping(value = "/")
    public String partners(){
        return "/partners/index";
    }

    @RequestMapping(value = "/test")
    public  String test(){
        return "/partners/myinterior/interior_List";
    }
}
