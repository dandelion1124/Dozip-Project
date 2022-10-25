package com.dozip.dao;

import com.dozip.vo.ContractVO;
import com.dozip.vo.ReviewVO;

import java.util.List;

public interface ReviewDAO {
    List<ReviewVO> getAllReview();

    List<ContractVO> getClist(String id);

    int count();

    ReviewVO getDetail(int re_no);
    ContractVO getOneCont(String cont_no);

    void addReview(ReviewVO rv);
    int getReview_num(ReviewVO rv);
    void insertReview_Photos(ReviewVO rv);

    void re_count(int re_no);
}
