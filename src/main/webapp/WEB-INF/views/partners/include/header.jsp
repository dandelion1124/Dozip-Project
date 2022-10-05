<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파트너스 메인</title>
<link rel="stylesheet" href="/Partners/css/main_style.css">
<link rel='stylesheet' href="/Partners/css/calendar.css"/> 
<link rel="stylesheet" href="/Partners/css/partners_style.css">
<link rel="stylesheet" href="/Partners/css/partners_style2.css">
<script src="/Partners/js/jquery.js"></script>
<script src="/Partners/js/javascript.js"></script>
<script src="/Partners/js/javascript2.js"></script>
<script src='/Partners/js/calendar.js'></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
	
<%--
로딩중 아이콘 추가

 --%>
<style>
#loading {
	width: 100%;
	height: 100%;
	top: 0px;
	left: 0px; 
	display: block;
	background-color: gray;
	z-index: 20;
	text-align: center;

}
#loading-image {
	width:200px;
 	position: absolute;
	top: 40%;
	left: 50%;
}
</style>	
	
</head>
<script>
	$(window).ready(function() {
		$('#loading').hide(1000);
	});
</script>
<% 
if(session.getAttribute("id")==null){
	out.println("<script>");
	out.println("alert('시간이 만료되어 로그아웃되었습니다!')");
	out.println("location='/Partners/index.do'");
	out.println("</script>");
 }
%>
<body>
<!-- 로딩 아이콘 -->
<div align="center" id="loading"><img id="loading-image" src="/Partners/images/dozip_logo.png"></div>
<!-- 좌측 사이드바 영역 -->
<div id="wrap">
	<div id="side_wrap">
			<ul id="side_menu">
				<li><a href="#" style="height:75px;"></a></li>
				<li><a href="/Partners/index.jsp">PARTNERS</a></li>
				<li><a href="#">요&nbsp;&nbsp;금&nbsp;&nbsp;제</a>
					<ul>
						<li><a href="/Partners/interior_Plan/plan.jsp">요금제안내</a></li>
					</ul>
				</li>
				<li><a href="#">견적&nbsp;의뢰</a>
					<ul>
						<li><a href="/Partners/bid.do">입찰의뢰</a></li>
						<li><a href="/Partners/estimate_request/construct_request.jsp">시공요청</a></li>
					</ul></li>
				<li><a href="#">견적&nbsp;관리</a>
					<ul>
						<li><a href="/Partners/estimate/estimate_list.jsp">견적목록</a></li>
					</ul></li>
				<li><a href="#">내&nbsp;&nbsp;공&nbsp;&nbsp;사</a>
					<ul>
						<li><a href="/Partners/myinterior/interior_List.jsp">내 공사내역</a></li>
						<li><a href="/Partners/myinterior/schedule_List.jsp">일정 및 정산관리</a></li>
						<li><a href="/Partners/myinterior/settlement_details.jsp">정산내역</a></li>
					</ul></li>
				<li><a href="#">시공&nbsp;사례</a>
					<ul>
						<li><a href="/Partners/upload.do">등록</a></li>
						<li><a href="/Partners/portfolio_list.do">수정/삭제</a></li>
					</ul></li>
				<li><a href="#">광고&nbsp;관리</a>
					<ul>
						<li><a href="/Partners/marketing/marketing.jsp">노출프로모션</a></li>
					</ul></li>
				<li><a href="#">고객&nbsp;관리</a>
					<ul>
						<li><a href="/Partners/customer_qna.do">고객문의</a></li>
						<li><a href="/Partners/customer_review.do">고객후기</a></li>
					</ul></li>
				<li><a href="#">My&nbsp;Page</a>
					<ul>
						<li><a href="/Partners/data_manage.do">내 정보관리</a></li>
						<li><a href="/Partners/pw_change.do">비밀번호 변경</a></li>
					</ul></li>
				<%-- --%>
			</ul>
		</div>
	<div id="cont_wrap">
		<header>
			<div id="top_bar">
				<div id=top_title>
					<div>
					
					<button id="logo_button" onclick="logout_check()"> <img src="/Partners/images/dozip_logo.png" alt="메인로고"></button>
						
					</div>
					<div>PARTNERS PAGE</div>
				</div>
				<div class="msg">
					<span class="hide_1"> ${businessName}   님 환영합니다 <span id="timer"></span></span> <span
						class="hide_2"><input type="button" value="로그아웃"
						onclick="logout_check()"></span>
						
						
						<script>
							function logout_check() {
								var x = confirm('로그아웃 하시겠습니까?');
								
								if(x) location='/Partners/partners_logout.do'
								else return;
							}
						</script>
				</div>
			</div>
		</header>


		<article id="main_cont">