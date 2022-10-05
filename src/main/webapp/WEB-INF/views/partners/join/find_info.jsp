<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 찾기</title>
<link rel="stylesheet" href="/Partners/css/join_style.css">
<script src="/Partners/js/jquery.js"></script>
<script src="/Partners/js/join.js"></script>
</head>
<body>
	<article id="join_wrap">
		<div id="findinfo_cont">
			<div id="findinfo_title">
					<a href="index.do"> <img src="./images/join/findinfo_logo.png"
						alt="메인로고"></a>
			</div>
			<div id="findinfo_menu">
				<input type="button" id="findid_btn" value="아이디 찾기"> 
				<input type="button" id="findpwd_btn" value="비밀번호 찾기">
			</div>

			<div id=findinfo_form>
				<form id="findid_form" action="partners_findid.do" method="post">
					<div>
						<div class="findinfo_label">
							<label>사업자 등록번호</label>
						</div><div>
							<input type="text" name="findid_business_num" placeholder="000-00-00000">
						</div>
					</div>
					<div>
						<div class="findinfo_label">
							<label>가입시 등록한 핸드폰 번호</label>
						</div><div>
							<input type="text" name="findid_pTel" placeholder="000-0000-0000">
						</div>
					</div>
					<div>
						<div class="findinfo_label">
							<label>이메일</label>
						</div><div>
							<input type="email" name="findid_email">
						</div>
					</div>
					<div class="findinfo_findbtn">
						<div>
							<input type="submit" value="아이디 찾기">
						</div>
						<div>
							<input type="reset" value="취소">
						</div>
					</div>
				</form>
				<form action="partners_findpwd.do" id="findpwd_form" method="post">
					<div>
						<div class="findinfo_label">
							<label>사업자 등록번호</label>
						</div><div>
							<input type="text" name="findpwd_business_num" placeholder="000-00-00000">
						</div>
					</div>
					<div>
						<div class="findinfo_label">
							<label>계정 ID</label>
						</div><div>
							<input type="text" name="findpwd_pId">
						</div></div>
					<div>
						<div class="findinfo_label">
							<label>계정 사용자명</label>
						</div><div>
							<input type="text" name="findpwd_pName">
						</div>
					</div>
					<p>*가입시 등록한 이메일로 전송됩니다.</p>
					<div class="findinfo_findbtn">
						<div>
							<input type="submit" value="비밀번호 찾기">
						</div><div>
							<input type="reset" value="취소">
						</div></div>
				</form></div></div>
<jsp:include page="../include/footer.jsp" />