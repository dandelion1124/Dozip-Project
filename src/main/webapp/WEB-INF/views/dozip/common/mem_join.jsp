<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입</title>
	<link rel="stylesheet" type="text/css" href="/css/dozip/login.css" />
	<script src="/js/dozip/jquery.js"></script>
	<script src="/js/dozip/member.js"></script>
	<style>
		#join_form_table label {
			font-weight: bold;
			font-size: 0.9rem;
			display: inline-block;
			text-align: left;
			width: 92%;
			margin-bottom: 5px;
		}
		#join_form_table span {
			margin-bottom: 0px;
		}
	</style>
</head>
<body>
<div id="join_wrap">
	<div id="join_title"><p>회원가입</p></div>
	<form id="join_form_box" method="post" name="m">
		<table id="join_form_table">
			<tr>
				<%--<th>아이디</th>--%>
				<td id="id_box">
					<label for="mem_id">아이디</label>
					<input type="text"  name="mem_id"  id="mem_id" placeholder="아이디를 입력해주세요" oninput="id_check();"/><br/>
					<!-- <button type="button"  onclick="id_check();">아이디체크</button><br/> -->
					<span class="idcheck"></span>
				</td>
			</tr>
			<tr>
				<%--<th>비밀번호</th>--%>
				<td>
					<label for="mem_pwd">비밀번호</label>
					<input type="password"  name="mem_pwd"  id="mem_pwd" placeholder="비밀번호를 입력해주세요(4자이상)" oninput="pw_check();"/><br/>
					<span class="pwdcheck"></span>
				</td>
			</tr>
			<tr>
				<%--<th>비밀번호확인</th>--%>
				<td>
					<label for="mem_pwd_check">비밀번호확인</label>
					<input type="password"  name="mem_pwd_check"  id="mem_pwd_check" placeholder="비밀번호를 다시 입력해주세요" oninput="double_check();"/><br/>
					<span class="doublecheck"></span>
				</td>
			</tr>
			<tr>
				<%--<th>이름</th>--%>
				<td>
					<label for="mem_name">이름</label>
					<input type="text"  name="mem_name"  id="mem_name" placeholder="이름을 입력해주세요" oninput="name_check();"/><br/>
					<span class="namecheck"></span>
				</td>
			</tr>
			<tr>
				<%--<th>연락처</th>--%>
				<td>
					<label for="mem_tel">연락처</label>
					<input type="text"  name="mem_tel"  id="mem_tel" placeholder="-없이 숫자만 입력해주세요" oninput="tel_check();"/><br/>
					<span class="telcheck"></span>
				</td>
			</tr>
			<tr>
				<%--<th>이메일주소</th>--%>
				<td id="emailbox">
					<label for="mem_email">이메일주소</label>
					<input type="text"  name="mem_email"  id="mem_email" placeholder="이메일주소를 입력해주세요" oninput="email_check();"/>
					<span>@</span>
					<input type="text"  name="mem_domain"  id="mem_domain" placeholder="도메인주소를 입력해주세요" oninput="email_check();"/>
					<select name="domain_list" id="domain_list" onchange="changeSelect(this.value);" onclick="email_check();">
						<option selected>직접입력</option>
						<option value="naver.com">naver.com</option>
						<option value="daum.net">daum.net</option>
						<option value="gmail.com">gamil.com</option>
					</select>
					<br/>
					<span class="emailcheck"></span>
				</td>
			</tr>
		</table>
		
		<div class="join_agree">
			<label id="all_check"><span class="agree_text"><input type="checkbox"  name="all"  onclick="allselect(this.checked)"></span><span class="agree_text">전체동의</span></label>
			<hr width="100%" />
			<label><span class="agree_text"><input type="checkbox" name="chk" onclick="checkSelectAll()"></span><span class="agree_text" id="text1">(필수)</span><span class="agree_text" id="text2"><a href="#" >개인정보 처리방침</a>에 동의</span></label>
			<label><span class="agree_text"><input type="checkbox" name="chk" onclick="checkSelectAll()"></span><span class="agree_text" id="text1">(필수)</span><span class="agree_text" id="text2"><a href="#" >이용약관</a>에 동의</span></label>
			<label><span class="agree_text"><input type="checkbox" name="chk" onclick="checkSelectAll()"></span><span class="agree_text" id="text1">(선택)</span><span class="agree_text" id="text2"><a href="#" >인테리어 정보 및 마케팅 수신</a>에 동의</span></label>
			<span id="text3">※개인정보 처리방침에 동의해주세요.</span>
		</div>
		<div>
			<button id="join_btn"  type="button"  disabled >가 입 하 기</button>
		</div>
	</form>
</div>

<script>
	document.getElementById("join_btn").onclick = function() {
		function params_list() {
			var params = {};  //배열 선언
			var data = $("#join_form_box").serializeArray(); //폼태그에 있는 데이터 담기

			$.each(data, function () { //반복문
				var name = $.trim(this.name);  //name 변수에 this.data 의 name 파라미터 값
				var value = $.trim(this.value);  //value 변수에 this.data 의 value 값
				params[name] = value; //params 배열에 키, 값 쌍으로 저장
			});
			return params;
		}

		$.ajax({
			url : '/dozip/member_join_ok',
			type : 'post',
			data : {
				data:JSON.stringify(params_list())
			},
			success : function(data) {
				alert(data.message);
				window.close();
			},
			error:function(){
				alert("실패했습니다.");
			}
		});
	}
</script>
</body>
</html>