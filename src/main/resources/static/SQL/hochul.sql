select *
from estimatet;


insert into bidT values (bid_num_seq.nextval, '111-11-12345', '6', '10000', '10월2일','10월3일', '상세', '진행중', sysdate);
insert into bidT values (bid_num_seq.nextval, '111-11-12345', '6', '10050', '10월2일','10월3일', '상세', '계약요청', sysdate);
insert into bidT values (bid_num_seq.nextval, '111-11-12345', '6', '50000', '10월2일','10월3일', '상세', '진행중', sysdate);
select * from bidT where BID_STATE='계약요청';

