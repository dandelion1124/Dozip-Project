--동민 테스트용 sql

select * from REVIEWT;

create table reviewT
(
    re_no number(38) primary key, --글 번호
    mem_id varchar2(20) not null,-- 고객 id (fk)
    cont_no nvarchar2(15) not null, -- 계약서T 계약번호(fk)
    re_title varchar2(200), --글 제목 not null
    re_cont varchar2(4000), --글 내용 not null
    re_photo1 varchar2(70), -- 사진 1
    re_photo2 varchar2(70), -- 사진 2
    re_photo3 varchar2(70), -- 사진 3
    re_photo4 varchar2(70), -- 사진 4
    re_photo5 varchar2(70), -- 사진 5
    re_star number(10), -- 별점 1~5점
    re_count number(38) default 0, -- 조회수
    re_date date default sysdate, --작성일자
    re_modate date, --수정일자 (삭제할때도 해당일자 업데이트하기)
    re_state varchar2(10) default 1, --글 상태 (default 1 삭제하면 0)
    foreign key (mem_id) references memberT (mem_id),
    foreign key (cont_no) references contractT (cont_no)
);