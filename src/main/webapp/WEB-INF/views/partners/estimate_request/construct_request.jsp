<%@ page contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="my_req_list">
	<p style="margin-bottom: 15px; font-size: 0.9rem;"> <b>|</b> 견적의뢰 > 시공요청(지정)</p>
	<h2 class="item_title">시공요청(지정)</h2>
	<div style="padding:0 0 10px 2.5%; width:87%; border-bottom:3px double gray;">
		<ul style="padding:0px;">
			<li style="font-size: 0.8rem; margin-bottom: 5px; list-style:none;"><span class="red">*</span>&nbsp;고객이 업체를 지정하지 않고 신청한 견적 리스트를 확인합니다.</li>
			<li style="font-size: 0.8rem; margin-bottom: 5px; list-style:none;"><span class="red">*</span>&nbsp;자세히 보기를 클릭하면 세부 견적내역을 확인하고 입찰에 참여하실 수 있습니다.</li>
			<li style="font-size: 0.8rem; margin-bottom: 5px; list-style:none;"><span class="red">*</span>&nbsp;입찰을 신청하시면 모집마감일 내에 고객 쪽에서 업체를 선택하게 됩니다.</li>
		</ul>
	</div>
	<div style="width:88%;">
		<!--<select name="my_bid_option" style="border:1px solid lightgray; width: 80px;">
            <option value="all">전체</option>
            <option value="success">입찰 성공</option>
            <option value="fail">입찰 실패</option>
        </select> -->
		<p style="float:right; font-weight:bold; margin-top: 10px;">총 시공요청 개수: ${listcount}개</p>
	</div>
	<div style="padding: 0 0 25px 2.5%; width:95%;">
		<table style="width: 90%; border-collapse: collapse; text-align:center;
					padding: 0 0 25px 2.5%; background-color:white;">
			<tr class="my_req_label" style="border-bottom:1px solid black; border-top:2px solid black;/*#0064CD*/ height:50px; font-size:15px;">
				<th>견적서 번호</th> <th>견적요청 내용</th> <th>희망 예산</th> <th>견적신청일</th> <th>희망 시공시작일</th> <th>희망 시공종료일</th> <th>세부정보</th> <th>진행상태</th>
			</tr>
			<c:if test="${empty ereq}">
				<td colspan="8" style="font-size:25px; height:100px; background-color: aliceblue; text-align: center; line-height: 100px;">현재 시공요청 리스트가 없습니다.</td>
			</c:if>
			<c:if test="${!empty ereq}">
			<c:forEach var="er" items="${ereq}">
				<c:set var ="est_date" value ="${fn:split(er.est_date,' ')}"/>
				<c:set var = "est_start" value = "${fn:split(er.est_start,' ')}"/>
				<c:set var = "est_end" value = "${fn:split(er.est_end,' ')}"/>

				<tr class="my_req_cont" style="font-size:13px; border-bottom:1px solid lightgray;
					<c:if test="${er.est_check=='대기중'}"></c:if>
					<c:if test="${er.est_check=='수락'}">background-color:#EBFBFF;</c:if>
					<c:if test="${er.est_check=='거절'}">background-color:#FDF5E6;</c:if>
					<c:if test="${er.est_check=='계약요청'}">background-color:#EBFBFF;</c:if>
					<c:if test="${er.est_check=='작성완료'}">background-color:#D2E1FF;</c:if>
					<c:if test="${er.est_check=='계약완료'}">background-color:#D2E1FF;</c:if>
					<c:if test="${er.est_check=='잔금결제완료'}">background-color:lightgray;</c:if>
					">
					<td><b>${er.est_num}</b></td>
					<td> ${er.addr} ${er.est_use} 견적 문의</td> <td>${er.est_bud}만원</td> <td>${est_date[0]}</td> <td>${est_start[0]}</td> <td>${est_end[0]}</td>
					<td><div class="req_detail"><a href="/partners/request_detail?no=${er.est_num}&page=${page}" class="my_bid_btn-d-view" >자세히 보기</a></div></td>
					<form method="post" action="">
						<td class="req_accept">
							<c:if test="${er.est_check=='대기중'}">
								<button type="button" class="accept" id="permit_btn" name="permit" value="${er.est_num}">수락</button>
								<button type="button" class="deny" id="reject_btn" name="reject" value="${er.est_num}">거절</button>
							</c:if>
							<c:if test="${er.est_check=='수락'}"><span style="color:blue;"><b>수락</b></span></c:if>
							<c:if test="${er.est_check=='거절'}"><span style="color:red;"><b>거절</b></span></c:if>
							<c:if test="${er.est_check=='계약요청'}"><span style="color:#000069;"><b>계약요청</b></span></c:if>
							<c:if test="${er.est_check=='작성완료'}"><span style="color:blue;"><b>작성완료</b></span></c:if>
							<c:if test="${er.est_check=='계약완료'}"><span style="color:blue;"><b>계약완료</b></span></c:if>
							<c:if test="${er.est_check=='잔금결제완료'}"><span style="color:black;"><b>잔금결제완료</b></span></c:if>
						</td>
					</form>
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
				<a href="/partners/construct_request?page=${page-1}"><img src="/images/dozip/left-arrow.png"></a>
			</c:if>

			<%--현재 쪽번호 출력--%>
			<c:forEach var="p" begin="${startpage}" end="${endpage}" step="1">
				<c:if test="${p== page}"> ${p}</c:if> <!--현재 페이지 선택 시-->
				<c:if test="${p != page}"> <a href="/partners/construct_request?page=${p}">[${p}]</a> <!--현재 페이지 선택되지 않았을 시 -->
				</c:if>
			</c:forEach>

			<c:if test="${page >= maxpage}">
				<img src="/images/dozip/right-arrow.png"><div style="width:95%;">
		<!--<select name="my_bid_option" style="border:1px solid lightgray; width: 80px;">
            <option value="all">전체</option>
            <option value="success">입찰 성공</option>
            <option value="fail">입찰 실패</option>
        </select> -->
	</div>
			</c:if>
			<c:if test="${page<maxpage}">
				<a href="/partners/construct_request?page=${page+1}"><img src="/images/dozip/right-arrow.png"></a>
			</c:if>
		</p>
	</div>
</div>

<script>
	document.getElementById('permit_btn').onclick = function (){
		var est_num = $('#permit_btn').val();
		var est_check = '수락';

		var result = confirm("정말 수락하시겠습니까?");   //확인

		if(result==true){
			alert("수락되었습니다");
		}else{
			return false;
		}

		$.ajax({
			url : '/partners/construct_request_select',
			type : 'post',
			data : {
				est_num : est_num,
				est_check : est_check
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
		var est_num = $('#reject_btn').val();
		var est_check = '거절';

		var result = confirm("정말 거절하시겠습니까?");   //확인

		if(result==true){
			alert("거절되었습니다");
		}else{
			return false;
		}
		// alert("고객의 시공요청을 거절하시겠습니까?");

		$.ajax({
			url : '/partners/construct_request_select',
			type : 'post',
			data : {
				est_num : est_num,
				est_check : est_check
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
