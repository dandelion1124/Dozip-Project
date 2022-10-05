<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글상세</title>
</head>
<body>
	<table>
		<tr>
			<th>작성자</th> <td>${q.mem_id}</td>
		</tr>
		<tr>
			<th>문의유형</th> <td>${q.qna_type}</td>
		</tr>
		<tr>
			<th>글제목</th> <td>${q.qna_title}</td>
		</tr>
		<tr>
			<th>글내용</th> <td>${q.qna_cont}</td>
		</tr>
	</table>
	<button>글삭제</button>
	<hr/>
	<div>${q.qna_ref }<br/>${q.qna_step }<br/>${q.qna_level }<br/></div>
	<form method="post" action="admin_qnaReply.do">
		<!-- 히든전달 -->
		<input type="hidden" name="qna_ref" value="${q.qna_ref}"/>
		<input type="hidden" name="qna_step" value="${q.qna_step}"/>
		<input type="hidden" name="qna_level" value="${q.qna_level}"/>
		<input type="hidden" name="mem_id" value="${q.mem_id}"/>
		<input type="hidden" name="qna_type" value="${q.qna_type}"/>
		<input type="hidden" name="qna_title" value="Re : ${q.qna_title}"/>
		
		답변내용<br/>
		<textarea rows="5" cols="40" name="qna_cont"></textarea>
	
	<button type="submit">답변작성</button>
	</form>
	
</body>
</html>