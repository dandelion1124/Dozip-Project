select count(s.P_COMP_LOGO) as photo_check, count(p.P_ADDR1) as addr_check from PARTNERST p, PARTNERS_SUBT s where p.BUSINESSNUM=s.BUSINESSNUM and p.BUSINESSNUM='222-22-22222';


select * from PORTFOLIOT  where BUSINESSNUM ='111-11-11111'  ;
