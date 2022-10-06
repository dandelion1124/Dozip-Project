--회원가입시 필요한 파트너스의 정보를 담는 테이블
create table partnersT (
    business_num nvarchar2(12)primary key, --사업자번호
    businessName nvarchar2(20) not null, --상호명
    pId	nvarchar2(20) not null, --아이디
    pPw	nvarchar2(20) not null, --비밀번호
    pName nvarchar2(10) not null, --대표자이름
    pTel nvarchar2(12) not null, --대표자 연락처
    pMail_id nvarchar2(30) not null, --대표자 이메일 ID
    pMail_domain nvarchar2(30) not null, --대표자 이메일 DOMAIN
    pAddress nvarchar2(500), --영업장 주소
    pDate nvarchar2(15), --가입날짜
    PDeldate nvarchar2(15), --탈퇴날짜
    pDelcont nvarchar2(400), --탈퇴사유
    pState number(5) default 1 --탈퇴여부(가입 1, 탈퇴 2)
);
update partnersT set business_num='111' where business_num='105';
insert into partnersT (business_num, businessName, pId, pPw, pName, pTel, pMail_id, 
pMail_domain,pAddress, pDate,PDeldate,pDelcont,pState) values(105, '민우', 'baba', 123, 'ㅇ', 010, 'baba@naver','주소주소', '역삼동', 510,520,530,1);
select * from partnersT;
drop table partnersT;
delete from PARTNERST;
select * from partnersT where pId='shc729';






--포트폴리오에 대한 정보를 담는 테이블					
create table portfolioT(
	pf_no number(38) primary key, --글번호
	business_num nvarchar2(12) not null, --파트너스 사업자번호(외래키)
	pf_title nvarchar2(50) not null, --제목
	pf_type nvarchar2(5) not null, --공사유형
	pf_subtype nvarchar2(5) not null, --공사 세부유형
	pf_range nvarchar2(10) not null, -- 시공범위
	pf_zipcode nvarchar2(7) not null, --우편번호
	pf_addr1 nvarchar2(30) not null, --주소1
	pf_addr2 nvarchar2(30) not null, --주소2
	pf_addr3 nvarchar2(20), --주소3
	pf_area number(10) not null, --평수
	pf_cost number(10) not null, --공사비용
	pf_period number(5) not null, --공사기간
	pf_concept nvarchar2(30) not null, --시공컨셉
	pf_introduction nvarchar2(1000) not null, --인사말
	pf_closing nvarchar2(1000) not null, --맺음말
	pf_photo1 nvarchar2(70), --사진1
	pf_photo2 nvarchar2(70), --사진2
	pf_photo3 nvarchar2(70), --사진3
	pf_photo4 nvarchar2(70), --사진4
	pf_photo5 nvarchar2(70), --사진5
	pf_premium number(5) default 0, --프리미엄여부
	pf_regdate nvarchar2(20) not null, --작성일자
	foreign key(business_num) references partnersT(business_num)
);					

drop table portfolioT;

select * from portfolioT;

delete from portfolioT;

update PORTFOLIOT set pf_title = '모던한 포토 스튜디오' where pf_no=32;

update portfolioT set pf_subtype = '스튜디오' where pf_no=27;

select * from (select pf.*, pt.businessName from portfolioT pf, partnersT pt 
where pf.business_num = pt.business_num(+) order by pf_no desc) 
where ((pf_no is not null) and pf_subtype='아파트');

select * from (select pf.*, pt.businessName from portfolioT pf, partnersT pt 
where pf.business_num = pt.business_num(+) order by pf_no desc) 
where ((pf_no is not null)  and where pf_subtype='모던');





--portfolioT_no_seq 시퀀스 생성
create sequence portfolioT_no_seq
start with 1 
increment by 1
nocache;

select portfolioT_no_seq.nextval from dual;

update PARTNERST set  pAddress = '서울시 강남구 선릉로' where  pName = '구동민';

select * from portfolioT where business_num = (select business_num from partnersT where businessName like '%동민%');



create table partners_subT (
	business_num nvarchar2(12) not null,  --사업자번호
	pShortstate nvarchar2(2000),
	pInt_img nvarchar2(70),
	pComp_logo nvarchar2(70),
	pService nvarchar2(50),
	pHomepg nvarchar2(100),
	pRes_build_type nvarchar2(100),
	pRes_space_type nvarchar2(400),
	pCom_build_type nvarchar2(100),
	pCom_space_type nvarchar2(400),
	pRes_person_name nvarchar2(10),
	pRes_person_tel nvarchar2(15),
	pCom_person_name nvarchar2(10),
	pCom_person_tel nvarchar2(15),
	pBalance number(20),
	pAccount_bank nvarchar2(10),
	pAccount_name nvarchar2(10),
	pAccount_num nvarchar2(20),
	pAccount_file nvarchar2(70),
	pBusiness_lic_file nvarchar2(70),
	foreign key(business_num) references partnersT(business_num)
);

select * from partners_subT;
drop table partners_subT;
delete  from partners_subT;


