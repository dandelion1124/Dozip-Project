select c.*, p.PAY_STATE from CONTRACTT c, PAYT p where p.CONT_NO=c.CONT_NO;



select  c.*, p.PAY_STATE from CONTRACTT c, PAYT p where c.BUSINESSNUM='111-11-11111' and p.CONT_NO=c.CONT_NO and PAY_STATE!='계약금요청';
select distinct e.*, p.Pay_STATE from ESTIMATET e, PAYT p;
select e.*, p.Pay_STATE from ESTIMATET e LEFT JOIN  PAYT p ON e.EST_NUM ;




select * from contractT where BUSINESSNUM=#{businessNum} order by cont_no desc;

select est_num, cont_location, cont_total, cont_start, cont_end, cont_date, TRUNC(SYSDATE)-CONT_DATE as datecheck from contractT where BUSINESSNUM='111-11-11111' order by cont_no desc;
select cont_no, cont_location, cont_total, cont_start, cont_end, cont_date, TRUNC(SYSDATE)-CONT_DATE as datecheck from contractT where BUSINESSNUM='111-11-11111' order by cont_no desc;
