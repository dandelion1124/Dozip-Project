package com.dozip.service.dozip.apply;

import com.dozip.dao.dozip.apply.ApplyDAO;
import com.dozip.vo.EstimateVO;
import com.dozip.vo.PartnersVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ApplyServiceImpl implements ApplyService{
    @Autowired
    private ApplyDAO applyDAO;

    @Override //누적견적신청수
    public int counter() {
        return applyDAO.counter();
    }
    @Override //근처의 파트너스 불러오기
    public List<PartnersVO> search_part(String p_address) {
        return applyDAO.search_part(p_address);
    }
    @Override //근처에 있는 파트너스 숫자
    public int count_partners(String p_address) {
        return applyDAO.count_partners(p_address);
    }
    @Override //견적서 등록
    public void applyOk(EstimateVO e) {
        this.applyDAO.applyOk(e);
    }
}

