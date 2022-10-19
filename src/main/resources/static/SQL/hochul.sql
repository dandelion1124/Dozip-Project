select *
from estimatet;


insert into bidT values (bid_num_seq.nextval, '111-11-11111', '3', '100', '10월2일','10월3일', '상세', '진행중', sysdate);
insert into bidT values (bid_num_seq.nextval, '111-11-11111', '3', '100', '10월2일','10월3일', '상세', '진행중', sysdate);
insert into bidT values (bid_num_seq.nextval, '111-11-11111', '3', '100', '10월2일','10월3일', '상세', '진행중', sysdate);
select * from bidT where BID_STATE='계약요청';

