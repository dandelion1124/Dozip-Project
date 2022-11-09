package com.dozip.dao.partners.index;

import com.dozip.vo.InfoVO;
import com.dozip.vo.PayVO;

public interface IndexDAO {
    PayVO montly_sales(String businessNum);
    int portfolioCount(String bNum);
    InfoVO partnersInfoCheck(String bNum); //파트너스 정보 등록 확인용

    int newQnaCount(String bNum); //미답변 문의 개수
}
