package com.dozip.utils;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class Paging {
    private int page; //현재 쪽번호
    private int pageSize; //한 페이지에 보여지는 글 개수
    private int count; //전체 글 개수
    private int maxpage; //총페이지
    private int startpage; //시작페이지
    private int endpage; //마지막페이지
    private int startrow; //시작행
    private int endrow; //끝행

    //시작페이지, 한 페이지에 보여줄 글 개수, 가져올 리스트의 글 개수를 넣어서 페이징 생성
    public Paging(int page, int pageSize, int count){
        this.page = page;
        this.pageSize = pageSize;
        this.count = count;
        this.maxpage = (int) ((double) count / pageSize + 0.95);
        this.startpage = (((int) ((double) page / pageSize + 0.9)) - 1) * pageSize + 1;
        this.endpage = this.maxpage;
        if (endpage > startpage + count - 1) {
            endpage = startpage + count - 1;
        }
        this.startrow = (page - 1) * pageSize + 1;
        this.endrow = this.startrow + pageSize - 1;
    }
}
