package com.dozip.dao.dozip.contract;

import com.dozip.vo.ContractVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ContractDAOImpl implements ContractDAO{
    @Autowired
    private SqlSession sqlSession;
    @Override //계약서 개수
    public int getCListCount(String mem_id) {
        return this.sqlSession.selectOne("c_count", mem_id);
    }
    @Override //계약서 목록
    public List<ContractVO> getContList(ContractVO c) {
        return this.sqlSession.selectList("cont_list", c);
    }
    @Override //계약서 정보
    public ContractVO getCont(String cont_no) {
        return this.sqlSession.selectOne("get_cont", cont_no);
    }
    @Override // 계약동의
    public void updateCustomerNum(ContractVO c) {
        this.sqlSession.update("up_Cnum", c);
    }
}
