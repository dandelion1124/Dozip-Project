package com.dozip.service;

import com.dozip.dao.DozipDAO;
import com.dozip.vo.MemberVO;
import com.dozip.vo.PartnersVO;
import com.dozip.vo.QnaVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DozipServiceImpl implements DozipService{

    @Autowired
    private DozipDAO dozipDAO;
    @Autowired
    private JavaMailSender javaMailSender;

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

    @Override
    public int insertMem(MemberVO m) { return this.dozipDAO.insertMem(m); }

    @Override
    public int checkID(String id) { return this.dozipDAO.checkID(id); }

    @Override
    public int updatePwd(MemberVO m) { return this.dozipDAO.updatePwd(m); }

    @Override
    public int checkInfo(MemberVO m) { return this.dozipDAO.checkInfo(m); }

    @Override
    public void sendEmail(MemberVO m) {
        String toEmail = m.getMem_email()+"@"+m.getMem_domain();
        String msg = "";
        msg += m.getMem_name() + "님의 임시 비밀번호입니다.\n 비밀번호를 변경하여 사용하세요.";
        msg += "\n임시 비밀번호 : "+m.getMem_pwd();

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
}
