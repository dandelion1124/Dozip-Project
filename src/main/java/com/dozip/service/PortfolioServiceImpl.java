package com.dozip.service;

import com.dozip.dao.PortfolioDAO;
import com.dozip.vo.PortfolioVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PortfolioServiceImpl implements PortfolioService {

    @Autowired
    private PortfolioDAO portfolioDao;

    @Override
    public List<PortfolioVO> getPlist(PortfolioVO p) {
        return this.portfolioDao.getPlist(p);
    }
}
