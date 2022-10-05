<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>두꺼비집</title>
	<link rel="stylesheet" type="text/css" href="/DoZip/css/main.css" />
	<link rel="stylesheet" type="text/css" href="/DoZip/css/review.css" />
	<link rel="stylesheet" type="text/css" href="/DoZip/css/counsel.css" />
	<link rel="stylesheet" type="text/css" href="/DoZip/css/mypage.css" />
	
	<script src ="/DoZip/js/header.js" defer></script>
    <script src="/DoZip/js/jquery.js"></script>
    <script src="/DoZip/js/mypage.js"></script>
    <script src="/DoZip/js/member.js"></script>
  
	<script>
	    function openLogin(){
	        window.open("member_login.do", "_blank", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=400, height=550, left=0, top=0" );
	    }
	</script>
</head>
<body>
		<!-- header 영역 -->
		<header id="header">
			<!-- 상단 메뉴 바 -->
			<nav class="header_nav">
				<!-- 로고 -->
				<div class="logo">
					<a href="home.do"> <img src="/DoZip/images/main_logo.png"/>
					</a>
				</div>
				
				<ul class="menu">
					<li><a href="estimate_apply.do">견적신청</a></li>
					<li><a href="portfolio.do">포트폴리오</a></li>
					<li><a href="review.do">고객후기</a></li>
					<li><a href="#">스토리</a></li>
					<li><a href="partners.do">파트너스</a></li>
				</ul>
			
				<ul class="icons">
					<c:if test="${empty id}"> <!-- 로그인 전 -->
						<li><a href="#none" onclick="openLogin();"><img src="/DoZip/images/user.png" width="30" height="30" /></a></li>
					</c:if>
					<c:if test="${!empty id}"> <!-- 로그인 후 -->
						<li><a href="mypage_go.do"><img src="/DoZip/images/user.png" width="30" height="30" /></a></li>
					</c:if>
					<li><a href="counsel.do"><img src="/DoZip/images/counsel.png" width="30" height="30" /></a></li>
				</ul>
				<a href="#" class="toggleBtn"><i class="fas fa-bars"></i></a> <!-- 반응형 메뉴 토글 버튼-->
			</nav>
		</header>
		<!-- header 영역 끝 -->

		<div class="clear"></div>

<div id="wrap"> <!-- #wrap 시작 -->