create table estimateT(
 est_num varchar2(25) primary key --고유번호(primary key)
 ,mem_id varchar2(20) --회원아이디 fk
 ,business_num nvarchar2(50) -- 사업자 번호 fk
 ,est_check varchar2(50) -- est_check 견적 직접신청 수락/거절 확인 컬럼 -> Number로 1,0으로 값받아서수락/거절 확인  
 ,est_zoning varchar2(20) --공간유형(주거, 상가)
 ,est_use varchar2(20)   --건물유형
 ,est_areaP varchar2(50)  --평수(평) Number
 ,est_areaM varchar2(50)  --제곱미터 Number
 ,est_detail varchar2(500) -- 원하는 공간(도배/벽,바닥,주방,욕실,현관,발코니/샷시,조명,문)
 ,est_detail01 varchar2(30) -- 도배/벽 의 디테일
 ,est_detail02 varchar2(30) -- 바닥 의 디테일
 ,est_detail03 varchar2(30) -- 주방 의 디테일
 ,est_detail04 varchar2(30) --욕실 의 디테일
 ,est_detail05 varchar2(30) --현관 의 디테일
 ,est_detail06 varchar2(30) --발코니/샷시 의 디테일
 ,est_detail07 varchar2(30) --조명 의 디테일
 ,est_detail08 varchar2(30) --문 의 디테일
 ,est_bud varchar2(50)  --예산 Number
 ,est_start varchar2(50)  -- 희망공사 시작일
 ,est_end varchar2(50)  -- 희망공사 종료일
 ,est_date date default sysdate --견적신청 일자
 ,est_dateEnd date --견적신청 마감일자 +10일 (date)
 ,est_name varchar2(50)  --의뢰인 이름
 ,est_phone varchar2(50)  --의뢰인 휴대폰 번호
 ,est_addr varchar2(35)  -- 의뢰인 주소    (추가됨)
 ,est_desc varchar2(3000) --스타일 설명
 ,est_file varchar2(200) --파일첨부
);


-- 시퀀스 생성
create sequence est_num_seq
start with 1 
increment by 1
nocache;

select est_num_seq.nextval from dual;

 -- foreign key설정 사용자아이디
 alter table estimateT
 add constraint mem_id foreign key(mem_id) references memberT (mem_id);
 -- foreign key설정 사업자 번호 
 alter table estimateT
 add constraint business_num foreign key(business_num) references partnersT (business_num);

 
drop table estimateT;
 
select * from estimateT;
