package com.dozip.service.dozip.pay;

import com.dozip.dao.dozip.contract.ContractDAO;
import com.dozip.dao.dozip.estimate.EstimateDAO;
import com.dozip.dao.dozip.pay.PayDAO;
import com.dozip.vo.EstimateVO;
import com.dozip.vo.PayVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class PayServiceImpl implements PayService{
    @Autowired
    private PayDAO payDAO;
    @Autowired
    private EstimateDAO estimateDAO;
    @Autowired
    private ContractDAO contractDAO;

    @Override //결제정보
    public PayVO getPay(String cont_no) {
        return this.payDAO.getPay(cont_no);
    }
    @Override //결제상태 변경
    @Transactional
    public int payState(PayVO p) {
        if(p.getPay_cost3()!=null){
            EstimateVO e = new EstimateVO();
            e.setEst_num(this.contractDAO.getCont(p.getCont_no()).getEst_num());
            e.setEst_check("공사완료");
            this.estimateDAO.updateEstate(e);
        }
        return this.payDAO.payState(p);
    }
    @Override //해당일자가 되면 요청상태로 변경
    public void updateState() {
        this.payDAO.updateState();
    }
    @Override //결제요청상태 확인
    public List<PayVO> requestPay(String mem_id) {
        return this.payDAO.requestPay(mem_id);
    }
    @Override //DB null 체크
    public int check() {
        return this.payDAO.check();
    }


}
