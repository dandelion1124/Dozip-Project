<%@ page contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="my_req_list">
	<h2 class="item_title">시공견적요청</h2>
	<span style="float:right;">총 입찰 개수: ${listcount}개</span>
	<table style="width: 90%; border-collapse: collapse; text-align:center;
				margin:0 5% 40px 5%; background-color:white;">
		<tr class="my_req_label" style="border-bottom:1px solid black; border-top:2px solid black;/*#0064CD*/ height:50px; font-size:15px;">
			<th>견적요청 내용</th> <th>희망 예산</th> <th>견적신청일</th> <th>희망 시공시작일</th> <th>희망 시공종료일</th> <th>세부정보</th> <th>수용여부</th>
		</tr>
		<c:if test="${!empty ereq}">
		<c:forEach var="er" items="${ereq}">
		<tr class="my_req_cont" style="background-color:#EBFBFF; /*#FDF5E6*/ font-size:13px; border-bottom:1px solid lightgray;">
			<td> ${er.addr} ${er.est_use} 원상복구 견적 문의</td> <td>${er.est_bud}만원</td> <td>${er.est_date}</td> <td>${er.est_start}</td> <td>${er.est_end}</td>
			<td><div class="req_detail"><a href="/partners/request_detail?no=${er.est_num}&page=${page}" class="my_bid_btn-d-view" >자세히 보기</a></div></td>
			<td class="req_accept">
				<button class="accept" onclick="confirm('수용하시겠습니까?')">수용</button>
				<button class="deny" onclick="confirm('취소하시겠습니까?')">취소</button>
			</td>
		</tr>
		</c:forEach>
		</c:if>
	</table>

	<%--페이징 추가 --%>
	<div id="mybid_paging">
		<p>
			<c:if test="${page<=1}">
				[이전]
			</c:if>
			<c:if test="${page>1}">
				<a href="/partners/my_bid?page=${page-1}">[이전]</a>
			</c:if>

			<%--현재 쪽번호 출력--%>
			<c:forEach var="p" begin="${startpage}" end="${endpage}" step="1">
				<c:if test="${p== page}"> ${p}</c:if> <!--현재 페이지 선택 시-->
				<c:if test="${p != page}"> <a href="/partners/my_bid?page=${p}">[${p}]</a> <!--현재 페이지 선택되지 않았을 시 -->
				</c:if>
			</c:forEach>

			<c:if test="${page >= maxpage}">
				[다음]
			</c:if>
			<c:if test="${page<maxpage}">
				<a href="/partners/my_bid?page=${page+1}">[다음]</a>
			</c:if>
		</p>
	</div>

</div>

<jsp:include page="../include/footer.jsp" />
