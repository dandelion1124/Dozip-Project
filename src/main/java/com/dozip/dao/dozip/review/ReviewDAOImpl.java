package com.dozip.dao.dozip.review;

import com.dozip.vo.ContractVO;
import com.dozip.vo.ReviewVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ReviewDAOImpl implements ReviewDAO {
    @Autowired
    private SqlSession sqlSession;
    @Override //아이디에 해당하는 리뷰개수확인
    public int reviewCount(String mem_id) {
        return this.sqlSession.selectOne("mem_id", mem_id);
    }
    @Override //리뷰 전체 목록
    public List<ReviewVO> getAllReview() {
        return this.sqlSession.selectList("allReview");
    }
    @Override // Best 리뷰
    public List<ReviewVO> best() {
        return this.sqlSession.selectList("best");
    }
    @Override //전체 리뷰 개수
    public int count() {
        return sqlSession.selectOne("count");
    }
    @Override //리뷰상세
    public ReviewVO getDetail(int re_no) {
        return this.sqlSession.selectOne("details",re_no);
    }
    @Override //리뷰 조회수up
    public void re_count(int re_no) {
        this.sqlSession.update("re_count", re_no);
    }
    @Override //계약서 목록
    public List<ContractVO> getClist(String id) {
        return sqlSession.selectList("getClist",id);
    }
    @Override //계약정보
    public ContractVO getOneCont(String cont_no) {
        return sqlSession.selectOne("getCont",cont_no);
    }
    @Override //후기등록
    public void addReview(ReviewVO rv) {
        sqlSession.insert("review_upload",rv);
    }
    @Override //후기번호확인
    public int getReview_num(ReviewVO rv) {
        return sqlSession.selectOne("review_num",rv);
    }
    @Override //후기사진등록
    public void insertReview_Photos(ReviewVO rv) {
        sqlSession.insert("review_photos",rv);
    }

    @Override
    public List<ReviewVO> getMreview(ReviewVO r) {return sqlSession.selectList("m_review",r);}

    @Override
    public void reviewDel(int re_no) {sqlSession.update("del_review",re_no);}
}
