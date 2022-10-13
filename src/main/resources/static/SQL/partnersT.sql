


update partnersT set business_num='111' where business_num='105';
insert into partnersT (business_num, businessName, pId, pPw, pName, pTel, pMail_id, 
pMail_domain,pAddress, pDate,PDeldate,pDelcont,pState) values(105, '민우', 'baba', 123, 'ㅇ', 010, 'baba@naver','주소주소', '역삼동', 510,520,530,1);
select * from partnersT;
update partnersT set pAddress = '강남구 역삼동' where businessNum = '111-11-11111';
drop table partnersT;
delete from PARTNERST;
select * from partnersT where pId='shc729';







select * from portfolioT;

delete from portfolioT where businessNum = '222-22-22222';

update PORTFOLIOT set pf_title = '모던한 포토 스튜디오' where pf_no=32;

update portfolioT set pf_subtype = '스튜디오' where pf_no=27;

select * from (select pf.*, pt.businessName from portfolioT pf, partnersT pt 
where pf.BUSINESSNUM = pt.business_num(+) order by pf_no desc)
where ((pf_no is not null) and pf_subtype='아파트');

select * from (select pf.*, pt.businessName from portfolioT pf, partnersT pt 
where pf.BUSINESSNUM = pt.business_num(+) order by pf_no desc)
where ((pf_no is not null)  and where pf_subtype='모던');

select p.pf_no, p.businessNum, p.pf_title, p.pf_type, p.pf_subtype, p.pf_range, p.pf_zipcode, p.pf_addr1, p.pf_addr2, p.pf_addr3, p.pf_area,
            p.pf_cost, p.pf_period, p.pf_concept, p.pf_introduction, p.pf_closing, p.pf_photo1, p.pf_photo2, p.pf_photo3, p.pf_photo4, p.pf_photo5,
            p.pf_premium, p.pf_regdate, pt.businessName from portfolioT p JOIN partnersT pT on pT.businessNum = p.businessNum order by p.pf_no desc;


delete from portfolioT where businessNum='222-22-22222';

update PARTNERST set  pAddress = '서울시 강남구 선릉로' where  pName = '구동민';

select * from portfolioT where BUSINESSNUM = (select BUSINESSNUM from partnersT where businessName like '%동민%');




delete  from partners_subT;


