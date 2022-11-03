package com.dozip.service.dozip.estimate;

import com.dozip.vo.BidVO;
import com.dozip.vo.ContractVO;
import com.dozip.vo.EstimateVO;
import com.dozip.vo.PayVO;

import java.util.List;

public interface EstimateService {
    int getPListCount(String mem_id); //견적서(지정) 개수확인
    int getListCount(String mem_id); //견적서(입찰) 개수확인
    List<EstimateVO> getPElist(EstimateVO e); //견적서(지정) 리스트
    List<EstimateVO> getElist(EstimateVO e); //견적서(입찰) 리스트
    void updateState(BidVO b); //견적서(입찰) 선택
    void updateEstate(EstimateVO e); //견적신청 상태변경
}
