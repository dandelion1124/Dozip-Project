package com.dozip.dao;

import com.dozip.vo.PartnersVO;
import com.dozip.vo.PortfolioVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PartnersDAOImpl implements PartnersDAO {

    @Autowired
    private SqlSession sqlSession;

    @Override
    public PartnersVO getPartnersInfo(String pId) {
        return sqlSession.selectOne("partners_info", pId);
    }

    @Override
    public void addPortfolio(PortfolioVO pv) {
        sqlSession.insert("portfolio_in", pv);
    }

    @Override
    public int getPort_num(PortfolioVO pv) {
        return sqlSession.selectOne("portfolio_num", pv);
    }

    @Override
    public PartnersVO getMember(String business_num) {
        return sqlSession.selectOne("data_manage",business_num);
    }
}

