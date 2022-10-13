-- 1. 두집 회원테이블 --
drop table memberT;
select * from MEMBERT;
create table memberT
(
    mem_id           varchar2(20) primary key,   --회원아이디
    mem_pwd          varchar2(20) not null,      --회원비번
    mem_name         varchar2(20) not null,      --회원이름
    mem_tel          varchar2(20) not null,      --회원연락처
    mem_email        varchar2(20) not null,      --회원 이메일 아이디
    mem_domain       varchar2(20) not null,      --회원 이메일 도메인
    mem_zip          varchar2(10),               --회원 우편번호
    mem_addr1        varchar2(100),              --회원 주소
    mem_addr2        varchar2(100),              --회원 주소 상세
    mem_joinType     varchar2(20) not null,      --가입유형(일반/카톡/네이버/페북/구글)
    mem_joinDate     date       default sysdate, --회원 가입날짜
    mem_withdraw     number(10) default 0,       -- 탈퇴여부(탈퇴시 : 1)
    mem_withdrawDate date                        -- 탈퇴일자
);

-- 2. 파트너스 테이블 --
drop table partnersT;
select * from PARTNERST;
create table partnersT
(
    businessNum  nvarchar2(12) primary key, --사업자번호
    businessName nvarchar2(20) not null,    --상호명
    pId          nvarchar2(20) not null,    --아이디
    pPw          nvarchar2(20) not null,    --비밀번호
    pName        nvarchar2(10) not null,    --대표자이름
    pTel         nvarchar2(12) not null,    --대표자 연락처
    pMailId      nvarchar2(30) not null,    --대표자 이메일 ID
    pMailDomain  nvarchar2(30) not null,    --대표자 이메일 DOMAIN
    pAddress     nvarchar2(500),            --영업장 주소
    pDate        nvarchar2(15),             --가입날짜
    PDeldate     nvarchar2(15),             --탈퇴날짜
    pDelcont     nvarchar2(400),            --탈퇴사유
    pState       number(5) default 1        --탈퇴여부(가입 1, 탈퇴 2)
);


--3. 포트폴리오 테이블 --
drop table portfolioT;
select * from PORTFOLIOT;
create table portfolioT
(
    pf_no           number(38) primary key,   --글번호
    businessNum     nvarchar2(12)   not null, --파트너스 사업자번호(외래키)
    pf_title        nvarchar2(50)   not null, --제목
    pf_type         nvarchar2(30)   not null, --공사유형
    pf_subtype      nvarchar2(5)    not null, --공사 세부유형
    pf_range        nvarchar2(10)   not null, -- 시공범위
    pf_zipcode      nvarchar2(7)    not null, --우편번호
    pf_addr1        nvarchar2(30)   not null, --주소1
    pf_addr2        nvarchar2(30)   not null, --주소2
    pf_addr3        nvarchar2(20),            --주소3
    pf_area         number(10)      not null, --평수
    pf_cost         number(10)      not null, --공사비용
    pf_period       number(5)       not null, --공사기간
    pf_concept      nvarchar2(30)   not null, --시공컨셉
    pf_introduction nvarchar2(1000) not null, --인사말
    pf_closing      nvarchar2(1000) not null, --맺음말
    pf_photo1       nvarchar2(70),            --사진1
    pf_photo2       nvarchar2(70),            --사진2
    pf_photo3       nvarchar2(70),            --사진3
    pf_photo4       nvarchar2(70),            --사진4
    pf_photo5       nvarchar2(70),            --사진5
    pf_premium      number(5) default 0,      --프리미엄여부
    pf_regdate      nvarchar2(20)   not null, --작성일자
    foreign key (businessNum) references partnersT (businessNum)
);

--포트폴리오 시퀀스
drop sequence portfolioT_no_seq; --삭제
select portfolioT_no_seq.nextval from dual; -- 시퀀스 확인
create sequence portfolioT_no_seq start with 1 increment by 1 nocache; --생성

--4. 파트너스 sub 테이블 --
drop table partners_subT;
select * from partners_subT;
create table partners_subT
(
    businessNum       nvarchar2(12) not null, --사업자번호
    pShortstate        nvarchar2(2000),
    pInt_img           nvarchar2(70),
    pComp_logo         nvarchar2(70),
    pService           nvarchar2(50),
    pHomepg            nvarchar2(100),
    pRes_build_type    nvarchar2(100),
    pRes_space_type    nvarchar2(400),
    pCom_build_type    nvarchar2(100),
    pCom_space_type    nvarchar2(400),
    pRes_person_name   nvarchar2(10),
    pRes_person_tel    nvarchar2(15),
    pCom_person_name   nvarchar2(10),
    pCom_person_tel    nvarchar2(15),
    pBalance           number(20),
    pAccount_bank      nvarchar2(10),
    pAccount_name      nvarchar2(10),
    pAccount_num       nvarchar2(20),
    pAccount_file      nvarchar2(70),
    pBusiness_lic_file nvarchar2(70),
    foreign key (businessNum) references partnersT (businessNum)
);

--5. 입찰 테이블 --
drop table bidT;
select * from bidT;
create table bidT
(
    bid_num     varchar2(12) primary key,
    businessNum nvarchar2(12)  not null,
    est_num     varchar2(12)   not null,
    bid_price   number(20)     not null,
    bid_period  number(5)      null,
    bid_detail  varchar2(3000) null,
    bid_end     number(5)      not null,
    foreign key (businessNum) references partnersT (businessNum),
    foreign key (est_num) references estimateT (est_num)
);

--6. 견적서 테이블 --
drop table estimateT;
select * from estimateT;
create table estimateT
(
    est_num      varchar2(25) primary key, --고유번호(primary key)
    mem_id       varchar2(20),             --회원아이디 fk
    business_num nvarchar2(50),            -- 사업자 번호 fk
    est_check    varchar2(50),             -- est_check 견적 직접신청 수락/거절 확인 컬럼 -> Number로 1,0으로 값받아서수락/거절 확인
    est_zoning   varchar2(20),             --공간유형(주거, 상가)
    est_use      varchar2(20),             --건물유형
    est_areaP    varchar2(50),             --평수(평) Number
    st_areaM     varchar2(50),             --제곱미터 Number
    est_detail   varchar2(500),            -- 원하는 공간(도배/벽,바닥,주방,욕실,현관,발코니/샷시,조명,문)
    est_detail01 varchar2(30),             -- 도배/벽 의 디테일
    est_detail02 varchar2(30),             -- 바닥 의 디테일
    est_detail03 varchar2(30),             -- 주방 의 디테일
    est_detail04 varchar2(30),             --욕실 의 디테일
    est_detail05 varchar2(30),             --현관 의 디테일
    est_detail06 varchar2(30),             --발코니/샷시 의 디테일
    est_detail07 varchar2(30),             --조명 의 디테일
    est_detail08 varchar2(30),             --문 의 디테일
    est_bud      varchar2(50),             --예산 Number
    est_start    varchar2(50),             -- 희망공사 시작일
    est_end      varchar2(50),             -- 희망공사 종료일
    est_date     date default sysdate,     --견적신청 일자
    est_dateEnd  date,                     --견적신청 마감일자 +10일 (date)
    est_name     varchar2(50),             --의뢰인 이름
    est_phone    varchar2(50),             --의뢰인 휴대폰 번호
    est_addr     varchar2(35),             -- 의뢰인 주소    (추가됨)
    est_desc     varchar2(3000),           --스타일 설명
    est_file     varchar2(200)            --파일첨부
);

-- 견적서 테이블 시퀀스
DROP SEQUENCE est_num_seq; --삭제
select est_num_seq.nextval from dual; --시퀀스 확인
create sequence est_num_seq start with 1 increment by 1 nocache; --생성


--7. 고객문의 테이블 --
drop table qnaT;
select * from qnaT;
create table qnaT
(
    qna_no      number(38) primary key,     --글번호
    mem_id      varchar2(20)   not null,    --고객아이디(fk)
    businessNum nvarchar2(12),              --사업자번호(fk)
    qna_type    varchar2(50),               --질문유형 (null허용으로 변경하고 작성페이지는 유효성검사로 넣게끔하는걸로 바꿈)
    qna_title   varchar2(200)  not null,    --글제목
    qna_cont    varchar2(4000) not null,    --글내용
    qna_date    date       default sysdate, --작성일자
    edit_date   date,                       --수정일자
    qna_state   number(10) default 1,       --글상태(삭제:0)
    qna_ref     number(38),                 -- 답글(그룹번호)
    qna_step    number(38),                 -- 답글(원본글:0)
    qna_level   number(38),                 -- 답글(정렬순서 원본글:0)
    reply_state varchar2(20),               -- 답변상태
    reply_date  date,                       --답변일자
    foreign key (mem_id) references memberT (mem_id),
    foreign key (businessNum) references partnersT (businessNum)
);

--고객문의 테이블 시퀀스
drop sequence qnaT_no_seq; --삭제
select qnaT_no_seq.nextval from dual; --시퀀스 확인
create sequence qnaT_no_seq start with 1 increment by 1 nocache; --생성