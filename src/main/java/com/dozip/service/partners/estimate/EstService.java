package com.dozip.service.partners.estimate;

import com.dozip.vo.EstimateVO;

import java.util.List;

public interface EstService {
    int getElistCount(String businessNum);
    List<EstimateVO> selectEstimateListBnum(EstimateVO e);
    void updateEstimate2(EstimateVO e);
}
