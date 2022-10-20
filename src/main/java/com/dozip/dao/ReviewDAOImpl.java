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
        return sqlSession.selectList("allReview");
    }

    @Override
    public List<ContractVO> getClist(String id) {return sqlSession.selectList("getClist",id);}
}
