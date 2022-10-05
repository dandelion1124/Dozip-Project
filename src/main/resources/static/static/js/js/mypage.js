/* 상단 메뉴 */
function on_myact_sub() {
	$('.mypage_menu_sub').hide();
	$('.mypage_body').hide();
	$('#myact_sub').show();
	$('#my_info').show();
}
function on_mycontract_sub() {
	$('.mypage_menu_sub').hide();
	$('.mypage_body').hide();
	$('#mycontract_sub').show();
	$('#my_apply_list').show();
}
function on_myqna_sub() {
	$('.mypage_menu_sub').hide();
	$('.mypage_body').hide();
	$('#myqna_sub').show();
	$('#my_counsel_list').show();
}
/* 나의활동 - 하위메뉴*/
function on_my_info() {
	$('.mypage_body').hide();
	$('#my_info').show();
}
function on_my_info_modify() {
	$('.mypage_body').hide();
	$('#my_info_modify').show();
}
function on_my_pwd_modify() {
	$('.mypage_body').hide();
	$('#my_pwd_modify').show();
}
function on_my_scrap_view() {
	$('.mypage_body').hide();
	$('#my_scrap_view').show();
}
function on_my_review_list() {
	$('.mypage_body').hide();
	$('#my_review_list').show();
}
/* 계약관리 - 하위메뉴 */
function on_my_apply_list() {
	$('.mypage_body').hide();
	$('#my_apply_list').show();
}
function on_my_contract() {
	$('.mypage_body').hide();
	$('#my_contract').show();
}
/* 질문관리 - 하위메뉴 */
function on_my_counsel_list() {
	$('.mypage_body').hide();
	$('#my_counsel_list').show();
}
function on_my_partner_qna() {
	$('.mypage_body').hide();
	$('#my_partner_qna').show();
}

/* 비밀번호 유효성 검사 */
function validate_pwd($new_pwd)
{
  var pattern= new RegExp(/^[a-z0-9]+$/);//영문소문자와 숫자만
  return pattern.test($new_pwd);
}

/* 비밀번호 변경 확인 */
function pwd_check(){
	$current_pwd=$.trim($("#current_pwd").val());
	$new_pwd=$.trim($("#new_pwd").val());
	$new_pwd_check=$.trim($("#new_pwd_check").val());
	if($current_pwd == ""){
		alert('기존 비밀번호를 입력해주세요.');
		$('#current_pwd').focus();
		return false;
	}
	if($new_pwd == ""){
		alert('변경할 비밀번호를 입력해주세요.');
		$('#new_pwd').focus();
		return false;
	}
	if($new_pwd.length < 8){
		alert("비밀번호는 8자리 이상 입력해주세요.");
		$("#new_pwd").focus();
		return false;
	}
	if(!(validate_pwd($new_pwd))){
		alert("영문, 숫자를 포함한 8자 이상의 비밀번호를 입력해주세요.");
		$("#new_pwd").val("").focus();
		return false;
	};
	if($new_pwd_check == ""){
		alert('변경할 비밀번호를 다시 한 번 입력해주세요.');
		$('#new_pwd_check').focus();
		return false;
	}
	if($new_pwd != $new_pwd_check){
		alert("비밀번호 확인이 일치하지 않습니다.");
		$("#new_pwd_check").val("").focus();
		return false;
	}
}