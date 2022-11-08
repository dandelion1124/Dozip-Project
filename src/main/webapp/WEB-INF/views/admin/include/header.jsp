<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>두꺼비집</title>
	<link rel="stylesheet" type="text/css" href="/css/admin/main.css" />
	
	<script src="https://kit.fontawesome.com/3624917c4f.js" crossorigin="anonymous"></script>
	
</head>
<body>
		<!-- header 영역 -->
		<header id="header">
			<!-- 상단 메뉴 바 -->
			<nav class="header_nav">
				<!-- 로고 -->
				<div class="logo">
					<a href="/admin/"> <img src="/images/admin/logo.png"/>
					</a>
				</div>
				
				<ul class="menu">
					<li><a href="/admin/mem">회원/파트너스관리&nbsp;</a></li>
					<li><a href="/admin/write">전체글관리&nbsp;</a></li>
					<li><a href="/admin/contract">계약/정산관리&nbsp;</a></li>
					<li><a href="/admin/qna">문의관리&nbsp;</a></li>
				</ul>
			
				<ul class="icons">
					<li><a href="/dozip/logout_ok"  id="admin_logout">관리자페이지 나가기</a></li>
				</ul>
				<a href="#" class="toggleBtn"><i class="fas fa-bars"></i></a> <!-- 반응형 메뉴 토글 버튼-->
			</nav>
		</header>
		<!-- header 영역 끝 -->

		<div class="clear"></div>