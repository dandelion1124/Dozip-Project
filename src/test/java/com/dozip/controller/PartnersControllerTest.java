package com.dozip.controller;

import com.dozip.service.PartnersService;
import com.dozip.vo.PartnersVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class PartnersControllerTest {

    @Autowired
    private PartnersService partnersService;


     PartnersVO pInfo = partnersService.getPartnersInfo("d");


}
