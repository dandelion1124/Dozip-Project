<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp" />
<style>
#monthly_option {
	width: 200px;
	border: 2px solid blue;
	background: #F6FBFF;
	margin: 30px 0px;
	padding-left: 20px;
}

#monthly_cost {
	height: 100px;
	display: flex;
	justify-content: space-between;
	margin-bottom: 40px;
	border: 1px solid blue;
}

#monthly_cost div {
	margin: 35px 20px;
}

#monthly_type>div {
	display: flex;
	justify-content: space-between;
}
#monthly_type>h2{
background: #B3B9BE;
padding:13px;
}

#monthly_cont ul, #part_cont ul{
padding:0px 40px;
list-style-type: square;

}

</style>

	<div id="monthly_cont">
		<h1>월정액 요금제</h1>
		<p>고객이 상담 접수 시 작성한 공사 예산을 기준으로 매월 종합 인테리어 고객을 소개해드리는 상품
		<div id="monthly_type">
			<h2>Type A</h2>
			<ul>
				<li>고객 예산 2,000만원 이상</li>
				<li>추천 대상 도배, 주방, 욕실 등 부분 공정 전문 파트너스</li>
				<li>시공 지역 수도권(서울, 경기, 인천)</li>
			</ul>
			<div>
				<div id="monthly_option">
					<p>주거+상업</p>
					<p>
						견적 의뢰 제공 &nbsp;&nbsp;&nbsp; <b>제한없음 </b>
					</p>

				</div>
				<div id="monthly_option">
					<p>주거+상업</p>
					<p>
						견적 의뢰 제공 &nbsp;&nbsp;&nbsp; <b>제한없음 </b>
					</p>

				</div>
				<div id="monthly_option">
					<p>주거+상업</p>
					<p>
						견적 의뢰 제공 &nbsp;&nbsp;&nbsp; <b>제한없음 </b>
					</p>

				</div>
			</div>
			<div id="monthly_cost">
				<div>부분시공 주거 + 상업</div>
				<div>
					정상가 550,000원 <input type="button" value="신청하기">
				</div>

			</div>
		</div>
		<div id="monthly_type">
			<h2>Type B</h2>
			<ul>
				<li>고객 예산 1,000만원~ 1,999만원 </li>
				<li>추천 대상 도배, 주방, 욕실 등 부분 공정 전문 파트너스</li>
				<li>시공 지역 수도권(서울, 경기, 인천)</li>
			</ul>
			<div>
				<div id="monthly_option">
					<p>주거+상업</p>
					<p>
						견적 의뢰 제공 &nbsp;&nbsp;&nbsp; <b>제한없음 </b>
					</p>

				</div>
				<div id="monthly_option">
					<p>주거+상업</p>
					<p>
						견적 의뢰 제공 &nbsp;&nbsp;&nbsp; <b>제한없음 </b>
					</p>

				</div>
				<div id="monthly_option">
					<p>주거+상업</p>
					<p>
						견적 의뢰 제공 &nbsp;&nbsp;&nbsp; <b>제한없음 </b>
					</p>

				</div>
			</div>
			<div id="monthly_cost">
				<div>부분시공 주거 + 상업</div>
				<div>
					정상가 550,000원 <input type="button" value="신청하기">
				</div>
			</div>

		</div>
		<div id="monthly_type">
			<h2>Type C</h2>
			<ul>
				<li>고객 예산 1,000만원 미만</li>
				<li>추천 대상 도배, 주방, 욕실 등 부분 공정 전문 파트너스</li>
				<li>시공 지역 수도권(서울, 경기, 인천)</li>
			</ul>
			<div>
				<div id="monthly_option">
					<p>주거+상업</p>
					<p>
						견적 의뢰 제공 &nbsp;&nbsp;&nbsp; <b>제한없음 </b>
					</p>

				</div>
				<div id="monthly_option">
					<p>주거+상업</p>
					<p>
						견적 의뢰 제공 &nbsp;&nbsp;&nbsp; <b>제한없음 </b>
					</p>

				</div>
				<div id="monthly_option">
					<p>주거+상업</p>
					<p>
						견적 의뢰 제공 &nbsp;&nbsp;&nbsp; <b>제한없음 </b>
					</p>

				</div>
			</div>
			<div id="monthly_cost">
				<div>부분시공 주거 + 상업</div>
				<div>
					정상가 550,000원 <input type="button" value="신청하기">
				</div>
			</div>
		</div>

	</div>

<jsp:include page="../include/footer.jsp" />

