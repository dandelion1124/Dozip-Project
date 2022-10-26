<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="../include/header.jsp" />
<style>
	#qna_table td {
		text-align: center;
	}
</style>
<div id="qna_title">
	<div class="title">Q&A</div>
	<div class="message">고객문의 페이지입니다. 빠른 시일 내에 처리 바랍니다.</div>
</div>

<form action="customer_qna" method="get" onsubmit='return search_check();'>
<input type="hidden" id="board_ref" value="${q.qna_ref }">
<input type="hidden" id="board_step" value="${q.qna_step }">
<input type="hidden" id="board_level" value="${q.qna_level }">

<div id="search_bar">
	<div>
<select id="search_condition" name="find_field">
				<option value="default" selected>검색옵션</option>
				<option value="customer_name" <c:if test="${find_field =='customer_name' }"> ${'selected' }</c:if>>작성자</option>
				<option value="qna_type" <c:if test="${find_field =='qna_type' }"> ${'selected' }</c:if>>문의유형</option>
			</select> <input type="search" name="find_text" id="search_text" value="${find_text }" placeholder="입력해주세요">

<select  name="answer" id='answer'> <%--onchange='answer_check();--%>
				<option value="whole"  <c:if test="${answer =='whole' }"> ${'selected' }</c:if>>답변상태</option>
				<option value="no" <c:if test="${answer =='no' }"> ${'selected' }</c:if>>미답변</option>
				<option value="yes" <c:if test="${answer =='yes' }"> ${'selected' }</c:if>>답변완료</option>
			</select>
	</div><div>
	<input type="submit" value="검색">
</div>
</div>
<table id="qna_table">

	<tr class="qna_first_tr">
		<th style="width:10%">답변상태</th>
		<th style="width:42%">제목</th>
		<th style="width:15%">문의유형</th>
		<th style="width:10%">작성자</th>
		<th style="width:13%">등록일시</th>

	</tr>
	<c:if test="${empty qlist }">
		<tr>
			<td colspan="6" class="not_serach_msg"> 조회된 문의 내용이 없습니다.</td>
		</tr>
	</c:if>
	<c:if test="${!empty qlist }">

		<c:forEach var="q" items="${ qlist}">
			<c:if test="${q.qna_step ==0}"> <%--원본글 부분 --%>
			<tr class="qna_tr">
				<td>${q.reply_state }</td>
				<td id='qna_tilte_input'>
				<c:if test="${q.reply_state =='미답변'}">
				<input type="button" value="${q.qna_title }" id = "reply_${q.qna_no }_btn" onclick="qna_reply_toggle(${q.qna_no })" >
				</c:if>
				<c:if test="${q.reply_state =='답변완료'}">
				<input type="button" value="${q.qna_title }" id = "reply_${q.qna_no }_btn" disabled>

				</c:if>
				</td>
				<td>${q.qna_type }
			    </td>
			    <td>${q.mem_name }</td>
				<td class="qna_table_date">${fn:substring(q.qna_date,0,10)}</td>
			</tr>
			</c:if>
			<c:if test="${q.qna_step==1 }">  <%--답변글 출력 부분 --%>
			<tr>
			<td></td>
			<td class="second_reply_td"><span style="color:blue; font-weight:bolder;">	<img src="/images/dozip/arrow.png"></span>  &nbsp; ${q.qna_cont } </td>
			<td  class="third_reply_td"><input type="button" value="삭제" class="del_btn" onclick="reply_del(${q.qna_no }, ${q.qna_ref })"></td>
			<td class="first_reply_td"><span class="reply_date_text"> ${businessName } </span></td>
			<td class="first_reply_td"><span class="reply_date_text"> ${fn:substring(q.reply_date,0,10)} </span></td>
			</tr>
			</c:if>
			<tr>
			<td></td>
			 <td colspan="4" style="display:none;" id="reply_${q.qna_no }"> <div id="qna_cont_box">${q.qna_cont }</div><br> <%--원본글 내용 --%>

				<textarea rows="3" cols="100%" id="reply_${q.qna_no }_textarea" style="width: 86%; resize: none;"></textarea> <%--답변글 작성 부분 --%>
				<input type="button" value="등록" class="reply_btn" onclick="qna_reply(${q.qna_no }, '${q.mem_id }', '${q.qna_title }',${q.qna_step }, ${q.qna_level },'${q.qna_type }',${page })">
			</td>
			</tr>
		</c:forEach>
	</c:if>
	<tr>
	<th colspan="6" id="paging_th">
	<%--검색 전 페이징 --%>
	<c:if test="${(empty find_field ) && (empty find_text)}"><%--검색 필드와 검색어가 없을떄 --%>
		<%--이전 버튼 --%>
		<c:if test="${page <= 1 }">	&lt;이전</c:if>
		<c:if test="${page>1 }"><a href="customer_qna?page=${page-1 }"> &lt;이전 </a></c:if>

		<%--현재 쪽번호 출력 --%>
		<c:forEach var="a" begin="${startpage }" end="${endpage }" step="1">
			<c:if test="${a==page }"> <%--현재 쪽번호가 선택된 경우 --%>
				<span style="color:orange;"> &nbsp; ${a } &nbsp;</span>
			</c:if>
			<c:if test="${a!=page }"> <%--현재 페이지가 선택 안된 경우 --%>
				<a href="customer_qna?page=${a}">&nbsp; ${a } &nbsp;</a>
			</c:if>
		</c:forEach>
			<%--다음 버튼 --%>
			<c:if test="${page >= maxpage }">
				다음&gt;
			</c:if>
			<c:if test="${page < maxpage }">
				<a href="customer_qna?page=${page+1 }"> 다음&gt;</a>
			</c:if>
</c:if>

<%--검색이후 페이징 (쪽나누기) --%>
<c:if test="${(!empty find_field ) || (!empty find_name)}">
	<c:if test="${page<=1 }"> &lt;이전 </c:if>
	<c:if test="${page>1 }"> <a href="customer_qna?page=${page-1}&find_field=${find_field}&find_text=${find_text}">&lt;이전</a>&nbsp; </c:if>

	<%--현재 쪽번호 출력 --%>
	<c:forEach var="a" begin="${startpage }" end="${endpage }" step="1">
		<%--현재 페이지가 선택된 경우 --%>
		<c:if test="${a == page }"> &nbsp;	<span style="color:orange;"> &nbsp; ${a } &nbsp;</span> &nbsp;	</c:if>
		<%--현재 페이지가 선택 안된 경우 --%>
		<c:if test="${a!= page }"> <a href="customer_qna?page=${a}&find_field=${find_field}&find_text=${find_text}">&nbsp; ${a } &nbsp;</a>&nbsp;</c:if>
	</c:forEach>
	<c:if test="${page >= maxpage }">	다음&gt;	</c:if>
	<c:if test="${page< maxpage }">	<a href="customer_qna?page=${page+1 }">다음&gt;</a>	</c:if>
</c:if>
	</th></tr></table></form>
<jsp:include page="../include/footer.jsp" />