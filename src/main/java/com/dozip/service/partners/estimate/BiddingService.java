package com.dozip.service.partners.estimate;

import com.dozip.vo.BidVO;
import com.dozip.vo.EstimateVO;

import java.util.List;

public interface BiddingService {
    List<EstimateVO> selectEstimateList(); //estimate 테이블에 있는 db 전부 가져오기
    EstimateVO selectEstimate(String bid_no); // bid, bid_detail, bid_detail_ok
    int countBid(String est_num);
    int checkBid(BidVO b); //입찰했는지 확인하는것
    /* bid_detail_ok */
    void insertbid(BidVO bid);
    int getBlistCount2(String businessNum);
    List<BidVO> selectJoinList(EstimateVO e);

    BidVO countJoinpartners(BidVO b); //파트너스 수 세기
}
