/**********
 * 로그아웃 묻기
 */
function logout_check() {
    var x = confirm('로그아웃 하시겠습니까?');
    if (x)
        location = '/partners/logout'
    else
        return;
}
/***********/
/*좌측 메뉴  */
/***********/
$(document).ready(function () {
    $('#side_menu > li >a ').click(function () {
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
let iSecond; //초단위로 환산
let timerchecker = null;
window.onload = function () {

    fncClearTime();
    initTimer();
}
function fncClearTime() {
    iSecond = 30000; 		//로그인 시간 설정
}
Lpad = function (str, len) {
    str = str + "";
    while (str.length < len) {
        str = "0" + str;
    }
    return str;
}
initTimer = function () {
    var timer = document.getElementById("timer");
    rHour = parseInt(iSecond / 3600);
    rHour = rHour % 60;
    rMinute = parseInt(iSecond / 60);
    rMinute = rMinute % 60;
    rSecond = iSecond % 60;
    if (iSecond > 0) {
        timer.innerHTML = "&nbsp;" + Lpad(rMinute, 2) + "분" + Lpad(rSecond, 2) + "초";
        iSecond--;
        timerchecker = setTimeout("initTimer()", 1000); //1초 간격으로 체크
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
function initAjax() { //브라우저에 따른 AjaxObject 인스턴스 분기처리
    var xmlhttp;
    if (window.XMLHttpRequest) {//code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp = new XMLHttpRequest();
    } else {//code for IE6, IE5
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    return xmlhttp;
}
    /*******************/
    /*** 공사유형선택 **/
    /*******************/
    $(function () {
        $('#sel_type').change(function () {
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

    /*******************************/
    /* 포트폴리오 등록시 유효성검증*/
    /*******************************/
    function portfoilio_check() {
        $sel_type = $.trim($('#sel_type').val());

        if ($.trim($('#pf_title').val()) == '') {
            alert('제목은 필수사항입니다');
            $('#pf_title').focus();
            return false;
        }
        if ($sel_type == 'none') {
            alert('공사 유형을 선택하세요');
            return false;
        } else if ($sel_type == '주거공간' && $.trim($('#sel_house').val()) == 'none') {
            alert('공사 세부 유형을 선택하세요');
            return false;
        } else if ($sel_type == '상업공간' && $.trim($('#sel_business').val()) == 'none') {
            alert('공사 세부 유형을 선택하세요');
            return false;
        }
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
        $qna_title = 'RE:'+$title; //원본글제목
        $qna_step = $step; //몇번째 답글인지
        $qna_level = $level; //정렬순서
        $qna_type = $type; //질문 유형
        $page = $pagenum; //페이지
        $textarea_id = "#reply_" + $number + "_textarea";
        $replytext = ($($textarea_id).val()); //댓글내용
        $.ajax({
            type: "post",
            url: 'customer_reply_ok?page=$page',
            data: {
                qna_ref: $qna_no, //  그룹번호 = 원본글번호
                qna_cont: $replytext, // 답글 내용
                qna_title: $qna_title, //원본글제목
                mem_id: $mem_id, //원본글 작성 회원 아이디
                qna_step: $qna_step, //몇번째 답글인지
                qna_level: $qna_level, //정렬순서
                qna_type: $qna_type //질문 유형
            },
            datatype: "int",
            success: function (data) {
                alert('댓글등록완료!');
                location.reload();
            }
        });
    }

    function reply_del($del_qna_no, $del_qna_ref) {
        $.ajax({
            type: "get",
            url: 'customer_qna_del_ok?qna_no=' + $del_qna_no + '&qna_ref=' + $del_qna_ref,
            datatype: "int",
            success: function (data) {
                alert('댓글삭제완료!');
                location.reload();
            }
        });
    }




