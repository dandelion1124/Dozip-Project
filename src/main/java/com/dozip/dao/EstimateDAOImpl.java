package com.dozip.dao;

import com.dozip.vo.EstimateVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class EstimateDAOImpl implements EstimateDAO {
    @Autowired
    private SqlSession sqlSession;


    @Override
    public void applyOk(EstimateVO e) {
        this.sqlSession.insert("a_insert", e);  }

    @Override
    public int getPListCount(String mem_id) { return this.sqlSession.selectOne("p_count", mem_id); }

    @Override
    public List<EstimateVO> getPElist(EstimateVO e) { return this.sqlSession.selectList("p_list", e); }

    @Override
    public int getListCount(String mem_id) { return this.sqlSession.selectOne("e_count", mem_id); }

    @Override
    public List<EstimateVO> getElist(EstimateVO e) { return this.sqlSession.selectList("e_list", e); }
}
