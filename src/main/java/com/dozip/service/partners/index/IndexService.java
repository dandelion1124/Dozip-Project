package com.dozip.service.partners.index;

import com.dozip.vo.PayVO;

public interface IndexService {
    PayVO montly_sales(String businessNum);

    int portfolioCount(String bNum);
}
