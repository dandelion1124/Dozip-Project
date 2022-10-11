<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp" />
<!--메인 content-->


<div class="pw_change_form">
	<form method="post" action="pw_change.do" >
		<center>
			<div class="pw_change_title"><h2>비밀번호 변경</h2></div>
			<table style="width: 50%; height:300px; border: 1px solid lightgray; border-collapse: collapse; text-align:center;
							 background-color:white;">
				<tr height ="30">
					<td align="center" style="font-size:18px; text-align:right; width:30%;"><b>비밀번호 변경</b></td>
					<td width="250"><input type="text" class="pw_change01" name ="pPw" id="pPw" placeholder="기존 비밀번호를 입력해주세요"></td>
				</tr></br>
				<tr height ="40">
					<td rowspan="2" style="font-size:18px; text-align:right; width:30%;"><b>새 비밀번호 입력</b></td>
					<td width="250">
						<input type="text" class="pw_change02" id="pPw" name="pPw" placeholder="10~16자 영문, 숫자, 특수문자 조합"><br/><br/>
					</td>
				</tr>
				<tr height ="40">
					<td>
						<input type="text" class="pw_change03" id="pPw" name="pPw" placeholder="비밀번호를 재입력해주세요">
					</td>
				</tr>
				<tr height ="40" >
					<td colspan="2" align="center"><input class="pw_change_complete" type="submit" value ="변경완료"/></td>
				</tr>
			</table>
		</center>
	</form>
</div>
<jsp:include page="../include/footer.jsp" />