package com.dozip.dao;

import com.dozip.vo.BidVO;
import com.dozip.vo.ContractVO;
import com.dozip.vo.EstimateVO;
import com.dozip.vo.PayVO;
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

    @Override
    public List<BidVO> getBidList(String est_num) { return this.sqlSession.selectList("bid_list", est_num); }

    @Override
    public void updateState(BidVO b) { this.sqlSession.update("state_up", b); }

    @Override
    public String getEnum(String bid_num) { return this.sqlSession.selectOne("find_Enum", bid_num); }

    @Override
    public void updateState2(String est_num) { this.sqlSession.update("state_down", est_num); }

    @Override
    public void updateEstate(EstimateVO e) { this.sqlSession.update("est_state", e); }

    @Override
    public int counter() {
        return this.sqlSession.selectOne("cCounter");
    }

    @Override
    public int getCListCount(String mem_id) { return this.sqlSession.selectOne("c_count", mem_id); }

    @Override
    public List<ContractVO> getContList(ContractVO c) { return this.sqlSession.selectList("cont_list", c); }

    @Override
    public ContractVO getCont(String cont_no) { return this.sqlSession.selectOne("get_cont", cont_no); }

    @Override
    public void updateCustomerNum(ContractVO c) { this.sqlSession.update("up_Cnum", c); }

    @Override
    public String getBidNum(ContractVO c) { return this.sqlSession.selectOne("get_bNum", c); }

    @Override
    public void insertPay(ContractVO c) { this.sqlSession.insert("in_pay", c); }

    @Override
    public PayVO getPay(String cont_no) { return this.sqlSession.selectOne("get_pay", cont_no); }

    @Override
    public int payState(PayVO p) { return this.sqlSession.update("pay_state", p); }

}
