package com.dozip.service.dozip.bid;

import com.dozip.dao.dozip.bid.BidDAO;
import com.dozip.vo.BidVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BidServiceImpl implements BidService{
    @Autowired
    private BidDAO bidDAO;
    @Override //입찰 리스트
    public List<BidVO> getBidList(String est_num) {
        return this.bidDAO.getBidList(est_num);
    }
    @Override //입찰거절
    public void updateReject(String bid_num) {
        this.bidDAO.updateReject(bid_num); // bidT 상태 : 거절 (개별거절)
    }
    @Override //아이디에 해당하는 입찰리스트
    public List<BidVO> getIdBidList(String mem_id) {
        return this.bidDAO.getIdBidList(mem_id);
    }
}
