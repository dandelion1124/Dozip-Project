<%@ page contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<div class="my_bid_list">
	<div class="request_spot">
		<h2 class="item_title">내 입찰목록</h2>
		<%-- <div class="my_bid_title1"><h3 id="bid_fin"> <!--입찰 완료 --></h3></div> --%>
	</div>
	<div style="width:90%;">
		<!--<select name="my_bid_option" style="border:1px solid lightgray; width: 80px;">
            <option value="all">전체</option>
            <option value="success">입찰 성공</option>
            <option value="fail">입찰 실패</option>
        </select> -->
		<p style="float:right;">총 입찰 개수: ${listcount}개</p>
	</div>

	<table style="width: 90%; border-collapse: collapse; text-align:center;
				margin:0 5% 20px 5%; background-color:white;">
		<tr class="my_bid_label" style="border-bottom:1px solid black; border-top:2px solid black;/*#0064CD*/ height:50px; font-size:15px;">
			<th>입찰 내용</th> <th>입찰가</th> <th>모집 마감일</th> <th>입찰 시공시작일</th> <th>입찰 시공종료일</th> <th>세부정보</th> <th>입찰상태</th>
		</tr>
		<c:if test="${empty list}">
			<tr class="no_bid_list">
				<td colspan="7" style="font-size:25px; height:100px; background-color: aliceblue;">조회된 입찰 리스트가 없습니다.</td>
			</tr>
		</c:if>

		<c:if test="${!empty list}">
			<c:forEach var="e" items="${list}">
				<tr class="my_bid_cont" style="background-color:#EBFBFF; /*#FDF5E6*/ font-size:13px; border-bottom:1px solid lightgray;">
					<c:set var = "est_dateEnd" value = "${fn:split(e.est_dateEnd,' ')}"/>
					<td>${e.est_addr} ${e.est_use} 견적 문의</td> <td>${e.bid_price}</td> <td>${est_dateEnd[0]}</td>  <td>${e.bid_start}</td> <td>${e.bid_end}</td>
					<td><div class="bid_detail"><a href="/partners/bid_detail?no=${e.est_num}&page=${page}" class="my_bid_btn-d-view" >자세히 보기</a></div></td>
					<td class="bid_result"><span class="success1">${e.bid_state}</span></td>
				</tr>
			</c:forEach>
		</c:if>
		<%--		<tr class="my_bid_cont" style="background-color:#FDF5E6; /*#FDF5E6*/ font-size:14px;">--%>
		<%--			<td>목동 사무실 원상복구 견적 문의</td> <td>5,000,000원</td> <td>2022.07.13</td>  <td>2022.07.25</td>--%>
		<%--			<td><div class="bid_detail"><a href="/partners/estimate_request/bid_detail?no=${e.est_num}" class="my_bid_btn-d-view" >자세히 보기</a></div></td>--%>
		<%--			<td class="bid_result"><span class="fail1">실패</span></td>--%>
		<%--		</tr>--%>
		<%--		<tr class="my_bid_cont" style="background-color:#EBFBFF; /*#FDF5E6*/ font-size:14px;">--%>
		<%--			<td>목동 사무실 원상복구 견적 문의</td> <td>5,000,000원</td> <td>2022.07.13</td>  <td>2022.07.25</td>--%>
		<%--			<td><div class="bid_detail"><a href="/partners/estimate_request/bid_detail?no=${e.est_num}" class="my_bid_btn-d-view" >자세히 보기</a></div></td>--%>
		<%--			<td>진행중</hr>--%>
		<%--				<a href="#" class="btn-cancel" onclick="confirm('입찰을 취소하시겠습니까?')" >취소</a>--%>
		<%--			</td>--%>
		<%--		</tr>--%>

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
