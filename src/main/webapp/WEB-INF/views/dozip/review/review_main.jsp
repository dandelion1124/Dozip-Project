<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page contentType="text/html; charset=UTF-8"%>
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
			<button type="button" onclick="location.href='/dozip/review_write'">후기 작성하기 >></button>
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
					<div id="review_go_box"><a href="/dozip/review_detail" id="review_go">해당 리뷰보러 가기 >> </a></div>
				</div>
			</div>
		</div>
	
		<!-- part2 반복문 -->
		<div class="review_list">
			<c:if test = "${!empty reviewList}">
				<c:forEach var="i" begin="0" end="${fn:length(reviewList)}" step="1">
			<div id="card">
				<div class="card_inner">
					<div>
						<img class = "ho" onclick = "location.href='review_detail?re_no=${reviewList[i].re_no}';" src= '${reviewList[i].re_photo1}'/>
							<%-- onclick으로 클릭시 글번호를 넣어 상세로 연결되게 --%>
					</div>
					<div class="card_title"><p>${reviewList[i].re_title}</p></div>
					<div class="card_cont">
						<p>${reviewList[i].re_cont}</p>
					</div>
					<p></p>
				</div>
			</div>
				</c:forEach>
			</c:if>
		</div>

		<c:if test="${empty reviewList}">
			<div id = "none_re">목록이 없습니다.</div>
		</c:if>

	<div class="part3">
		<button id="more" type="button">더 보기</button>
	</div>
	</div>
	
<%-- 하단 공통부분 --%>
<jsp:include page="../common/footer.jsp" />