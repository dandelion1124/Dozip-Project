package com.dozip.service;

import com.dozip.vo.BidVO;
import com.dozip.vo.EstimateVO;

import java.util.List;

public interface EstimateService {

    void applyOk(EstimateVO e);

    int getPListCount(String mem_id); //businessNum이 있는 신청 개수

    List<EstimateVO> getPElist(EstimateVO e); //businessNum이 있는 신청 리스트 가져오기

    int getListCount(String mem_id);

    List<EstimateVO> getElist(EstimateVO e);

    List<BidVO> getBidList(String est_num);

    void updateState(String bid_num);

    int counter();
}
