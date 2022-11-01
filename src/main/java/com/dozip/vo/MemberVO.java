package com.dozip.vo;

import lombok.Data;

@Data
public class MemberVO {
    private String mem_id;
    private String mem_pwd;
    private String mem_name;
    private String mem_tel;
    private String mem_email;
    private String mem_domain;
    private String mem_zip;
    private String mem_addr1;
    private String mem_addr2;
    private String mem_joinType;
    private String mem_joinDate;
    private int mem_withdraw;
    private String mem_withdrawDate;
    private String mem_pf;
    private String role;
}
