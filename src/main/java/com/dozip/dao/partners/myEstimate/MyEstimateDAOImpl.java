package com.dozip.dao.partners.myEstimate;

import com.dozip.vo.BidVO;
import com.dozip.vo.ContractVO;
import com.dozip.vo.EstimateVO;
import com.dozip.vo.PayVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MyEstimateDAOImpl implements MyEstimateDAO{
    @Autowired
    SqlSession sqlSession;

    @Override
    public List<EstimateVO> getAllEstList(String businessNum) {
        return sqlSession.selectList("est_list", businessNum);
    }
    @Override
    public List<ContractVO> getContractList(String businessNum) {
        return sqlSession.selectList("all_contract",businessNum);
    }
    @Override
    public List<PayVO> getpayList(String businessNum) {
        return sqlSession.selectList("get_paystate", businessNum);
    }
    @Override
    public BidVO getOneBid(String est_num) {
        return sqlSession.selectOne("get_bid", est_num);
    }
    @Override
    public EstimateVO getOneEst(String est_num) {
        return sqlSession.selectOne("get_est",est_num);
    }
    @Override
    public EstimateVO write_contract(String est_num) {
        return sqlSession.selectOne("write_contract",est_num);
    }
    @Override
    public int insertContract(ContractVO cv) {
        return sqlSession.insert("contract_in",cv);
    }

    @Override
    public void updateEstimate(ContractVO cv) {
        sqlSession.update("update_est",cv);
    }

    @Override //일정 등록하기 위한 컬럼 insert
    public void insertSchedule(String cont_no) {
        sqlSession.insert("schedule_in",cont_no);
    }
}
