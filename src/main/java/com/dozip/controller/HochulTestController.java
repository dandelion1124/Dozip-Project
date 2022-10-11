package com.dozip.controller;

import com.dozip.service.PartnersService;
import com.dozip.vo.PortfolioVO;
import com.oreilly.servlet.MultipartRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Controller
@RequestMapping("/partners/*")
public class HochulTestController {
    @Autowired
    private PartnersService partnersService;


    @GetMapping("/test_upload")
    public String test(){
        return "/partners/portfolio/p_upload_photo";
    }







    @RequestMapping(value="/upload_photo_ok")
    public void upload_photo_ok(PortfolioVO pv, @RequestParam List<MultipartFile> photos, HttpServletResponse response, HttpServletRequest request) throws IOException {
        response.setContentType("text/html;charset=UTF-8");


        int pf_no = 0;
        Cookie[] cookies = request.getCookies();
        for(Cookie c: cookies) {
            if(c.getName().equals("pf_no")) {
                pf_no=Integer.parseInt(c.getValue()); //쿠키에서 포트폴리오 번호 가져옴 -> 사진 삽입 위해
            }
        }


        String uploadPath="C:/upload/"+pf_no;
        File dir= new File(uploadPath);



        if (!dir.isDirectory()) { //폴더가 없다면 생성
            Boolean a = dir.mkdirs();
            System.out.println(a);
        }
        int i=1;
        for (MultipartFile photo : photos){

            System.out.println( photo.getOriginalFilename());
            photo.transferTo(new File("C:/upload/"+pf_no+"/photo0"+i+".jpg"));
            i++;
        }
    }
}
