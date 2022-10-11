<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파트너스 메인</title>
<link rel="stylesheet" href="/css/partners/main_style.css">
<link rel='stylesheet' href="/css/partners/calendar.css" />
<link rel="stylesheet" href="/css/partners/partners_style.css">
<link rel="stylesheet" href="/css/partners/partners_style2.css">
<script src="/js/partners/jquery.js"></script>
<script src="/js/partners/javascript.js"></script>
<script src="/js/partners/javascript2.js"></script>
<script src='/js/partners/calendar.js'></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<%--로딩중 아이콘 추가 --%>
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
	width: 200px;
	position: absolute;
	top: 40%;
	left: 50%;
}
</style>

</head>

<%-- 

<script>
window.onload = function () {
		$('#main_cont').hide();
		$('#main_cont').fadeIn(900);
		} 
</script>  
--%>

<%-- 
<% 
if(session.getAttribute("id")==null){
	out.println("<script>");
	out.println("alert('시간이 만료되어 로그아웃되었습니다!')");
	out.println("location='/Partners/index.do'");
	out.println("</script>");
 }
%>--%>
<body>
	<!-- 로딩 아이콘 
<div align="center" id="loading"><img id="loading-image" src="/Partners/images/dozip_logo.png"></div>-->
	<!-- 좌측 사이드바 영역 -->
	<div id="wrap">
		<div id="side_wrap">
		
			<ul id="side_menu">
			<li style="height: 100px;">
			</li>
				<li><a href="/partners/">&nbsp;&nbsp;&nbsp;PARTNERS</a></li>
				<li><a href="#">&nbsp;&nbsp;&nbsp;요&nbsp;&nbsp;금&nbsp;&nbsp;제</a>
					<ul>
						<li><a href="/partners/planning">요금제안내</a></li>
					</ul></li>
				<li><a href="#">&nbsp;&nbsp;&nbsp;견적&nbsp;의뢰</a>
					<ul>
						<li><a href="/Partners/bid.do">입찰의뢰</a></li>
						<li><a
							href="/Partners/estimate_request/construct_request.jsp">시공요청</a></li>
					</ul></li>
				<li><a href="#">&nbsp;&nbsp;&nbsp;견적&nbsp;관리</a>
					<ul>
						<li><a href="/partners/estimate_list">견적목록</a></li>
					</ul></li>
				<li><a href="#">&nbsp;&nbsp;&nbsp;내&nbsp;&nbsp;공&nbsp;&nbsp;사</a>
					<ul>
						<li><a href="/partners/interior_list">공사내역</a></li>
						<li><a href="/partners/schedule_list">일정관리</a></li>
						<li><a href="/partners/balance_details">정산내역</a></li>
					</ul></li>
				<li><a href="#">&nbsp;&nbsp;&nbsp;시공&nbsp;사례</a>
					<ul>
						<li><a href="/partners/upload">등록</a></li>
						<li><a href="/partners/portfolio_list">수정/삭제</a></li>
					</ul></li>
				<li><a href="#">&nbsp;&nbsp;&nbsp;광고&nbsp;관리</a>
					<ul>
						<li><a href="/partners/marketing">노출프로모션</a></li>
					</ul></li>
				<li><a href="#">&nbsp;&nbsp;&nbsp;고객&nbsp;관리</a>
					<ul>
						<li><a href="/partners/qna">고객문의</a></li>
						<li><a href="/partners/review">고객후기</a></li>
					</ul></li>
				<li><a href="#">&nbsp;&nbsp;&nbsp;My&nbsp;Page</a>
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
						<div id="menu_show_hide">
						<img id="menu_show_hide_img" src='/images/partners/menu_show_hide.png'></div>
						<div><img id="header_main_logo" src="/images/partners/dozip_logo.png" alt="메인로고"></div>
						<div>PARTNERS PAGE</div>
					</div>
					<script>
					
					$('#menu_show_hide_img').click(function() {
						//1180px
						var margin =$('#top_bar').css('margin-left');
						if(window.innerWidth>1173){
						if(margin=='0px'){
							$('#side_wrap').css({'display':'block'});
							$('#top_bar').css({'margin-left':'161px'});
							$('#footer_mediaquery').css({'margin-left':'160px'});
							$('#main_cont').css({'margin-left':'160px'});
							$('#fotter_setting').css({'display':'block'});
						}
						else {
							$('#side_wrap').css({'display':'none'});
							$('#top_bar').css({'margin-left':'0px'});
							$('#footer_mediaquery').css({'margin-left':'0px'});
							$('#main_cont').css({'margin-left':'0px'});
							$('#fotter_setting').css({'display':'none'});
						}
						}
					});
					$(window).resize(function (){
						  // width값을 가져오기
						  var width_size = window.innerWidth;
						  if (width_size <= 1173) {
							  	$('#side_wrap').css({'display':'none'});
								$('#top_bar').css({'margin-left':'0px'});
								$('#footer_mediaquery').css({'margin-left':'0px'});	
								$('#main_cont').css({'margin-left':'0px'});
								$('#fotter_setting').css({'display':'none'});
						}
						  else  {
							 	 $('#side_wrap').css({'display':'block'});
								$('#top_bar').css({'margin-left':'161px'});
								$('#footer_mediaquery').css({'margin-left':'160px'});	
								$('#main_cont').css({'margin-left':'160px'});
								$('#fotter_setting').css({'display':'block'});
								}			  
						});
					
					</script>
					
					
			
					<div class="msg">
						<span class="hide_1"> ${businessName} 님 환영합니다 <span
							id="timer"></span></span> <span class="hide_2"><input
							type="button" value="로그아웃" onclick="logout_check()"></span>


						<script>
							function logout_check() {
								var x = confirm('로그아웃 하시겠습니까?');

								if (x)
									location = '/Partners/partners_logout.do'
								else
									return;
							}
						</script>
					</div>
				</div>
			
			</header>
			<article id="main_cont">