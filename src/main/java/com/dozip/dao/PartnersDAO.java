package com.dozip.dao;

import com.dozip.vo.PartnersVO;

public interface PartnersDAO {
    PartnersVO getPartnersInfo(String pId);

    PartnersVO getMember(String business_num); //data_manage 회원정보
}
