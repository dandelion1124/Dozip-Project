--결제 테이블 --
drop table payT;
delete from payT;
select * from payT;
create table payT
(
    pay_no nvarchar2(15) primary key, --고유번호(P000000)
    cont_no nvarchar2(15) not null, -- 계약서 번호 FK
    mem_id varchar2(20) not null, --고객 회원아이디 FK
    businessNum nvarchar2(50) not null, --업체 사업자번호 FK
    pay_cost1 nvarchar2(50), -- 계약금 결제 금액
    pay_date1 date, -- 계약금 결제일자
    pay_cost2 nvarchar2(50), -- 중도금 결제 금액
    pay_date2 date, -- 중도금 결제일자
    pay_cost3 nvarchar2(50), -- 잔금 결제 금액
    pay_date3 date, -- 잔금 결제일자
    pay_state nvarchar2(50) default '계약금요청', -- 진행상태
    foreign key (cont_no) references contractT (cont_no)
);

--결제 테이블 시퀀스
drop sequence payT_no_seq; --삭제
select payT_no_seq.nextval from dual; --시퀀스 확인
create sequence payT_no_seq start with 1 increment by 1 nocache; --생성