package com.dozip.service.partners.portfoilio;


import com.dozip.dao.partners.portfoilio.PortfolioDAO2;
import com.dozip.vo.PortfolioVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PortfolioServiceImpl2 implements PortfolioService2 {
    @Autowired
    PortfolioDAO2 portfolioDAO;

    @Override
    public int addPortfolio(PortfolioVO pv) {
        portfolioDAO.addPortfolio(pv);
        return portfolioDAO.getPort_num(pv); //수정작업 필요 . 가끔2개가 조회됨
    }
    @Override
    public void insertPort_Photos(PortfolioVO pv) {
        portfolioDAO.insertPort_Photos(pv);
    } //포트폴리오 등록
    @Override
    public List<PortfolioVO> getPortfolios(String businessNum) {
        return portfolioDAO.getPortfolios(businessNum);
    }
    @Override
    public PortfolioVO getOnePortfolio(PortfolioVO pv) {
        return portfolioDAO.getOnePortfolio(pv);
    }
}
