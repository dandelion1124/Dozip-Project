package com.dozip.service.dozip.member;

import com.dozip.dao.dozip.member.MemberDAO;
import com.dozip.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;

@Service
public class MemberServiceImpl implements MemberService {

    @Autowired
    private MemberDAO memberDAO;
    @Autowired
    private JavaMailSender javaMailSender;
    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override //회원가입 완료 (회원가입을 할 때, 비밀번호는 암호화하여 저장하도록 한다.)
    public int insertMem(MemberVO m) {
        String encodedPassword = passwordEncoder.encode(m.getMem_pwd());
        m.setMem_pwd(encodedPassword);
        return this.memberDAO.insertMem(m);
    }
    @Override //아이디중복체크
    public int checkID(String id) {
        return this.memberDAO.checkID(id);
    }
    @Override //아이디 찾기
    public String getFindID(MemberVO vo) {
        return this.memberDAO.getFindID(vo);
    }
    @Override //비번찾기-회원정보일치확인
    public int checkInfo(MemberVO m) {
        return this.memberDAO.checkInfo(m);
    }
    @Override //비밀번호 변경하기
    public int updatePwd(MemberVO m) {
        String encodedPassword = passwordEncoder.encode(m.getMem_pwd());
        m.setMem_pwd(encodedPassword);
        return this.memberDAO.updatePwd(m);
    }
    @Override //비번찾기 : 비밀번호 변경 + 메일로 보내기
    @Transactional
    public HashMap findPwd(MemberVO m, String imsiPwd) {
        boolean result = false;
        int res = this.updatePwd(m);
        HashMap<String,Object> map = new HashMap<>();
        if(res == 1){
            try{
                String toEmail = m.getMem_email()+"@"+m.getMem_domain();
                String msg = "";
                msg += m.getMem_name() + "님의 임시 비밀번호입니다.\n 비밀번호를 변경하여 사용하세요.";
                msg += "\n임시 비밀번호 : "+imsiPwd;

                SimpleMailMessage message = new SimpleMailMessage();
                message.setTo(toEmail);
                message.setSubject("[두꺼비집] 임시비밀번호 발송메일입니다.");
                message.setText(msg);
                javaMailSender.send(message);

                map.put("res", 1);
                map.put("message", "임시비밀번호가 메일로 발송되었습니다.");
            }catch (Exception e){
                map.put("res", 2);
                map.put("message", "메일발송에 실패했습니다.");
            }
        }
        return map;
    }
    @Override //회원정보 가져오기
    public MemberVO getMemberInfo(String id) {
        return this.memberDAO.getMemberInfo(id);
    }
    @Override //회원정보수정
    public int updateMember(MemberVO m) {
        return this.memberDAO.updateMember(m);
    }
    @Override //아이디에 해당하는 비밀번호
    public String loginCheck(String mem_id) {
        return this.memberDAO.loginCheck(mem_id);
    }
    @Override // 로그인-회원체크
    public MemberVO login(String mem_id) {
        return memberDAO.login(mem_id);
    }
}
