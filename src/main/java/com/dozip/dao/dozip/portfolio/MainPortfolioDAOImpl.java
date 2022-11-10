package com.dozip.dao.dozip.portfolio;

import com.dozip.vo.PartnersVO;
import com.dozip.vo.Partners_subVO;
import com.dozip.vo.PortfolioVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MainPortfolioDAOImpl implements MainPortfolioDAO {
    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<PortfolioVO> getAllList() { //포트폴리오 전체 리스트
        return this.sqlSession.selectList("port_list");
    }
    @Override //포트폴리오 검색 리스트
    public List<PortfolioVO> getSearchList(PortfolioVO p) {
        return this.sqlSession.selectList("search_list", p);
    }
    @Override //포트폴리오 상세
    public PortfolioVO getOnelist(int pf_no) {
        return this.sqlSession.selectOne("pf_list",pf_no);
    }
    @Override //파트너스 정보
    public PartnersVO getComplist(int pf_no) {
        return this.sqlSession.selectOne("pt_list",pf_no);
    }
    @Override //파트너스 정보
    public PartnersVO getOnecomp(String businessName) {
        return this.sqlSession.selectOne("pc_list",businessName);
    }

    @Override
    public Partners_subVO getComplogo(int pf_no) {return this.sqlSession.selectOne("pt_logo",pf_no);}

    @Override
    public Partners_subVO getClogo(String businessNum) {return this.sqlSession.selectOne("pst_logo",businessNum);}
}
