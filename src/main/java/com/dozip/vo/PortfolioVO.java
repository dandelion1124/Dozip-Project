package com.dozip.vo;

import lombok.Data;

@Data
public class PortfolioVO {
    private int pf_no;
    private String business_num;
    private String pf_title;
    private String pf_type;
    private String pf_subtype;
    private String pf_range;
    private String pf_zipcode;
    private String pf_addr1;
    private String pf_addr2;
    private String pf_addr3;
    private int pf_area;
    private int pf_cost;
    private int pf_period;
    private String pf_concept;
    private String pf_introduction;
    private String pf_closing;
    private String pf_photo1;
    private String pf_photo2;
    private String pf_photo3;
    private String pf_photo4;
    private String pf_photo5;
    private int pf_premium;
    private String pf_regdate;
    private String businessName; //아우터 조인을 위해 컬럼 추가


    public PortfolioVO() {}

    //포트폴리오 정보 담기를 위한 생성자 오버로딩

    public PortfolioVO(String business_num, String pf_title, String pf_type, String pf_subtype, String pf_range,
                       String pf_zipcode, String pf_addr1, String pf_addr2, String pf_addr3, int pf_area, int pf_cost,
                       int pf_period, String pf_concept, String pf_introduction, String pf_closing) {
        super();
        this.business_num = business_num;
        this.pf_title = pf_title;
        this.pf_type = pf_type;
        this.pf_subtype = pf_subtype;
        this.pf_range = pf_range;
        this.pf_zipcode = pf_zipcode;
        this.pf_addr1 = pf_addr1;
        this.pf_addr2 = pf_addr2;
        this.pf_addr3 = pf_addr3;
        this.pf_area = pf_area;
        this.pf_cost = pf_cost;
        this.pf_period = pf_period;
        this.pf_concept = pf_concept;
        this.pf_introduction = pf_introduction;
        this.pf_closing = pf_closing;
    }

}
