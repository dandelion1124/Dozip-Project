package com.dozip.service;

import com.dozip.dao.EstimateDAO;
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
    public void updateState(BidVO b) {
        b.setBid_state("계약요청");
        this.estimateDAO.updateState(b); //bidT 상태 : 계약요청

        b = this.estimateDAO.getEnum(b.getBid_num()); // 선택한 bid_num의 bidVO를 받아옴

        b.setBid_state("거절");
        this.estimateDAO.updateState2(b.getEst_num()); //나머지 bidT 상태 : 거절

        System.out.println("시작"+b.getBid_start()+", 종료"+b.getBid_end());

        b.setBid_start(b.getBid_start().substring(0,10));
        b.setBid_end(b.getBid_end().substring(0,10));
        this.estimateDAO.updateBtoE(b); //선택한 bidT의 내용을 estimateT에 update

        EstimateVO e = new EstimateVO();
        e.setEst_num(b.getEst_num());
        e.setEst_check("계약요청");
        this.estimateDAO.updateEstate(e); //estimateT 상태 : 계약요청
    }

    @Override
    public int counter() {
        return estimateDAO.counter();
    }

    @Override
    public int getCListCount(String mem_id) { return this.estimateDAO.getCListCount(mem_id); }

    @Override
    public List<ContractVO> getContList(ContractVO c) { return this.estimateDAO.getContList(c); }

    @Override
    public ContractVO getCont(String cont_no) { return this.estimateDAO.getCont(cont_no); }

    @Override
    @Transactional
    public void contractOK(ContractVO c) { //cont_no, mem_id, est_num, businessNum
        this.estimateDAO.updateCustomerNum(c); // 계약서테이블에 고객 주민등록번호 업데이트

        EstimateVO e = new EstimateVO();
        e.setEst_num(c.getEst_num());
        e.setEst_check("계약완료");
        this.estimateDAO.updateEstate(e); // 견적서테이블 상태 '계약완료'로 변경

        BidVO b = new BidVO();
        if(this.estimateDAO.getBidNum(c)!=null) {
            b.setBid_num(this.estimateDAO.getBidNum(c));
            b.setBid_state("계약완료");
            this.estimateDAO.updateState(b); // 입찰테이블 상태 '계약완료'로 변경
        }

        this.estimateDAO.insertPay(c); // 결제테이블 생성, 최초상태 '계약금요청'
    }

    @Override
    public PayVO getPay(String cont_no) { return this.estimateDAO.getPay(cont_no); }

    @Override
    public int payState(PayVO p) { return this.estimateDAO.payState(p); }

    @Override
    public void updateEstate(EstimateVO e) {
        this.estimateDAO.updateEstate(e); //estimateT 상태 : 계약요청
    }

    @Override
    public void updateReject(String bid_num) {
        this.estimateDAO.updateReject(bid_num); // bidT 상태 : 거절 (개별거절)
    }


}
