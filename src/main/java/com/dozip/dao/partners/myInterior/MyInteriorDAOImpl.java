package com.dozip.dao.partners.myInterior;

import com.dozip.vo.ContractVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MyInteriorDAOImpl implements MyInteriorDAO{
    @Autowired
    SqlSession sqlSession;

    @Override
    public List<ContractVO> getContract_interior(String businessNum) {return sqlSession.selectList("interior_estimate",businessNum);}
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
}
