package com.dozip.service.partners.index;

import com.dozip.vo.InfoVO;
import com.dozip.vo.PayVO;

public interface IndexService {
    PayVO montly_sales(String businessNum);

    int portfolioCount(String bNum);

    InfoVO partnersInfoCheck(String bNum); //파트너스 정보 등록여부 체크용

    int newQnaCount(String bNum); //미답변 문의 개수

    int directEstCount(String bNum);

    int reviewCount(String bNum); //후기 개수

    int requestContCount(String bNum);

    int getreviewStart(String bNum); //후기 평점합
}
