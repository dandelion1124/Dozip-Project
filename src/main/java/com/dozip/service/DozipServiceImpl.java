package com.dozip.service;

import com.dozip.dao.DozipDAO;
import com.dozip.vo.MemberVO;
import com.dozip.vo.PartnersVO;
import com.dozip.vo.QnaVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DozipServiceImpl implements DozipService{

    @Autowired
    private DozipDAO dozipDAO;
    @Autowired //메일보내기
    private JavaMailSender javaMailSender;
    @Autowired //암호화
    private PasswordEncoder passwordEncoder;

    @Override
    public String loginCheck(String mem_id) {
        return this.dozipDAO.loginCheck(mem_id);
    }

    @Override
    public String getFindID(MemberVO vo) {
        return this.dozipDAO.getFindID(vo);
    }

    @Override
    public MemberVO getMemberInfo(String id) { return this.dozipDAO.getMemberInfo(id); }

    @Override
    public int updateMember(MemberVO m) { return this.dozipDAO.updateMember(m); }

    @Override
    public int getListCount(String id) { return this.dozipDAO.getListCount(id); }

    @Override
    public List<QnaVO> getQlist(QnaVO q) { return this.dozipDAO.getQlist(q); }

    @Override
    public int getPListCount(String id) { return this.dozipDAO.getPListCount(id); }

    @Override
    public List<QnaVO> getPlist(QnaVO q) { return this.dozipDAO.getPlist(q); }

    @Override
    public void insertQna(QnaVO q) { this.dozipDAO.insertQna(q); }

    @Override
    public String getBnum(String businessName) { return this.dozipDAO.getBnum(businessName); }

    @Override
    public List<String> getPartners() { return this.dozipDAO.getPartners(); }

    @Override //회원가입 (회원가입을 할 때, 비밀번호는 암호화하여 저장하도록 한다.
    public int insertMem(MemberVO m) {
        String encodedPassword = passwordEncoder.encode(m.getMem_pwd());
        m.setMem_pwd(encodedPassword);
        return this.dozipDAO.insertMem(m);
    }

    @Override
    public int checkID(String id) { return this.dozipDAO.checkID(id); }

    @Override
    public int updatePwd(MemberVO m) {
        String encodedPassword = passwordEncoder.encode(m.getMem_pwd());
        m.setMem_pwd(encodedPassword);
        return this.dozipDAO.updatePwd(m);
    }

    @Override
    public int checkInfo(MemberVO m) { return this.dozipDAO.checkInfo(m); }

    @Override
    public void sendEmail(MemberVO m, String imsiPwd) {
        String toEmail = m.getMem_email()+"@"+m.getMem_domain();
        String msg = "";
        msg += m.getMem_name() + "님의 임시 비밀번호입니다.\n 비밀번호를 변경하여 사용하세요.";
        msg += "\n임시 비밀번호 : "+imsiPwd;

        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(toEmail);
        message.setSubject("[두꺼비집] 임시비밀번호 발송메일입니다.");
        message.setText(msg);
        javaMailSender.send(message);
    }

    @Override
    public List<PartnersVO> search_part(String p_address) {
        return dozipDAO.search_part(p_address);
    }

    @Override
    public int count_partners(String p_address) {
        return dozipDAO.count_partners(p_address);
    }

    @Override // 새롭게 추가한 로그인 메서드
    public MemberVO login(String mem_id) {
        return dozipDAO.login(mem_id);
    }
}
