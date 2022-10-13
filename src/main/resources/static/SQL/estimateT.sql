

 -- foreign key설정 사용자아이디
 alter table estimateT
 add constraint mem_id foreign key(mem_id) references memberT (mem_id);
 -- foreign key설정 사업자 번호 
 alter table estimateT
 add constraint business_num foreign key(business_num) references partnersT (business_num);

 
drop table estimateT;
 
select * from estimateT;
