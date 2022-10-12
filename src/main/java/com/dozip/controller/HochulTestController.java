package com.dozip.controller;

import com.dozip.service.PartnersService;
import com.dozip.vo.PortfolioVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@Controller
@RequestMapping("/partners/*")
public class HochulTestController {
    @Autowired
    private PartnersService partnersService;


    @GetMapping("/test_upload")
    public String test() {
        return "/partners/portfolio/p_upload_photo";
    }

    //포트폴리오 사진등록
    @RequestMapping(value = "/upload_photo_ok")
    public String upload_photo_ok(PortfolioVO pv, @RequestParam List<MultipartFile> photos,
                                HttpServletResponse response, HttpServletRequest request) throws IOException {
        response.setContentType("text/html;charset=UTF-8");


        int pf_no = 0;
        Cookie[] cookies = request.getCookies();
        for (Cookie c : cookies) {
            if (c.getName().equals("pf_no")) {
                pf_no = Integer.parseInt(c.getValue()); //쿠키에서 포트폴리오 번호 가져옴 -> 사진 삽입 위해
            }
        }


        String uploadPath = "C:/dozip/portfolio/" + pf_no;
        File dir = new File(uploadPath);


        if (!dir.isDirectory()) { //폴더가 없다면 생성
            dir.mkdirs();
        }
        int i = 1;
        for (MultipartFile photo : photos) {

            System.out.println(photo.getOriginalFilename());
            photo.transferTo(new File(uploadPath+ "/photo0" + i + ".jpg"));
            if(i==1){
                pv.setPf_photo1(uploadPath+ "/photo0" + i + ".jpg");
            }
            if(i==2){
                pv.setPf_photo2(uploadPath+ "/photo0" + i + ".jpg");
            }
            if(i==3){
                pv.setPf_photo3(uploadPath+ "/photo0" + i + ".jpg");
            }
            if(i==4){
                pv.setPf_photo4(uploadPath+ "/photo0" + i + ".jpg");
            }
            if(i==5){
                pv.setPf_photo5(uploadPath+ "/photo0" + i + ".jpg");
            }
            i++;
        }
        System.out.println(uploadPath+ "/photo0" + i + ".jpg");

        pv.setPf_no(pf_no);
        partnersService.insertPort_Photos(pv);
        return "/partners/index";
    }//upload_photo_ok













    //파트너스 비번찾기
    @PostMapping("/partners_findpwd")
    public String partners_findpwd(String findpwd_business_num, String findpwd_pId, String findpwd_pName,
                                   HttpServletResponse response) throws Exception {
       response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();

        out.println("<script>");
        out.println("alert('Spring 코드로 바꿀예정입니다')");
        out.println("location='/partners/main'");
        out.println("</script>");

        return null;
    }//partners_findpwd()

}
