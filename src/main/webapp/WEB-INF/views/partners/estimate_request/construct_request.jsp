<%@ page contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="my_req_list">
	<h2 class="item_title">시공견적요청</h2>

	<table style="width: 90%; border-collapse: collapse; text-align:center;
				margin:0 5% 40px 5%; background-color:white;">
		<tr class="my_req_label" style="border-bottom:1px solid black; border-top:2px solid black;/*#0064CD*/ height:50px; font-size:15px;">
			<th>견적요청 내용</th> <th>희망 예산</th> <th>견적신청일</th> <th>희망 시공시작일</th> <th>희망 시공종료일</th> <th>세부정보</th> <th>수용여부</th>
		</tr>
		<c:if test="${!empty ereq}">
		<c:forEach var="er" items="${ereq}">
		<tr class="my_req_cont" style="background-color:#EBFBFF; /*#FDF5E6*/ font-size:13px; border-bottom:1px solid lightgray;">
			<td> ${er.addr} ${er.est_use} 원상복구 견적 문의</td> <td>${er.est_bud}만원</td> <td>${er.est_date}</td> <td>${er.est_start}</td> <td>${er.est_end}</td>
			<td><div class="req_detail"><a href="/partners/request_detail?no=${er.est_num}" class="my_bid_btn-d-view" >자세히 보기</a></div></td>
			<td class="req_accept">
				<button class="accept" onclick="confirm('수용하시겠습니까?')">수용</button>
				<button class="deny" onclick="confirm('취소하시겠습니까?')">취소</button>
			</td>
		</tr>
		</c:forEach>
		</c:if>
	</table>

</div>

<jsp:include page="../include/footer.jsp" />
