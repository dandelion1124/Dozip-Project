package com.dozip.dao.partners.estimate;

import com.dozip.vo.BidVO;
import com.dozip.vo.EstimateVO;

import java.util.List;

public interface BiddingDAO {
    List<EstimateVO> selectEstimateList(); //estimate 테이블에 있는 db 전부 가져오기
    EstimateVO selectEstimate(String bid_no);
    int countBid(String est_num);
    int checkBid(BidVO b);
    /* bid_detail_ok */
    void insertbid(BidVO bid);
    int getBlistCount2(String businessNum);
    List<BidVO> selectJoinList(EstimateVO e);

    BidVO countJoinpartners(BidVO b);
}
