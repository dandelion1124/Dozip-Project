package com.dozip.service.dozip.pay;

import com.dozip.vo.PayVO;

public interface PayService {
    PayVO getPay(String cont_no); //결제정보
    int payState(PayVO p); //결제상태 변경

}
