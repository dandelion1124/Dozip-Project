<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:include page = "../include/header.jsp"/>
<%-- 상단 공통부분 끝 --%>
<link rel="stylesheet" type="text/css" href="/Admin/css/admin_qnaList.css" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div class="all_qna_list_wrap">
	<div>
		<p id="all_qna_list_title">고객문의 목록</p>
		<p>고객이 올린 문의글 전체를 관리며하며, 답변을 작성할 수 있습니다.</p>
	</div>
	<div>
		<!-- 목록 출력 -->
		<table class="all_qna_list_table">
			<tr>
				<th> </th>
				<th id="qna_number">글번호</th><th style="width:10%;">글작성자</th><th style="width:8%;">글유형</th>
				<th>원본글번호</th>
				<th style="width:10%;">문의유형</th><th style="width:15%;">제목</th><th>문의날짜</th><th>답변자</th>
				<th>답변상태</th><th>답변일자</th>
			</tr>
				
			<tr>
				<th><input type="checkbox" /></th>
				<th><input type="text"/></th>
				<th><input type="text"/></th>
				<th><input type="text"/></th>
				<th><input type="text"/></th>
				<th>
					<select name="cw_check" id="cw_check">
						<option selected>문의유형</option>
						<option value="1">1번 문의유형</option>
						<option value="2">2번 문의유형</option>
						<option value="3">3번 문의유형</option>
						<option value="4">4번 문의유형</option>
						<option value="5">5번 문의유형</option>
					</select>
				</th>
				<th><input type="text"/></th>
				<th><input type="text"/></th>
				<th><input type="text"/></th>
				<th>
					<select name="answer_check" id="answer_check">
						<option selected>답변상태</option>
						<option value="1">미답변</option>
						<option value="2">답변완료</option>
					</select>
				</th>
				<th><input type="text"/></th>
			</tr>
			
			<c:if test="${fn:length(qlist) == 0}">
				<tr><td colspan="10"> 등록된 글이 없습니다.</td> </tr>
			</c:if>	
			<c:if test="${fn:length(qlist) != 0}">
			<c:forEach var="i" begin="0" end="${fn:length(qlist)-1}" step="1">		
				<tr>
					<td><input type="checkbox" /></td>
					<td id="num">${qlist[i].qna_no}</td><!-- 글번호 -->
					<td>${qlist[i].mem_id}</td><!-- 작성자 -->
					<td><!-- 글유형(원본글인지답글인지) -->
						<c:if test="${qlist[i].qna_step == 0}">원본글</c:if>
						<c:if test="${qlist[i].qna_step != 0}">답글</c:if>
					</td>
					<td>${qlist[i].qna_ref}</td><!-- 원본글번호 -->
					<td>${qlist[i].qna_type}</td><!-- 문의유형 -->
					<td id="title"><a href="admin_qnadetail.do?qna_no=${qlist[i].qna_no}">${qlist[i].qna_title}</a></td><!-- 글제목 -->
					<td id="date">${qlist[i].qna_date}</td><!-- 문의날짜 -->
					<td><!-- 업체명 -->
						<c:if test="${qlist[i].businessName != null}">${qlist[i].businessName}</c:if>
						<c:if test="${qlist[i].businessName == null}">관리자</c:if>
					</td>
					<td id="state">${qlist[i].reply_state}</td><!-- 답변상태 -->
					<td>${qlist[i].reply_date}</td><!-- 답변날짜 -->
				</tr>
			</c:forEach>
			</c:if>
			
		</table>
		
		<!-- 쪽번호 출력 -->
		<div class="page_area">
			<c:if test="${page<=1}">[이전]</c:if>
			<c:if test="${page>1}"><a href="admin_qnalist.do?page=${page-1}">[이전]</a></c:if>
			
			<c:forEach var="p" begin="${startpage}" end="${endpage}" step="1">
				<c:if test="${p==page}">${p}</c:if>
				<c:if test="${p!=page}"><a href="admin_qnalist.do?page=${p}">[${p}]</a></c:if>
			</c:forEach>
			
			<c:if test="${page>=maxpage}">[다음]</c:if>
			<c:if test="${page<maxpage}"><a href="admin_qnalist.do?page=${page+1}">[다음]</a></c:if>
		</div>
	</div>
</div>



<%-- 하단 공통부분--%>
<jsp:include page = "../include/footer.jsp"/>