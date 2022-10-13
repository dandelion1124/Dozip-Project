


update partnersT set business_num='111' where business_num='105';
insert into partnersT (business_num, businessName, pId, pPw, pName, pTel, pMail_id, 
pMail_domain,pAddress, pDate,PDeldate,pDelcont,pState) values(105, '민우', 'baba', 123, 'ㅇ', 010, 'baba@naver','주소주소', '역삼동', 510,520,530,1);
select * from partnersT;
drop table partnersT;
delete from PARTNERST;
select * from partnersT where pId='shc729';







select * from portfolioT;

delete from portfolioT;

update PORTFOLIOT set pf_title = '모던한 포토 스튜디오' where pf_no=32;

update portfolioT set pf_subtype = '스튜디오' where pf_no=27;

select * from (select pf.*, pt.businessName from portfolioT pf, partnersT pt 
where pf.BUSINESSNUM = pt.business_num(+) order by pf_no desc)
where ((pf_no is not null) and pf_subtype='아파트');

select * from (select pf.*, pt.businessName from portfolioT pf, partnersT pt 
where pf.BUSINESSNUM = pt.business_num(+) order by pf_no desc)
where ((pf_no is not null)  and where pf_subtype='모던');





update PARTNERST set  pAddress = '서울시 강남구 선릉로' where  pName = '구동민';

select * from portfolioT where BUSINESSNUM = (select BUSINESSNUM from partnersT where businessName like '%동민%');




delete  from partners_subT;


