create table partners_subT
(
    businessNum       nvarchar2(12) not null, --사업자번호(FK)
    pShortstate        nvarchar2(2000),
    pInt_img           nvarchar2(70) default 'null',
    pComp_logo         nvarchar2(70) default '0',
    pService           nvarchar2(50) default '0',
    pHomepg            nvarchar2(100),
    pRes_build_type    nvarchar2(100) default '0',
    pRes_space_type    nvarchar2(400) default '0',
    pCom_build_type    nvarchar2(100) default '0',
    pCom_space_type    nvarchar2(400) default '0',
    pRes_person_name   nvarchar2(10),
    pRes_person_tel    nvarchar2(15) default '0',
    pCom_person_name   nvarchar2(10) default '0',
    pCom_person_tel    nvarchar2(15) default '0',
    pBalance           number(20) default '0',
    pAccount_bank      nvarchar2(10) default '0',
    pAccount_name      nvarchar2(10) default '0',
    pAccount_num       nvarchar2(20) default '0',
    pAccount_file      nvarchar2(70) default '0',
    pBusiness_lic_file nvarchar2(70)default '0',
    foreign key (businessNum) references partnersT (businessNum)
);

drop table partners_subT;
select * from partners_subT;
