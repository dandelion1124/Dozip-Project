/* 이메일주소 동기화 */
var changeSelect = function(value) {
	$("#mem_domain").val(value);
}

/* 회원가입 전체동의 */
function allselect(bool){
	var chks = document.getElementsByName("chk");
	for(var i = 0; i < chks.length; i++){
		chks[i].checked = bool;
	}
}
/* 아래 항목 선택여부 따라 자동으로 전체선택 적용, 해제 */
function checkSelectAll()  {
	  const checkboxes = document.querySelectorAll('input[name="chk"]');
	  const checked = document.querySelectorAll('input[name="chk"]:checked');
	  const selectAll = document.querySelector('input[name="all"]');
	  
	  if(checkboxes.length === checked.length)  {
	    selectAll.checked = true;
	  }else {
	    selectAll.checked = false;
	  }
}

/* 회원가입 창 띄우기 */
function openJoin(){
	window.open("member_join.do", "_blank", "toolbar=no, menubar=no, scrollbars=no, resizable=no, width=550, height=750, left=0, top=0" );
}

/* 회원가입 아이디 유효성 검증 */
function validate_userid($mem_id)
{
  var pattern= new RegExp(/^[a-z0-9_]+$/);//아이디를 영문소문자와 숫자, _조합으로만 처리할 수 있음
  return pattern.test($mem_id);
};

function id_check(){
	$(".idcheck").hide();
	//아이디 영역을 숨김
	$mem_id=$.trim($("#mem_id").val());	
	//입력글자 확인
	if($mem_id==''){
		$("#join_btn").prop("disabled", true);
		return false;
	}
	if(!(validate_userid($mem_id))){
		$newtext='<font color="red" size="2"><b>아이디는 영문소문자,숫자,_조합만 가능합니다.</b></font>';
		$("#join_btn").prop("disabled", true); //가입버튼 비활성화
		$(".idcheck").text('');
		$(".idcheck").show();
		$(".idcheck").append($newtext);
		return false;
	};
	//입력글자 길이 체크
	if($mem_id.length < 4){
		$newtext='<font color="red" size="2"><b>아이디는 4자 이상이어야 합니다.</b></font>';
		$("#join_btn").prop("disabled", true);
		$(".idcheck").text('');
		$(".idcheck").show();
		$(".idcheck").append($newtext);
		return false;
	};
	if($mem_id.length > 20){
		$newtext='<font color="red" size="2"><b>아이디는 20자 이하이어야 합니다.</b></font>';
		$("#join_btn").prop("disabled", true);
		$(".idcheck").text('');
		$(".idcheck").show();
		$(".idcheck").append($newtext);
		return false;
	};
	
	//아이디 중복확인
    $.ajax({
        type:"POST",
        url:"member_id_check.do", 
        data: {"mem_id":$mem_id},
        datatype:"int",
        success: function (data) {
      	  if(data==1){
      		$newtext='<font color="red" size="2"><b>중복 아이디입니다.</b></font>';
			$("#join_btn").prop("disabled", true);
      		$(".idcheck").text('');
        	$(".idcheck").show();
        	$(".idcheck").append($newtext);          		
          	return false;
      	  }else{
      		$newtext='<font color="blue" size="2"><b>사용가능한 아이디입니다.</b></font>';
			$("#join_btn").prop("disabled",  false); //유효성을 통과했을 때, 가입 버튼을 활성화시킴
      		$(".idcheck").text('');
      		$(".idcheck").show();
      		$(".idcheck").append($newtext);
      	  }  	    	  
        },
    	  error:function(){//비동기식 아작스로 서버디비 데이터를 못가져와서 에러가 발생했을 때 호출되는 함수이다.
    		  alert("data error");
    	  }
      });//$.ajax
}

/* 비밀번호 유효성 검사 */
function validate_pw($mem_pwd)
{
  var pattern= new RegExp(/^[a-z0-9]+$/);//영문소문자와 숫자만
  return pattern.test($mem_pwd);
}
/* 비밀번호 체크*/
function pw_check(){
	$(".pwdcheck").hide();
	$mem_pwd=$.trim($("#mem_pwd").val());
	if($mem_pwd==''){
		$("#join_btn").prop("disabled", true);
		return false;
	}
	if(!(validate_pw($mem_pwd))){
		$newtext='<font color="red" size="2"><b>비밀번호는 영문소문자,숫자조합만 가능합니다.</b></font>';
		$("#join_btn").prop("disabled", true);
		$(".pwdcheck").text('');
		$(".pwdcheck").show();
		$(".pwdcheck").append($newtext);
		return false;
	}
	else if($mem_pwd.length < 4){
		$newtext='<font color="red" size="2"><b>비밀번호는 4자 이상이어야 합니다.</b></font>';
		$("#join_btn").prop("disabled", true);
		$(".pwdcheck").text('');
		$(".pwdcheck").show();
		$(".pwdcheck").append($newtext);
		return false;
	}
	else if($mem_pwd.length > 20){
		$newtext='<font color="red" size="2"><b>비밀번호는 20자 이하이어야 합니다.</b></font>';
		$("#join_btn").prop("disabled", true);
		$(".pwdcheck").text('');
		$(".pwdcheck").show();
		$(".pwdcheck").append($newtext);
		return false;
	}
	else{
		$newtext='<font color="blue" size="2"><b>형식에 맞는 비밀번호입니다.</b></font>';
		$("#join_btn").prop("disabled", false);
		$(".pwdcheck").text('');
		$(".pwdcheck").show();
		$(".pwdcheck").append($newtext);
		return false;
	}
}

/* 비밀번호 더블체크 */
function double_check(){
	$(".doublecheck").hide();
	$mem_pwd=$.trim($("#mem_pwd").val());
	$mem_pwd_check=$.trim($("#mem_pwd_check").val());
	if($mem_pwd_check==''){
		$("#join_btn").prop("disabled", true);
		$("#mem_pwd_check").css("background-color", "#FFFFFF");
		return false;
	}
	if($mem_pwd != $mem_pwd_check){
		$("#mem_pwd_check").css("background-color", "#FFCCCC");
		$newtext='<font color="red" size="2"><b>비밀번호가 일치하지 않습니다.</b></font>';
		$("#join_btn").prop("disabled", true);
		$(".doublecheck").text('');
		$(".doublecheck").show();
		$(".doublecheck").append($newtext);
		return false;
	}else{
		$("#mem_pwd_check").css("background-color", "#FFFFFF");
		$newtext='<font color="blue" size="2"><b>비밀번호가 일치합니다.</b></font>';
		$("#join_btn").prop("disabled", false);
		$(".doublecheck").text('');
		$(".doublecheck").show();
		$(".doublecheck").append($newtext);
		return false;
	}
}

/* 이름 한글 유효성 검사 */
function validate_name($mem_name)
{
  var pattern= new RegExp(/^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]+$/);//한글
  return pattern.test($mem_name);
}
/* 이름 체크 */
function name_check(){
	$(".namecheck").hide();
	$mem_name=$.trim($("#mem_name").val());
	if($mem_name==''){
		$("#join_btn").prop("disabled", true);
		return false;
	}
	if(!validate_name($mem_name)){
		$newtext='<font color="red" size="2"><b>한글이름을 작성해주세요.</b></font>';
		$("#join_btn").prop("disabled", true);
		$(".namecheck").text('');
		$(".namecheck").show();
		$(".namecheck").append($newtext);
		return false;
	}
	else{
		$("#join_btn").prop("disabled", false);
		$(".namecheck").text('');
		$(".namecheck").hide();
		return false;
	}
}
/* 번호체크 */
function validate_tel($mem_pwd)
{
  var pattern= new RegExp(/^[0-9]+$/);//숫자만
  return pattern.test($mem_pwd);
}
/* 연락처 유효성 */
function tel_check(){
	$(".telcheck").hide();
	$mem_tel=$.trim($("#mem_tel").val());
	if($mem_tel==''){
		$("#join_btn").prop("disabled", true);
		return false;
	}
	if(!validate_tel($mem_tel)){
		$newtext='<font color="red" size="2"><b>숫자만 입력해주세요.</b></font>';
		$("#join_btn").prop("disabled", true);
		$(".telcheck").text('');
		$(".telcheck").show();
		$(".telcheck").append($newtext);
		return false;
	}
	else if($mem_tel.length!=11){
		$newtext='<font color="red" size="2"><b>휴대폰번호 11자리를 확인해주세요.</b></font>';
		$("#join_btn").prop("disabled", true);
		$(".telcheck").text('');
		$(".telcheck").show();
		$(".telcheck").append($newtext);
		return false;
	}
	else{
		$("#join_btn").prop("disabled", false);
		$(".telcheck").text('');
		$(".telcheck").hide();
		return false;
	}
}

function emailcheck($mail){
	var pattern =  new RegExp(/^[0-9a-zA-Z_]*@[a-z]+\.[a-z]{2,3}$/i);
	return pattern.test($mail);
}
/* 이메일 유효성 */
function email_check(){
	$(".emailcheck").hide();
	$mem_email=$.trim($("#mem_email").val());
	$mem_domain=$.trim($("#mem_domain").val());
    $mail = $mem_email+"@"+$mem_domain; 
	if($mem_email=='' && $mem_domain==''){
		$("#join_btn").prop("disabled", true);
		return false;
	} 
	if(!emailcheck($mail)){
		$newtext='<font color="red" size="2"><b>이메일 형식이 맞지않습니다.</b></font>';
		$("#join_btn").prop("disabled", true);
		$(".emailcheck").text('');
		$(".emailcheck").show();
		$(".emailcheck").append($newtext);
		return false;
	}
	else{
		$newtext='<font color="blue" size="2"><b>이메일 형식이 맞습니다.</b></font>';
		$("#join_btn").prop("disabled", false);
		$(".emailcheck").text('');
		$(".emailcheck").show();
		$(".emailcheck").append($newtext);
	}
}

/*회원가입 빈칸 유효성*/
function join_check(){
	if($.trim($('#mem_id').val())==''){
		  alert('아이디를 입력해주세요.');
		  $('#mem_id').val('').focus();
		  return false;
	  }
	if($.trim($('#mem_pwd').val())==''){
		  alert('비밀번호를 입력해주세요.');
		  $('#mem_pwd').val('').focus();
		  return false;
	  }
	if($.trim($('#mem_pwd_check').val())==''){
		  alert('비밀번호를 한 번 더 입력해주세요.');
		  $('#mem_pwd_check').val('').focus();
		  return false;
	  }
	if($.trim($('#mem_name').val())==''){
		  alert('이름을 입력해주세요.');
		  $('#mem_name').val('').focus();
		  return false;
	}
	if($.trim($('#mem_tel').val())==''){
		  alert('연락처를 입력해주세요.');
		  $('#mem_tel').val('').focus();
		  return false;
	}
	if($.trim($('#mem_email').val())==''){
		  alert('이메일주소를 입력해주세요.');
		  $('#mem_email').val('').focus();
		  return false;
	  }
	if($.trim($('#mem_domain').val())==''){
		  alert('이메일주소를 입력해주세요.');
		  $('#mem_domain').val('').focus();
		  return false;
	  }
}

/* 아이디 로그인 유효성 */
function login_check(){
	if($.trim($('#mem_id').val())==''){
		$("#login_idcheck").hide();
		  alert('아이디를 입력해주세요.');
		  $('#mem_id').val('').focus();
	  }
	else if($.trim($('#mem_pwd').val())==''){
		  alert('비밀번호를 입력해주세요.');
		  $('#mem_pwd').val('').focus();
	  }
	else {
		document.id_login_box.submit();
		return true;
	}
}

/*  아이디찾기 */
/* 이름 체크 */
function name_check2(){
	$(".namecheck2").hide();
	$mem_name=$.trim($("#mem_name2").val());
	if($mem_name==''){
		$("#find_id_btn").prop("disabled", true);
		return false;
	}
	if(!validate_name($mem_name)){
		$newtext='<font color="red" size="2"><b>한글이름을 작성해주세요.</b></font>';
		$("#find_id_btn").prop("disabled", true);
		$(".namecheck2").text('');
		$(".namecheck2").show();
		$(".namecheck2").append($newtext);
		return false;
	}
	else{
		$("#find_id_btn").prop("disabled", false);
		$(".namecheck2").text('');
		$(".namecheck2").hide();
		return false;
	}
}
/* 연락처 유효성 */
function tel_check2(){
	$(".telcheck2").hide();
	$mem_tel=$.trim($("#mem_tel2").val());
	if($mem_tel==''){
		$("#find_id_btn").prop("disabled", true);
		return false;
	}
	if(!validate_tel($mem_tel)){
		$newtext='<font color="red" size="2"><b>숫자만 입력해주세요.</b></font>';
		$("#find_id_btn").prop("disabled", true);
		$(".telcheck2").text('');
		$(".telcheck2").show();
		$(".telcheck2").append($newtext);
		return false;
	}
	else if($mem_tel.length!=11){
		$newtext='<font color="red" size="2"><b>휴대폰번호 11자리를 확인해주세요.</b></font>';
		$("#find_id_btn").prop("disabled", true);
		$(".telcheck2").text('');
		$(".telcheck2").show();
		$(".telcheck2").append($newtext);
		return false;
	}
	else{
		$("#find_id_btn").prop("disabled", false);
		$(".telcheck2").text('');
		$(".telcheck2").hide();
		return false;
	}
}

/* 아이디 비번찾기*/
function id_check2(){
	$(".idcheck").hide();
	//아이디 영역을 숨김
	$mem_id=$.trim($("#mem_id").val());	
	//입력글자 확인
	if($mem_id==''){
		return false;
	}
	if(!(validate_userid($mem_id))){
		$newtext='<font color="red" size="2"><b>아이디는 영문소문자,숫자,_조합만 가능합니다.</b></font>';
		$(".idcheck").text('');
		$(".idcheck").show();
		$(".idcheck").append($newtext);
		return false;
	};
	//입력글자 길이 체크
	if($mem_id.length < 4){
		$newtext='<font color="red" size="2"><b>아이디는 4자 이상이어야 합니다.</b></font>';
		$(".idcheck").text('');
		$(".idcheck").show();
		$(".idcheck").append($newtext);
		return false;
	};
	if($mem_id.length > 20){
		$newtext='<font color="red" size="2"><b>아이디는 20자 이하이어야 합니다.</b></font>';
		$(".idcheck").text('');
		$(".idcheck").show();
		$(".idcheck").append($newtext);
		return false;
	};
}