package com.dozip.service;

import com.dozip.dao.EstimateDAO;
import com.dozip.vo.EstimateVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EstimateServiceImpl implements EstimateService {

    @Autowired
    private EstimateDAO estimateDAO;

    @Override
    public void applyOk(EstimateVO e) {
        this.estimateDAO.applyOk(e);  }

    @Override
    public int getPListCount(String mem_id) { return this.estimateDAO.getPListCount(mem_id); }

    @Override
    public List<EstimateVO> getPElist(EstimateVO e) { return this.estimateDAO.getPElist(e); }

    @Override
    public int getListCount(String mem_id) { return this.estimateDAO.getListCount(mem_id); }

    @Override
    public List<EstimateVO> getElist(EstimateVO e) { return this.estimateDAO.getElist(e); }

}
