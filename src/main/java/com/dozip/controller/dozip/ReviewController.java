package com.dozip.controller.dozip;

import com.dozip.service.dozip.review.ReviewService;
import com.dozip.vo.ContractVO;
import com.dozip.vo.ReviewVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/dozip/*")
public class ReviewController {
    @Autowired
    private ReviewService reviewService;

    @GetMapping("review_main") //고객 후기 메인페이지
    public ModelAndView review_main(ModelAndView mv) throws Exception {

        List<ReviewVO> reviewList = new ArrayList<ReviewVO>();
        List<ReviewVO> bestList = new ArrayList<ReviewVO>();

        reviewList = this.reviewService.getAllReview(); //리뷰 전체 목록
        bestList = this.reviewService.best(); // Best 리뷰
        int count = this.reviewService.count(); //리뷰 개수

        if(bestList.size() != 0){
            mv.addObject("best",bestList.get(0));
        }

        mv.addObject("reviewList",reviewList);
        mv.addObject("count", count);
        mv.setViewName("/dozip/review/review_main");
        return mv;
    }

    @GetMapping("review_detail") //후기 상세페이지
    public ModelAndView review_detail(@RequestParam("re_no") int re_no, ModelAndView mv) {
        //String id = (String) session.getAttribute("id");

        ReviewVO getDetail = this.reviewService.getDetail(re_no); //리뷰 정보 re_no기준으로 가져오기
        this.reviewService.re_count(re_no); //리뷰 조회수 up

        mv.addObject("re",getDetail);
        mv.setViewName("/dozip/review/review_detail");
        return mv;
    }

    @GetMapping("review_write") //후기작성페이지 이동
    public ModelAndView review_write(ModelAndView mv, HttpSession session, HttpServletRequest request) throws Exception{
        String id = (String) session.getAttribute("id");
        mv.setViewName("/dozip/review/review_write");
        return mv;
    }

    @RequestMapping ("myall_contract") //나의 계약서 불러오기
    public ModelAndView myall_contract(ModelAndView mv,HttpSession session,HttpServletRequest request) throws Exception{
        String id = (String) session.getAttribute("id");
        ContractVO c = new ContractVO();
        List<ContractVO> clist = new ArrayList<ContractVO>();
        clist = this.reviewService.getClist(id);
        mv.addObject("clist", clist);
        mv.setViewName("/dozip/review/myall_contract");
        return mv;
    }

    @RequestMapping(value="search_cont", method = RequestMethod.GET, produces="application/json")
    @ResponseBody //계약번호를 기준으로 계약정보 불러오기
    public ContractVO cSearchList(String cont_no){
        ContractVO cv = this.reviewService.getOneCont(cont_no); //계약정보
        return cv;
    }

    @RequestMapping(value = "/upload_review_ok") //후기등록
    public String upload_review(ReviewVO rv, HttpSession session, HttpServletResponse response, HttpServletRequest request){

        rv.setMem_id((String) session.getAttribute("id"));
        int re_star = Integer.parseInt(request.getParameter("rating")); //별점이 들어오게
        rv.setRe_star(re_star);

        Cookie cookie = new Cookie("re_no", String.valueOf(reviewService.addReview(rv))); //후기등록
        response.addCookie(cookie);

        return "/dozip/review/upload_review_photo";
    }

    @RequestMapping(value = "/upload_rphoto_ok") //후기 사진등록
    public String upload_rphoto_ok(ReviewVO rv, @RequestParam List<MultipartFile>images, HttpServletResponse response, HttpServletRequest request)throws Exception{

        response.setContentType("text/html;charset=UTF-8");

        int re_no = 0;
        Cookie[] cookies = request.getCookies();
        for(Cookie c:cookies){
            if(c.getName().equals("re_no")){
                re_no = Integer.parseInt(c.getValue()); //쿠키에서 글번호 가져옴
            }
        }

//        String uploadRPath = "C:\\DoZip\\src\\main\\resources\\static\\r_upload\\" + re_no+"\\";  //동민 PC upload 경로
//       테스트 시 각자 폴더 경로 주석 풀어서 잡아주세요~
//        String uploadRPath = "C:\\workspace\\dozip\\src\\main\\resources\\static\\r_pload\\" + re_no+"\\";  //호철 노트북 upload 경로
       String uploadRPath = "C:\\DEV\\IntelliJ_work\\dozip\\src\\main\\resources\\static\\r_upload\\" + re_no+"\\";  //지혜 노트북 upload 경로
//       String uploadPath = "D:\\DoZip\\src\\main\\resources\\static\\upload\\" + re_no+"\\";  //민우 학원 PC upload 경로
//       String uploadRPath = "C:\\Users\\johnny\\Documents\\dozip\\src\\main\\resources\\static\\r_upload\\" + re_no+"\\"; //수환 학원 PC upload 경로

        String uploadRDBPath ="/r_upload/"+ re_no+"/";
        File dir = new File(uploadRPath);

        if (!dir.isDirectory()) { //폴더가 없다면 생성
            dir.mkdirs();
        }
        System.out.println("등록된 사진 수: "+ images.size());

        String dbFilename[]=new String[5];
        String saveFilename[]=new String[5];

        for(int i=1; i<=images.size();i++) {
            dbFilename[i-1]=uploadRDBPath+ "photo0" + i + ".jpg";   //String 객체에 DB(html에서 불러올) 파일명 저장
            saveFilename[i-1]=uploadRPath+ "photo0" + i + ".jpg";   //String 객체에 실제 파일명 저장
            images.get(i-1).transferTo(new File(saveFilename[i-1])); //실제 파일저장.
            System.out.println(dbFilename[i-1]);
        }
        rv.setRe_photo1(dbFilename[0]);
        rv.setRe_photo2(dbFilename[1]);        rv.setRe_photo3(dbFilename[2]);
        rv.setRe_photo4(dbFilename[3]);       rv.setRe_photo5(dbFilename[4]);

        rv.setRe_no(re_no);
        reviewService.insertReview_Photos(rv); //후기사진등록
        return "redirect:/dozip/review_main";
    }
}
