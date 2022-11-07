package com.dozip.vo;

import lombok.Data;

@Data
public class ReviewVO {
    private int re_no;
    private String mem_id;
    private String cont_no;
    private String re_title;
    private String re_cont;
    private String re_photo1;
    private String re_photo2;
    private String re_photo3;
    private String re_photo4;
    private String re_photo5;
    private int re_star;
    private int re_count;
    private String re_date;
    private String re_modate;
    private String re_state;

    //Best댓글) 계약서 테이블에서가져온 정보
    private String cont_title;
    private int cont_area;
    private String partners_name;

    //페이징. 쪽나누기 관련변수
    private int startrow; //시작행번호
    private int endrow; //끝행 번호
}
