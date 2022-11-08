<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page contentType="text/html; charset=UTF-8"%>

<jsp:include page="../common/header.jsp" />
<link rel="stylesheet" type="text/css" href="/css/dozip/review.css" />

<%-- 상단 공통부분 끝 --%>

	<div class="review_wrap">


		<!-- part1  -->
		<div class="part1">

			<span id="part1_title">BEST 후기</span>
			<span id="part1_count">총 ${count}개의 고객후기</span>

        <c:if test="${!empty best}">
			<div class="big_review">
				<img class="big_img" src= ${best.re_photo1} />
				<div class="big_review_cont">
					<p class="review_title">${best.re_title}</p> <br>
					<p class="review_cont">${best.re_cont}</p>

					<p id="review_tag">
						<button>${best.cont_area}평</button>
						<button>${best.cont_title}</button>
						<button>${best.partners_name}</button>
					</p>
					<p id="review_info">${best.mem_id} 고객님 | ${best.re_date.substring(0,10)}</p>
					<div id="review_go_box">
						<button type="button" onclick="location.href='/dozip/review_detail?re_no=${best.re_no}'" id="review_go" style="cursor: pointer">리뷰보러 가기</button>
					</div>
				</div>
			</div>
        </c:if>
            <c:if test="${empty best}">
                <div class="big_review">
                    <img class="big_img" src="/images/dozip/nothing.jpg"/>
                    <div class="big_review_cont">
                        <p class="re_nothing">목록이 없습니다.</p>
                    </div>
                </div>
            </c:if>
		</div>

<%-- 본문 --%>
<div class="review_write">
	<button type="button" onclick="location.href='/dozip/review_write'">후기 작성하기</button>
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
								<div class="card_cont">${reviewList[i].re_cont}</div>
							</div>
						</c:forEach>
					</c:if>
					<c:if test="${empty reviewList}">
						<p class="re_nothing">목록이 없습니다.</p>
					</c:if>
				</div>
		</div>
<%--	</div>--%>
	
<%-- 하단 공통부분 --%>
<jsp:include page="../common/footer.jsp" />