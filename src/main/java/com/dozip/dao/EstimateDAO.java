package com.dozip.dao;

import com.dozip.vo.EstimateVO;

import java.util.List;

public interface EstimateDAO {
    void applyOk(EstimateVO e);

    int getPListCount(String mem_id);

    List<EstimateVO> getPElist(EstimateVO e);

    int getListCount(String mem_id);

    List<EstimateVO> getElist(EstimateVO e);
}
