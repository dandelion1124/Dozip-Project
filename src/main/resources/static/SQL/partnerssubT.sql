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

drop table partners_subT;
select * from partners_subT;
DELETE FROM partners_subT 
commit;

drop table bidT;
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