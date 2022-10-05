<%@ page contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp" />
<style>
.cont_img {
	float: left;
}
</style>
<div>
	<h2>파트너스 요금제 가입하기</h2>
	<p>요금제 상품에 가입하시면 보장된 인테리어 의뢰 고객을 만날 수 있습니다</p>

	<div>
		<p>사장님 매출 향상! 두집이 도와드립니다.</p>
		<p>업체 평균 400% 이상 수익률을 기록하고 있습니다.</p>
	</div>

	<section>
		<h3>월정액 요금제</h3>
		<img src="../images/plan1.png" alt="월정액" class="cont_img">
		<p>고객이 상담 접수 시 작성한 공사 예산을 기준으로 매월 종합 인테리어 고객을 소개해드리는 상품입니다.</p>
		<input type="button" value="자세히보기" onclick="location='monthly.jsp'">
	</section>
	<div class=clear></div>
	<section>
		<h3>부분 시공 요금제</h3>
		<img src="../images/plan2.png" alt="부분시공" class="cont_img">
		<p>고객 예산 1천만원 미만의 예산으로 부분 시공 및 소규모 종합 시공 견적 의뢰를 받을 수 있는 상품입니다.</p>
		<input type="button" value="자세히보기" onclick="location='part.jsp'">
	</section>
</div>




<jsp:include page="../include/footer.jsp" />

