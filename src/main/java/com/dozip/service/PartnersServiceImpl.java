package com.dozip.service;

import com.dozip.dao.PartnersDAO;
import com.dozip.vo.PartnersVO;
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
    public PartnersVO getMember(String business_num) {
        return this.partnersDao.getMember(business_num);
    }
}

