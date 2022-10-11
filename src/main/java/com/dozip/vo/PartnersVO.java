package com.dozip.vo;

import lombok.Data;

@Data
public class PartnersVO {
    private String business_num;
    private String businessName;
    private String pId;
    private String pPw;
    private String pName;
    private String pTel;
    private String pMail_id;
    private String pMail_domain;
    private String pAddress;
    private String pDate;
    private String PDeldate;
    private String pDelcont;
    private int pState;

    public PartnersVO() {}




    //회원가입시 사용할 DTO

    public PartnersVO(String business_num, String businessName, String pId, String pPw, String pName, String pTel,
                       String pMail_id, String pMail_domain) {
        super();
        this.business_num = business_num;
        this.businessName = businessName;
        this.pId = pId;
        this.pPw = pPw;
        this.pName = pName;
        this.pTel = pTel;
        this.pMail_id = pMail_id;
        this.pMail_domain = pMail_domain;
    }

}
