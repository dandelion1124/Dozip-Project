<%@ page contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp" />
	<h2>노출 프로모션 관리</h2>

	<div
		style="display: flex; justify-content: flex-end; margin-bottom: 20px;">
	</div>
	<table border=1 style="width: 100%; min-height:500px; border-collapse: collapse;">
		<tr>
			<th><input type="checkbox" name="sel" id="allCheck"></th>
			<th>시공번호</th>
			<th>계약날짜</th>
			<th>공사유형</th>
			<th>시공범위</th>
			<th>공사면적</th>
			<th>공사기간</th>
			<th>공사금액(만원)</th>
			<th>주소</th>
			<th>등록</th>
		</tr>
		<%
		for (int i = 0; i < 10; i++) {
		%>

		<tr>
			<th><input type="checkbox" name="sel"></th>
			<th><%=i%></th>
			<th><%=i%></th>
			<th><%=i%></th>
			<th><%=i%></th>
			<th><%=i%></th>
			<th>1000</th>
			<th><%=i%></th>
			<th><%=i%></th>
			<th><input type="button" value="등록" onclick="selPeriod()"></th>
		</tr>



		<%
		}
		%>



	</table>

<script>
	function selPeriod() {
		var url = 'select_period.jsp';
		var windowName = "기간 선택";
		var size = "width=300, height=400,";
		var position= ' left='+ Math.ceil(( window.screen.width - 300 )/2)+', top='+Math.ceil(( window.screen.height - 400 )/2);
		window.open(url, windowName, size+position);
	}
	
</script>

<jsp:include page="../include/footer.jsp" />


