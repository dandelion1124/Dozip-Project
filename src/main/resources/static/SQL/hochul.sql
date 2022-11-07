
select count(*) as count, TO_CHAR(PAY_DATE1, 'YYYY-MM') as PAY_DATE1, sum(PAY_COST1) as PAY_COST1,sum(PAY_COST2) as PAY_COST2, sum(PAY_COST3)
    as PAY_COST3 from PAYT where BUSINESSNUM='111-11-11111' group by TO_CHAR(PAY_DATE1, 'YYYY-MM');









select count(*) as count,  sum(PAY_COST1) as PAY_COST1,sum(PAY_COST2) as PAY_COST2, sum(PAY_COST3)
                as PAY_COST3 from PAYT where BUSINESSNUM='111-11-11111';

