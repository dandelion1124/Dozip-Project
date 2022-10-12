package com.dozip.service;


import com.dozip.vo.PartnersVO;
import com.dozip.vo.Partners_subVO;
import com.dozip.vo.PortfolioVO;

public interface PartnersService {
    PartnersVO getPartnersInfo(String pId);

    int addPortfolio(PortfolioVO pv);

    PartnersVO getMember(String businessNum); //data_manage 회원정보 가져오기
    void insertPartners(PartnersVO pv);

    PartnersVO getPartnersInfo2(String findid_business_num);

    void insertPort_Photos(PortfolioVO pv);

    Partners_subVO getPartnersSub(String businessNum);
}
