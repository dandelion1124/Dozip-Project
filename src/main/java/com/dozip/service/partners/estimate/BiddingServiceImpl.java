package com.dozip.service.partners.estimate;

import com.dozip.dao.partners.estimate.BiddingDAO;
import com.dozip.vo.BidVO;
import com.dozip.vo.EstimateVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BiddingServiceImpl implements BiddingService {
    @Autowired
    BiddingDAO biddingDAO;
    @Override
    public List<EstimateVO> selectEstimateList(String businessNum) { return biddingDAO.selectEstimateList(businessNum); }
    @Override
    public EstimateVO selectEstimate(String bid_no) {
        return biddingDAO.selectEstimate(bid_no);
    }

    @Override
    public int countBid(String est_num) { return biddingDAO.countBid(est_num); }
    @Override
    public int checkBid(BidVO b) {
        return biddingDAO.checkBid(b);
    }
    /* bid_detail_ok */
    @Override
    public void insertbid(BidVO bid) {
        biddingDAO.insertbid(bid);
    }
    @Override
    public int getBlistCount2(String businessNum) {
        return biddingDAO.getBlistCount2(businessNum);
    }
    @Override
    public List<BidVO> selectJoinList(EstimateVO e) {
        return this.biddingDAO.selectJoinList(e);
    }


}
