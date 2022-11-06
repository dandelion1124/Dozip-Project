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


    //내공사 내역 검색용
    private String pay_state;
    private String interiorState;


    //계약서 작성 남은일자
    private String dateCheck;

    //달력 등록여부
    private int regit_state;


    //추가 주소 부분(포트폴리오 불러오기 시 사용)
    private String est_zipcode;
    private String est_addr2;
    private String est_addr3;
    private String est_zoning;
    private String est_use;


}
