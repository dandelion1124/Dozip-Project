<%@ page contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp" />


<div class="my_req_list">
	<h2 class="item_title">시공견적요청</h2>
	<table style="width: 90%; border-collapse: collapse; text-align:center;
				margin:0 5% 40px 5%; background-color:white;">
		<tr class="my_req_label" style="border-bottom:1px solid lightgray; border-top:1px solid lightgray/*#0064CD*/; height:50px; font-size:16px;">
			<th>견적요청 내용</th> <th>희망 예산</th> <th>희망 시공시작일</th> <th>희망 시공종료일</th> <th>세부정보</th> <th>수용여부</th>
		</tr>
		<tr class="my_req_cont" style="background-color:#EBFBFF; /*#FDF5E6*/ font-size:14px;">
			<td>목동 사무실 원상복구 견적 문의</td> <td>5,000,000원</td> <td>2022.07.13</td> <td>2022.07.25</td>
			<td><div class="req_detail"><a href="/partners/request_detail" class="my_bid_btn-d-view" >자세히 보기</a></div></td>
			<td class="req_accept">
				<button class="accept" onclick="confirm('수용하시겠습니까?')">수용</button>
				<button class="deny" onclick="confirm('취소하시겠습니까?')">취소</button>
			</td>
		</tr>
		<tr class="my_req_cont" style="background-color:#EBFBFF; /*#FDF5E6*/ font-size:14px;">
			<td>목동 사무실 원상복구 견적 문의</td> <td>5,000,000원</td> <td>2022.07.13</td>  <td>2022.07.25</td>
			<td><div class="req_detail"><a href="/partners/request_detail" class="my_bid_btn-d-view" >자세히 보기</a></div></td>
			<td class="req_accept">
				<button class="accept" onclick="confirm('수용하시겠습니까?')">수용</button>
				<button class="deny" onclick="confirm('취소하시겠습니까?')">취소</button>
			</td>
		</tr>
	</table>
</div>

<jsp:include page="../include/footer.jsp" />
