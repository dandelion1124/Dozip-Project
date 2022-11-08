
select count(*) as count, TO_CHAR(PAY_DATE1, 'YYYY-MM') as PAY_DATE1, sum(PAY_COST1) as PAY_COST1,sum(PAY_COST2) as PAY_COST2, sum(PAY_COST3)
    as PAY_COST3 from PAYT where BUSINESSNUM='111-11-11111' group by TO_CHAR(PAY_DATE1, 'YYYY-MM');



select count(*) as count, TO_CHAR(PAY_DATE1, 'YYYY-MM') as PAY_DATE1, sum(PAY_COST1) as PAY_COST1,sum(PAY_COST2) as PAY_COST2, sum(PAY_COST3) as PAY_COST3
from PAYT where BUSINESSNUM='111-11-11111' and TO_CHAR(PAY_DATE1, 'YYYY-MM') =TO_CHAR(Sysdate, 'YYYY-MM') group by TO_CHAR(PAY_DATE1, 'YYYY-MM')


select p.*, s.P_COMP_LOGO from PARTNERST p, PARTNERS_SUBT s where p_addr1 like '%삼성동%' and p.BUSINESSNUM=s.BUSINESSNUM;



select count(*) as count,  sum(PAY_COST1) as PAY_COST1,sum(PAY_COST2) as PAY_COST2, sum(PAY_COST3)
                as PAY_COST3 from PAYT where BUSINESSNUM='111-11-11111';

