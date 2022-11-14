package com.dozip.controller.partners;

import com.dozip.service.partners.partner.PartnerService;
import com.dozip.vo.*;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

@Controller
@RequestMapping("partners/*")
public class PartnerController {
    @Autowired
    private PartnerService partnerService;
    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private JavaMailSender javaMailSender;
    //회원가입 페이지
    @RequestMapping("/signup")
    public String partners_signup(Model model) {
        String[] email = {"직접입력", "gmail.com", "naver.com", "hanmail.net", "nate.com"};
        model.addAttribute("email", email);
        return "/partners/join/signup";
    }// partners_signup()

    //회원 가입시 아이디 체크
    @PostMapping("/partners_idCheck")
    public void id_check(String pId, HttpServletResponse response) throws Exception {
        PartnersVO vo = partnerService.getPartnersInfo(pId);
    }//id_check()

    //회원가입
    @PostMapping("partners_join_ok")
    @ResponseBody
    public HashMap<String, Object> partners_join_ok(@RequestParam String data) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<>();
        ObjectMapper mapper = new ObjectMapper();
        PartnersVO pv = mapper.readValue(data, PartnersVO.class);
        pv.setP_Pw(passwordEncoder.encode(pv.getP_Pw())); //비밀번호 암호화
        int result = partnerService.checkBusinessNum(pv);

        if (result == 1) {
            resultMap.put("status", 1);
            resultMap.put("message", "이미 가입된 사업자번호가 있습니다 \\ n다시 회원가입을 진행해주세요");

        } else {
            resultMap.put("status", 0);
            resultMap.put("message", "회원가입에 성공하였습니다");
            partnerService.insertPartners(pv);
        }
        return resultMap;
    }//partners_join_ok

    //파트너스 정보 찾기 페이지
    @RequestMapping("partners_findinfo")
    public String partners_findinfo() {
        return "/partners/join/find_info";
    } //partners_findinfo()


    //파트너스 아이디찾기
    @ResponseBody
    @RequestMapping("/partners_findid")
    public HashMap<String, Object> partners_findid(String findid_business_num, String findid_pTel, String findid_email, HttpServletResponse response) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<>();
        //넘어온정보 알맞게 가공한후 (전화번호)
        findid_pTel = findid_pTel.replaceAll("-", "");
        //사업자 번호를 기준으로 db를 통해 정보 조회한후
        PartnersVO fv = partnerService.getPartnersInfo2(findid_business_num);

        if (fv == null || !findid_pTel.equals(fv.getP_Tel()) || !findid_email.equals(fv.getP_MailId() + "@" + fv.getP_MailDomain())) {
            resultMap.put("status", 0);
            resultMap.put("message", "일치하는 정보 없음");
        } else {
            resultMap.put("status", 1);
            resultMap.put("message", "당신의 아이디는 " + fv.getP_Id() + " 입니다");
        }
        return resultMap;
    }//partners_findid()


    //파트너스 비번찾기
    @ResponseBody
    @PostMapping("/partners_findpwd")
    public HashMap<String, Object> partners_findpwd(String findpwd_business_num, String findpwd_pId, String findpwd_pName) {
        HashMap<String, Object> resultMap = new HashMap<>();


        PartnersVO vo = partnerService.getPartnersInfo(findpwd_pId); //파트너스 정보 가져옴
        try {
            String db_business_num = vo.getBusinessNum();
            String db_pId = vo.getP_Id();
            String db_pName = vo.getP_Name();
            if (db_business_num.equals(findpwd_business_num) && db_pId.equals(findpwd_pId) && db_pName.equals(findpwd_pName)) {
                try{
                    String imsiPwd = "";
                    for (int i = 0; i < 12; i++) {
                        imsiPwd += (char) ((Math.random() * 26) + 97);
                    }
                    imsiPwd+="ims!";
                    vo.setP_Pw(passwordEncoder.encode(imsiPwd));
                    partnerService.updatePwd(vo);
                    System.out.println(vo);
                    String toEmail = vo.getP_MailId()+"@"+vo.getP_MailDomain();

                    System.out.println(toEmail);
                    String msg = "";
                    msg += vo.getBusinessName() + "님의 임시 비밀번호입니다.\n 비밀번호를 변경하여 사용하세요.";
                    msg += "\n임시 비밀번호 : "+imsiPwd;

                    SimpleMailMessage message = new SimpleMailMessage();
                    message.setTo(toEmail);
                    message.setSubject("[두꺼비집] 임시비밀번호 발송메일입니다.");
                    message.setText(msg);
                    javaMailSender.send(message);

                    resultMap.put("status", 1);
                    resultMap.put("message", "임시비밀번호가 메일로 발송되었습니다.");
                }catch (Exception e){
                    System.out.println(e.getStackTrace());
                    System.out.println(e.getMessage());
                    resultMap.put("status", 0);
                    resultMap.put("message", "메일발송에 실패했습니다.");
                }
            }
            else{
                resultMap.put("status",0);
                resultMap.put("message","일치하는 정보가 없습니다 2");
            }
        } catch (Exception e) {
            resultMap.put("status",0);
            resultMap.put("message","일치하는 정보가 없습니다 3");
        }
        return resultMap;

    }//partners_findpwd()


    //로그인 인증
    @ResponseBody
    @RequestMapping(value = "/login_ok")
    public HashMap<String, Object> partners_login_ok(@RequestParam String data, HttpSession session) throws IOException {
        HashMap<String, Object> resultMap = new HashMap<>();
        ObjectMapper mapper = new ObjectMapper();
        PartnersVO pv = mapper.readValue(data, PartnersVO.class);
        PartnersVO pInfo = partnerService.getPartnersInfo(pv.getP_Id()); //파트너스 아이디를 기준으로 파트너스 정보를 가져옴

        if (pInfo == null) {
            resultMap.put("status", 1);
            resultMap.put("message", "존재하지 않는 아이디입니다");

        } else {
            boolean pw_check = passwordEncoder.matches(pv.getP_Pw(), pInfo.getP_Pw());//인코딩전 비밀번호와 인코딩된비밀번호를 비교
            if (!pw_check) {
                resultMap.put("status", 2);
                resultMap.put("message", "비밀번호가 일치하지 않습니다");

            } else {
                resultMap.put("status", 0);
                resultMap.put("message", pInfo.getBusinessName() + "님 환영합니다!");
                session.setAttribute("p_id", pInfo.getP_Id());
                session.setAttribute("businessName", pInfo.getBusinessName());
                session.setAttribute("businessNum", pInfo.getBusinessNum());
                session.setMaxInactiveInterval(-1);   //세션을 통해 로그인 시간 설정
            }
        }
        return resultMap;

    }//partners_login_ok

    //로그아웃
    @RequestMapping("/logout")
    public ModelAndView partners_logout(HttpSession session) {
        //session.invalidate();
        session.removeAttribute("p_id");
        session.removeAttribute("businessName");
        session.removeAttribute("businessNum");

        return new ModelAndView("redirect:/partners/main");
    }//partners_logout

}
