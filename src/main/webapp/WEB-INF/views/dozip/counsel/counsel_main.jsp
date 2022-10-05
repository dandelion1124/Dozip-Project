<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../common/header.jsp" />
<script src="/DoZip/js/jquery.js" ></script>

<%-- 상단 공통부분 끝 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<div class="counsel_wrap">
	<div class="counsel_info">
		<div id="info_text">
			<p id="info_text_b">질문과 답변</p>
			<p id="info_text_s">자주하는 질문과 답변을 확인해보세요</p>
		</div>
		<div class="btn_group">
			<button id="qna_write_btn"><a href="counsel_write.do" >문의글 작성하기</a></button>
			<button id="real_counsel_btn"><a href="#" >1:1 실시간 상담하기</a></button>
		</div>
	</div>
	
	<div class="my_qna">
		<div class="my_qna_title"><p>나의 문의</p></div>
		<div class="my_qna_cont">
			<!-- 목록 출력 -->
			<table>
				<tr>
				<th id="head_num">번호</th> <th id="head_title">제목</th> <th id="qna_state">답변상태</th><th id="head_date">작성일</th>
				</tr>
				<c:if test="${fn:length(qlist) == 0}">
					<tr><td colspan="4"> 등록된 글이 없습니다.</td> </tr>
				</c:if>	
				<c:if test="${fn:length(qlist) != 0}">
				<c:forEach var="i" begin="0" end="${fn:length(qlist)-1}" step="1">		
				<c:if test="${qlist[i].businessName == null}">
					<tr>
						<td id="num">
							<c:set var="number" value="${(listcount-(5*(page-1)))-i}" />
							<c:out value="${number}"/>
						</td>
						<td id="title">
							<c:if test="${qlist[i].qna_level != 0}">=></c:if>
							<a href="#">${qlist[i].qna_title}</a>
						</td>
						<td id="state">${qlist[i].reply_state}</td> <td id="date">${qlist[i].qna_date}</td>
					</tr>
				</c:if>
				</c:forEach>
				</c:if>
			</table>
			
			<!-- 쪽번호 출력 -->
			<div class="page_area">
				<c:if test="${page<=1}">[이전]</c:if>
				<c:if test="${page>1}"><a href="counsel.do?page=${page-1}">[이전]</a></c:if>
				
				<c:forEach var="p" begin="${startpage}" end="${endpage}" step="1">
					<c:if test="${p==page}">${p}</c:if>
					<c:if test="${p!=page}"><a href="counsel.do?page=${p}">[${p}]</a></c:if>
				</c:forEach>
				
				<c:if test="${page>=maxpage}">[다음]</c:if>
				<c:if test="${page<maxpage}"><a href="counsel.do?page=${page+1}">[다음]</a></c:if>
			</div>
		</div>
	</div>

	<div class="qna_part">
		<div class="qna_btn_group">
			<button type="button" onclick="">서비스안내</button>
			<button type="button" onclick="">견적</button>
			<button type="button" onclick="">상담</button>
			<button type="button" onclick="">계약</button>
			<button type="button" onclick="">공사</button>
			<button type="button" onclick="">시공후</button>
			<button type="button" onclick="">파트너스</button>
		</div>
		
		<div class="qna_cont">
			<div class="qna_menu">
				<span>회원 아이디와 비밀번호가 기억나지 않아요.</span>
			</div>
			<div class="qna_hide">
				두집​ 홈페이지 상단 → 사용자 아이콘을 누르신 다음 노출되는 창에서 제일 하단 '아이디로 로그인하기' 로 들어가시면 아이디 또는 비밀번호를 찾으실 수 있습니다. 
				그래도 찾지 못하실 경우, 고객센터로 연락주시면 신속히 도움 드리겠습니다.
			</div>
			<%! int i=0; %>
			<% for(i=1; i<4; i++){ %>
			<div class="qna_menu">
				<span><%=i %>번 질문</span>
			</div>
			<div class="qna_hide">
				<%=i %>번 답변
			</div>
		<%} %>
		</div>
	</div>

</div>

<script>
	$(".qna_menu").click(function() {
		$(this).next(".qna_hide").stop().slideToggle(300);
		$(this).toggleClass('on').siblings().removeClass('on');
		$(this).next(".qna_hide").siblings(".qna_hide").slideUp(300);
	});
</script>


<%-- 하단 공통부분 --%>
<jsp:include page="../common/footer.jsp" />