package com.dozip.dao.dozip.apply;

import com.dozip.vo.EstimateVO;
import com.dozip.vo.PartnersVO;

import java.util.List;

public interface ApplyDAO {
    int counter(); //누적견적신청수
    List<PartnersVO> search_part(String p_address); //근처의 파트너스 불러오기
    int count_partners(String p_address); //근처에 있는 파트너스 숫자
    void applyOk(EstimateVO e); //견적서 등록
}
