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
	<link rel="stylesheet" type="text/css" href="/css/dozip/main.css" />
	<link rel="stylesheet" type="text/css" href="/css/dozip/review.css" />

	<script src ="/js/dozip/header.js" defer></script>
    <script src="/js/dozip/jquery.js"></script>
    <script src="/js/dozip/mypage.js"></script>
    <script src="/js/dozip/member.js"></script>

	<script src="https://kit.fontawesome.com/6f3edb2719.js" crossorigin="anonymous"></script>

	<style>
		header {
			position: fixed;
			background: #FFF;
			z-index: 999;
			left: 0;
			right: 0;
			display: block;
			padding:0 180px;
			height: 80px;
			margin-top: -8px;
		}
		header .logo a{width:171px ; height:56px; background:url(/images/dozip/HomeLogo01.png) no-repeat; display:block; text-indent:-9999em;}
		header .logo{float:left;}
		header nav {float:right;}
		header nav ul{float:left;}
		header nav ul li{float:left;}
		header nav ul li a {line-height: 56px; font-size:14px; color:#fff; text-decoration:none;}
		header + div{ /* 헤더 다음에 오는 div 에 패딩을 주어 가려짐 문제 해결 */
			padding-top: 60px;
		}
		header nav ul li a{color: rgb(43, 43, 42);}

		.main-menu li{margin-right:29px;}
		.main-menu li:last-child{margin-right:20px;}

		.top-icons li{margin-right:25px;}
		.top-icons li:last-child{margin-right:0;}

		header nav ul li a:hover, header nav ul li a.active{
			color:#7e9e7f;
		}
		header ol, ul {
			list-style: none;
		}
	</style>
	<script>
	    function openLogin(){
	        window.open("/dozip/login", "_blank", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=400, height=550, left=0, top=0" );
	    }
	</script>
</head>
<body>
		<!-- header 영역 -->
		<header>
			<div class="container clearfix">
				<h1 class="logo">
					<a href="/dozip/home"></a>
				</h1>
				<nav class="clearfix">
					<ul class="main-menu">
						<li><a href="/dozip/home" class="active">Home</a></li>
						<li><a href="/dozip/apply">견적신청</a></li>
						<li><a href="/dozip/port">포트폴리오</a></li>
						<li><a href="">고객후기</a></li>
						<li><a href="">스토리</a></li>
						<li><a href="/partners/main">파트너스</a></li>
					</ul>
					<ul class="top-icons">
						<c:if test="${empty id}"> <!-- 로그인 전 -->
							<li><a href="#none" onclick="openLogin();"><i class="fas fa-user"></i></a></li>
						</c:if>
						<c:if test="${!empty id}"> <!-- 로그인 후 -->
							<li><a href="/dozip/mypage"><i class="fas fa-user"></i></a></li>
						</c:if>
						<li><a href="/dozip/counsel_main"><i class="fa-solid fa-comments"></i></a></li>
					</ul>
				</nav>
			</div>
		</header>
		<!-- header 영역 끝 -->

		<div class="clear"></div>

<div id="wrap"> <!-- #wrap 시작 -->