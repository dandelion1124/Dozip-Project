<%@ page contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp" />

<script type="text/javascript">
    $(function() {
        $("#allCheck").click(function() {
            if ($("#allCheck").prop("checked")) {
                $("input[type=checkbox]").prop("checked", true);
            } else {
                $("input[type=checkbox]").prop("checked", false);
            }
        })
    })
</script>
    
	<h1>내공사내역</h1>
	
	<div style="display:flex; justify-content: flex-end; margin-bottom:20px;">
		<input type=button value="계약해지">
	</div>
	<table border=1 style="width: 100%; border-collapse: collapse;">
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
			<th>고객명/연락처</th>
			<th>계약서</th>
			<th>정산현황(계약금,중도금,완납)</th>
			<th>계약파기</th>
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
			<th><%=i%></th>
			<th>1000</th>
			<th><%=i%></th>
			<th><%=i%></th>
			<th><a href="../images/계약서.png">다운</a></th>
			<th>완납</th>
			<th><input type="button" value="해지"
				onclick="confirm('해지하시겠습니까?')"></th>
		</tr>



		<%
		}
		%>




	</table>


<jsp:include page="../include/footer.jsp" />

