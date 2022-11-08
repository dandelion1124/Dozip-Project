package com.dozip.vo;

import lombok.Data;

@Data
public class PartnersVO {
    private String businessNum;
    private String businessName;
    private String p_Id;
    private String p_Pw;
    private String p_Name;
    private String p_Tel;
    private String p_MailId;
    private String p_MailDomain;
    private String p_Addr1;
    private String p_Addr2;
    private String p_Addr3;
    private String p_Date;
    private String P_Deldate;
    private String p_Delcont;
    private int p_State;

    //추가 필요정보
    private int p_count;
    //사진등록용
    private String p_Comp_logo;


}
