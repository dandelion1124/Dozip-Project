package com.dozip.service.dozip.bid;

import com.dozip.vo.BidVO;

import java.util.List;

public interface BidService {
    List<BidVO> getBidList(String est_num); //입찰 리스트
    void updateReject(String bid_num); //입찰거절
}
