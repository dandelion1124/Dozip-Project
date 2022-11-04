package com.dozip.controller.partners;

import com.dozip.service.partners.portfoilio.PortfolioService2;
import com.dozip.vo.PortfolioVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("partners/*")
public class PortfolioController {
    @Autowired
    PortfolioService2 portfolioService;
    // 포트폴리오 페이지
    @RequestMapping(value = "/upload")
    public String portfolioUpload() {
        return "/partners/portfolio/p_upload";
    }

    // 포트폴리오 등록
    @RequestMapping(value = "/upload_photo")
    public String portfolioUpload_photo(PortfolioVO pv, HttpSession session, HttpServletResponse response,
                                        HttpServletRequest request) {
        pv.setBusinessNum((String) session.getAttribute("businessNum"));
        if (pv.getPf_addr2().isEmpty())  //마이바티스에 널 값 insert시 오류나서 문자열 처리
            pv.setPf_addr2(" ");

        if (pv.getPf_subtype().contains(",")) {
            String[] str = pv.getPf_subtype().split(",");
            if (pv.getPf_type().equals("주거공간")) {
                pv.setPf_subtype(str[0]);
            } else if (pv.getPf_type().equals("상업공간")) {
                pv.setPf_subtype(str[1]);
            }
        }
        Cookie cookie = new Cookie("pf_no", String.valueOf(portfolioService.addPortfolio(pv)));
        response.addCookie(cookie);
        return "/partners/portfolio/p_upload_photo";
    }

    //포트폴리오 사진등록
    @RequestMapping(value = "/upload_photo_ok")
    public String upload_photo_ok(PortfolioVO pv, @RequestParam List<MultipartFile> photos, HttpServletRequest request) throws IOException {
        int pf_no = 0;
        Cookie[] cookies = request.getCookies();
        for (Cookie c : cookies) {
            if (c.getName().equals("pf_no"))    pf_no = Integer.parseInt(c.getValue());
        }

            /* 중요!!! 이미지 파일 업로드하고 html 로 불러오기 위한 작업
        1. 아래 uploadPath 주소를 자신의 프로젝트 주소의 upload 폴더로 바꿉니다.

            String uploadPath = "upload폴더 경로 주소" + pf_no;
        2. 사진 등록후 서버 한번 재시작 해야 포트폴리오가 불러와집니다
        3. 작업 하신후에 upload 폴더안에 있는 내용들은 깃에 올리지 말아주세요~~ (**삭제 혹은 무시**)
        */

//        String uploadPath = "D:\\workspace\\dozip\\src\\main\\resources\\static\\upload\\" + pf_no + "\\";  //호철 PC upload 경로
        String uploadPath = "C:\\workspace\\dozip\\src\\main\\resources\\static\\upload\\" + pf_no + "\\";  //호철 노트북 upload 경로
//       String uploadPath = "C:\\DEV\\IntelliJ_work\\dozip\\src\\main\\resources\\static\\upload\\" + pf_no+"\\";  //지혜 학원 PC upload 경로
//       String uploadPath = "D:\\DoZip\\src\\main\\resources\\static\\upload\\" + pf_no+"\\";  //민우 학원 PC upload 경로
//       String uploadPath = "D:\\DoZip\\src\\main\\resources\\static\\upload\\" + pf_no+"\\";  //수환 학원 PC upload 경로
//        String uploadPath = "C:\\DoZip\\src\\main\\resources\\static\\upload\\" + pf_no+"\\";  //동민 학원 PC upload 경로

        String uploadDBPath = "/upload/" + pf_no + "/";
        File dir = new File(uploadPath);

        if (!dir.isDirectory()) { //폴더가 없다면 생성
            dir.mkdirs();
        }
        System.out.println("등록된 사진 수: " + photos.size());

        String dbFilename[] = new String[5];
        String saveFilename[] = new String[5];

        for (int i = 1; i <= photos.size(); i++) {
            dbFilename[i - 1] = uploadDBPath + "photo0" + i + ".jpg";   //String 객체에 DB(html에서 불러올) 파일명 저장
            saveFilename[i - 1] = uploadPath + "photo0" + i + ".jpg";   //String 객체에 실제 파일명 저장
            photos.get(i - 1).transferTo(new File(saveFilename[i - 1])); //실제 파일저장.
            System.out.println(dbFilename[i - 1]);
        }
        pv.setPf_photo1(dbFilename[0]);    pv.setPf_photo2(dbFilename[1]);    pv.setPf_photo3(dbFilename[2]);
        pv.setPf_photo4(dbFilename[3]);    pv.setPf_photo5(dbFilename[4]);    pv.setPf_no(pf_no);
        portfolioService.insertPort_Photos(pv);
        return "redirect:/partners/main";
    }//upload_photo_ok

    @RequestMapping(value = "/portfolio_list")  //포트폴리오 리스트
    public ModelAndView portfolio_list(HttpSession session) {
        List<PortfolioVO> plist= portfolioService.getPortfolios((String) session.getAttribute("businessNum")); //파트너스가 작성한 포트폴리오 불러오기
        ModelAndView mv = new ModelAndView("/partners/portfolio/p_list");
        mv.addObject("plist", plist);
        return mv;
    }
    @RequestMapping("/p_modify") //포트폴리오 수정폼
    public ModelAndView p_modify(String pf_no, HttpSession session){
        PortfolioVO pv = new PortfolioVO();
        pv.setBusinessNum((String)session.getAttribute("businessNum"));
        pv.setPf_no(Integer.parseInt(pf_no));
        PortfolioVO vo = portfolioService.getOnePortfolio(pv);
        System.out.println(vo);

        ModelAndView mv = new ModelAndView("//partners/portfolio/p_edit");
        mv.addObject("vo",vo);
        return mv;
    }
}
