package com.dozip.service.partners.mypage;

import com.dozip.dao.partners.mypage.InfoDAO;
import com.dozip.vo.PartnersVO;
import com.dozip.vo.Partners_subVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class InfoServiceImpl implements InfoService {
    @Autowired
    InfoDAO infoDAO;
    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    public PartnersVO getMember(String businessNum) {
        return this.infoDAO.getMember(businessNum);
    }
    @Override
    public Partners_subVO getPartnersSub(String businessNum) {
        return infoDAO.getPartnersSub(businessNum);
    }
    @Override
    public void updatePartners(PartnersVO p) { infoDAO.updatePartners(p); }

    @Override
    public void insertPartnersSub(Partners_subVO ps) {
        infoDAO.insertPartnersSub(ps);
    }
    @Override
    public void updatePartnersSub(Partners_subVO ps) {
        infoDAO.updatePartnersSub(ps);
    }

    @Override
    public int checkSub(String businessNum) {
        return infoDAO.checkSub(businessNum);
    }

    @Override
    public String ploginCheck(String p_id) {
        return infoDAO.ploginCheck(p_id);
    }

    @Override
    public int pupdatePwd(PartnersVO p) {
        String encodedPassword = passwordEncoder.encode(p.getP_Pw());
        p.setP_Pw(encodedPassword);
        return infoDAO.pupdatePwd(p);
    }

    @Override
    public void insertpartnerslogo(Partners_subVO ps) {
        infoDAO.insertpartnerslogo(ps);
    }

    @Override
    public void updatepartnerslogo(Partners_subVO ps) {
        infoDAO.updatepartnerslogo(ps);
    }
}
