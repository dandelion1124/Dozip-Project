package com.dozip.service.partners.index;

import com.dozip.dao.partners.index.IndexDAO;
import com.dozip.vo.PayVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class IndexServiceImpl implements IndexService{
    @Autowired
    IndexDAO indexDAO;

    @Override
    public PayVO montly_sales(String businessNum) {
        return indexDAO.montly_sales(businessNum);
    }
    @Override
    public int portfolioCount(String bNum) {
        return indexDAO.portfolioCount(bNum);
    }
}
