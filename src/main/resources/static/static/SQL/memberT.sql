drop table memberT;

create table memberT(
	mem_id varchar2(20) primary key, --회원아이디
	mem_pwd varchar2(20) not null, --회원비번
	mem_name varchar2(20) not null, --회원이름
	mem_tel varchar2(20) not null, --회원연락처
	mem_email varchar2(20) not null, --회원 이메일 아이디
	mem_domain varchar2(20) not null, --회원 이메일 도메인
	mem_zip varchar2(10), --회원 우편번호
	mem_addr1 varchar2(100), --회원 주소
	mem_addr2 varchar2(100), --회원 주소 상세
	mem_joinType varchar2(20) not null, --가입유형(일반/카톡/네이버/페북/구글)
	mem_joinDate date default sysdate, --회원 가입날짜
	mem_withdraw number(10) default 0, -- 탈퇴여부(탈퇴시 : 1)
	mem_withdrawDate date -- 탈퇴일자
);
delete from memberT;
select * from memberT;

/* 간편 로그인은 어떤식으로 값들이 넘어오는지 각 플랫폼 별로 찾아봐야해서  
 *  일단 회원테이블 활용은 일반가입 회원 기준으로 작업해야 할 거 같습니다. */