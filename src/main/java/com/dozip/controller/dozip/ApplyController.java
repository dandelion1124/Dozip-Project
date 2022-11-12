package com.dozip.controller.dozip;

import com.dozip.service.dozip.apply.ApplyService;
import com.dozip.utils.ConvertAddr;
import com.dozip.utils.UploadPath;
import com.dozip.vo.EstimateVO;
import com.dozip.vo.PartnersVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/dozip/*")
public class ApplyController {


    @Autowired
    private ApplyService applyService;

    @RequestMapping("/apply") //견적신청 페이지 이동
    public ModelAndView apply(ModelAndView mv, String name){
        int count = this.applyService.counter(); //누적견적신청수
        mv.addObject("name",name);
        mv.addObject("count",count);
        mv.setViewName("/dozip/apply/applicationSheet");
        return mv;
    }

    @RequestMapping(value = "/search_part/{est_addr}") //근처에 존재하는 파트너스 목록
    public ResponseEntity<List<PartnersVO>> search_part(@PathVariable("est_addr") String est_addr) {
        ConvertAddr convertAddr = new ConvertAddr(est_addr);

        ResponseEntity<List<PartnersVO>> entity = null;
        try {
            entity = new ResponseEntity<>(this.applyService.search_part(convertAddr.convert_db()), HttpStatus.OK); //근처의 파트너스 불러오기
        } catch (Exception e) {
            e.printStackTrace();
            entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
        return entity;
    }//search_part()

    @ResponseBody //근처에 있는 파트너스 숫자
    @RequestMapping("/count_partners")
    public String count_partners(String est_addr) {
        ConvertAddr convertAddr = new ConvertAddr(est_addr);
        int count = applyService.count_partners(convertAddr.convert_db()); //근처 파트너스 숫자
        String result=String.valueOf(count);
        return result;
    }//count_partners()

    @RequestMapping("apply_ok")
    public String apply_ok(HttpServletRequest request, HttpServletResponse response, HttpSession session, MultipartFile est_file) throws Exception{
        response.setContentType("text/html;charset=UTF-8");
        EstimateVO e = new EstimateVO();
        PrintWriter out=response.getWriter();

        e.setMem_id((String) session.getAttribute("id")); //현재 로그인된 세션의 아이디 값

        e.setEst_zoning(request.getParameter("est_zoning"));
        e.setEst_use(request.getParameter("est_use"));
        e.setEst_areaP(Integer.parseInt(request.getParameter("areaP")));
        e.setEst_areaM(Float.parseFloat(request.getParameter("areaM")));
        e.setEst_detail(request.getParameter("d")); //배열
        e.setEst_detail01(request.getParameter("group_wallpaper_item"));
        e.setEst_detail02(request.getParameter("group_floor_item"));
        e.setEst_detail03(request.getParameter("d3")); //배열
        e.setEst_detail04(request.getParameter("d4")); //배열
        e.setEst_detail05(request.getParameter("d5")); //배열
        e.setEst_detail06(request.getParameter("group_window_item"));
        e.setEst_detail07(request.getParameter("group_light_item"));
        e.setEst_detail08(request.getParameter("group_door_item"));

        e.setEst_bud(Integer.parseInt(request.getParameter("est_bud").replace(",","")));
        e.setEst_start(request.getParameter("est_start"));
        e.setEst_end(request.getParameter("est_end"));

        e.setEst_name(request.getParameter("name"));
        e.setEst_phone(request.getParameter("phone"));

        e.setEst_zipcode(request.getParameter("pf_zipcode"));
        e.setEst_addr(request.getParameter("pf_addr1"));
        e.setEst_addr2(request.getParameter("pf_addr2"));
        e.setEst_addr3(request.getParameter("pf_addr3"));

        e.setEst_desc(request.getParameter("paragraph"));

        String bn = request.getParameter("bNum");
        System.out.println("선택한 회사 : "+bn);
        UploadPath path = new UploadPath();
        String uploadPath=path.getPath();

        uploadPath+="est_upload\\";

        Date now =new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd-");
        String randomName = String.valueOf((int)(Math.random() *(99999999-10000000+1))+10000000);

        String uploadDBPath = "/upload/est_upload/";
        File dir = new File(uploadPath);

        if (!dir.isDirectory()) { //폴더가 없다면 생성
            dir.mkdirs();
        }

        String dbFilename= uploadDBPath + sdf.format(now)+randomName +".jpg";   //String 객체에 DB(html에서 불러올) 파일명 저장
        String saveFilename= uploadPath + sdf.format(now)+randomName +".jpg";   //String 객체에 실제 파일명 저장
        System.out.println(saveFilename);
        est_file.transferTo(new File(saveFilename)); //실제 파일저장.
        e.setEst_file(dbFilename);

        if(bn != null) {    //선택한 회사가 1개 또는 그 이상이면 갯수만큼 여러번 DB에 같은 값 저장
            String[] array=bn.split("/");
            for (int i = 0; i < array.length; i++) {
                e.setBusinessNum(array[i]);
                this.applyService.applyOk(e);
            }
        }
        else {
            this.applyService.applyOk(e);
        }

//        int count = this.estimateService.counter();
//        e.setStartrow(count);
//        System.out.println(count);

        out.println("<script>");
        out.println("alert('견적 신청이 완료되었습니다.');");
        out.println("location.href = '/dozip/home';");
        out.println("</script>");

        System.out.println(e.toString());

        return null;
    }
}
