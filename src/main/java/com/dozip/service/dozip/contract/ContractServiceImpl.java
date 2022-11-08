package com.dozip.service.dozip.contract;

import com.dozip.dao.dozip.bid.BidDAO;
import com.dozip.dao.dozip.contract.ContractDAO;
import com.dozip.dao.dozip.estimate.EstimateDAO;
import com.dozip.dao.dozip.pay.PayDAO;
import com.dozip.vo.BidVO;
import com.dozip.vo.ContractVO;
import com.dozip.vo.EstimateVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ContractServiceImpl implements ContractService{
    @Autowired
    private ContractDAO contractDAO;
    @Autowired
    private EstimateDAO estimateDAO;
    @Autowired
    private BidDAO bidDAO;
    @Autowired
    private PayDAO payDAO;

    @Override //계약서 개수
    public int getCListCount(String mem_id) {
        return this.contractDAO.getCListCount(mem_id);
    }
    @Override //계약서 목록
    public List<ContractVO> getContList(ContractVO c) {
        return this.contractDAO.getContList(c);
    }
    @Override //계약서 정보
    public ContractVO getCont(String cont_no) {
        return this.contractDAO.getCont(cont_no);
    }

    @Override
    @Transactional
    public void contractOK(ContractVO c) { //cont_no, mem_id, est_num, businessNum
        this.contractDAO.updateCustomerNum(c); // 계약서테이블에 고객 주민등록번호 업데이트

        EstimateVO e = new EstimateVO();
        e.setEst_num(c.getEst_num());
        e.setEst_check("계약완료");
        this.estimateDAO.updateEstate(e); // 견적서테이블 상태 '계약완료'로 변경

        BidVO b = new BidVO();
        if(this.bidDAO.getBidNum(c)!=null) { //입찰번호 확인
            b.setBid_num(this.bidDAO.getBidNum(c));
            b.setBid_state("계약완료");
            this.bidDAO.updateState(b); // 입찰테이블 상태 '계약완료'로 변경
        }

        this.payDAO.insertPay(c); // 결제테이블 생성, 최초상태 '계약금요청'
    }


}
