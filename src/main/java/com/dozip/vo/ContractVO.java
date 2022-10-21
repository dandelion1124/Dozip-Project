package com.dozip.vo;

import lombok.Data;

@Data
public class ContractVO {
    private String cont_no;
    private String est_num;
    private String mem_id;
    private String businessNum;
    private String cont_title;
    private String cont_location;
    private String cont_area;
    private String cont_start;
    private String cont_end;
    private String cont_total;
    private String cont_cost1;
    private String cont_date1;
    private String cont_cost2;
    private String cont_date2;
    private String cont_cost3;
    private String cont_date3;
    private String cont_date;
    private String customer_name;
    private String customer_addr;
    private String customer_number;
    private String customer_tel;
    private String partners_name;
    private String partners_addr;
    private String partners_tel;

    //페이징. 쪽나누기 관련변수
    private int startrow; //시작행번호
    private int endrow; //끝행 번호

    private String businessName; //사업자명
}
