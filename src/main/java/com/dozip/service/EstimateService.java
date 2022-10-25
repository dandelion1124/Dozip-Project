package com.dozip.service;

import com.dozip.vo.BidVO;
import com.dozip.vo.ContractVO;
import com.dozip.vo.EstimateVO;
import com.dozip.vo.PayVO;

import java.util.List;

public interface EstimateService {

    void applyOk(EstimateVO e);

    int getPListCount(String mem_id); //businessNum이 있는 신청 개수

    List<EstimateVO> getPElist(EstimateVO e); //businessNum이 있는 신청 리스트 가져오기

    int getListCount(String mem_id);

    List<EstimateVO> getElist(EstimateVO e);

    List<BidVO> getBidList(String est_num);

    void updateState(BidVO b);

    int counter();

    int getCListCount(String mem_id);

    List<ContractVO> getContList(ContractVO c);

    ContractVO getCont(String cont_no);

    void contractOK(ContractVO c);

    PayVO getPay(String cont_no);

    int payState(PayVO p);

    void updateEstate(EstimateVO e);

    void updateReject(String bid_num);
}
