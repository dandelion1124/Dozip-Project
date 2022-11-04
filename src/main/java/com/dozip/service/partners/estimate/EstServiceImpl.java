package com.dozip.service.partners.estimate;

import com.dozip.dao.partners.estimate.EstDAO;
import com.dozip.vo.EstimateVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EstServiceImpl implements EstService{
    @Autowired
    EstDAO estDAO;


    @Override
    public int getElistCount(String businessNum) {
        return estDAO.getElistCount(businessNum);
    }
    @Override
    public List<EstimateVO> selectEstimateListBnum(EstimateVO e) { return this.estDAO.selectEstimateListBnum(e); }
    @Override
    public void updateEstimate2(EstimateVO e) { estDAO.updateEstimate2(e); }
}
