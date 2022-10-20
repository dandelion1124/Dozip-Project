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
}
