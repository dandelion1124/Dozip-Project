<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>간편로그인</title>
	<link rel="stylesheet" type="text/css" href="/DoZip/css/login.css" />
	<!-- 카카오 스크립트 -->
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script>
		Kakao.init('3d8bfa3cbe8aabf2dd47e365262af246'); 
		//발급받은 키 중 javascript키를 사용해준다.
		console.log(Kakao.isInitialized()); // sdk초기화여부판단
		
		//카카오로그인
		function kakaoLogin() {
			Kakao.Auth.login({
				success : function(response) {
					Kakao.API.request({
						url : '/v2/user/me',
						success : function(response) {
							console.log(response)
						},
						fail : function(error) {
							console.log(error)
						},
					})
				},
				fail : function(error) {
					console.log(error)
				},
			})
		}
	</script>
	

	
</head>

<body>
<div id="login_wrap">
	<div>
	<p id="login_title">두집 시작하기</p>
	<p id="login_info">간편하게 소셜 계정으로<br/> 다양한 두집의 서비스를 이용해보세요!</p>
	</div>
	<div id="kakao_login">
		<p><button id="kakao_btn" type="button" onclick="kakaoLogin();">
			<a href="javascrip:void(0)">카카오	로그인</a>
		</button></p>
	</div>
	<div id="naver_login">
		<p><button id="naver_btn" type="button"  onclick="openPopUp();">
			<a href="javascript:void(0)">네이버	로그인</a>
		</button></p>
	</div>
	<div id="facebook_login">
		<p><button id="facebook_btn" type="button" onclick="kakaoLogin();">
			<a href="javascrip:void(0)">페이스북	로그인</a>
		</button></p>
	</div>
	<div id="google_login">
		<p><button id="google_btn" type="button" onclick="kakaoLogin();">
			<a href="javascrip:void(0)">구글	로그인</a>
		</button></p>
	</div>
	<div id="id_login">
		<p><a href="#none" onclick="openIdLogin();">아이디로 로그인하기</a></p>
	</div>
</div>

<!-- 버튼보다 아래에 있어야 제대로 작동하며, 함수명을 변경하면 작동하지 않음 (유의) -->
<!-- 아이디로 로그인 -->
	<script>
    function openIdLogin(){
        window.open("member_id_login.do", "_self", "toolbar=no, menubar=no, scrollbars=yes, resizable=no" );
    }
	</script>

<!-- 네이버 스크립트 -->
	<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
	<script>	
	var naverLogin = new naver.LoginWithNaverId(
			{
				clientId: "2X8n1s3lCX9_JCYqBMBc", //내 애플리케이션 정보에 cliendId를 입력해줍니다.
				callbackUrl: "http://localhost:8080/index.jsp", // 내 애플리케이션 API설정의 Callback URL 을 입력해줍니다.
				isPopup: true,
				callbackHandle: true
			}
		);	
	
	naverLogin.init();
	
	function openPopUp() {
	    window.open("https://nid.naver.com/nidlogin.logout", "_blank", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=500, height=600, left=0, top=0");
	}
	</script>
</body>
</html>