<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:include page="../common/header.jsp" />
<%-- 상단 공통부분 끝 --%>

<%--	<div class="review_wrap">--%>


		<!-- part1  -->
		<div class="part1">

			<span id="part1_title">BEST 후기</span>
			<span id="part1_count">총 ${count}개의 고객후기</span>

			<div class="big_review">
				<img id="big_img" src= '/images/dozip/ex01.png' />
				<div class="big_review_cont">
					<p id="review_title">글제목</p>
					<p id="review_cont">집닥을 통해 여러군데 견적을 받았어요. 그 중에 여기가 견적서도 빨리 보내주고 제가 원하는 가격에 최대한 맞춰서 인테리어를 도와주셨어요! 요즘 인테리어 사기가 많아서 고민하고 걱정했는데 확실하게 일 처리 해주시고 전기부터 소방까지 꼼꼼하게 챙겨주셨어요. 벽지나 타일을 고르는데 고민이 많은데 추천도 잘 해주시고 지금도 대 만족 하고 있습니다</p>
					<p id="review_tag"><button>주거유형</button><button>스타일</button><button>평수</button></p>
					<p id="review_info">글쓴이 고객님 | 2022.04.23</p>
					<div id="review_go_box"><a onclick="location.href='/dozip/review_detail?re_no=12'"  id="review_go" style="cursor: pointer">해당 리뷰보러 가기 >> </a></div>
				</div>
			</div>

		</div>

<%-- 본문 --%>
<div class="review_write">
	<button type="button" onclick="location.href='/dozip/review_write'">후기 작성하기 >></button>
</div>

<!-- part2 반복문 -->

				<div class="card_inner">
					<c:if test = "${!empty reviewList}">
						<c:forEach var="i" begin="0" end="${fn:length(reviewList)-1}" step="1">
							<div class="gallery">
							<a class="images" onclick = "location.href='review_detail?re_no=${reviewList[i].re_no}';" alt="image"><img src="${reviewList[i].re_photo1}"></a>
							<%--<img class = "ho" onclick = "location.href='review_detail?re_no=${reviewList[i].re_no}';" src= '${reviewList[i].re_photo1}'/>
								<%-- onclick으로 클릭시 글번호를 넣어 상세로 연결되게 --%>
								<div class="card_title"><p>${reviewList[i].re_title}</p></div>
								<div class="card_cont"><p>${reviewList[i].re_cont}</p></div>
							</div>
						</c:forEach>
					</c:if>
					<c:if test="${empty reviewList}">
						<div id = "none_re">목록이 없습니다.</div>
					</c:if>
				</div>
		</div>
<%--	</div>--%>
	
<%-- 하단 공통부분 --%>
<jsp:include page="../common/footer.jsp" />