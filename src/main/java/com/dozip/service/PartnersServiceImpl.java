package com.dozip.service;

import com.dozip.dao.PartnersDAO;
import com.dozip.vo.PartnersVO;
import com.dozip.vo.PortfolioVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PartnersServiceImpl implements PartnersService {
    @Autowired
    private PartnersDAO partnersDao;

    @Override
    public PartnersVO getPartnersInfo(String pId) {
        return partnersDao.getPartnersInfo(pId);
    }

    @Override
    public int addPortfolio(PortfolioVO pv) {
        partnersDao.addPortfolio(pv);
        return partnersDao.getPort_num(pv); //수정작업 필요 . 가끔2개가 조회됨
    }

    public PartnersVO getMember(String business_num) {
        return this.partnersDao.getMember(business_num);
    @Override
    public void insertPartners(PartnersVO pv) {
        partnersDao.insertPartners(pv);
    }

    @Override
    public PartnersVO getPartnersInfo2(String findid_business_num) {
        return partnersDao.getPartnersInfo2(findid_business_num);
    }

    @Override
    public void insertPort_Photos(PortfolioVO pv) {
        partnersDao.insertPort_Photos(pv);
    }
}

