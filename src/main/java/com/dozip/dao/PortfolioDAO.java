package com.dozip.dao;

import com.dozip.vo.PortfolioVO;

import java.util.List;

public interface PortfolioDAO {
    List<PortfolioVO> getPlist(PortfolioVO p);
}
