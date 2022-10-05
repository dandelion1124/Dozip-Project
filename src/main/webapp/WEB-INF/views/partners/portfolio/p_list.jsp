<%@ page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp" />
	<h1> 포트폴리오 목록</h1>
		<table style="margin:0 auto;">
			<tr>
				<th>시공번호</th>
				<th>제목</th>
				<th>수정/삭제</th>
			</tr>
			<tr>
				<td>2</td>
				<td>이름</td>
				<td><input type="button" value="수정/삭제" onclick="location='./portfolio/p_modify.jsp'"></td>
			</tr>
			<tr>
				<td>1</td>
				<td>이름</td>
				<td><input type="button" value="수정/삭제" onclick="location='./portfolio/p_modify.jsp'"></td>
			</tr>
		</table>
<jsp:include page="../include/footer.jsp" />

