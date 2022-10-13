
alter table qnaT modify qna_type null;
delete qnaT;
COMMIT;
select * from partnersT;


commit;
rollback;


select * from qnaT where mem_id='hong'order by qna_no desc;

select qna_no, mem_id, qnaT.business_num, qna_type,qna_title,qna_cont,qna_date,edit_date,qna_state,qna_ref,qna_step,qna_level,reply_state,reply_date, partnersT.businessName  from qnaT,partnersT where qnaT.business_num=partnersT.business_num(+) and mem_id='hong';



select qna_no, mem_id, qnaT.business_num, qna_type,qna_title,qna_cont,qna_date,edit_date,qna_state,qna_ref,qna_step,qna_level,reply_state,reply_date, partnersT.businessName  from qnaT,partnersT where qnaT.business_num=partnersT.business_num(+) and mem_id='hong';




select mem_name, qnaT.* from qnaT Left Join memberT On qnaT.mem_id = memberT.mem_id where business_num='321-15-01521' and qna_state=1 and reply_state='답변완료' and qna_type like 3 order by qna_ref desc, qna_level asc;











---쿼리문 테스트
select * from (
select rowNum r, qna_no, mem_id, qnaT.business_num, qna_type,qna_title,
qna_cont,qna_date,edit_date,qna_state,qna_ref,qna_step,
qna_level,reply_state,reply_date, partnersT.businessName
from qnaT,partnersT 
where qnaT.business_num=partnersT.business_num(+) 
and mem_id='yang'
order by qna_no desc, qna_ref desc, qna_level asc
)where r>=6 and r<=10;
		
select * from (
select rowNum r, qna_no, q.mem_id, q.business_num, qna_type,qna_title,
qna_cont,qna_date,edit_date,qna_state,qna_ref,qna_step,
qna_level,reply_state,reply_date, p.businessName, m.mem_name
from (select*from qnaT where mem_id='hong' order by qna_ref desc, qna_level asc) q, partnersT p, memberT m  
where q.business_num=p.business_num(+) and q.mem_id=m.mem_id(+)
)where r>=6 and r<=10;

----------


select * from qnaT;
select businessName,business_num from partnersT;


--sqlplus / as sysdba 관리자 권한으로 로그인 하여 
--grant create view to admin; 
--뷰테이블 생성권한을 부여하고나면 view테이블을 만들 수 있다. 
CREATE OR REPLACE VIEW v_partnersT
AS
SELECT businessName , business_num
FROM partnersT;



















select mem_name, qna_no, qnaT.mem_id, qna_type, qna_title, qna_cont, qna_date, qna_ref, qna_step, qna_level, reply_state from qnaT Left Join memberT On qnaT.mem_id = memberT.mem_id where business_num='321-15-01521' and qna_state=1 order by qna_no DESC;
      