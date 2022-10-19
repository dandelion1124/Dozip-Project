package com.dozip.dao;

import com.dozip.vo.BidVO;
import com.dozip.vo.EstimateVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

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

    @Override
    public List<BidVO> getBidList(String est_num) { return this.sqlSession.selectList("bid_list", est_num); }

    @Override
    public void updateState(String bid_num) { this.sqlSession.update("state_up", bid_num); }

    @Override
    public String getEnum(String bid_num) { return this.sqlSession.selectOne("find_Enum", bid_num); }

    @Override
    public void updateState2(String est_num) { this.sqlSession.update("state_down", est_num); }

    @Override
    public void updateEstate(String est_num) { this.sqlSession.update("est_state", est_num); }

}
