package com.dozip.dao;

import com.dozip.vo.PartnersVO;
import com.dozip.vo.PortfolioVO;

public interface PartnersDAO {
    PartnersVO getPartnersInfo(String pId);

    void addPortfolio(PortfolioVO pv);

    int getPort_num(PortfolioVO pv);
}

