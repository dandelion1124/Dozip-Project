package com.dozip.service.dozip.review;

import com.dozip.dao.dozip.review.ReviewDAO;
import com.dozip.vo.ContractVO;
import com.dozip.vo.ReviewVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReviewServiceImpl implements ReviewService {
    @Autowired
    private ReviewDAO reviewDAO;

    @Override //아이디에 해당하는 리뷰개수확인
    public int reviewCount(String mem_id) {
        return this.reviewDAO.reviewCount(mem_id);
    }
    @Override //리뷰 전체 목록
    public List<ReviewVO> getAllReview() {
        return this.reviewDAO.getAllReview();
    }
    @Override // Best 리뷰
    public List<ReviewVO> best() {
        return this.reviewDAO.best();
    }
    @Override //전체 리뷰 개수
    public int count() {
        return reviewDAO.count();
    }
    @Override //리뷰상세
    public ReviewVO getDetail(int re_no) {
        return reviewDAO.getDetail(re_no);
    }
    @Override //리뷰 조회수up
    public void re_count(int re_no) {
        this.reviewDAO.re_count(re_no);
    }
    @Override //계약서 목록
    public List<ContractVO> getClist(String id) {
        return this.reviewDAO.getClist(id);
    }
    @Override //계약정보
    public ContractVO getOneCont(String cont_no) {
        return this.reviewDAO.getOneCont(cont_no);
    }
    @Override //후기등록
    public int addReview(ReviewVO rv) {
        this.reviewDAO.addReview(rv);
        return this.reviewDAO.getReview_num(rv); //후기번호확인
    }
    @Override //후기사진등록
    public void insertReview_Photos(ReviewVO rv) {
        reviewDAO.insertReview_Photos(rv);
    }
}
