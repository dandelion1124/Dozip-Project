<%@ page contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<div class="my_bid_list">
	<div class="request_spot">
		<p style="margin-bottom: 15px; font-size: 0.9rem;"> <b>|</b> 견적의뢰 > 입찰의뢰 > 내 입찰목록</p>
		<h2 class="item_title">내 입찰목록</h2>
		<div style="padding:0 0 10px 2.5%; width:87%; border-bottom:3px double gray;">
			<ul style="padding:0px;">
				<li style="font-size: 0.8rem; margin-bottom: 5px; list-style:none;"><span class="red">*</span>&nbsp;현재 참여중인 입찰을 모두 확인하실 수 있습니다.</li>
				<li style="font-size: 0.8rem; margin-bottom: 5px; list-style:none;"><span class="red">*</span>&nbsp;입찰 및 계약 진행상황에 따라 입찰상태가 바뀌게 됩니다.</li>
				<li style="font-size: 0.8rem; margin-bottom: 5px; list-style:none;"><span class="red">*</span>&nbsp;입찰상태는 <b style="font-size:15px;">[ 진행중 -> 계약요청/거절 -> 계약완료 -> 공사완료 ]</b> 순으로 진행됩니다. </li>
			</ul>
		</div>
		<%-- <div class="my_bid_title1"><h3 id="bid_fin"> <!--입찰 완료 --></h3></div> --%>
	</div>
	<div style="width:88%;">
		<!--<select name="my_bid_option" style="border:1px solid lightgray; width: 80px;">
            <option value="all">전체</option>
            <option value="success">입찰 성공</option>
            <option value="fail">입찰 실패</option>
        </select> -->
		<p style="float:right; font-weight:bold; margin-top: 10px;">총 입찰 개수: ${listcount}개</p>
	</div>
	<div style="padding: 0 0 25px 2.5%; width:95%;">
	<table style="width: 90%; border-collapse: collapse; text-align:center;
				padding: 0 0 25px 2.5%; background-color:white;">
		<tr class="my_bid_label" style="border-bottom:1px solid black; border-top:2px solid black;/*#0064CD*/ height:50px; font-size:15px;">
			<th>입찰 번호</th> <th>입찰 내용</th> <th>입찰가</th> <th>모집마감일</th> <th>시공시작 입찰일</th> <th>시공종료 입찰일</th> <th>세부정보</th> <th>입찰상태</th>
		</tr>
		<c:if test="${empty list}">
			<tr class="no_bid_list">
				<td colspan="8" style="font-size:25px; height:100px; background-color: aliceblue;">조회된 입찰 리스트가 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${!empty list}">
			<c:forEach var="e" items="${list}">
				<tr class="my_bid_cont" style="font-size:13px; border-bottom:1px solid lightgray;
					<c:if test="${e.bid_state=='진행중'}"></c:if>
					<c:if test="${e.bid_state=='계약요청'}">background-color:#EBFBFF;</c:if>
					<c:if test="${e.bid_state=='거절'}">background-color:#FDF5E6;</c:if>
					<c:if test="${e.bid_state=='계약완료'}">background-color:#D2E1FF;</c:if>
					<c:if test="${e.bid_state=='공사완료'}">background-color:lightgray;</c:if>
					">
					<c:set var = "est_dateEnd" value = "${fn:split(e.est_dateEnd,' ')}"/>
					<c:set var = "bid_start" value = "${fn:split(e.bid_start,' ')}"/>
					<c:set var = "bid_end" value = "${fn:split(e.bid_end,' ')}"/>

					<td><b>${e.bid_num}</b></td> <td>${e.addr} ${e.est_use} 견적 문의</td> <td>${e.bid_price}만원</td> <td>${est_dateEnd[0]}</td>  <td>${bid_start[0]}</td> <td>${bid_end[0]}</td>
					<td><div class="bid_detail"><a href="/partners/bid_detail?no=${e.est_num}&page=${page}" class="my_bid_btn-d-view" >자세히 보기</a></div></td>
					<td class="bid_result"><span class="success1" style="
						<c:if test="${e.bid_state=='진행중'}">color:black;</c:if>
						<c:if test="${e.bid_state=='계약요청'}">color:blue;</c:if>
						<c:if test="${e.bid_state=='거절'}">color:red;</c:if>
						<c:if test="${e.bid_state=='계약완료'}">color:#0000CD;</c:if>
						<c:if test="${e.bid_state=='공사완료'}">color:black;</c:if>
							">${e.bid_state}</span></td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
	</div>
	<%--페이징 추가 --%>
	<div id="mybid_paging">
		<p>
		<c:if test="${page<=1}">
			<img src="/images/dozip/left-arrow.png">
		</c:if>
		<c:if test="${page>1}">
			<a href="/partners/my_bid?page=${page-1}"><img src="/images/dozip/left-arrow.png"></a>
		</c:if>

		<%--현재 쪽번호 출력--%>
		<c:forEach var="p" begin="${startpage}" end="${endpage}" step="1">
			<c:if test="${p== page}"> ${p}</c:if> <!--현재 페이지 선택 시-->
			<c:if test="${p != page}"> <a href="/partners/my_bid?page=${p}">[${p}]</a> <!--현재 페이지 선택되지 않았을 시 -->
			</c:if>
		</c:forEach>

		<c:if test="${page >= maxpage}">
			<img src="/images/dozip/right-arrow.png">
		</c:if>
		<c:if test="${page<maxpage}">
			<a href="/partners/my_bid?page=${page+1}"><img src="/images/dozip/right-arrow.png"></a>
		</c:if>
		</p>
	</div>
</div>

<jsp:include page="../include/footer.jsp" />
