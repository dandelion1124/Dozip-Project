package com.dozip.service;


import com.dozip.vo.PartnersVO;
import com.dozip.vo.PortfolioVO;

public interface PartnersService {
    PartnersVO getPartnersInfo(String pId);

    int addPortfolio(PortfolioVO pv);

    PartnersVO getMember(String business_num); //data_manage 회원정보 가져오기
}
