-- 1. 두집 회원테이블 --
drop table memberT;
delete memberT;
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
delete from PARTNERST;
select * from PARTNERST;
create table partnersT
(
    businessNum  nvarchar2(12) primary key, --사업자번호
    businessName nvarchar2(20) not null,    --상호명
    p_Id          nvarchar2(20) not null,    --아이디
    p_Pw          nvarchar2(20) not null,    --비밀번호
    p_Name        nvarchar2(10) not null,    --대표자이름
    p_Tel         nvarchar2(12) not null,    --대표자 연락처
    p_MailId      nvarchar2(30) not null,    --대표자 이메일 ID
    p_MailDomain  nvarchar2(30) not null,    --대표자 이메일 DOMAIN
    p_Addr1       nvarchar2(50),             --기본주소
    p_Addr2       nvarchar2(30),             --상세주소
    p_Addr3       nvarchar2(20),             --참고주소
    p_Date        nvarchar2(15),             --가입날짜
    P_Deldate     nvarchar2(15),             --탈퇴날짜
    p_Delcont     nvarchar2(400),            --탈퇴사유
    p_State       number(5) default 1        --탈퇴여부(가입 1, 탈퇴 2)
);

--3. 포트폴리오 테이블 --
drop table portfolioT;
select * from PORTFOLIOT;
create table portfolioT
(
    pf_no           number(38) primary key,   --글번호(PK)
    businessNum     nvarchar2(12)   not null, --파트너스 사업자번호(FK)
    pf_title        nvarchar2(50)   not null, --제목
    pf_type         nvarchar2(10)   not null, --공사유형
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
delete partners_subT;
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

--5. 견적서 테이블 --
drop table estimateT;
delete estimateT;
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

-- 견적서 테이블 시퀀스
DROP SEQUENCE est_num_seq; --삭제
select est_num_seq.nextval from dual; --시퀀스 확인
create sequence est_num_seq start with 1 increment by 1 nocache; --생성


--6. 입찰 테이블 --
drop table bidT;
delete bidT;
select * from bidT;
create table bidT
(
    bid_num     varchar2(12) primary key, --입찰번호(PK)
    businessNum nvarchar2(12)  not null, --사업자번호(FK)
    est_num     varchar2(12)   not null, --견적서 번호(FK)
    bid_price   number(20)     not null,
    bid_start  varchar2(50) not null,
    bid_end  varchar2(50) not null,
    bid_detail  varchar2(3000) null,
    bid_state   varchar2(50)   default '진행중', --상태
    bid_date date default sysdate, --입찰신청일자
    foreign key (businessNum) references partnersT (businessNum),
    foreign key (est_num) references estimateT (est_num)
);
-- 입찰 테이블 시퀀스
DROP SEQUENCE bid_num_seq; --삭제
select bid_num_seq.nextval from dual; --시퀀스 확인
create sequence bid_num_seq start with 1 increment by 1 nocache; --생성

--7. 계약서 테이블 --
drop table contractT;
delete from contractT;
select * from contractT;
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

--계약서 테이블 시퀀스
drop sequence contractT_no_seq; --삭제
select contractT_no_seq.nextval from dual; --시퀀스 확인
create sequence contractT_no_seq start with 1 increment by 1 nocache; --생성

--8. 결제 테이블 --
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

--9. 고객문의 테이블 --
drop table qnaT;
delete qnaT;
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

-- 10. 고객후기 테이블 --
drop table reviewT;
delete reviewT;
select * from reviewT;
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
    re_state varchar2(10) default 1 --글 상태 (default 1 삭제하면 0)
    --foreign key (mem_id) references memberT (mem_id),
    --foreign key (cont_no) references contractT (cont_no)
);

--고객후기 테이블 시퀀스
drop sequence re_no_seq; --삭제
select re_no_seq.nextval from dual; --시퀀스 확인
create sequence re_no_seq start with 1 increment by 1 nocache; --생성