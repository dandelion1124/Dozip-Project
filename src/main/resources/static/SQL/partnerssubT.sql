drop table partners_subT;
select * from partners_subT;
create table partners_subT
(
    businessNum       nvarchar2(12) not null, --사업자번호(FK)
    p_Shortstate        nvarchar2(2000),
    p_Int_img           nvarchar2(70),
    p_Comp_logo         nvarchar2(70),
    p_Service           nvarchar2(50),
    p_Homepg            nvarchar2(100),
    p_Res_build_type    nvarchar2(100),
    p_Res_space_type    nvarchar2(400),
    p_Com_build_type    nvarchar2(100),
    p_Com_space_type    nvarchar2(400),
    p_Res_person_name   nvarchar2(10),
    p_Res_person_tel    nvarchar2(15),
    p_Com_person_name   nvarchar2(10),
    p_Com_person_tel    nvarchar2(15),
    p_Balance           nvarchar2(20),
    p_Account_bank      nvarchar2(10),
    p_Account_name      nvarchar2(10),
    p_Account_num       nvarchar2(20),
    p_Account_file      nvarchar2(70),
    p_Business_lic_file nvarchar2(70),
    foreign key (businessNum) references partnersT (businessNum)
);
DELETE FROM partnersT where p_Id='partners1';

drop table partners_subT;
select * from partners_subT;
DELETE FROM partners_subT
commit;

drop table bidT;
delete bidT;
select * from bidT;
create table bidT
(
    bid_num     varchar2(12) primary key, --입찰번호(PK)
    businessNum nvarchar2(12)  not null, --사업자번호(FK)
    est_num     varchar2(12) not null, --견적서 번호(FK)
    bid_price   number(20)    not null,
    bid_start  varchar2(50) not null,
    bid_end  varchar2(50) not null,
    bid_detail  varchar2(3000) null,
    bid_state   varchar2(50)   default '진행중', --상태
    bid_date date default sysdate, --입찰신청일자
    foreign key (businessNum) references partnersT (businessNum),
    foreign key (est_num) references estimateT (est_num)
);

delete from estimateT;
commit;

drop table estimateT;
delete from estimateT where est_check
select * from estimateT;
create table estimateT
(
    est_num      varchar2(25) primary key, --고유번호(primary key)
    mem_id       varchar2(20),             --회원아이디 fk
    businessNum nvarchar2(50),            -- 사업자 번호 fk
    est_check    varchar2(50) default '대기중', -- est_check 견적 직접신청 수락/거절/대기중/계약요청 (default)확인 컬럼
    est_zoning   varchar2(300),             --공간유형(주거, 상가)
    est_use      varchar2(300),             --건물유형
    est_areaP    varchar2(300),             --평수(평)
    est_areaM     varchar2(300),             --제곱미터
    est_detail   varchar2(500),            -- 원하는 공간(도배/벽,바닥,주방,욕실,현관,발코니/샷시,조명,문)
    est_detail01 varchar2(500),             -- 도배/벽 의 디테일
    est_detail02 varchar2(500),             -- 바닥 의 디테일
    est_detail03 varchar2(500),             -- 주방 의 디테일
    est_detail04 varchar2(500),             --욕실 의 디테일
    est_detail05 varchar2(500),             --현관 의 디테일
    est_detail06 varchar2(500),             --발코니/샷시 의 디테일
    est_detail07 varchar2(500),             --조명 의 디테일
    est_detail08 varchar2(500),             --문 의 디테일
    est_bud      varchar2(500),             --예산
    est_start    varchar2(100),             -- 희망공사 시작일
    est_end      varchar2(100),             -- 희망공사 종료일
    est_date     date default sysdate,     --견적신청 일자
    est_dateEnd date default sysdate+10, --견적신청 마감일자 +10일 (date) 디폴트값 추가하기
    est_name     varchar2(200),             --의뢰인 이름
    est_phone    varchar2(200),             --의뢰인 휴대폰 번호
    est_addr     varchar2(200),             -- 의뢰인 주소    (추가됨)
    est_desc     varchar2(3000),           --스타일 설명
    est_file     varchar2(200),            --파일첨부
    foreign key (businessNum) references partnersT (businessNum),
    foreign key (mem_id) references memberT (mem_id)
);
update estimateT set est_dateEnd='2022-10-23' where est_num=4;
insert into estimateT(est_num,mem_id,est_zoning,est_use,est_areaP,est_areaM,est_detail,est_detail01,est_bud,est_start,est_end,
est_name,est_phone,est_addr,est_desc) values('E20221027-01','mem01','주거','유형','1','3.3','도배/벽','디테일','150','2022-11-01','2022-11-10',
'의뢰인','010-2222-3333','경기 성남시 분당구 미금로 215', '스타일 스타일 아주 좋아');

insert into estimateT(est_num,mem_id,est_zoning,est_use,est_areaP,est_areaM,est_detail,est_detail01,est_bud,est_start,est_end,
est_name,est_phone,est_addr,est_desc) values('E20221027-01','mem01','주거','유형','1','3.3','도배/벽','디테일','150','2022-11-01','2022-11-10',
'의뢰인','010-2222-3333','경기 성남시 분당구 미금로 215', '스타일 스타일 아주 좋아');

delete PARTNERST;

select * from (select rowNum ,* from estimateT where businessNum='143-34-47434')
select rownum r, b.* from ( select * from estimateT where businessNum='143-34-47434' order by est_num desc) b   
select rownum r,e.* from estimateT e where businessNum='143-34-47434' order by est_num desc
select rowNum r,e.* from (select * from estimateT where businessNum='143-34-47434') e order by est_num desc
select *
        from (select rowNum r, e.*
              from estimateT e
              order by est_num desc where businessNum='143-34-47434')
        where r >= 1
          and r <= 5