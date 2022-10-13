package com.dozip.service;

import com.dozip.dao.PortfolioDAO;
import com.dozip.vo.PartnersVO;
import com.dozip.vo.PortfolioVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PortfolioServiceImpl implements PortfolioService {

    @Autowired
    private PortfolioDAO portfolioDao;




    @Override
    public PortfolioVO getOnelist(int pf_no) {
        return this.portfolioDao.getOnelist(pf_no);
    }

    @Override
    public PartnersVO getComplist(int pf_no) {
        return this.portfolioDao.getComplist(pf_no);
    }

    @Override
    public PartnersVO getOnecomp(String businessName) {
        return this.portfolioDao.getOnecomp(businessName);
    }

    @Override
    public List<PortfolioVO> getAllList() { return this.portfolioDao.getAllList();}


}
