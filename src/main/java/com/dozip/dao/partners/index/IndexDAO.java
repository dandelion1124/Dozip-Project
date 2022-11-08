package com.dozip.dao.partners.index;

import com.dozip.vo.PayVO;

public interface IndexDAO {
    PayVO montly_sales(String businessNum);

    int portfolioCount(String bNum);
}
