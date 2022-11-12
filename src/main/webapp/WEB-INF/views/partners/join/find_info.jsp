<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 찾기</title>
<link rel="stylesheet" href="/css/partners/join_style.css">
<script src="/js/partners/jquery.js"></script>
<script src="/js/partners/join.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
	<article id="join_wrap">
		<div id="findinfo_cont">
			<div id="findinfo_title">
					<a href="/partners/main"> <img src="/images/partners/findinfo_logo.png"
						alt="메인로고"></a>
			</div>
			<div id="findinfo_menu">
				<input type="button" id="findid_btn" value="아이디 찾기"> 
				<input type="button" id="findpwd_btn" value="비밀번호 찾기">
			</div>

			<div id=findinfo_form>
				<form id="findid_form" method="post">
					<div>
						<div class="findinfo_label">
							<label>사업자 등록번호</label>
						</div><div>
							<input type="text" id="findid_business_num" placeholder="000-00-00000" required>
						</div>
					</div>
					<div>
						<div class="findinfo_label">
							<label>가입시 등록한 핸드폰 번호</label>
						</div><div>
							<input type="text" id="findid_pTel" placeholder="000-0000-0000" required>
						</div>
					</div>
					<div>
						<div class="findinfo_label">
							<label>이메일</label>
						</div><div>
							<input type="email" id="findid_email"required>
						</div>
					</div>
					<div class="findinfo_findbtn">
						<div>
							<input type="button" value="아이디 찾기" onclick="partners_findid()">
						</div>
						<div>
							<input type="reset" value="취소">
						</div>
					</div>
				</form>
				<form id="findpwd_form" method="post">
					<div>
						<div class="findinfo_label">
							<label>사업자 등록번호</label>
						</div><div>
							<input type="text" name="findpwd_business_num"  id="findpwd_business_num" placeholder="000-00-00000" required>
						</div>
					</div>
					<div>
						<div class="findinfo_label">
							<label>계정 ID</label>
						</div><div>
							<input type="text" name="findpwd_pId"  id="findpwd_pId" required>
						</div></div>
					<div>
						<div class="findinfo_label">
							<label>계정 사용자명</label>
						</div><div>
							<input type="text" name="findpwd_pName" id="findpwd_pName" required>
						</div>
					</div>
					<p>*가입시 등록한 이메일로 전송됩니다.</p>
					<div class="findinfo_findbtn">
						<div>
							<input type="button" value="비밀번호 찾기"  onclick="partners_findpwd()">
						</div><div>
							<input type="reset" value="취소">
						</div></div>
				</form></div></div>

								<script>


								</script>
<jsp:include page="../include/footer.jsp" />