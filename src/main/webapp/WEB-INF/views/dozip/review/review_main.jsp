<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../common/header.jsp" />
<%-- 상단 공통부분 끝 --%>

	<div class="review_wrap">
	<br/>
	<!-- 드롭다운 버튼 -->
		<div class = "dropdown">
			<select name="d1" class="dd_group" style="margin-left:30px;">
				<option selected>주거유형</option>
				<option value="아파트">아파트</option>
				<option value="빌라">빌라</option>
				<option value="주택">주택</option>
				<option value="오피스텔">오피스텔</option>
			</select>
			<select name="d2" class="dd_group">
				<option selected>상업유형</option>
				<option value="카페/식당">카페/식당</option>
				<option value="상가/매장">상가/매장</option>
				<option value="학원/교육">학원/교육</option>
				<option value="사무실">사무실</option>
				<option value="숙박/병원">숙박/병원</option>
				<option value = "간판">간판</option>
				<option value = "기타">기타</option>
			</select>
			<select name="d3" class="dd_group">
				<option selected>스타일</option>
				<option value="모던">모던</option>
				<option value="심플/미니멀">심플/미니멀</option>
				<option value="내추럴">내추럴</option>
				<option value="빈티지">빈티지</option>
				<option value="럭셔리">럭셔리</option>
			</select>
			<select name="d4" class="dd_group">
				<option selected>비용</option>
				<option value="1000만원 이하">1000만원 이하</option>
				<option value="1000만원대">1000만원대</option>
				<option value="2000만원대">2000만원대</option>
				<option value="3000만원대">3000만원대</option>
				<option value="4000만원대">4000만원대</option>
				<option value="5000만원대">5000만원대</option>
				<option value="6000만원 이상">6000만원 이상</option>
			</select>
			<select name="d5" class="dd_group">
				<option selected>평수</option>
				<option value="10평대">10평대</option>
				<option value="20평대">20평대</option>
				<option value="30평대">30평대</option>
				<option value="50평대">50평대</option>
				<option value="60평대 이상">60평대 이상</option>
			</select>
		</div>
		
		<%-- 본문 --%>
		<div class="review_write">
			<button type="button" onclick="location.href='review_write.do'">후기 작성하기 >></button>
		</div>
		
		<!-- part1  -->
		<div class="part1">
			<span id="part1_title">BEST 후기</span>
			<span id="part1_count">총 122개의 고객후기</span>
			<div class="big_review">
				<img id="big_img" src="/DoZip/images/ex01.png" />
				<div class="big_review_cont">
					<p id="review_title">글제목</p>
					<p id="review_cont">집닥을 통해 여러군데 견적을 받았어요. 그 중에 여기가 견적서도 빨리 보내주고 제가 원하는 가격에 최대한 맞춰서 인테리어를 도와주셨어요! 요즘 인테리어 사기가 많아서 고민하고 걱정했는데 확실하게 일 처리 해주시고 전기부터 소방까지 꼼꼼하게 챙겨주셨어요. 벽지나 타일을 고르는데 고민이 많은데 추천도 잘 해주시고 지금도 대 만족 하고 있습니다</p>
					<p id="review_tag"><button>주거유형</button><button>스타일</button><button>평수</button></p>
					<p id="review_info">글쓴이 고객님 | 2022.04.23</p>
					<div id="revie_go_box"><a href="review_detail.do" id="revie_go">해당 리뷰보러 가기 >> </a></div>
				</div>
			</div>
		</div>
	
		<!-- part2 -->
		<div class="part2">
		<div id="part5_area">
			<div class="part5_inner">
				<div><a class="part5_img" href="review_detail.do">
					<img src="/DoZip/images/review1.jpg"/>
				</a></div>
				<div class="part5_title"><p>깔끔한 주방 인테리어</p></div>
				<div class="part5_cont">
					<p>싱크대 상판을 세라믹으로 하고 화장대의 상판과 수납장 하나의 상판도 세라믹으로 해서 효율적으로 세라믹을 사용할 수 있어서 만족합니다. 인조대리석보다 비싸지만 아주 만족합니다.</p>
				</div>
				<p></p>					
			</div>
			<div class="part5_inner">
				<div><a class="part5_img" href="review_detail.do">
					<img src="/DoZip/images/review2.jpg"/>
				</a></div>
				<div class="part5_title"><p>아늑하고 분위기 있는 침실</p></div>
				<div class="part5_cont">
					<p>편안하고 분위기 있는 침실을 원했어요. 업체와 여러번의 이야기를 통해 제가 원하는 느낌을 찾을 수 잇었어요. 소통이 원활해서 큰 스트레스를 받지 않고 공사를 진행할 수 있었습니다. 군더더기 없이 침실공간을 만들고 싶었는데 제가 원하던대로 잘 나온거 같아요.</p>
				</div>
				<p></p>					
			</div>
			<div class="part5_inner">
				<div><a class="part5_img" href="review_detail.do">
					<img src="/DoZip/images/review3.jpg"/>
				</a></div>
				<div class="part5_title"><p>작업을 위한 작업실 공사</p></div>
				<div class="part5_cont">
					<p>프리랜서로 일하고 있는데, 이번에 두집을 통해 작업실 공사를 맡겨봤어요. 어떻게 해야할지 몰랐는데 전문가분들이 여러가지 시안을 보여주시면서 선택할 수 있도록 도와주셔서 더 좋은 결과물이 나온거 같아요. 만족합니다.</p>
				</div>
				<p></p>					
			</div>
		</div>
	</div>	
	
	<div class="part3">
		<button id="more" type="button">더 보기</button>
	</div>
		
	</div>
	
<%-- 하단 공통부분 --%>
<jsp:include page="../common/footer.jsp" />