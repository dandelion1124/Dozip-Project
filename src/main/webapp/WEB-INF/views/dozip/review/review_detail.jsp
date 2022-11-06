<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<hr/>
			<div class="rp_img">
				<img src="${re.re_photo1}">
			</div>
			<div class="review_title">
				<p class="re_title">${re.re_title}</p><p class="star" style="float: right">${re.re_star} 점</p>
			</div>
		<hr/>
			<div class="review_info">
			<p>${re.mem_id}고객님 | ${re.re_date.substring(0,10)}</p><p hidden>수정일 : ${re.re_modate}</p>
			</div>

		<div class="review_img">
			<c:if test="${!empty re.re_photo2}">
				<img src="${re.re_photo2}">
			</c:if>
			<c:if test="${!empty re.re_photo3}">
				<img src="${re.re_photo3}">
			</c:if>
			<c:if test="${!empty re.re_photo4}">
				<img src="${re.re_photo4}">
			</c:if>
			<c:if test="${!empty re.re_photo5}">
				<img src="${re.re_photo5}">
			</c:if>
<%--				<img src="${re.re_photo3}">--%>
<%--				<img src="${re.re_photo4}">--%>
<%--				<img src="${re.re_photo5}">--%>

		</div>

		<div>
			<textarea class="re_cont" readonly>${re.re_cont}</textarea>
		</div>
	</div>
</div>

<%-- 하단 공통부분 --%>
<jsp:include page="../common/footer.jsp" />