package com.dozip.dao;

import com.dozip.vo.PartnersVO;
import com.dozip.vo.PortfolioVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class PortfolioDAOImpl implements PortfolioDAO{

    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<PortfolioVO> getPlist(PortfolioVO p) {
        return this.sqlSession.selectList("port_list",p);
    }

    @Override
    public PortfolioVO getOnelist(int pf_no) {
        return this.sqlSession.selectOne("pf_list",pf_no);
    }

    @Override
    public PartnersVO getComplist(int pf_no) {
        return this.sqlSession.selectOne("pt_list",pf_no);
    }

    @Override
    public PartnersVO getOnecomp(String businessName) {
        return this.sqlSession.selectOne("pc_list",businessName);
    }
}
