package com.dozip.controller.partners;

import com.dozip.service.partners.mypage.InfoService;
import com.dozip.vo.MemberVO;
import com.dozip.vo.PartnersVO;
import com.dozip.vo.Partners_subVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.PrintWriter;
import java.util.HashMap;


@Controller
@RequestMapping("partners/*")
public class InfoController {
    @Autowired
    InfoService infoService;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Value("${uploadPath}")
    private String uploadPath;

    /*My page
     *
     */
    @RequestMapping(value = "/data_manage", method = RequestMethod.GET)
    public ModelAndView data_manage(HttpServletResponse response, HttpServletRequest request, HttpSession session) throws Exception {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String businessNum = (String) session.getAttribute("businessNum");
//        if(businessNum==null) {
//            out.println("<script>");
//            out.println("alert('다시 로그인하세요!');");
//            out.println("location='/partners';");
//            out.println("</script>");
//        }else {
        //System.out.println(businessNum);
        //this.partnersService.insertPartnersSub(businessNum);
        PartnersVO p = this.infoService.getMember(businessNum);//사업자번호에 해당하는 회원정보를 DB로부터 가져옴.
        Partners_subVO ps = this.infoService.getPartnersSub(businessNum);

//        String pf_addr1=request.getParameter("pf_addr1");
//        String pf_addr2=request.getParameter("pf_addr2");
//        String pf_addr3=request.getParameter("pf_addr3");

        //System.out.println(p.toString());
        //System.out.println(p.getP_Name()+" "+p.getP_Tel());
        //System.out.println(p.getP_Address());
        //System.out.println(pf_addr1);

        ModelAndView m = new ModelAndView();
        m.addObject("p", p);//p 키이름에 p객체 저장
        m.addObject("ps", ps);

        //m.addObject("pName",p.getP_Name());
        //m.addObject("pTel",p.getP_Tel());
        //m.addObject("pShortstate",0);


        //m.addObject("");

        m.setViewName("/partners/mypage/data_manage");
        return m;
//        }
    }//data_manage()

    @RequestMapping(value = "/data_manage_ok", method = RequestMethod.POST) //data_manage
    public String data_manage_ok(Model m, MultipartFile comp_logo, Partners_subVO ps, HttpServletResponse response, HttpServletRequest request,
                                 HttpSession session) throws Exception {
        //System.out.println(comp_logo);
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        uploadPath+="est_upload//";

        String uploadDBPath = "/upload/est_upload/";
        File dir = new File(uploadPath);

        if (!dir.isDirectory()) { //폴더가 없다면 생성
            dir.mkdirs();
        }
        String dbFilename = uploadDBPath + "partnerslogo" + ".jpg";   //String 객체에 DB(html에서 불러올) 파일명 저장
        String saveFilename = uploadPath + "partnerslogo" + ".jpg";   //String 객체에 실제 파일명 저장

        comp_logo.transferTo(new File(saveFilename)); //실제 파일저장.
        System.out.println(dbFilename);

        ps.setP_Comp_logo(dbFilename);

        //String businessNum = (String)session.getAttribute("businessNum");
/*
        String pAddress=request.getParameter("pAddress");

        String pBusinessNum=request.getParameter("businessNum");
        String pShortstate=request.getParameter("pShortstate");
        String pHomepg=request.getParameter("pHomepg");
        String pRes_person_name=request.getParameter("pRes_person_name");
        String pRes_person_tel=request.getParameter("pRes_person_tel");
        String pCom_person_name=request.getParameter("pCom_person_name");
        String pCom_person_tel=request.getParameter("pCom_person_tel");
        //Int pBalance=Integer.parseInt(request.getParameter("pBalance"));
        String pAccount_bank=request.getParameter("pAccount_bank");
        String pAccount_name=request.getParameter("pAccount_name");
        String pAccount_num=request.getParameter("pAccount_num");

        //System.out.println(pAddress);
        //System.out.println(pShortstate);System.out.println(pHomepg);System.out.println(pRes_person_name);

        PartnersVO p=new PartnersVO();
        //Partners_subVO ps=new Partners_subVO();

       p.setP_Address(pAddress);
        ps.setBusinessNum(pBusinessNum);
        ps.setP_Shortstate(pShortstate); ps.setP_Homepg(pHomepg); ps.setP_Res_person_tel(pRes_person_name);
        ps.setP_Res_person_tel(pRes_person_tel); ps.setP_Com_person_name(pCom_person_name); ps.setP_Com_person_tel(pCom_person_tel);
        //ps.setPBalance(pBalance);
        ps.setP_Account_bank(pAccount_bank); ps.setP_Account_name(pAccount_name); ps.setP_Account_num(pAccount_num);
*/
        //System.out.println(p.getPAddress());
        //System.out.println(ps.getPShortstate());//+" "+ps.getPHomepg());
        //System.out.println(ps.toString());

        PartnersVO p = new PartnersVO();
//        System.out.println(p.getBusinessNum());
//        String[] p_Service = {};
//        String[] p_Res_build_type = {};
//        String[] p_Res_space_type = {};
//        String[] p_Com_build_type = {};
//        String[] p_Com_space_type = {};
//
//        p_Service= request.getParameterValues("p_Service");
//        p_Res_build_type=request.getParameterValues("p_Res_build_type");
//        p_Res_space_type=request.getParameterValues("p_Res_space_type");
//        p_Com_build_type=request.getParameterValues("p_Com_build_type");
//        p_Com_space_type=request.getParameterValues("p_Com_space_type");

        //ps.setP_Service( request.getParameterValues("p_Service"));
//        System.out.println(p_Service);
//        String pservice="";
//        for(int i=0;i<p_Service.length;i++){
//            pservice+=p_Service[i]+";";
//        }
//        System.out.println(pservice);
//
//        String pRes_build_type="";
//        for(int i=0;i<p_Res_build_type.length;i++){
//            pRes_build_type+=p_Res_build_type[i]+";";
//        }
//        System.out.println(pRes_build_type);
//
//        String pRes_space_type="";
//        for(int i=0;i<p_Res_space_type.length;i++){
//            pRes_space_type+=p_Res_space_type[i]+";";
//        }
//        System.out.println(pRes_space_type);
//
//        String pCom_build_type="";
//        for(int i=0;i<p_Res_space_type.length;i++){
//            pservice+=p_Res_space_type[i]+";";
//        }
//        System.out.println(pCom_build_type);
//
//        String pCom_space_type="";
//        for(int i=0;i<p_Com_space_type.length;i++){
//            pCom_space_type+=p_Com_space_type[i]+"/";
//        }
//        System.out.println(pCom_space_type);

        if (request.getParameter("p_Addr1") != null) {

            //p.setP_Address(request.getParameter("p_Address"));
            p.setP_Addr1(request.getParameter("p_Addr1"));
            p.setP_Addr2(request.getParameter("p_Addr2"));
            p.setP_Addr3(request.getParameter("p_Addr3"));
            p.setBusinessNum(ps.getBusinessNum());
            //System.out.println(p.getP_Addr1()+p.getP_Addr2()+p.getP_Addr3());
            this.infoService.updatePartners(p);
        }



        int res = this.infoService.checkSub(ps.getBusinessNum());
        System.out.println(res);
        if (res == 0) {
            this.infoService.insertPartnersSub(ps);
            infoService.insertpartnerslogo(ps);
        } else {
            this.infoService.updatePartnersSub(ps);
            infoService.updatepartnerslogo(ps);
        }

        m.addAttribute("ps", ps);

        out.println("<script>");
        out.println("alert('정보 입력 성공!');");
        out.println("history.back();");
        out.println("</script>");

        return null;
        // return "redirect:/partners/data_manage;";
        //return new ModelAndView("redirect:/partners/data_manage;");

    }
    @RequestMapping(value = "/pw_change")
    public String pw_change() {
        return "/partners/mypage/pw_change";
    }


    @RequestMapping("pw_change_ok") //마이페이지-비밀번호수정완료
    @ResponseBody
    public HashMap<String, String> pwChangeOk(String current_pwd, String new_pwd, HttpSession session) throws Exception {
        PartnersVO p = new PartnersVO();
        p.setP_Id((String)session.getAttribute("p_id")); //현재 로그인 되어있는 세션의 아이디 값
        p.setP_Pw(new_pwd);//새 비번

        int res = 0;
        HashMap<String, String> map = new HashMap<String, String>();

        boolean pw_check = passwordEncoder.matches(current_pwd, (this.infoService.ploginCheck(p.getP_Id())));
        if(pw_check){//일치하면
            res = this.infoService.pupdatePwd(p);//비밀번호 변경
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
}
