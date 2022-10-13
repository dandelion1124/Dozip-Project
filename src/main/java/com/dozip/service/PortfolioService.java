package com.dozip.service;

import com.dozip.vo.PartnersVO;
import com.dozip.vo.PortfolioVO;

import java.util.List;

public interface PortfolioService {

    PortfolioVO getOnelist(int pf_no);

    PartnersVO getComplist(int pf_no);

    PartnersVO getOnecomp(String businessName);

    List<PortfolioVO> getAllList();
}
