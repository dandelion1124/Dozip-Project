package com.dozip.service;

import com.dozip.dao.EstimateDAO;
import com.dozip.vo.BidVO;
import com.dozip.vo.EstimateVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class EstimateServiceImpl implements EstimateService {

    @Autowired
    private EstimateDAO estimateDAO;

    @Override
    public void applyOk(EstimateVO e) {
        this.estimateDAO.applyOk(e);  }

    @Override
    public int getPListCount(String mem_id) { return this.estimateDAO.getPListCount(mem_id); }

    @Override
    public List<EstimateVO> getPElist(EstimateVO e) { return this.estimateDAO.getPElist(e); }

    @Override
    public int getListCount(String mem_id) { return this.estimateDAO.getListCount(mem_id); }

    @Override
    public List<EstimateVO> getElist(EstimateVO e) { return this.estimateDAO.getElist(e); }

    @Override
    public List<BidVO> getBidList(String est_num) { return this.estimateDAO.getBidList(est_num); }

    @Override
    @Transactional //트랜잭션 적용
    public void updateState(String bid_num) {
        this.estimateDAO.updateState(bid_num); //bidT 상태 : 계약요청
        String est_num = this.estimateDAO.getEnum(bid_num); // 선택한 bid_num의 est_num을 가져옴
        this.estimateDAO.updateState2(est_num); //나머지 bidT 상태 : 거절
        this.estimateDAO.updateEstate(est_num); //estimateT 상태 : 계약요청
    }

    @Override
    public int counter() {
        return estimateDAO.counter();
    }


}
