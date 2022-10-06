/*************************/
/* 로그인창 유효성 검사 */
/*************************/
function login_check() {
	if ($.trim($("#signin_id").val()) == '') {
		alert('아이디를 입력하세요');
		$('#signin_id').focus();
		return false;
	}
	if ($.trim($('#signin_pw').val()) == '') {
		alert('비밀번호를 입력하세요');
		$('#signin_id').focus();
		return false;
	}
}
/*아이디 체크 버튼 연동 */
$(function() {
	$('#id_save_button').click(function() {
		if ($('#id_save_checkbox').prop('checked')) {
			$('#id_save_checkbox').prop('checked', '');
		}
		else {
			$('#id_save_checkbox').prop('checked', 'checked');
		}

	});

});
/*************************/
/* 회원가입창 유효성 검사 */
/*************************/


//사업자 번호 형식 체크
$('#business_num').on('keyup', function(event) {
	$('#business_num_check').hide();
	$business_num = $.trim($(
		"#business_num").val());

	var a1 = $business_num.charAt(3);
	var a2 = $business_num.charAt(6);
	var a3 = $business_num.replace(
		/[-_]/g, '');

	if ($business_num == '') {
		$('#business_num').css("border", "2.5px solid gray");
		return false;
	}

	if (a1 == '-' && a2 == '-'
		&& a3 > 1010000000
		&& a3 < 9999999999) {
		$('#business_num_check').hide();

		$('#business_num').css(
			"border",
			"2.5px solid gray");

	} else {
		$newtext = '<font color="red" size="2"><b>형식이 맞지 않습니다!</b></font>';
		$('#business_num_check').text(
			'');
		$('#business_num_check').show(
			'');
		$('#business_num_check')
			.append($newtext);
		$('#business_num').css(
			"border",
			"2.5px solid red");
	}
});
//연락처 형식 체크
$('#pTel').on('keyup', function(event) {
	$('#pTel_check').hide();
	var pTel = $.trim($("#pTel").val());
	const ONLY_NUMBER = /^[0-9]*$/; //숫자 정규 표현식
	if (pTel == '') {
		$('#pTel').css("border", "2.5px solid gray");
	}
	else if (!(ONLY_NUMBER.test(pTel)) || pTel.length != 11) {
		$newtext = '<font color="red" size="2"><b>형식이 맞지 않습니다!</b></font>';
		$('#pTel_check').text('');
		$('#pTel_check').show('');
		$('#pTel_check').append($newtext);
		$('#pTel').css("border", "2.5px solid red");
	}
	else {
		$('#pTel').css("border", "2.5px solid gray");
	}

});
//아이디 형식 체크
$('#pId').on('keyup', function(event) {
	$('#idcheck').hide();
	$pId = $.trim($("#pId").val());

	if ($pId == '') { //입력된 값이 없을때
		$('#pId').css("border",
			"2.5px solid gray");
		return false;
	}
	if ($pId.length < 4) { //아이디 4자 미만
		$newtext = '<font color="red" size="2"><b>아이디는 4자 이상이어야 합니다!</b></font>';
		$('#idcheck').text('');
		$('#idcheck').show('');
		$('#idcheck').append($newtext);
		$('#pId').css("border",
			"2.5px solid red");
		return false;

	} else if (!(validate_userid($pId))) { //형식 안맞을때
		$newtext = '<font color="red" size="2"><b>영문 대소문자, 숫자, _조합만 가능합니다!</b></font>';
		$('#idcheck').text('');
		$('#idcheck').show('');
		$('#idcheck').append($newtext);
		$('#pId').css("border",
			"2.5px solid red");
		return false;
	} else { // 모두 충족시키면
		$newtext = '<font color="blue" size="2"><b>아이디 중복체크를 해주세요</b></font>';
		$('#idcheck').text('');
		$('#idcheck').show('');
		$('#idcheck').append($newtext);
		$('#pId').css("border",
			"2.5px solid gray");
	}
});

//아이디 중복체크
function id_check() {
	$('#idcheck').hide();
	$pId = $.trim($("#pId").val());
	if ($pId == '') { //입력된 값이 없을때
		$('#pId').css("border",
			"2.5px solid gray");
		return false;
	}
	if ($pId.length < 4) { //아이디 4자 미만
		$newtext = '<font color="red" size="2"><b>아이디는 4자 이상이어야 합니다!</b></font>';
		$('#idcheck').text('');
		$('#idcheck').show('');
		$('#idcheck').append($newtext);
		$('#pId').css("border",
			"2.5px solid red");
		return false;

	} else if (!(validate_userid($pId))) { //형식 안맞을때
		$newtext = '<font color="red" size="2"><b>영문 대소문자, 숫자, _조합만 가능합니다!</b></font>';
		$('#idcheck').text('');
		$('#idcheck').show('');
		$('#idcheck').append($newtext);
		$('#pId').css("border",
			"2.5px solid red");
		return false;

	} else {
		$.ajax({
			type: "POST",
			url: 'partners_idcheck.do',
			data: {
				"pId": $pId
			},
			datatype: "int",
			success: function(data) {
				if (data == 1) {
					$newtext = '<font color="red" size="2"><b>중복 아이디입니다!</b></font>';
					$('#idcheck').text('');
					$('#idcheck').show('');
					$('#idcheck').append($newtext);
					$('#pId').css("border",
						"2.5px solid red");
					$('#pId').focus();
					return false;
				} else {
					$newtext = '<font color="blue" size="2"><b>사용가능한 아이디입니다!</b></font>';
					$('#idcheck').text('');
					$('#idcheck').show('');
					$('#idcheck').append($newtext);
					$('#pId').focus();
				}
			},
			error: function() {
				alert('data error');
			}
		});
	}







}

//비밀번호 일치여부
$('#pPw').on('keyup', function(event) {
	$('#password_check').hide();
	$pPw = $.trim($("#pPw").val()); //비밀번호
	$pwchk = $.trim($("#pwchk").val()); //비밀번호 다시 입력


	if ($pPw == '') { //입력된 값이 없을때
		$('#pPw').css("border", "2.5px solid gray");
		return false;
	}
	if (!(validate_pw($pPw)) || $pPw.length > 16) {
		$newtext = '<font color="red" size="2"><b>비밀번호가 형식이 맞지 않습니다!</b></font>';
		$('#password_check').text('');
		$('#password_check').show('');
		$('#password_check').append($newtext);
		$('#pPw').css("border", "2.5px solid red");
	} else {
		$('#pPw').css("border", "2.5px solid gray");
	}

	if ($pwchk == '') { //입력된 값이 없을때
		$('#pwchk').css("border", "2.5px solid gray");
		return false;
	}
	if ($pPw != $pwchk) { //비밀번호가 일치하지 않으면
		$newtext = '<font color="red" size="2"><b>비밀번호가 일치하지 않습니다!</b></font>';
		$('#password_check').text('');
		$('#password_check').show('');
		$('#password_check').append($newtext);
		$('#pwchk').css("border", "2.5px solid red");
		$('#pPw').css("border", "2.5px solid red");
		return false;
	} else { // 모두 충족시키면
		if ((validate_pw($pPw)) && $pPw.length < 16) {
			$newtext = '<font color="blue" size="2"><b>일치합니다</b></font>';
			$('#password_check').text('');
			$('#password_check').show('');
			$('#password_check').append($newtext);
			$('#pwchk').css("border", "2.5px solid gray");
			$('#pPw').css("border", "2.5px solid gray");
		}
	}
});
$('#pwchk').on('keyup', function(event) {
	$('#password_check').hide();
	$pPw = $.trim($("#pPw").val()); //비밀번호
	$pwchk = $.trim($("#pwchk").val()); //비밀번호 다시 입력

	if ($pwchk == '') { //입력된 값이 없을때
		$('#pwchk').css("border", "2.5px solid gray");
		return false;
	}
	if ($pPw != $pwchk) { //비밀번호가 일치하지 않으면
		$newtext = '<font color="red" size="2"><b>비밀번호가 일치하지 않습니다!</b></font>';
		$('#password_check').text('');
		$('#password_check').show('');
		$('#password_check').append($newtext);
		$('#pwchk').css("border", "2.5px solid red");
		$('#pPw').css("border", "2.5px solid red");

		return false;
	} else { // 모두 충족시키면
		$newtext = '<font color="blue" size="2"><b>일치합니다</b></font>';
		$('#password_check').text('');
		$('#password_check').show('');
		$('#password_check').append($newtext);
		$('#pwchk').css("border", "2.5px solid gray");
		$('#pPw').css("border", "2.5px solid gray");
	}
});
//정규표현식
function validate_userid($pId) {
	var pattern = new RegExp(/^[A-z0-9_]+$/);//아이디를 영문소문자와 숫자 와 _조합으로 처리
	return pattern.test($pId);
};
function validate_pw($pPw) {
	var pattern = new RegExp(/^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{10,}$/);//아이디를 영문소문자와 숫자 와 _조합으로 처리
	return pattern.test($pPw);
};




/********************/
/*회원가입창 이메일 */
/********************/

$(function() {
	$('#email_adr').change(function() {
		$('#pMail_domain').val($('#email_adr').val());
	});
});



/***************************/
/*회원가입창 개인정보 동의 */
/**************************/
$(function() {
	$('#all').click(function() {
		if ($('#all').prop('checked')) {
			$('#check_1').prop('checked', 'checked');
			$('#check_2').prop('checked', 'checked');
			$('#check_3').prop('checked', 'checked');
		} else {
			$('#check_1').prop('checked', '');
			$('#check_2').prop('checked', '');
			$('#check_3').prop('checked', '');
		}

	});
});
$(function() {
	$('#check_1').click(function() {
		if ($('#all').prop('checked')) {
			$('#all').prop('checked', '');
		}

	});
});
$(function() {
	$('#check_2').click(function() {
		if ($('#all').prop('checked')) {
			$('#all').prop('checked', '');
		}

	});
});
$(function() {
	$('#check_3').click(function() {
		if ($('#all').prop('checked')) {
			$('#all').prop('checked', '');
		}
	});
});

/***************************/
/*   회원정보 찾기 창 전환 */
/**************************/



$(function() {
	$('#findid_btn').click(function() {
		$('#findid_form').show();
		$('#findpwd_form').hide();
		$('#findid_btn').css("background", "#659832");
		$('#findpwd_btn').css("background", "#F0F0F0");

	});
});
$(function() {
	$('#findpwd_btn').click(function() {
		$('#findpwd_form').show();
		$('#findid_form').hide();
		$('#findpwd_btn').css("background", "#659832");
		$('#findid_btn').css("background", "#F0F0F0");

	});
});

$(document).ready(function() {
	$('#findid_btn').css("background", "#659832");
});



