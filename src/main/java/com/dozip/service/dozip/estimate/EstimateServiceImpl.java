package com.dozip.service.dozip.estimate;

import com.dozip.dao.dozip.bid.BidDAO;
import com.dozip.dao.dozip.estimate.EstimateDAO;
import com.dozip.vo.BidVO;
import com.dozip.vo.ContractVO;
import com.dozip.vo.EstimateVO;
import com.dozip.vo.PayVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class EstimateServiceImpl implements EstimateService {
    @Autowired
    private EstimateDAO estimateDAO;
    @Autowired
    private BidDAO bidDAO;

    @Override //견적서(지정) 개수확인
    public int getPListCount(String mem_id) {
        return this.estimateDAO.getPListCount(mem_id);
    }
    @Override //견적서(입찰) 개수확인
    public int getListCount(String mem_id) {
        return this.estimateDAO.getListCount(mem_id);
    }
    @Override //견적서(지정) 리스트
    public List<EstimateVO> getPElist(EstimateVO e) {
        return this.estimateDAO.getPElist(e);
    }
    @Override //견적서(입찰) 리스트
    public List<EstimateVO> getElist(EstimateVO e) {
        return this.estimateDAO.getElist(e);
    }
    @Override //견적서(입찰) 선택
    @Transactional
    public void updateState(BidVO b) {
        b.setBid_state("계약요청");
        this.bidDAO.updateState(b); //bidT 상태 : 계약요청

        b = this.bidDAO.getEnum(b.getBid_num()); // 선택한 bid_num의 bidVO를 받아옴

        b.setBid_state("거절");
        this.bidDAO.updateState2(b.getEst_num()); //나머지 bidT 상태 : 거절

        System.out.println("시작"+b.getBid_start()+", 종료"+b.getBid_end());

        b.setBid_start(b.getBid_start().substring(0,10));
        b.setBid_end(b.getBid_end().substring(0,10));
        this.estimateDAO.updateBtoE(b); //선택한 bidT의 내용을 estimateT에 update

        EstimateVO e = new EstimateVO();
        e.setEst_num(b.getEst_num());
        e.setEst_check("계약요청");
        this.estimateDAO.updateEstate(e); //estimateT 상태 : 계약요청
    }
    @Override //견적신청 상태변경
    public void updateEstate(EstimateVO e) {
        this.estimateDAO.updateEstate(e); //estimateT 상태 : 계약요청
    }
}
