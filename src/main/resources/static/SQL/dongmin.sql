--동민 테스트용 sql

select * from memberT;
select * from ESTIMATET;
select * from PARTNERST;
select * from REVIEWT;
select * from contractT;

select * from contractT where mem_id = 'dozip';


insert into reviewT(re_no,mem_id,cont_no,re_title,re_cont,re_star,re_count,re_date,re_state)
values (re_no_seq.nextval,'dozip','C111111','테스트입니다','테스트내용',3,0,sysdate,1);
delete from reviewT where mem_id='dozip';
commit;
update estimateT set BUSINESSNUM = '111-11-11111' where MEM_ID ='dozip';
insert into contractT(cont_no,est_num,mem_id,businessNum,cont_title,cont_location,cont_area,cont_start,cont_end,cont_total,cont_cost1,
cont_date1,cont_cost2,cont_date2,cont_cost3,cont_date3,cont_date,customer_name,customer_addr,customer_number,customer_tel,partners_name,
partners_addr,partners_tel) values ('C000000','2','dozip','111-11-11111','포쉐린 타일 공사','서울 강남구 선릉로6길 5','도배/벽','2022-10-25','2022-10-31',
'3,000','1000','2022-10-25','1000','2022-10-26','1000','2022-10-27','2022-10-25','구동민','서울 강남구 선릉로 6길 5','960908','010-7672-9299',
'신호철','강남구 선릉로9','01033233232');

update contractT set cont_area ='34' where businessNum = '111-11-11111';
update contractT set cont_area = '50' where businessNum = '222-22-22222';
update contractT set partners_name='호철인테리어' where businessNum='111-11-11111';
update contractT set partners_name='호철인테리어' where businessNum='222-22-22222';

insert into contractT(cont_no, est_num, mem_id, businessNum, cont_title, cont_location, cont_area, cont_start, cont_end,
                      cont_total, cont_cost1,
                      cont_date1, cont_cost2, cont_date2, cont_cost3, cont_date3, cont_date, customer_name,
                      customer_addr, customer_number, customer_tel, partners_name,
                      partners_addr, partners_tel)
values ('C111111', '2', 'dozip', '222-22-22222', '포쉐린 화장실 공사', '서울 강남구 선릉로6길 6', '욕실', '2022-10-25', '2022-10-31',
        '4,000', '1500', '2022-10-25', '1000', '2022-10-26', '1500', '2022-10-27', '2022-10-25', '구동민',
        '수원시 영통구 7', '880215', '010-7672-9299',
        '신호철', '강남구 선릉로9', '01033233232');
commit;
select * from CONTRACTT;
delete from CONTRACTT;

create table contractT
(
    cont_no nvarchar2(15) primary key, --고유번호(C000000)
    est_num varchar2(25) not null, --견적번호 FK
    mem_id varchar2(20) not null, --고객 회원아이디 FK
    businessNum nvarchar2(50) not null, --업체 사업자번호 FK
    cont_title nvarchar2(50) not null, --공사명
    cont_location nvarchar2(50) not null, --공사장소
    cont_area nvarchar2(50) not null, --공사면적
    cont_start nvarchar2(50) not null, --착공일
    cont_end nvarchar2(50) not null, --준공일
    cont_total nvarchar2(50) not null, --총공사대금
    cont_cost1 nvarchar2(50) not null, --계약금
    cont_date1 nvarchar2(50) not null, --계약급 지급일자
    cont_cost2 nvarchar2(50) not null, --중도금
    cont_date2 nvarchar2(50) not null, --중도금 지급일자
    cont_cost3 nvarchar2(50) not null, --잔금
    cont_date3 nvarchar2(50) not null, --잔금 지급일자
    cont_date nvarchar2(50) not null, --계약일자
    customer_name nvarchar2(50) not null, -- 고객 이름
    customer_addr nvarchar2(50) not null, -- 고객 주소
    customer_number nvarchar2(50) not null, -- 고객 주민번호(사업자번호)
    customer_tel nvarchar2(50) not null, -- 고객 연락처
    partners_name nvarchar2(50) not null, -- 업체명
    partners_addr nvarchar2(50) not null, -- 업체주소
    partners_tel nvarchar2(50) not null, -- 업체전화번호
    foreign key (mem_id) references memberT (mem_id),
    foreign key (est_num) references estimateT (est_num),
    foreign key (businessNum) references partnersT (businessNum)
);

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