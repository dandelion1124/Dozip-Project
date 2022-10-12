package com.dozip.dao;

import com.dozip.vo.PartnersVO;
import com.dozip.vo.PortfolioVO;

import java.util.List;

public interface PortfolioDAO {
    List<PortfolioVO> getPlist();

    PortfolioVO getOnelist(int pf_no);

    PartnersVO getComplist(int pf_no);

    PartnersVO getOnecomp(String businessName);

    PortfolioVO testVO(String id);
}
