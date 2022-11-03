package com.dozip.service.dozip.pay;

import com.dozip.dao.dozip.estimate.EstimateDAO;
import com.dozip.dao.dozip.pay.PayDAO;
import com.dozip.vo.PayVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PayServiceImpl implements PayService{
    @Autowired
    private PayDAO payDAO;

    @Override //결제정보
    public PayVO getPay(String cont_no) {
        return this.payDAO.getPay(cont_no);
    }
    @Override //결제상태 변경
    public int payState(PayVO p) {
        return this.payDAO.payState(p);
    }


}
