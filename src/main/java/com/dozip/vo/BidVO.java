package com.dozip.vo;

import lombok.Data;

@Data
public class BidVO {
    private String bid_num; //입찰번호(PK)
    private String businessNum; //사업자번호(FK)
    private String est_num; //견적서번호(FK)
    private int price; //공사금액
    private int period; //공사기간
    private String bid_detail; //공사내용(설명)
    private String bid_state; //진행상태
    private String bid_date; //입찰신청일자

    //추가필요내용
    private String businessName; //사업자명
}