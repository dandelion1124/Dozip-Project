create table bidT (
    bid_num varchar2(12) primary key,
    business_num nvarchar2(12) not null,
    est_num varchar2(12) not null,
    bid_price number(20) not null,
    bid_period number(5) null,
    bid_detail varchar2(3000) null,
    bid_end number(5) not null,
    foreign key(business_num) references partnersT(business_num),
    foreign key(est_num) references estimateT(est_num)
);

select * from bidT;
drop table bidT;