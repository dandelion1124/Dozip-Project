<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../include/header.jsp" />

<style>
#qna_table {
	height: 200px;
	width: 99%;
	margin: 50px 10px;
	border: 1px solid black;
	border-collapse: collapse;
}
#qna_table th {
	background:#DEDBC5;
	border: 1px solid black;
}
tr.qna_tr>td{
	border:1px solid black;
	padding:2px 5px;
}
.qna_table_date{
	max-width:100px;
}
.reply_textarea{
	border:none;
}

td#reply_cont{
	background:#e1deca;
}
span.reply_date_text{
	font-weight: bold;
}
#qna_table th{
	height:50px;
}
#write_date {
    border: none;
    background: none;
    font-weight: bold;
    font-size: 15px;
}
.not_serach_msg {
	text-align: center;
}
td.first_reply_td {
	text-align: center;
	border: 1px solid black;
	padding: 10px 5px;
}
td.second_reply_td {
	border: 1px solid black;
	padding: 10px 15px;
}
td.third_reply_td {
	border: 1px solid black;
}
.reply_btn>input {
	margin-left:26%;
	padding:5px;
}
td.third_reply_td>input {
	margin-left:45%;
	padding:5px;
}
div#qna_paging {
   	float: left;
    margin-bottom: 60px;
    margin-left: 40%;
}
</style>

<div id="qna_title">
	<div class="title">고객 문의</div>
	<div class="message">고객문의 페이지입니다. 빠른 시일 내에 처리 바랍니다.</div>
</div>
<div id="search_bar">
	<div>
		<dt>검색조건</dt>
		<dd>
			<span>
				<div>
					<span>등록일</span><span class="period_cont"> 지난7일</span>
					<button type="button">▼</button>
				</div>
				<div>
					답변여부<span class="period_cont"> 지난7일</span>
					<button type="button">▼</button>
				</div>
				<div>
					상세검색
					<button id="detailed_search" type="button">▼</button>
				</div>
				<div>
					초기화
					<button type="button">▼</button>
				</div>
			</span>
		</dd>
	</div>

</div>
<form action="customer_qna.do" method="get" onsubmit='return search_check();'>
<div  id="search_conditon" style="display:none">
	<div id=search_conditon_wrap>
		<div id=search_conditon_sub_1>
			<div>
				<input type="button" value="오늘"> <input type="button"
					value="지난 7일"> <input type="button" value="지난 30일">
			</div>
			<div>
				<input type="date"> ~ <input type="date">
			</div>
		</div>
		<%-- <hr>
		<div>
			<input type="radio" name="answer" value="whole" <c:if test="${answer =='whole'}"> ${'checked' }</c:if>> 전체 <input
				type="radio" name="answer" value="yes" <c:if test="${answer =='yes' }"> ${'checked' }</c:if>> 답변 <input
				type="radio" name="answer" value="no" <c:if test="${answer =='no' }"> ${'checked' }</c:if>> 미답변
		</div>--%>
		<hr>
		<div>
			<select id="search_condition" name="find_field">
				<option value="default" selected>검색옵션</option>
				<option value="customer_name" <c:if test="${find_field =='customer_name' }"> ${'selected' }</c:if>>고객명</option>
				<option value="qna_type" <c:if test="${find_field =='qna_type' }"> ${'selected' }</c:if>>문의유형</option>
			</select> <input type="search" name="find_text" id="search_text" value="${find_text }" placeholder="입력해주세요">
		</div>
		<hr>

		<div id="search_conditon_hidemenu">
			<div>
				<input type="submit" value="검색"> <input type="reset" value="초기화" onclick="">
			</div>
			<input type="button" value="검색 접기" id="hide_button">
		</div>
	</div>
</div>















<table id="qna_table">
	<tr>	
		<th>글번호</th>
		<th><input id="write_date"type="button" value="등록일시↓↑" onclick="alert('정렬기능 구현 대기중')"></th>
		<th>고객명</th>
		<th>문의내용</th>
		<th>문의유형</th>
		<th>답변여부</th>
	</tr>
	
	<c:if test="${empty qlist }">
		<tr>
			<td colspan="6" class="not_serach_msg"> 조회된 문의 내용이 없습니다.</td>
		</tr>
	</c:if>
	<c:if test="${!empty qlist }">
		
		<c:forEach var="q" items="${ qlist}">
			<c:if test="${q.qna_step ==0}">
			<tr class="qna_tr">
				<td>${q.qna_no }</td>
				<td class="qna_table_date">${q.qna_date }</td>
				<td>${q.mem_name }</td>
				<td>글제목 : ${q.qna_title } <br>문의내용 : ${q.qna_cont }
				</td>
				<td>${q.qna_type }
				<input type="hidden" id="board_ref" value="${q.qna_ref }">
			    <input type="hidden" id="board_step" value="${q.qna_step }">
			    <input type="hidden" id="board_level" value="${q.qna_level }">
			    </td>
				<td class="reply_btn"><input type="button" value="답변하기" id = "reply_${q.qna_no }_btn" onclick="qna_reply_toggle(${q.qna_no })" ></td>
			</tr>
			</c:if>
			<c:if test="${q.qna_step==1 }">
			<tr style="height:90px">
			<td colspan="2" class="first_reply_td"><span class="reply_date_text"> ${ q.reply_date} </span></td>
			<td colspan="2" class="second_reply_td"><span style="color:blue; font-weight:bolder;">${q.qna_title} </span>  &nbsp; ${q.qna_cont } </td>
			<td colspan="2" class="third_reply_td"><input type="button" value="삭제" onclick="reply_del(${q.qna_no }, ${q.qna_ref })"></td>
			</tr>
			</c:if>
			<tr>
			 <td colspan="6" style="display:none;" id="reply_${q.qna_no }"> 
				<textarea rows="5%" cols="100%" id="reply_${q.qna_no }_textarea" style="width: 86%; resize: none;"></textarea>
				<input type="button" value="등록" onclick="qna_reply(${q.qna_no }, '${q.mem_id }', '${q.qna_title }',${q.qna_step }, ${q.qna_level },'${q.qna_type }',${page })">
			</td>
			</tr>
		</c:forEach>
	</c:if>
</table>


<%--검색 전후 페이징(쪽나누기 --%>
<div id="qna_paging">
	<%--검색 전 페이징 --%>
	<c:if test="${(empty find_field ) && (empty find_text)}"><%--검색 필드와 검색어가 없을떄 --%>
		<%--이전 버튼 --%>
		<c:if test="${page <=1 }">[이전]&nbsp;</c:if>
		<c:if test="${page>1 }"><a href="customer_qna.do?page=${page-1 }">[이전]</a>&nbsp;
		</c:if>
		
		<%--현재 쪽번호 출력 --%>
		<c:forEach var="a" begin="${startpage }" end="${endpage }" step="1">
			<c:if test="${a==page }"> <%--현재 쪽번호가 선택된 경우 --%>
				<${ a} >
			</c:if>
			<c:if test="${a!=page }"> <%--현재 페이지가 선택 안된 경우 --%>
				<a href="customer_qna.do?page=${a}">[${a }]</a>
			</c:if>
		</c:forEach>
			<%--다음 버튼 --%>
			<c:if test="${page  >= maxpage }">
				[다음]
			</c:if>
			<c:if test="${page < maxpage }">
				<a href="customer_qna.do?page=${page+1 }"> [다음] </a>
			</c:if>
</c:if>

<%--검색이후 페이징 (쪽나누기) --%>
<c:if test="${(!empty find_field ) || (!empty find_name)}">
	<c:if test="${page<=1 }"> [이전]&nbsp; </c:if>
		<c:if test="${page>1 }">
			<a href="customer_qna.do?page=${page-1}&find_field=${find_field}&find_text=${find_text}">[이전]</a>&nbsp;
		</c:if>
		<%--get으로 find_field 와 find_text을 전달해야 검색이후 페이징 목록을 유지한다. 검색필드와 검색어를
		전달하지 않으면 검색전 페이징 목록으로 이동해서 검색효과가 사라진다--%>
		
		<%--현재 쪽번호 출력 --%>
		<c:forEach var="a" begin="${startpage }" end="${endpage }" step="1">
			<c:if test="${a == page }"> <%--현재 페이지가 선택된 경우 --%>
				<${a }>
			</c:if>
			<c:if test="${a!= page }"> <%--현재 페이지가 선택 안된 경우 --%>
				<a href="customer_qna.do?page=${a}&find_field=${find_field}&find_text=${find_text}">[${a }]</a>&nbsp;
			</c:if>
		</c:forEach>
	<c:if test="${page >= maxpage }">
		[다음]
	</c:if>
	<c:if test="${page< maxpage }">
		<a href="customer_qna.do?page=${page+1 }">[다음]</a>
	</c:if>

</c:if>

</div>












</form>
<jsp:include page="../include/footer.jsp" />