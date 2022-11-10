package com.dozip.service.dozip.portfolio;

import com.dozip.dao.dozip.portfolio.MainPortfolioDAO;
import com.dozip.vo.PartnersVO;
import com.dozip.vo.Partners_subVO;
import com.dozip.vo.PortfolioVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MainPortfolioServiceImpl implements MainPortfolioService {
    @Autowired
    private MainPortfolioDAO mainPortfolioDao;

    @Override //포트폴리오 전체 리스트
    public List<PortfolioVO> getAllList() {
        return this.mainPortfolioDao.getAllList();
    }
    @Override //포트폴리오 검색 리스트
    public List<PortfolioVO> getSearchList(PortfolioVO p) {
        return this.mainPortfolioDao.getSearchList(p);
    }
    @Override //포트폴리오 상세
    public PortfolioVO getOnelist(int pf_no) {
        return this.mainPortfolioDao.getOnelist(pf_no);
    }
    @Override //파트너스 정보
    public PartnersVO getComplist(int pf_no) {
        return this.mainPortfolioDao.getComplist(pf_no);
    }
    @Override //파트너스 정보
    public PartnersVO getOnecomp(String businessName) {
        return this.mainPortfolioDao.getOnecomp(businessName);
    }

    @Override
    public Partners_subVO getComplogo(int pf_no) {return this.mainPortfolioDao.getComplogo(pf_no) ;}

    @Override
    public Partners_subVO getClogo(String businessNum) {return this.mainPortfolioDao.getClogo(businessNum);}
}
