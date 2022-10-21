<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../common/header.jsp" />
<%-- 상단 공통부분 끝 --%>

<div class="review_detail_wrap">
	<div class="review_detail">

		<div class="review_info">
			<div class="rp_img">
				<img src="/images/dozip/ex01.png">
			</div>
			<div class="review_title">
				<p>글 제목 : ${re.re_title}</p>
			</div>
			<p>글번호 : ${re.re_no}</p>
			<p>글쓴이 : ${re.mem_id}</p>
			<p>별점 : ${re.re_star}</p>
			<p>조회수 : ${re.re_count}</p>
			<p>작성일 : ${re.re_date}</p>
			<p hidden>수정일 : ${re.re_modate}</p>
		</div>
		<div class="review_img">
			<img src="/images/dozip/ex01.png">
			<img src="/images/dozip/ex01.png">
			<img src="/images/dozip/ex01.png">
			<img src="/images/dozip/ex01.png">
		</div>
		<div>
			<p>글 내용 : ${re.re_cont}</p>
		</div>
	</div>
</div>

<%-- 하단 공통부분 --%>
<jsp:include page="../common/footer.jsp" />