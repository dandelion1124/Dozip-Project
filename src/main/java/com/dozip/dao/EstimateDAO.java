package com.dozip.dao;

import com.dozip.vo.BidVO;
import com.dozip.vo.ContractVO;
import com.dozip.vo.EstimateVO;

import java.util.List;

public interface EstimateDAO {
    void applyOk(EstimateVO e);

    int getPListCount(String mem_id);

    List<EstimateVO> getPElist(EstimateVO e);

    int getListCount(String mem_id);

    List<EstimateVO> getElist(EstimateVO e);

    List<BidVO> getBidList(String est_num);

    void updateState(String bid_num);

    String getEnum(String bid_num);

    void updateState2(String est_num);

    void updateEstate(String est_num);

    int counter();

    int getCListCount(String mem_id);

    List<ContractVO> getContList(ContractVO c);

    ContractVO getCont(String cont_no);
}
