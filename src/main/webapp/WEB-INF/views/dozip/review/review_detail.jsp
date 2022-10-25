<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="../common/header.jsp" />
<script src="/js/dozip/jquery.js"></script>
<%-- 상단 공통부분 끝 --%>
<div class="review_detail_wrap">

	<div class="review_detail">

		<div class="review_info">
			<p style="float: left; font-style: italic">No. ${re.re_no}</p>
			<p style="float: right">조회수 : ${re.re_count}</p>
		</div>
			<div class="rp_img">
				<img src="${re.re_photo1}">
			</div>
			<div class="review_title">
				<p class="re_title">제목 : ${re.re_title}</p><p class="star" style="float: right">${re.re_star} 점</p>
			</div>
		<hr/>
			<div class="review_info">
			<p>${re.mem_id}고객님 | ${re.re_date}</p><p hidden>수정일 : ${re.re_modate}</p>
			</div>

		<div class="review_img">
			<img src="${re.re_photo2}">
			<img src="${re.re_photo3}">
			<img src="${re.re_photo4}">
			<img src="${re.re_photo5}">
		</div>
		<div>
			<p class="re_cont">글 내용 : ${re.re_cont}</p>
		</div>
	</div>
</div>

<%-- 하단 공통부분 --%>
<jsp:include page="../common/footer.jsp" />