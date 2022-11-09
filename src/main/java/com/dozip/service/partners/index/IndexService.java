package com.dozip.service.partners.index;

import com.dozip.vo.InfoVO;
import com.dozip.vo.PayVO;

public interface IndexService {
    PayVO montly_sales(String businessNum);

    int portfolioCount(String bNum);

    InfoVO partnersInfoCheck(String bNum); //파트너스 정보 등록여부 체크용

    int newQnaCount(String bNum); //미답변 문의 개수
}
