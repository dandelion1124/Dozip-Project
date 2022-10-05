<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp" />
<div id="introduce_cont">
	<h2>시공사례등록</h2>
	<p>
		직접 시공한 인테리어의 포트폴리오를 등록할 수 있습니다.<br> 등록된 포트폴리오는 메인홈페이지에서 확인 할 수
		있습니다.
	</p>
	<div>
		<h4>1. 정보입력 ---> 2. 사진등록 ---> 3. 완료</h4>
	</div>
	<div>
		<span><b>두집</b>에서 계약한 인테리어를 조회하면 쉽게 주요정보를 입력 할 수 있습니다.</span> 
		<input type="button" value="불러오기" onclick="loadPortfolioInfo()">
	</div>
	
	<%--계약 불러오기 개발중 --%>
	
	<script>
		function loadPortfolioInfo(){
			$business_num='${business_num}'
			$.ajax({
				type:"post",
				url:'loadportfolio_info.do',
				data:{
					business_num:$business_num
				},
				datatype:"text",
				success: function(result){
					window.open( "./portfolio/load_info.jsp", "Child", "width=800, height=300, top=500, left=500");
				}
			});
		}
	</script>
</div>
<form action="upload_photo.do" id="portfolio_form" method="post" onsubmit="return portfoilio_check()">
	<%-- 제목, 공사 유형, 시공범위, 주소 ,평수, 공사비용, 공사기간--%>
	<fieldset id="first_area">
		<legend>기본정보</legend>
		<div>
			<div id="form_sub_title">
				<label>제목</label>
			</div>
			<div class="a">
				<input type="text" name="pf_title" size="30" id="pf_title"
					placeholder="이보다 더 완벽할 수는 없다"> <span>0/50</span>
				<!-- 제목 -->
			</div>
		</div>
		<div class="inline_div">
			<div id="form_sub_title">
				<label>공사 유형</label>
			</div>
			<!-- 공사유형 -->
			<select id="sel_type" name="pf_type" id="pf_type">
				<option value="none" selected>선택</option>
				<option value="주거공간">주거공간</option>
				<option value="상업공간">상업공간</option>
			</select> <select id="sel_house" name="pf_subtype" id="pf_subtype" disabled>
				<option value="none" selected>선택</option>
				<option value="아파트">아파트</option>
				<option value="빌라">빌라</option>
				<option value="주택">주택</option>
				<option value="오피스텔">오피스텔&nbsp;</option>
			</select> <select id="sel_business" name="pf_subtype" id="pf_subtype" style="display: none;">
				<option value="none" selected>선택</option>
				<option value="사무실">사무실</option>
				<option value="상가/매장">상가/매장</option>
				<option value="카페/식당">카페/식당</option>
				<option value="학원/교육">학원/교육</option>
				<option value="숙박/병원">숙박/병원</option>
				<option value="간판">간판</option>
				<option value="기타">기타</option>
			</select>
		</div>
	
		<div class="inline_div">
			<div id="form_sub_title">
				<label>시공 범위</label>
			</div>
			<!-- 시공범위 -->
			<input type="radio" name="pf_range" value="전체 리모델링">전체 리모델링 <input
				type="radio" name="pf_range" value="부분 리모델링">부분 리모델링
		</div>
		<div class="clear"></div>
		<div id="form_sub_title">
			<div id="form_sub_title">
				<label>주소</label>
			</div>
			<input type="text" id="sample6_postcode" readonly placeholder="우편번호"
				size="4" name="pf_zipcode"> <input type="text" id="sample6_address"  name ="pf_addr1" readonly
				placeholder="주소" size="30"> <input type="text"
				id="sample6_detailAddress" name ="pf_addr2" placeholder="상세주소"> <input
				type="text" id="sample6_extraAddress" name ="pf_addr3" readonly placeholder="참고항목"
				size=10> <input type="button" value="주소검색"
				onclick="sample6_execDaumPostcode()">
		</div>
		<div class="inline_div">
			<div id="form_sub_title">
				<label>평수</label>
			</div>
			<input name="pf_area" id="pf_area" size="10" id="parentValue1"> 평
		</div>
		<div class="inline_div">
			<div id="form_sub_title">
				<label>공사비용</label>
			</div>
			<input type="text" name="pf_cost" id="pf_cost" size="10"> 만원
		</div>
		<div class="inline_div">
			<div id="form_sub_title">
				<label>공사기간</label>
			</div>
			<select name="pf_period" id="pf_period">
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
				<option value="6">6</option>
				<option value="7">7</option>
				<option value="8">8</option>
				<option value="9">9</option>
			</select>주
		</div>
	</fieldset>
	<!-- 여기까지 첫번째 입력 영역-->
	<fieldset>
		<legend>디자인(시공컨셉)</legend>
		<div id="form_sub_title">
		</div>
		<input type="radio" value="모던" name="pf_concept">모던 <input type="radio"
			value="미니멀" name="pf_concept">미니멀 <input type="radio" value="내추럴" name="pf_concept">내추럴
		<input type="radio" value="빈티지" name="pf_concept">빈티지 <input type="radio"
			value="심플" name="pf_concept">심플 <input type="radio" value="럭셔리" name="pf_concept">럭셔리
	</fieldset>
	<fieldset>
		<legend>소개글</legend>
		<textarea rows=10% cols=100% name="pf_introduction" id="pf_introduction" style="width: 100%; resize: none;">(EX. 따듯함이 느껴지는 원목과 화이트 컬러의 내추럴 스타일, 33평 아파트 인테리어 입니다.)</textarea>
	</fieldset>
	<fieldset>
		<legend>맺음말</legend>
		<textarea rows="7" cols=100% name="pf_closing" id="pf_closing" style="width: 100%; resize: none;">(EX. 지금까지 서울 강남구 논현동 33평 아파트 인테리어 였습니다.)</textarea>
	</fieldset>
	<fieldset id="f_button">
		<input type="submit" value="사진등록"> <input type="reset"
			value="초기화">
	</fieldset>
</form>
<jsp:include page="../include/footer.jsp" />