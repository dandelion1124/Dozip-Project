select count(s.P_COMP_LOGO) as photo_check, count(p.P_ADDR1) as addr_check from PARTNERST p, PARTNERS_SUBT s where p.BUSINESSNUM=s.BUSINESSNUM and p.BUSINESSNUM='222-22-22222';


select * from PORTFOLIOT  where BUSINESSNUM ='111-11-11111'  ;






select e.* from ESTIMATET e, bidT b where e.EST_NUM=b.EST_NUM and EST_CHECK='계약요청' and b.BUSINESSNUM='111-11-11111';



select count(*) from ESTIMATET e where (select count(*) from bidT b where b.BUSINESSNUM='111-11-11111')= and EST_CHECK='계약요청';


select count(*) from bidT b where b.BUSINESSNUM='111-11-11111';

select b.EST_NUM from bidT b where b.BUSINESSNUM='111-11-11111';


select sum(RE_STAR) from REVIEWT r, CONTRACTT c where r.CONT_NO=c.CONT_NO and c.BUSINESSNUM='111-11-11111'

