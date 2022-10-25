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

    @Override
    public int count() {
        return reviewDAO.count();
    }

    @Override
    public ReviewVO getDetail(int re_no) {
        return reviewDAO.getDetail(re_no);
    }

    public ContractVO getOneCont(String cont_no) {return this.reviewDAO.getOneCont(cont_no);}

    @Override
    public int addReview(ReviewVO rv) {
        this.reviewDAO.addReview(rv);
        return this.reviewDAO.getReview_num(rv);}

    @Override
    public void insertReview_Photos(ReviewVO rv) {reviewDAO.insertReview_Photos(rv);}

    @Override
    public void re_count(int re_no) {
        this.reviewDAO.re_count(re_no);
    }


}
