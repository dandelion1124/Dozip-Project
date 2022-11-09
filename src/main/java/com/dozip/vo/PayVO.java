package com.dozip.vo;

import lombok.Data;

@Data
public class PayVO {
    private String pay_no;
    private String cont_no;
    private String mem_id;
    private String businessNum;
    private String pay_cost1;
    private String pay_date1;
    private String pay_cost2;
    private String pay_date2;
    private String pay_cost3;
    private String pay_date3;
    private String pay_state;


    //정산내역에서 사용
    private int count;
    private String cont_title;
    private String customer_name;


}