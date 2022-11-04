<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../common/header.jsp" />
<script src="/DoZip/js/jquery.js" ></script>
<link rel="stylesheet" type="text/css" href="/css/dozip/counsel.css" />
<%-- 상단 공통부분 끝 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<style>
	.my_qna_table th {
		background-color: #f7f7f7;
		font-size: 0.9rem;
		height: 30px;
		border-bottom: 1px solid #B3B9BE;
		border-top: 2px solid #2b2a29;
	}
	.my_qna_table {
		width: 100%;
		text-align: center;
		border-collapse: collapse;
	}
	.my_qna_table td {
		border-bottom: 1px solid #B3B9BE;
		padding: 10px 0;
		font-size: 0.8rem;
	}
	#head_num { width: 10%; }
	#head_title { width: 60%; }
	.page_area{
		text-align:center;
		margin-top: 10px;
	}
</style>

<div class="counsel_wrap">
	<div class="counsel_info">
		<div id="info_text">
			<p id="info_text_b">질문과 답변</p>
			<p id="info_text_s">자주하는 질문과 답변을 확인해보세요</p>
		</div>
		<div class="btn_group">
			<button id="qna_write_btn"><a href="/dozip/qna_write" >문의글 작성하기</a></button>
			<button id="real_counsel_btn"><a href="#" >1:1 실시간 상담하기</a></button>
		</div>
	</div>
	
	<div class="my_qna">
		<div class="my_qna_title"><p>나의 문의</p></div>
		<div class="my_qna_cont">
			<table class="my_qna_table">
				<tr>
					<th id="head_num">번호</th> <th id="head_title">제목</th> <th id="qna_state">답변상태</th><th id="head_date">작성일</th>
				</tr>
				<c:if test="${fn:length(qlist) == 0}">
					<tr><td colspan="4"> 등록된 글이 없습니다.</td> </tr>
				</c:if>
				<c:if test="${fn:length(qlist) != 0}">
					<c:forEach var="i" begin="0" end="${fn:length(qlist)-1}" step="1">
						<tr>
							<td id="num">
								<c:set var="number" value="${(p.count-(p.pageSize*(p.page-1)))-i}" />
								<c:out value="${number}"/>
							</td>
							<td id="title" style="text-align: left; padding-left: 20px;">
								<c:if test="${qlist[i].qna_level != 0}"><img src="/images/dozip/arrow.png"></c:if>
								<a href="#">${qlist[i].qna_title}</a>
							</td>
							<td id="state">
								<c:if test="${qlist[i].qna_level != 0}"><span></span></c:if>
								<c:if test="${qlist[i].qna_level == 0}">${qlist[i].reply_state}</c:if>
							</td>
							<td id="date">${qlist[i].qna_date}</td>
						</tr>
					</c:forEach>
				</c:if>
			</table>

			<!-- 쪽번호 출력 -->
			<div class="page_area">
				<c:if test="${p.page<=1}"><img src="/images/dozip/left-arrow.png"></c:if>
				<c:if test="${p.page>1}"><a href="/dozip/counsel_main?page=${p.page-1}"><img src="/images/dozip/left-arrow.png"></a></c:if>

				<c:forEach var="page" begin="${p.startpage}" end="${p.endpage}" step="1">
					<c:if test="${page==p.page}"><span style="color: #347844; font-weight: bold;">${page}</span></c:if>
					<c:if test="${page!=p.page}"><a href="/dozip/counsel_main?page=${page}">${page}</a></c:if>
				</c:forEach>

				<c:if test="${p.page>=p.maxpage}"><img src="/images/dozip/right-arrow.png"></c:if>
				<c:if test="${p.page<p.maxpage}"><a href="/dozip/counsel_main?page=${p.page+1}"><img src="/images/dozip/right-arrow.png"></a></c:if>
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