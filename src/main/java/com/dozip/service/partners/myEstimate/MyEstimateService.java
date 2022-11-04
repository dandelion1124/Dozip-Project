package com.dozip.service.partners.myEstimate;

import com.dozip.vo.BidVO;
import com.dozip.vo.ContractVO;
import com.dozip.vo.EstimateVO;
import com.dozip.vo.PayVO;

import java.util.List;

public interface MyEstimateService {
    List<EstimateVO> getAllEstList(String businessNum);
    List<ContractVO> getContractList(String businessNum);
    List<PayVO> getpayList(String businessNum);
    BidVO getOneBid(String est_num);

    EstimateVO getOneEst(String est_num);
    EstimateVO write_contract(String est_num);
    int insertContract(ContractVO cv);
    void insertSchedule(String cont_no);
}
