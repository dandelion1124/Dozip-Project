package com.dozip.dao.partners.index;

import com.dozip.vo.InfoVO;
import com.dozip.vo.PayVO;

public interface IndexDAO {
    PayVO montly_sales(String businessNum);
    int portfolioCount(String bNum);
    InfoVO partnersInfoCheck(String bNum); //파트너스 정보 등록 확인용

    int newQnaCount(String bNum); //미답변 문의 개수

    int directEstCount(String bNum); //직접 견적 신청개수

    int reviewCount(String bNum); //등록된 리뷰 개수

    int requestContCount(String bNum);

    int getreviewStart(String bNum);

    int finishedInteriorCount(String bNum); //공사완료된 개수
}
