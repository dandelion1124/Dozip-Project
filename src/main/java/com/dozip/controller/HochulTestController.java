package com.dozip.controller;

import com.dozip.service.DozipService;
import com.dozip.service.PartnersService;
import com.dozip.vo.PartnersVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.List;

@Controller
//@RequestMapping("/partners/*")
@RequestMapping("/dozip/*")
public class HochulTestController {
    @Autowired
    private PartnersService partnersService;

    @Autowired
    private DozipService dozipService;

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


    @RequestMapping("/test")
    public String p_upload_photo(){
        return "/partners/portfolio/p_upload_photo";
    }




        @RequestMapping(value="/search_part/{est_addr}")
        public ResponseEntity<List<PartnersVO>> search_part(@PathVariable("est_addr") String est_addr) {

            ResponseEntity<List<PartnersVO>> entity = null;
            System.out.println("%"+est_addr+"%");
            try{
                entity = new ResponseEntity<>(this.dozipService.search_part("%"+est_addr+"%"), HttpStatus.OK);
            } catch (Exception e){
                e.printStackTrace();
                entity= new ResponseEntity<>(HttpStatus.BAD_REQUEST);
            }
            System.out.println("entity : "+ entity);

            return entity;
        }//search_part()

        @RequestMapping("/count_partners")
        public String count_partners( String p_address){
            int count=0;
            System.out.println("카운트 :"+"%"+p_address+"%");

            count=dozipService.count_partners("%"+p_address+"%");
            System.out.println(count);
            return null;
        }

}
