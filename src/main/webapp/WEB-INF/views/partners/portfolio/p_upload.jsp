<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp" />

<style>
	input#sample6_postcode {
		margin-bottom: 12px;
	}
	#portfolio_form input, #portfolio_form select {
		border:none;
		border-radius: 3px;
		padding: 0 3px;
	}
	fieldset#first_area input[type=button], fieldset#first_area input[type=text], fieldset#first_area select {
		height: 30px;
	}
	fieldset#first_area select:hover, fieldset#first_area input[type=text]:hover{
		background: #e2e6e8;
	  }

	#portfolio_form textarea{
		border:none;
		border-radius: 4px;
	}
	#portfolio_form fieldset{
		background: rgba(251, 219, 189, 0.12);
	}
	.textCount, .textTotal {
		font-size: 13px;
	}
	#process_message img{
		width: 40px;
		margin: 0px 20px;
		padding-top: 20px;
	}
	div#process_message {
		display: flex;
		align-items: center;
		font-size: 20px;
		height: 10px;
	}
	#f_button input:hover,.port_btn:hover,#port_load_btn:hover{
		background:#9A9A9A;
		cursor: pointer;
	}
	#f_button input{
		float: right;
		margin: 0px 10px;
		padding: 0px 14px;
	}
	input#port_load_btn {
		border: none;
		background: rgba(169, 169, 167, 0.62);
		border-radius: 3px;
		padding: 7px 10px;
	}
</style>
<p style="margin-bottom: 10px"> | 시공사례 > 등록</p>

<div id="introduce_cont">
	<h2>시공사례등록</h2>
	<p>
		직접 시공한 인테리어의 포트폴리오를 등록할 수 있습니다.<br> 등록된 포트폴리오는 메인홈페이지에서 확인 할 수
		있습니다.
	</p>
	<div id="process_message">
		<div>정보입력</div>
		<div><img src="/images/partners/right-arrow.png"></div>
		<div>사진등록 </div>
		<div><img src="/images/partners/right-arrow.png"> </div><div>완료</div>
	</div>
	<div>
		<span><b>두집</b>에서 계약한 인테리어를 조회하면 쉽게 주요정보를 입력 할 수 있습니다.</span>
		<input type="button" value="불러오기" id='port_load_btn' onclick="loadPortfolioInfo()">
	</div>


	<script>
		function loadPortfolioInfo(){
			window.open( "./load_info", "Child", "width=930, height=300, top=500, left=500")
		}
	</script>
</div>
<form action="upload_photo" id="portfolio_form" method="post" onsubmit="return portfoilio_check()">
	<input type="hidden" id="businessNum"  value="${businessNum}">
	<%-- 제목, 공사 유형, 시공범위, 주소 ,평수, 공사비용, 공사기간--%>
	<fieldset id="first_area">
		<legend>기본정보</legend>
		<div>
			<div class="form_sub_title">
				<label>제목</label>
			</div>
			<div class="a">
				<input type="text" name="pf_title" size="30" id="pf_title"placeholder="이보다 더 완벽할 수는 없다"> <span class="textCount">0자</span><span class="textTotal">/50자</span>
			</div>
		</div>
		<div class="inline_div">
			<div class="form_sub_title">
				<label>공사 유형</label>
			</div>
			<!-- 공사유형 -->
			<select id="sel_type" name="pf_type">
				<option value="none" selected>선택</option>
				<option value="주거공간">주거공간</option>
				<option value="상업공간">상업공간</option>
			</select>
            <select id="sel_house" name="pf_subtype" disabled>
				<option value="none" selected>선택</option>
				<option value="아파트">아파트</option>
				<option value="빌라">빌라</option>
				<option value="주택">주택</option>
				<option value="오피스텔">오피스텔&nbsp;</option>
			</select>
            <select id="sel_business" name="pf_subtype"  style="display: none;">
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
			<div class="form_sub_title">
				<label>시공 범위</label>
			</div>
			<!-- 시공범위 -->
			<input type="radio" name="pf_range" value="전체 리모델링">전체 리모델링
            <input type="radio" name="pf_range" value="부분 리모델링">부분 리모델링
		</div>
		<div class="clear"></div>
		<div class="form_sub_title">
			<div class="form_sub_title">
				<label>주소</label>
			</div>
			<input type="text" id="sample6_postcode" readonly placeholder="우편번호" size="5" name="pf_zipcode">
            <input type="text" id="sample6_address"  name ="pf_addr1" readonly	placeholder="주소" size="30">
            <input type="text" id="sample6_detailAddress" name ="pf_addr2" placeholder="상세주소">
            <input type="text" id="sample6_extraAddress" name ="pf_addr3" readonly placeholder="참고항목" size=10>
            <input type="button" value="주소검색" id='searchAddr'  class='port_btn' onclick="sample6_execDaumPostcode()">
		</div>
		<div class="inline_div">
			<div class="form_sub_title">
				<label>평수</label>
			</div>
			<input type="text" name="pf_area" id="pf_area" size="10"> 평

		</div>
		<div class="inline_div">
			<div class="form_sub_title">
				<label>공사비용</label>
			</div>
			<input type="text" name="pf_cost" id="pf_cost" size="10"> 만원
		</div>
		<div class="inline_div">
			<div class="form_sub_title">
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
		<div class="form_sub_title">
		</div>
		<input type="radio" value="모던" name="pf_concept">모던
        <input type="radio"	value="미니멀" name="pf_concept">미니멀
        <input type="radio" value="내추럴" name="pf_concept">내추럴
		<input type="radio" value="빈티지" name="pf_concept">빈티지
        <input type="radio"	value="심플" name="pf_concept">심플
        <input type="radio" value="럭셔리" name="pf_concept">럭셔리
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
		<input type="submit" value="사진등록"> <input type="reset" value="초기화">
	</fieldset>
</form>
<script>
	$('#pf_title').keyup(function (e) {
		let content = $(this).val();
		// 글자수 세기
		if (content.length == 0 || content == '') {
			$('.textCount').text('0자');
		} else {
			$('.textCount').text(content.length + '자');
		}
	});
</script>
<jsp:include page="../include/footer.jsp" />
