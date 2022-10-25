package com.dozip.vo;

import lombok.Data;

@Data
public class EstimateVO {

        private String est_num;
        private String mem_id;
        private String businessNum;
        private String est_check;
        private String est_zoning;
        private String est_use;
        private String est_areaP;
        private String est_areaM;
        private String est_detail;
        private String est_detail01;
        private String est_detail02;
        private String est_detail03;
        private String est_detail04;
        private String est_detail05;
        private String est_detail06;
        private String est_detail07;
        private String est_detail08;
        private String est_bud;
        private String est_start;
        private String est_end;
        private String est_date;
        private String est_dateEnd;
        private String est_name;
        private String est_phone;
        private String est_addr;
        private String est_desc;
        private String est_file;

        //페이징. 쪽나누기 관련변수
        private int startrow; //시작행번호
        private int endrow; //끝행 번호

        //검색기능
        private String find_name;//검색어
        private String find_field;//검색필드

        private String businessName; //사업자명
        private String addr;
        private long remaindate;
}