package com.dozip.service;


import com.dozip.vo.PartnersVO;

public interface PartnersService {
    PartnersVO getPartnersInfo(String pId);
    PartnersVO getMember(String business_num); //data_manage 회원정보 가져오기
}
