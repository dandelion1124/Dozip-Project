package com.dozip.service.dozip.portfolio;

import com.dozip.vo.PartnersVO;
import com.dozip.vo.PortfolioVO;

import java.util.List;

public interface MainPortfolioService {
    List<PortfolioVO> getAllList(); //포트폴리오 전체 리스트
    List<PortfolioVO> getSearchList(PortfolioVO p); //포트폴리오 검색 리스트
    PortfolioVO getOnelist(int pf_no); //포트폴리오 상세
    PartnersVO getComplist(int pf_no); //파트너스 정보
    PartnersVO getOnecomp(String businessName); //파트너스 정보
}
