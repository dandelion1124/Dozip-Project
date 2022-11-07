package com.dozip.dao.dozip.estimate;

import com.dozip.vo.BidVO;
import com.dozip.vo.ContractVO;
import com.dozip.vo.EstimateVO;
import com.dozip.vo.PayVO;

import java.util.List;

public interface EstimateDAO {
    int getPListCount(String mem_id); //견적서(지정) 개수확인
    int getListCount(String mem_id); //견적서(입찰) 개수확인
    List<EstimateVO> getPElist(EstimateVO e); //견적서(지정) 리스트
    List<EstimateVO> getElist(EstimateVO e); //견적서(입찰) 리스트
    void updateEstate(EstimateVO e); //견적서 상태변경
    void updateBtoE(BidVO b); //견적내용 입찰내용으로 업데이트
    List<String> getEstNum(String mem_id); //견적서(입찰) 번호 리스트
}
