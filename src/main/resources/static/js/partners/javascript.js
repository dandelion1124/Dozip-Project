/***********/
/*좌측 메뉴  */
/***********/

$(document).ready(function() {
	$('#side_menu > li >a ').click(function() {
		$('#side_menu li ul').slideUp();
		if ($(this).attr('class') != 'enable') {
			$(this).next().slideToggle();
			$('#side_menu li a').removeClass('enable');
			$(this).addClass('enable');
		} else {
			$(this).removeClass('enable');
		}
	});
});




/**************/
/*로그인 시간 */
/**************/

var iSecond; //초단위로 환산
var timerchecker = null;
window.onload = function() {
	fncClearTime();
	initTimer();
}
function fncClearTime() {

	iSecond = 1000; 		//로그인 시간 설정
}

Lpad = function(str, len) {
	str = str + "";
	while (str.length < len) {
		str = "0" + str;
	}
	return str;
}
initTimer = function() {
	var timer = document.getElementById("timer");
	rHour = parseInt(iSecond / 3600);
	rHour = rHour % 60;
	rMinute = parseInt(iSecond / 60);
	rMinute = rMinute % 60;
	rSecond = iSecond % 60;
	if (iSecond > 0) {
		timer.innerHTML = "&nbsp;" + Lpad(rMinute, 2) + "분 " + Lpad(rSecond, 2) + "초 ";
		iSecond--;
		timerchecker = setTimeout("initTimer()", 1000); // 1초 간격으로 체크    
	} else {
		logoutUser();
	}
}




function refreshTimer() {
	var xhr = initAjax();
	xhr.open("POST", "/jsp_std/kor/util/window_reload2.jsp", false);
	xhr.send();
	fncClearTime();
}



function logoutUser() {
	clearTimeout(timerchecker);
	var xhr = initAjax();
	xhr.open("POST", "/mail/user.public.do?method=logout", false);
	xhr.send();
	location.reload();
}



function initAjax() { // 브라우저에 따른 AjaxObject 인스턴스 분기 처리    
	var xmlhttp;
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari        
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5        
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	return xmlhttp;
}
/*******************/
/***** 주소 검색 ***/
/*******************/

function sample6_execDaumPostcode() {
	new daum.Postcode({
		oncomplete: function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var addr = ''; // 주소 변수
			var extraAddr = ''; // 참고항목 변수

			//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				addr = data.roadAddress;
			} else { // 사용자가 지번 주소를 선택했을 경우(J)
				addr = data.jibunAddress;
			}

			// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
			if (data.userSelectedType === 'R') {
				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
				// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraAddr !== '') {
					extraAddr = ' (' + extraAddr + ')';
				}
				// 조합된 참고항목을 해당 필드에 넣는다.
				document.getElementById("sample6_extraAddress").value = extraAddr;

			} else {
				document.getElementById("sample6_extraAddress").value = '';
			}

			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById('sample6_postcode').value = data.zonecode;
			document.getElementById("sample6_address").value = addr;
			// 커서를 상세주소 필드로 이동한다.
			document.getElementById("sample6_detailAddress").focus();
		}
	}).open();
}

/*******************/
/*** 공사유형선택 **/
/*******************/

$(function() {
	$('#sel_type').change(function() {
		if (($('#sel_type').val()) == '주거공간') {
			$('#sel_house').removeAttr("disabled");
			$('#sel_house').show();
			$('#sel_business').hide();
		}
		if (($('#sel_type').val()) == '상업공간') {
			$('#sel_business').removeAttr("disabled");
			$('#sel_business').show();
			$('#sel_house').hide();
		}
		if (($('#sel_type').val()) == 'none') {
			$('#sel_house, #sel_business').prop('disabled', 'disabled');
			$("#sel_house, #sel_business").val("none");
		}
	});
});

/*****************************/
/*고객관리 페이지  토글 버튼*/
/*****************************/


$(function() {
	$('#detailed_search').click(function() {
		$('#search_conditon').toggle(400);
	});
});
$(function() {
	$('#hide_button').click(function() {
		$('#search_conditon').hide(400);
	});
});

/*****************************/
/*포트폴리오 사진등록 JS*/
/*****************************/


function loadFile1(input) {
	// 여러개의 이미지를 읽을수도 있기 때문에 
	if (input.files && input.files[0]) {
		var fr = new FileReader();
		//파일리더로 일고 읽는게 완료되면  만들어준 아이디에 속성값을 지정하여 사용하겠다.
		fr.onload = function(event) {
			document.getElementById('preview1').src = event.target.result;
			document.getElementById('preview1').style.display = "flex";
		};
		fr.readAsDataURL(input.files[0]);
		// 이미지파일을 읽어 온다.
	} else {
		document.getElementById('preview1').src = "";
	}
}
function loadFile2(input) {
	// 여러개의 이미지를 읽을수도 있기 때문에 
	if (input.files && input.files[0]) {
		var fr = new FileReader();
		//파일리더로 일고 읽는게 완료되면  만들어준 아이디에 속성값을 지정하여 사용하겠다.
		fr.onload = function(event) {
			document.getElementById('preview2').src = event.target.result;
			document.getElementById('preview2').style.display = "flex";

		};
		fr.readAsDataURL(input.files[0]);
		// 이미지파일을 읽어 온다.
	} else {
		document.getElementById('preview2').src = "";
	}
}
function loadFile3(input) {
	// 여러개의 이미지를 읽을수도 있기 때문에 
	if (input.files && input.files[0]) {
		var fr = new FileReader();
		//파일리더로 일고 읽는게 완료되면  만들어준 아이디에 속성값을 지정하여 사용하겠다.
		fr.onload = function(event) {
			document.getElementById('preview3').src = event.target.result;
			document.getElementById('preview3').style.display = "flex";

		};
		fr.readAsDataURL(input.files[0]);
		// 이미지파일을 읽어 온다.
	} else {
		document.getElementById('preview3').src = "";
	}
}
function loadFile4(input) {
	// 여러개의 이미지를 읽을수도 있기 때문에 
	if (input.files && input.files[0]) {
		var fr = new FileReader();
		//파일리더로 일고 읽는게 완료되면  만들어준 아이디에 속성값을 지정하여 사용하겠다.
		fr.onload = function(event) {
			document.getElementById('preview4').src = event.target.result;
			document.getElementById('preview4').style.display = "flex";

		};
		fr.readAsDataURL(input.files[0]);
		// 이미지파일을 읽어 온다.
	} else {
		document.getElementById('preview4').src = "";
	}
}
function loadFile5(input) {
	// 여러개의 이미지를 읽을수도 있기 때문에 
	if (input.files && input.files[0]) {
		var fr = new FileReader();
		//파일리더로 일고 읽는게 완료되면  만들어준 아이디에 속성값을 지정하여 사용하겠다.
		fr.onload = function(event) {
			document.getElementById('preview5').src = event.target.result;
			document.getElementById('preview5').style.display = "flex";

		};
		fr.readAsDataURL(input.files[0]);
		// 이미지파일을 읽어 온다.
	} else {
		document.getElementById('preview5').src = "";
	}
}


/*******************************/
/* 포트폴리오 등록시 유효성검증*/
/*******************************/
function portfoilio_check() {

	if ($.trim($('#pf_title').val()) == '') {
		alert('제목은 필수사항입니다');
		$('#pf_title').focus();
		return false;
	}
	/*if ($.trim($('#pf_type').val()) == '') {
		alert('공사유형은 필수사항입니다');
		$('#pf_type').focus();
		return false;
	}
	if ($.trim($('#pf_subtype').val()) == '') {
		alert('공사세부 유형은 필수사항입니다');
		$('#pf_subtype').focus();
		return false;
	}*/
	if ($(':radio[name="pf_range"]:checked').length < 1) {
		alert('시공범위를 선택해주세요');
		return false;
	}
	if ($.trim($('#sample6_postcode').val()) == '') {
		alert('주소는 필수사항입니다');
		$('#sample6_postcode').focus();
		return false;
	}
	if ($.trim($('#pf_area').val()) == '') {
		alert('평수를 입력하세요');
		$('#pf_area').focus();
		return false;
	}
	if ($.trim($('#pf_cost').val()) == '') {
		alert('공사비용을 입력하세요');
		$('#pf_cost').focus();
		return false;
	}
	if ($(':radio[name="pf_concept"]:checked').length < 1) {
		alert('시공 컨셉을 선택하세요');
		return false;
	}
	if ($.trim($('#pf_introduction').val()) == '') {
		alert('소개글을 입력하세요');
		$('#pf_introduction').focus();
		return false;
	}
	if ($.trim($('#pf_closing').val()) == '') {
		alert('맺음말을 입력하세요');
		$('#pf_closing').focus();
		return false;
	}
}


/***********************/
/*qna 페이지 유효성검증*/
/***********************/
function search_check() {
	if ($('#search_condition').val() == 'default' &&  $('#search_text').val() == "") {
		alert('검색유형을 선택하세요');
		$('#search_text').val("");
		return false;
	}
	/*
	if ($('#search_condition').val() != 'default' && $('#search_text').val() == "") {
		alert('검색어를 입력하세요');
		$('#search_text').focus();
		return false;
	}

	if($(':radio[name="answer"]:checked').length < 1) {
		alert('검색유형을 선택하세요');
		return false;
	
	}*/
}
/**********************/
/*문의글 답변 기능 JS */
/**********************/
function qna_reply_toggle($number) {
	var test = "#reply_" + $number;
	$(test).toggle();
}
function qna_reply($number, $id, $title, $step, $level, $type, $pagenum) { //답변 입력 함수
	$qna_no = $number;  //글번호
	$mem_id = $id; //글작성한 회원아이디
	$qna_title = $title; //원본글제목
	$qna_step = $step; //몇번째 답글인지
	$qna_level = $level; //정렬순서
	$qna_type = $type; //질문 유형
	$page =$pagenum; //페이지
	$textarea_id = "#reply_" + $number + "_textarea";
	$replytext = ($($textarea_id).val()); //댓글내용
	$.ajax({
		type: "post",
		url: 'customer_reply_ok.do?page=$page',
		data: {
			qna_ref: $qna_no, //  그룹번호 = 원본글번호
			qna_cont: $replytext, // 답글 내용
			mem_id: $mem_id, //원본글 작성 회원 아이디
			qna_step: $qna_step, //몇번째 답글인지
			qna_level: $qna_level, //정렬순서
			qna_type: $qna_type //질문 유형
		},
		datatype: "text",

		success: function(result) {
			alert('댓글등록완료!');
			
			location.reload();
		}
	});
}
function reply_del($del_qna_no, $del_qna_ref) {
	$.ajax({
		type: "get",
		url: 'customer_qna_del_ok.do?qna_no=' + $del_qna_no + '&qna_ref=' + $del_qna_ref,
		datatype: "text",
		success: function(result) {
			alert('댓글삭제완료!');
			
			
			
			location.reload();
		}
	});
}