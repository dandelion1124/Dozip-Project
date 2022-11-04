package com.dozip.dao.partners.estimate;

import com.dozip.service.partners.estimate.EstService;
import com.dozip.vo.EstimateVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class EstDAOImpl implements EstDAO{
    @Autowired
    SqlSession sqlSession;

    @Override
    public int getElistCount(String businessNum) { return this.sqlSession.selectOne("cons_req_count",businessNum); }
    @Override
    public List<EstimateVO> selectEstimateListBnum(EstimateVO e) {
        return this.sqlSession.selectList("select_est_bnum",e);
    }
    @Override
    public void updateEstimate2(EstimateVO e) {
        sqlSession.update("update_est2",e);
    }
}
