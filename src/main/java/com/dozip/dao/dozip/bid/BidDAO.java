package com.dozip.dao.dozip.bid;

import com.dozip.vo.BidVO;
import com.dozip.vo.ContractVO;

import java.util.List;

public interface BidDAO {
    List<BidVO> getBidList(String est_num); //입찰 리스트
    String getBidNum(ContractVO c); //입찰번호 확인
    void updateState(BidVO b); //입찰 상태변경
    void updateState2(String est_num); //입찰 상태변경(거절)
    BidVO getEnum(String bid_num); //입찰내용
    void updateReject(String bid_num); //입찰거절
    List<BidVO> getIdBidList(String mem_id); //아이디에 해당하는 입찰리스트
}

