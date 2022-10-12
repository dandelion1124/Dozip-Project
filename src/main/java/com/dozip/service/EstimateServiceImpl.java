package com.dozip.service;

import com.dozip.dao.EstimateDAO;
import com.dozip.vo.EstimateVO;
import org.springframework.stereotype.Service;

@Service
public class EstimateServiceImpl implements EstimateService {

    private EstimateDAO estimateDAO;

    @Override
    public void applyOk(String id) {
        this.estimateDAO.applyOk(id);
    }
}
