package com.dozip.dao;

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

    @Override
    public List<ReviewVO> getAllReview() {
        return this.sqlSession.selectList("allReview");
    }

    @Override
    public List<ContractVO> getClist(String id) {return sqlSession.selectList("getClist",id);}

    @Override
    public int count() {
        return sqlSession.selectOne("count");
    }

    @Override
    public ReviewVO getDetail(int re_no) {
        return this.sqlSession.selectOne("details",re_no);
    }


    public ContractVO getOneCont(String cont_no) {return sqlSession.selectOne("getCont",cont_no);}

    @Override
    public void addReview(ReviewVO rv) {sqlSession.insert("review_upload",rv);}

    @Override
    public int getReview_num(ReviewVO rv) {return sqlSession.selectOne("review_num",rv);}

    @Override
    public void insertReview_Photos(ReviewVO rv) {sqlSession.insert("review_photos",rv);}

    @Override
    public void re_count(int re_no) {
        this.sqlSession.update("re_count", re_no);
    }


}
