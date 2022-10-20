package com.dozip.service;

import com.dozip.dao.ReviewDAO;
import com.dozip.vo.ContractVO;
import com.dozip.vo.ReviewVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReviewServiceImpl implements ReviewService {

    @Autowired
    private ReviewDAO reviewDAO;

    @Override
    public List<ReviewVO> getAllReview() {
        return this.reviewDAO.getAllReview();
    }

    @Override
    public List<ContractVO> getClist(String id) {return this.reviewDAO.getClist(id);}
}
