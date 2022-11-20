package com.dozip.dao.partners.myInterior;

import com.dozip.vo.ContractVO;
import com.dozip.vo.PayVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MyInteriorDAOImpl implements MyInteriorDAO{
    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<ContractVO> getContract_interior(ContractVO vo) {return sqlSession.selectList("interior_estimate",vo);}
    @Override
    public ContractVO show_contract(String cont_no) {
        return sqlSession.selectOne("show_contract",cont_no);
    }
    @Override
    public List<ContractVO> getschedule(String businessNum) {
        return sqlSession.selectList("load_schedule",businessNum);
    }
    @Override
    public int regit_schedule(String cont_no) {
        return sqlSession.update("regit_insert",cont_no);
    }

    @Override //정산내역 불러오기
    public List<PayVO> getBalance(PayVO vo) {
        return sqlSession.selectList("get_balance",vo);
    }

    @Override //정산 완료내역 불러오기
    public PayVO totalBalance(PayVO vo) {
        return sqlSession.selectOne("get_tBalance", vo);
    }
    @Override //정산내역 불러오기
    public List<PayVO> getBalance_ing(PayVO vo) {
        return sqlSession.selectList("get_balance_ing", vo);
    }
    @Override //정산 완료내역 불러오기
    public PayVO totalBalance_ing(PayVO vo) {
        return sqlSession.selectOne("get_tBalance_ing", vo);
    }

    @Override //시공완료  월별 정산상세내역 불러오기
    public List<PayVO> monthly_balance(PayVO vo) {
        return sqlSession.selectList("montly_bal", vo);
    }

    @Override //시공중  월별 정산상세내역 불러오기
    public List<PayVO> monthly_balance_ing(PayVO vo) {
        return sqlSession.selectList("montly_bal_ing", vo);
    }

    @Override
    public List<ContractVO> getContractList_port(String businessNum) {
        return null;
    }
}
