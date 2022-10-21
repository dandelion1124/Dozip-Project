package com.dozip.service;

import com.dozip.vo.ContractVO;
import com.dozip.vo.ReviewVO;

import java.util.List;

public interface ReviewService {

    List<ReviewVO> getAllReview();

    List<ContractVO> getClist(String id);

    ContractVO getOneCont(String cont_no);
}
