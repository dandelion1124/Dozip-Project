<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp" />
<!--메인 content-->

<script>
	document.getElementById("pwchange_btn").onclick = function() {
		var current_pwd = $.trim($("#current_pwd").val());
		var new_pwd = $.trim($("#new_pwd").val());

		$.ajax({
			url : '/partners/pw_change_ok',
			type : 'post',
			dataType : 'json',
			data : {
				current_pwd : current_pwd,
				new_pwd : new_pwd
			},
			success : function(data) {
				alert(data.message);
				location.reload();
			},
			error:function(){
				alert("실패했습니다.");
			}
		});
	}
</script>

<div class="pw_change_form">
	<form method="post" action="pw_change_ok">
		<center>
			<div class="pw_change_title"><h2>비밀번호 변경</h2></div>
			<table style="width: 50%; height:300px; border: 1px solid lightgray; border-collapse: collapse; text-align:center;
							 background-color:white;">
				<tr height ="30">
					<td align="center" style="font-size:18px; text-align:center; width:30%;"><b>기존 비밀번호</b></td>
					<td width="250"><input type="password" class="pw_change01" name ="current_pwd" id="current_pwd" placeholder="기존 비밀번호를 입력해주세요"></td>
				</tr></br>
				<tr height ="30">
					<td style="font-size:18px; text-align:center; width:30%;"><b>새 비밀번호</b></td>
					<td width="250">
						<input type="password" class="pw_change02" id="new_pwd" name="new_pwd" placeholder="10~16자 영문, 숫자, 특수문자 조합">
					</td>
				</tr>
				<tr height ="30">
					<td align="center" style="font-size:18px; text-align:center; width:30%;"><b>비밀번호 확인</b></td>
					<td>
						<input type="password" class="pw_change03" id="new_pwd_check" name="new_pwd_check" placeholder="비밀번호를 재입력해주세요">
					</td>
				</tr>
				<tr height ="40" >
					<td colspan="2" align="center">
						<input class="pw_change_complete" type="submit" id="pwchange_btn" value ="변경"/>
						<!--<button type="button" class="pw_change_complete" id="pschange_btn" onclick="return pupdatePwd();" >변경</button> -->
					</td>
				</tr>
			</table>
		</center>
	</form>
</div>
<jsp:include page="../include/footer.jsp" />