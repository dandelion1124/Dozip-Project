<%@ page contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp" />


			<div class="my_req_list">
					<h2 class="item_title">시공견적요청</h2>
			<table border="1" style="width: 90%; border: 2px solid #0064CD; border-collapse: collapse; text-align:center;
			margin:40px 5%; background-color:white;">
				<tr class="my_req_label">
					<th>견적요청 내용</th> <th>희망 예산</th> <th>희망 견적일</th> <th>희망 시공시작일</th> <th>희망 시공종료일</th> <th>세부정보</th> <th>수용여부</th>
				</tr>
				<tr class="my_req_cont">
					<td>목동 사무실 원상복구 견적 문의</td> <td>5,000,000원</td> <td>2022.07.10</td> <td>2022.07.13</td>  <td>2022.07.25</td> 
					<td><div class="req_detail"><a href="./construct_request_detail.jsp;" class="my_bid_btn-d-view" >자세히 보기</a></div></td>
					<td class="req_accept">
						<button class="accept" onclick="confirm('수용하시겠습니까?')">수용</button>
						<button class="deny" onclick="confirm('취소하시겠습니까?')">취소</button>
					</td>
				</tr>
				<tr class="my_req_cont">
					<td>목동 사무실 원상복구 견적 문의</td> <td>5,000,000원</td> <td>2022.07.10</td> <td>2022.07.13</td>  <td>2022.07.25</td> 
					<td><div class="req_detail"><a href="./construct_request_detail.jsp;" class="my_bid_btn-d-view" >자세히 보기</a></div></td>
					<td class="req_accept">
						<button class="accept" onclick="confirm('수용하시겠습니까?')">수용</button>
						<button class="deny" onclick="confirm('취소하시겠습니까?')">취소</button>
					</td>
				</tr>
			</table>
			</div>
		
<jsp:include page="../include/footer.jsp" />
