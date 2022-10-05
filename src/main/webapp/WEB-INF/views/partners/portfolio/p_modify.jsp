<%@ page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp" />
    <div id="introduce_cont">
      <h2>시공사례 수정페이지</h2>
      <p>이미 등록한 시공사례들의 내용들을 수정 할 수 있습니다<br>
        수정된 포트폴리오는 메인홈페이지에서 확인 할 수 있습니다.</p>
      <div><span><b>두집</b>에서 계약한 인테리어를 조회하면 쉽게 주요정보를 입력 할 수 있습니다.</span>
      <input type="file" name="fileipload" value="내 계약 불러오기"></div>
    </div>
      <form id="portfolio_form">
        <!-- 제목, 공사 유형, 시공범위, 주소 ,평수, 공사비용, 공사기간-->
        <fieldset id="first_area">
          <legend>기본정보</legend>
            <div>
              <div id="form_sub_title"><label>제목</label></div>
              <div class="a">
                <input type="text" name="title" size='30' id='aaa' placeholder="이보다 더 완벽할 수는 없다"> <span>0/50</span> <!-- 제목 -->
              </div>
            </div>
            <div class="inline_div"><div id="form_sub_title"><label>공사 유형</label></div><!-- 공사유형 -->
              <select name="type" id="sel_type"> 
              	<option value="none" selected>선택</option>
                <option value="house" >주거공간 </option>
                <option value="business" >상업공간</option>
              </select>   
              <select id="sel_house" disabled>
                <option value="none" selected >선택</option>
                <option value="12">아파트 </option>
                <option value="23">빌라</option>
                <option value="23">주택</option>
                <option value="23">오피스텔&nbsp;</option>
              </select>        
              <select id="sel_business" style="display:none;">
                <option value="none" selected>선택</option>
                <option value="12">사무실 </option>
                <option value="23">상가/매장</option>
                <option value="23">카페/식당</option>
                <option value="23">학원/교육</option>
                <option value="23">숙박/병원</option>
                <option value="23">간판</option>
                <option value="23">기타</option>
              </select> 
            </div>
                       
            <div class="inline_div"><div id="form_sub_title"><label>시공 범위</label></div> <!-- 시공범위 -->
              <input type="radio" name="range" value="whole">전체 리모델링
              <input type="radio" name="range" value="part">부분 리모델링
            </div>
           
            <div class="clear"></div>

            <div id="form_sub_title"><div id="form_sub_title"><label>주소</label></div>
              <input type="text" id="sample6_postcode" readonly placeholder="우편번호" size="4">         
              <input type="text" id="sample6_address" readonly placeholder="주소" size="30"> 
              <input type="text" id="sample6_detailAddress" placeholder="상세주소">
              <input type="text" id="sample6_extraAddress" readonly placeholder="참고항목" size=10>
              <input type="button" value="주소검색" onclick="sample6_execDaumPostcode()">

            </div>
            <div class="inline_div"><div id="form_sub_title"><label>평수</label></div>
              <input type="text" id="size" size="10"> 평
            </div>
            <div class="inline_div"><div id="form_sub_title"><label>공사비용</label></div>
              <input type="text" id="cost" size="10"> 만원
            </div>
            <div class="inline_div"><div id="form_sub_title"><label>공사기간</label></div>
              <select name="period" id="period">
                <option value="1">1 </option>
                <option value="2">2 </option>
                <option value="3">3 </option>
                <option value="4">4 </option>
                <option value="5">5 </option>
                <option value="6">6 </option>
                <option value="7">7 </option>
                <option value="8">8 </option>
                <option value="9">9 </option>
              </select>주
            </div>
            
          
        </fieldset>
        <!-- 여기까지 첫번째 입력 영역-->
        <fieldset>
          <legend>디자인(시공컨셉)</legend>
          <div id="form_sub_title"></div>
          <input type="radio" value="modern">모던
          <input type="radio" value="minimal">미니멀
          <input type="radio" value="natural">내추럴
          <input type="radio" value="vintage">빈티지
          <input type="radio" value="simple">심플
          <input type="radio" value="luxury">럭셔리

        </fieldset>
        <fieldset>
          <legend>인사말</legend>
          <textarea rows=10% cols=100% style="width:100%;resize : none;">(EX. 따듯함이 느껴지는 원목과 화이트 컬러의 내추럴 스타일, 33평 아파트 인테리어 입니다.)</textarea>
        </fieldset>
        <fieldset>
          <legend>맺음말</legend>
          <textarea rows="7" cols=100% style="width:100%;resize : none;">지금까지 서울 강남구 논현동 33평 아파트 인테리어 였습니다.</textarea>
        </fieldset>
        
        <fieldset>
        	<legend>등록사진</legend>
        	<input type="file"> <img src="./photo/port001.png" style="width:200px; height:200px">
        </fieldset>
        <fieldset id="f_button">
        <input type="submit" value="수정"> <input type="reset" value="취소">
        </fieldset>
      </form>


<jsp:include page="../include/footer.jsp" />
    <%--공사유형선택 
<script>
$(document).ready(function() {

$('#sel_type').change(function() {
	if (($('#sel_type').val()) == 'house') {
		$('#sel_house').removeAttr("disabled");
		$('#sel_house').show();
		$('#sel_business').hide();
	}
	if (($('#sel_type').val()) == 'business') {
		$('#sel_business').removeAttr("disabled");
		$('#sel_business').show();
		$('#sel_house').hide();
	}
	if (($('#sel_type').val()) == 'none') {
		$('#sel_house, #sel_business').prop('disabled', 'disabled');
		$("#sel_house, #sel_business").val("none");
	}
});
});
</script>
--%>