package com.dozip.dao.partners.portfoilio;

import com.dozip.vo.PortfolioVO;

import java.util.List;

public interface PortfolioDAO2 {
    void addPortfolio(PortfolioVO pv);
    int getPort_num(PortfolioVO pv);
    void insertPort_Photos(PortfolioVO pv);
    List<PortfolioVO> getPortfolios(String businessNum);
    PortfolioVO getOnePortfolio(PortfolioVO pv);




}
