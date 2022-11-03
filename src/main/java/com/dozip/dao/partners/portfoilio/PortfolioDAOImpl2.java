package com.dozip.dao.partners.portfoilio;

import com.dozip.vo.PortfolioVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class PortfolioDAOImpl2 implements PortfolioDAO2 {
    @Autowired SqlSession sqlSession;

    @Override
    public void addPortfolio(PortfolioVO pv) {
        sqlSession.insert("portfolio_in", pv);
    }//포트폴리오 등록
    @Override
    public int getPort_num(PortfolioVO pv) {
        return sqlSession.selectOne("portfolio_num", pv);
    } //포트폴리오 사진 등록을위한 포트폴리오 번호 조회
    @Override
    public void insertPort_Photos(PortfolioVO pv) {
        sqlSession.insert("insert_photo",pv);
    }
    @Override
    public List<PortfolioVO> getPortfolios(String businessNum) {
        return sqlSession.selectList("get_portfolios", businessNum);
    }
    @Override
    public PortfolioVO getOnePortfolio(PortfolioVO pv) {
        return sqlSession.selectOne("getOne_port",pv);
    }



}
