select c.*, p.PAY_STATE from CONTRACTT c, PAYT p where p.CONT_NO=c.CONT_NO;



select  c.*, p.PAY_STATE from CONTRACTT c, PAYT p where c.BUSINESSNUM='111-11-11111' and p.CONT_NO=c.CONT_NO and PAY_STATE!='계약금요청';
select distinct e.*, p.Pay_STATE from ESTIMATET e, PAYT p;
select e.*, p.Pay_STATE from ESTIMATET e LEFT JOIN  PAYT p ON e.EST_NUM ;





select est_num, cont_location, cont_total, cont_start, cont_end, cont_date, TRUNC(SYSDATE)-CONT_DATE as datecheck from contractT where BUSINESSNUM='111-11-11111' order by cont_no desc;
select cont_no, cont_location, cont_total, cont_start, cont_end, cont_date, TRUNC(SYSDATE)-CONT_DATE as datecheck from contractT where BUSINESSNUM='111-11-11111' order by cont_no desc;


insert into scheduleT values ('C20221101-1','111-11-11111','공사제목','2022-11-14','2022-11-30');
insert into scheduleT values ('C20221101-2','111-11-11111','공사제목2','2022-11-10','2022-11-11');



select distinct c.*, e.EST_ZIPCODE, e.EST_ADDR2, e.EST_ADDR3, est_zoning, est_use from contractT c, ESTIMATET e where c.businessNum='111-11-11111' and c.EST_NUM=e.EST_NUM;


select c.*, p.PAY_STATE from CONTRACTT c, PAYT p, SCHEDULET s where c.BUSINESSNUM= and p.CONT_NO=c.CONT_NO and s.CONT_NO=c.CONT_NO and PAY_STATE!='계약금요청';
select c.*, p.PAY_STATE, s.REGIT_STATE from CONTRACTT c, PAYT p, SCHEDULET s where c.BUSINESSNUM='111-11-11111' and p.CONT_NO=c.CONT_NO and c.CONT_NO=s.CONT_NO and PAY_STATE!='계약금요청'
