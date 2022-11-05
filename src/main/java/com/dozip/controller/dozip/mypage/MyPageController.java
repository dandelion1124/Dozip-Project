package com.dozip.controller.dozip.mypage;

import com.dozip.service.dozip.estimate.EstimateService;
import com.dozip.service.dozip.member.MemberService;
import com.dozip.service.dozip.qna.QnaService;
import com.dozip.service.dozip.review.ReviewService;
import com.dozip.utils.Paging;
import com.dozip.vo.MemberVO;
import com.dozip.vo.QnaVO;
import com.dozip.vo.ReviewVO;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/dozip/*")
public class MyPageController {
    @Autowired
    private MemberService memberService;
    @Autowired
    private EstimateService estimateService;
    @Autowired
    private ReviewService reviewService;
    @Autowired
    private QnaService qnaService;
    @Autowired
    private PasswordEncoder passwordEncoder;

    @GetMapping("mypage_main") //마이페이지 메인화면 (수정중)
    public ModelAndView mypagetest(HttpSession session) {
        ModelAndView mv = new ModelAndView();

        //회원정보 가져오기
        MemberVO m = this.memberService.getMemberInfo((String) session.getAttribute("id"));
        mv.addObject("m", m);

        //견적서 개수 확인
        int pListCount=this.estimateService.getPListCount(m.getMem_id()); //지정
        int eListCount=this.estimateService.getListCount(m.getMem_id()); //입찰
        mv.addObject("pListCount", pListCount);
        mv.addObject("eListCount", eListCount);

        //현재일자 확인
        LocalDate now = LocalDate.now();
        mv.addObject("now", now);

        //문의글 개수 확인
        int qListCount=this.qnaService.getListCount(m.getMem_id()); //관리자 문의글
        int pqListCount=this.qnaService.getPListCount(m.getMem_id()); //업체 문의글
        mv.addObject("qListCount", qListCount);
        mv.addObject("pqListCount", pqListCount);

        //문의 리스트 출력(업체)
        List<QnaVO> qlist = new ArrayList<QnaVO>();
        QnaVO q = new QnaVO();
        q.setMem_id(m.getMem_id());
        q.setStartrow(1); q.setEndrow(5);
        qlist = this.qnaService.getPlist(q);
        mv.addObject("qlist", qlist);

        //리뷰개수확인
        int rListCount = this.reviewService.reviewCount(m.getMem_id()); //리뷰 개수
        List<ReviewVO> reviewList = new ArrayList<ReviewVO>();
        reviewList = this.reviewService.getAllReview(); //리뷰 전체 목록
        mv.addObject("rListCount",rListCount);
        mv.addObject("rlist", reviewList);

        mv.setViewName("/dozip/mypage/mypage");
        return mv;
    }

    @RequestMapping("my_edit") //마이페이지-회원정보수정 이동(로그인된 정보 불러오기)
    public ModelAndView myEdit(HttpSession session, ModelAndView mv) throws Exception{
        String id = (String)session.getAttribute("id");
        MemberVO m = this.memberService.getMemberInfo(id); //회원정보 가져오기
        mv.addObject("m",m);
        mv.setViewName("/dozip/mypage/mypage_edit");
        return mv;
    }

    @RequestMapping("my_edit_ok") //회원정보수정완료
    @ResponseBody
    public int myEditOK(@RequestParam String member) throws Exception {
        ObjectMapper mapper = new ObjectMapper().configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        MemberVO m = mapper.readValue(member, MemberVO.class);
        int res = this.memberService.updateMember(m); //회원정보수정
        return res;
    }

    @GetMapping("my_pwd") //마이페이지-비밀번호변경 이동
    public String myPwd() { return "/dozip/mypage/mypage_pwd"; }

    @RequestMapping("edit_pwd_ok") //마이페이지-비밀번호수정완료
    @ResponseBody
    public HashMap<String, String> editPwdOK(String current_pwd, String new_pwd, HttpSession session) throws Exception {
        MemberVO m = new MemberVO();
        m.setMem_id((String)session.getAttribute("id")); //현재 로그인 되어있는 세션의 아이디 값
        m.setMem_pwd(new_pwd);//새 비번

        int res = 0;
        HashMap<String, String> map = new HashMap<String, String>();

        boolean pw_check = passwordEncoder.matches(current_pwd, (this.memberService.loginCheck(m.getMem_id())));
        if(pw_check){//일치하면
            res = this.memberService.updatePwd(m);//비밀번호 변경
            if(res==1) {
                map.put("text","비밀번호 변경이 완료되었습니다.");
            }else {
                map.put("text","변경에 실패했습니다.");
            }
        }else{
            map.put("text","기존 비밀번호를 확인해주세요.");
        }
        return map;
    }

    @RequestMapping("my_review") //마이페이지 - 고객 리뷰 페이지
    public ModelAndView myReview(ModelAndView mv,ReviewVO r, HttpServletRequest request,HttpSession session){
        String id = (String)session.getAttribute("id");
        int count = this.reviewService.reviewCount(id); //아이디에 해당하는 리뷰 개수 확인
        //쪽나누기
        Paging paging;
        if(request.getParameter("page")==null){
            paging = new Paging(1,5,count); //시작페이지, 한페이지에 나올 개수, 리스트 총 개수
        }else{
            int page = Integer.parseInt(request.getParameter("page"));
            paging = new Paging(page,5,count); //선택한 페이지, 한페이지에 나올 개수, 리스트 총 개수
        }
        mv.addObject("p",paging);
        //리스트 출력
        List<ReviewVO>rlist = new ArrayList<>();
        r.setMem_id(id);
        r.setStartrow(paging.getStartrow());
        r.setEndrow(paging.getEndrow());
        rlist = this.reviewService.getMreview(id);
        mv.addObject("rlist",rlist);
        mv.addObject("count",count);

        mv.setViewName("/dozip/mypage/mypage_review");
        return mv;
    }

    //마이페이지 - 포트폴리오 스크랩 페이지 (미완성)
    @RequestMapping("my_scrap")
    public ModelAndView myScrap(ModelAndView mv, HttpServletRequest request){

        //쪽나누기
        int page = 1; //현재 쪽번호
        int limit = 5; //한 페이지에 보여지는 개수

        if(request.getParameter("page")!=null) {
            page=Integer.parseInt(request.getParameter("page"));
        }

        int listcount=0; /*listcount 받아오는 코드 작성해야 함.*/
        int maxpage = (int)((double)listcount/limit+0.95); //총페이지
        int startpage = (((int)((double)page/5+0.9))-1)*5+1; //시작페이지
        int endpage = maxpage; //마지막페이지

        if(endpage>startpage+5-1) endpage=startpage+5-1;

        mv.addObject("page", page);
        mv.addObject("startpage", startpage);
        mv.addObject("endpage",endpage);
        mv.addObject("maxpage",maxpage);
        mv.addObject("listcount",listcount);

        mv.setViewName("/dozip/mypage/mypage_scrap");
        return mv;
    }

}
