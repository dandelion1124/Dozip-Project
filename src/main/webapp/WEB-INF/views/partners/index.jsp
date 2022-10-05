<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파트너스 로그인</title>
<link rel="stylesheet" href="/css/partners/join_style.css">
<script src="/js/partners/jquery.js"></script>
<script src="/js/partners/join.js"></script>
</head>
<script>


$(window).resize(function (){

  // width값을 가져오기

  var width_size = window.outerWidth;

  

  // 800 이하인지 if문으로 확인

  if (width_size <= 1250) {

	$('#side_wrap').hide();
  }

  else  {

	$('#side_wrap').show();
  }

})
//수정

</script>
<body>
	<c:if test="${empty id}">
	<article id="join_wrap">		
		<div id= signin_cont>
			<div id="signin_title">
					<div><a href="#"><img src="/images/partners/partners_logo.png" alt="메인로고"></a></div>
			</div>
			<form action="partners_login_ok.do" method="post" id="로그인 폼" onsubmit="return login_check();">
				<div>
					<input type="text" name="login_pId" id="signin_id" placeholder="아이디">
					<span id="idcheck"></span>
				</div>
				<div>
					<input type="password" name="login_pPw" id="signin_pw" placeholder="비밀번호">
					<span id="pwcheck"></span>
				</div>
				<div>
					<input type="submit" value="로그인" id="login"></div>
				<div id=bottom_button1>
					<div id=id_save>
						<div><input type="checkbox" id=id_save_checkbox></div>		
						<div><button type="button" id=id_save_button>아이디 저장</button></div>
					</div>
					<div> <input type="button" id="signup_button" value="회원가입" onclick="location='partners_signup.do'"></div>
				</div>
			</form>
			<div id=bottom_button2>
				<div> 아이디 또는 비밀번호를 잃어버리셨다면 ?</div>
				<div><input type="button" id="" value="문의하기" onclick="location='partners_findinfo.do'"></div>
			</div></div>
	</c:if>
	<c:if test="${!empty id }">
		<jsp:include page="include/header.jsp" />
	</c:if>	
<jsp:include page="include/footer.jsp" />


		