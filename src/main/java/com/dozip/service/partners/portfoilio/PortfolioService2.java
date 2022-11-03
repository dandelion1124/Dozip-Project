package com.dozip.service.partners.portfoilio;

import com.dozip.vo.PortfolioVO;

import java.util.List;

public interface PortfolioService2 {
    int addPortfolio(PortfolioVO pv);

    void insertPort_Photos(PortfolioVO pv);
    List<PortfolioVO> getPortfolios(String businessNum);
    PortfolioVO getOnePortfolio(PortfolioVO pv);



}
