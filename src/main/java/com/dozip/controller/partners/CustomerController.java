package com.dozip.controller.partners;

import com.dozip.service.partners.customer.CustomerService;
import com.dozip.utils.Paging;
import com.dozip.vo.QnaVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("partners/*")
public class CustomerController {
    @Autowired
    CustomerService customerService;

    /*
    고객 문의페이지
     */
    // 검색 전,후 고객문의 글 보기
    @RequestMapping(value = "/customer_qna")
    public String customerQna(Model model, HttpSession session, HttpServletRequest request, QnaVO findQ, String answer) throws Exception {
        request.setCharacterEncoding("UTF-8");

        int page = 1; //쪽번호

        String find_field = null;
        String find_text = null;

        if (request.getParameter("page") != null)
            page = Integer.parseInt(request.getParameter("page"));
        if (request.getParameter("answer") != null)
            answer = request.getParameter("answer");
        if (request.getParameter("find_text") != null && request.getParameter("find_field") != null) {
            find_text = request.getParameter("find_text").trim();
            find_field = request.getParameter("find_field");
            if (find_field.equals("customer_name")) {
                findQ.setFind_text(find_text);
            } else if (find_field.equals("qna_type")) {
                findQ.setFind_text("%" + find_text + "%");
            }
        }

        findQ.setFind_field(find_field);
        findQ.setAnswer(answer);
        findQ.setBusinessNum((String) session.getAttribute("businessNum"));
        int listcount = customerService.getListCount(findQ); //검색전후 레코드 개수

        Paging paging = new Paging(page,8,listcount);


        int startrow = paging.getStartrow(); //읽기 시작할 행번호
        int endrow = paging.getEndrow(); //읽을 마지막 행번호
        findQ.setStartrow(startrow);
        findQ.setEndrow(endrow);
        List<QnaVO> qlist = customerService.getQnaList(findQ); // 검색 전후 목록

        model.addAttribute("page", page);
        model.addAttribute("startpage", paging.getStartpage());//시작 페이지
        model.addAttribute("endpage", paging.getEndpage()); //마지막 페이지
        model.addAttribute("maxpage", paging.getMaxpage());
        model.addAttribute("listcount", paging.getCount()); //레코드 개수
        model.addAttribute("answer", answer);
        model.addAttribute("find_text", find_text);
        model.addAttribute("find_field", find_field);
        model.addAttribute("qlist", qlist);

        return "/partners/customer/qna";
    }//customerQna()

    //고객문의글 답변
    @ResponseBody
    @PostMapping("/customer_reply_ok")
    public String customer_reply_ok(HttpSession session, QnaVO qv) {
        qv.setBusinessNum((String) session.getAttribute("businessNum"));
        int result = customerService.insertQna(qv);
        System.out.println(result);
        return null;
    }//customer_reply_ok

    //고객문의글 삭제
    @ResponseBody
    @GetMapping("/customer_qna_del_ok")
    public String customer_qna_del_ok(QnaVO dv) {
        customerService.deleteReply(dv);
        int result = customerService.selqnaRef(dv);
        if (result == 1) customerService.returnState(dv);
        return null;
    }//customer_qna_del_ok()
    
    /*
    리뷰페이지    
     */
    @RequestMapping(value = "/review")
    public String customerReview() {  // 고객문의 글 보기
        return "/partners/customer/review";
    }

}
