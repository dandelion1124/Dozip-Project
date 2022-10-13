package com.dozip.dao;

import com.dozip.vo.EstimateVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EstimateDAOImpl implements EstimateDAO {
    @Autowired
    private SqlSession sqlSession;


    @Override
    public void applyOk(EstimateVO e) {
        this.sqlSession.insert("a_insert", e);  }
}
