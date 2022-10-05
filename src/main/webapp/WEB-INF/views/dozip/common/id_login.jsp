<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>아이디로 로그인</title>
	<link rel="stylesheet" type="text/css" href="/DoZip/css/login.css" />
	<script src="/DoZip/js/jquery.js"></script>
	<script src="/DoZip/js/member.js"></script>
</head>
<body>
<div id="id_login_wrap">
	<div id="id_login_title">
		<p>아이디로 시작하기</p>
	</div>
	<form id="id_login_box" method="post" onsubmit="login_check();return false" action="member_login_ok.do" >
		<input type="text"  name="mem_id" id="mem_id" placeholder="  아이디"/>
		<input type="password" name="mem_pwd" id="mem_pwd" placeholder="  비밀번호"/>
		<button id="login_btn" type="submit">로 그 인</button>
	</form>
	<div id="find_box">
		<span>
			<a href="member_find.do" >아이디/비밀번호 찾기 </a>
		</span>
	</div>
	<div id="join_info">
		<span>
			<p>아직 두집 회원이 아니시라면? &nbsp;
			<a href="#none" onclick="openJoin();">회원가입하기</a></p>
		</span>
	</div>
</div>
</body>
</html>