select count(s.P_COMP_LOGO) as photo_check, count(p.P_ADDR1) as addr_check from PARTNERST p, PARTNERS_SUBT s where p.BUSINESSNUM=s.BUSINESSNUM and p.BUSINESSNUM='222-22-22222';


select * from PORTFOLIOT  where BUSINESSNUM ='111-11-11111';

select count(*) from ESTIMATET e where (select count(*) from bidT b where b.BUSINESSNUM='222-22-33333')=1;

select distinct e.* from ESTIMATET e, BidT b where e.BUSINESSNUM=b.BUSINESSNUM;


select e.* from ESTIMATET e, bidT b where e.EST_NUM=b.EST_NUM and EST_CHECK='계약요청' and b.BUSINESSNUM='111-11-11111';



select count(*) from ESTIMATET e where (select count(*) from bidT b where b.BUSINESSNUM='111-11-11111')= and EST_CHECK='계약요청';


select count(*) from bidT b where b.BUSINESSNUM='111-11-11111';

select b.EST_NUM from bidT b where b.BUSINESSNUM='111-11-11111';


select sum(RE_STAR) from REVIEWT r, CONTRACTT c where r.CONT_NO=c.CONT_NO and c.BUSINESSNUM='111-11-11111'

select distinct e.* from estimateT e, bidT b where e.EST_NUM=b.EST_NUM and b.BUSINESSNUM='222-22-33333' or e.BUSINESSNUM='222-22-33333'  and est_check != '대기중' and est_check != '수락' order by e.EST_NUM desc




                                     ;


select * from BIDT where BUSINESSNUM='111-11-11111';



                        order by EST_NUM desc;
