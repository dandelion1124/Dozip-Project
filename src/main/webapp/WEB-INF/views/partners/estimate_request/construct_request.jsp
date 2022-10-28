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
		<c:if test="${empty ereq}">
			<td colspan="7" style="font-size:25px; height:100px; background-color: aliceblue; text-align: center; line-height: 100px;">현재 시공요청 리스트가 없습니다.</td>
		</c:if>
		<c:if test="${!empty ereq}">
		<c:forEach var="er" items="${ereq}">
		<tr class="my_req_cont" style="background-color:#EBFBFF; /*#FDF5E6*/ font-size:13px; border-bottom:1px solid lightgray;">
			<c:set var = "est_date" value = "${fn:split(er.est_date,' ')}"/>
			<td> ${er.addr} ${er.est_use} 원상복구 견적 문의</td> <td>${er.est_bud}만원</td> <td>${est_date[0]}</td> <td>${er.est_start}</td> <td>${er.est_end}</td>
			<td><div class="req_detail"><a href="/partners/request_detail?no=${er.est_num}&page=${page}" class="my_bid_btn-d-view" >자세히 보기</a></div></td>
			<form method="post" action="">
			<td class="req_accept">
				<button type="button" class="accept" id="permit_btn" name="permit" value='" + this.bid_num + "' value="수락">수락</button>
				<button type="button" class="deny" id="reject_btn" name="reject" value='" + this.bid_num + "' onclick="confirm('거절하시겠습니까?')" value="거절">거절</button>
			</td>
			</form>
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
				<a href="/partners/construct_request?page=${page-1}">[이전]</a>
			</c:if>

			<%--현재 쪽번호 출력--%>
			<c:forEach var="p" begin="${startpage}" end="${endpage}" step="1">
				<c:if test="${p== page}"> ${p}</c:if> <!--현재 페이지 선택 시-->
				<c:if test="${p != page}"> <a href="/partners/construct_request?page=${p}">[${p}]</a> <!--현재 페이지 선택되지 않았을 시 -->
				</c:if>
			</c:forEach>

			<c:if test="${page >= maxpage}">
				[다음]
			</c:if>
			<c:if test="${page<maxpage}">
				<a href="/partners/construct_request?page=${page+1}">[다음]</a>
			</c:if>
		</p>
	</div>
</div>

<script>
	document.getElementById('permit_btn').onclick = function (){
		var bid_num = $('#permit_btn').val();

		alert("고객의 시공요청을 수락하시겠습니까?");

		$.ajax({
			url : '/partners/construct_request_accept',
			type : 'post',
			data : {
				est_num : bid_num
			},
			success : function(data) {
				location.reload();
			},
			error:function(error){
				alert(error);
			}
		})
	}

	document.getElementById('reject_btn').onclick = function (){
		var bid_num = $('#reject_btn').val();

		alert("고객의 시공요청을 거절하시겠습니까?");

		$.ajax({
			url : '/dozip/my_bid_reject',
			type : 'post',
			data : {
				est_num : bid_num
			},
			success : function(data) {
				location.reload();
			},
			error:function(error){
				alert(error);
			}
		})
	}

</script>

<jsp:include page="../include/footer.jsp" />
