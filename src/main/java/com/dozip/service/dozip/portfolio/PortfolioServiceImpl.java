package com.dozip.service.dozip.portfolio;

import com.dozip.dao.dozip.portfolio.PortfolioDAO;
import com.dozip.vo.PartnersVO;
import com.dozip.vo.PortfolioVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PortfolioServiceImpl implements PortfolioService {
    @Autowired
    private PortfolioDAO portfolioDao;

    @Override //포트폴리오 전체 리스트
    public List<PortfolioVO> getAllList() {
        return this.portfolioDao.getAllList();
    }
    @Override //포트폴리오 검색 리스트
    public List<PortfolioVO> getSearchList(PortfolioVO p) {
        return this.portfolioDao.getSearchList(p);
    }
    @Override //포트폴리오 상세
    public PortfolioVO getOnelist(int pf_no) {
        return this.portfolioDao.getOnelist(pf_no);
    }
    @Override //파트너스 정보
    public PartnersVO getComplist(int pf_no) {
        return this.portfolioDao.getComplist(pf_no);
    }
    @Override //파트너스 정보
    public PartnersVO getOnecomp(String businessName) {
        return this.portfolioDao.getOnecomp(businessName);
    }
}
