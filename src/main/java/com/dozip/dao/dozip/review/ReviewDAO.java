package com.dozip.dao.dozip.review;

import com.dozip.vo.ContractVO;
import com.dozip.vo.ReviewVO;

import java.util.List;

public interface ReviewDAO {
    int reviewCount(String mem_id); //아이디에 해당하는 리뷰개수확인
    List<ReviewVO> getAllReview(); //리뷰 전체 목록
    List<ReviewVO> best(); // Best 리뷰
    int count(); //전체 리뷰 개수
    ReviewVO getDetail(int re_no); //리뷰상세
    void re_count(int re_no); //리뷰 조회수up
    List<ContractVO> getClist(String id); //계약서 목록
    ContractVO getOneCont(String cont_no); //계약정보
    void addReview(ReviewVO rv); //후기등록
    int getReview_num(ReviewVO rv); //후기번호확인
    void insertReview_Photos(ReviewVO rv); //후기사진등록
    List<ReviewVO> getMreview(ReviewVO r); //아이디에 해당하는 리뷰목록

    void reviewDel(int re_no); //해당하는 리뷰 삭제
}
