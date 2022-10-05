<%@ page contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파트너스 회원가입</title>
<link rel="stylesheet" href="/Partners/css/join_style.css">
<script src="/Partners/js/jquery.js"></script>

</head>
<body>
	<article id="join_wrap">
		<div id="signup_form">
			<div id="signup_title">
				<a href="/Partners/index.do"> <img src="images/join/signup_logo.png" alt="메인로고"></a>
			</div>
			<form action="partners_signup_ok.do" method="post" onsubmit="return signup_check();">
				<div class="info">
					<label for="businessName">사업자명</label> 
					<input type="text" id="businessName" name="businessName" placeholder="업체명을 입력해주세요">
				</div>
				<div class="info">
					<label for="business_num">사업자번호</label> 
					<input type="text"	id="business_num" name="business_num" placeholder="000-00-00000">
				<div id="business_num_box">
					<span id="business_num_check"></span>
				</div></div>
				<div class="info">
					<label for="pName">대표자 이름</label> <input type="text" id="pName" name="pName" placeholder="대표자 이름을 입력해주세요">
				</div>
				<div class="info">
					<label for="pTel">대표자 연락처</label> <input type="text" id="pTel" name="pTel" placeholder="핸드폰번호('-')제외">
					<div id="pTel_check_box">
					<span id="pTel_check"></span>
				</div></div>
				<div class="info">
					<label for="pMail">대표자 이메일</label>
					<div class="email_info">
						<input type="text" id="pMail_id" name="pMail_id" placeholder="이메일 아이디"><span style="margin: 0px 3px;">@</span>
						<input type="text" id="pMail_domain" name="pMail_domain" placeholder="이메일 도메인">
					</div>
					<select id="email_adr" name="email_adr">
						<c:forEach var="e" items="${email}">
							<option value="${e}">${e}</option>
						</c:forEach>
					</select>
				</div>
				<div class="info">
					<label for="pId">아이디</label>
					<div class=signup_idchk>
						<input type="text" id="pId" name="pId" placeholder="4~16자 영문, 숫자">
						<input type="button" name="idchk" value="중복확인" onclick="id_check();">
					</div>
					<div id="idcheck_box">
						<span id="idcheck"></span>
					</div>
				</div>
				<div class="signup_pwd">
					<label for="pPw">비밀번호</label> <input type="password" id="pPw" name="pPw" placeholder="10~16자 영문, 숫자, 특수문자 조합"> 
					<input type="password" id="pwchk" placeholder="비밀번호 다시 입력">	
				<div id="password_check_box">
					<span id="password_check"></span>
				</div>
				</div>
				<div id=signup_personalInfo>
					<div>
						<div>
							<input type="checkbox" id="all"></div>
						<div id=signup_personalInfo_label>
							<label for="all">전체동의</label>
						</div></div>
					<div>
						<div>
							<input type="checkbox" id=check_1></div>
						<div id=signup_personalInfo_label>
							<label for="check_1">개인(신용)정보의 수집 이용 동의 </label>
						</div>
					</div>
					<div>
						<div>
							<input type="checkbox" id="check_2"></div>
						<div id=signup_personalInfo_label>
							<label for="check_2">개인(신용)정보의 제3자 제공 동의</label>
						</div></div>
					<div>
						<div>
							<input type="checkbox" id="check_3"></div>
						<div id=signup_personalInfo_label>
							<label for="check_3">서비스이용약관 동의</label>
						</div></div>

				</div>
				<div class=signup_submit>
					<input type="submit" value="가입하기"></div>
			</form>
		</div>
		<jsp:include page="../include/footer.jsp" />
		<script src="/Partners/js/join.js"></script>
</body>
</html>