package com.dozip.service;

import com.dozip.dao.EstimateDAO;
import com.dozip.vo.EstimateVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EstimateServiceImpl implements EstimateService {

    @Autowired
    private EstimateDAO estimateDAO;

    @Override
    public void applyOk(EstimateVO e) {
        this.estimateDAO.applyOk(e);  }

}
