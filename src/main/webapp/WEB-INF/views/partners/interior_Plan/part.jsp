<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp" />
<style>
#part_option{
width:200px;
border: 2px solid blue;
background: #F6FBFF;
margin: 30px 0px;
padding-left: 20px;
}
#part_cost{
height:100px;
display:flex;
justify-content:space-between;
margin: 30px 0px;
border: 1px solid blue;

}
#part_cost div{
margin: 35px 20px;

}
#part_cont ul{
padding:0px 40px;
list-style-type: square;

}
</style>

			<div id="part_cont">
					<h1>부분시공요금제</h1>
					<p>고객 예산 1천만원 미만의 예산으로 부분 시공 및 소규모 종합 시공 견적 의뢰를 받을 수 있는 상품입니다.
					
					
					<h2>부분시공</h2>
					<ul>
						<li>고객 예산 1,000만원 미만</li>
						<li>추천 대상 도배, 주방, 욕실 등 부분 공정 전문 파트너스</li>
						<li>시공 지역 수도권(서울, 경기, 인천)</li>
					</ul>
					<div id="part_option">
						<p>주거+상업</p>
						<p>견적 의뢰 제공 &nbsp;&nbsp;&nbsp; <b>제한없음 </b></p>
					
					</div>
					<div id="part_cost">
						<div>부분시공 주거 + 상업</div> <div>정상가 550,000원 <input type="button" value="신청하기"></div>
					</div>
			</div>

<jsp:include page="../include/footer.jsp" />

