package com.dozip.dao;

import com.dozip.vo.ContractVO;
import com.dozip.vo.ReviewVO;

import java.util.List;

public interface ReviewDAO {
    List<ReviewVO> getAllReview();

    List<ContractVO> getClist(String id);
}
