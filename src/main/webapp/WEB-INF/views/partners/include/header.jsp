<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>DOZIP PARTNERS</title>
    <link rel="stylesheet" href="/css/partners/main_style.css">
    <link rel='stylesheet' href="/css/partners/calendar.css"/>
    <link rel="stylesheet" href="/css/partners/partners_style.css">
    <link rel="stylesheet" href="/css/partners/partners_style2.css">
    <link rel="stylesheet" href="/css/partners/qna_review.css">
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/> <!--달력css-->


    <script src="/js/partners/jquery.js"></script>
    <script src="/js/partners/javascript.js"></script>
    <script src="/js/partners/javascript2.js"></script>
    <script src='/js/partners/calendar.js'></script>
    <script src='/js/address.js'></script>

    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script> <%-- 달력 --%>
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script> <%-- 달력 --%>


    <style>
        input[id='menuicon']{
            display:none;
        }
        input[id='menuicon']+label {
            display: block;
            width: 40px;
            height: 30px;
            position:fixed;

            transition: all .35s;
            cursor: pointer;
        }
        input[id="menuicon"]+label span {
            display: block;
            position: absolute;
            width: 100%;
            height: 4px;
            border-radius: 5px;
            background: #000;
            transition: all .35s;
        }
        input[id='menuicon'] + label span:nth-child(1) {
            top:0;
        }
        input[id='menuicon'] + label span:nth-child(2) {
            top:50%;
            transform: translateY(-50%);
        }
        input[id='menuicon'] + label span:nth-child(3) {
            bottom: 0;
        }
        input[id='menuicon']+ label{
            z-index: 2;
        }
        input[id='menuicon']:checked + label span:nth-child(1) {
            top :50%;
            transform: translateY(-50%) rotate(45deg);
        }
        input[id='menuicon']:checked + label span:nth-child(2) {
            opacity: 0;
        }
        input[id='menuicon']:checked + label span:nth-child(3) {
            bottom: 50%;
            transform: translateY(50%) rotate(-45deg);
        }
        div[id=side_wrap] {
            background-color:#e3e88b;
            position: relative;
            min-width:162px;
            top:0;
            left:-300px;
            z-index: 1;
            transition: all .35s;
        }

        input[id='menuicon']:checked + label + div {
            left:0;
        }
    </style>
</head>

    <%
if(session.getAttribute("p_id")==null) {
	out.println("<script>");
	out.println("alert('시간이 만료되어 로그아웃되었습니다!')");
	out.println("location='/partners/main'");
	out.println("</script>");
 }
%>
<body>
<!-- 좌측 사이드바 영역 -->
<div id="wrap">
    <input type="checkbox" id="menuicon" checked="checked">
    <label for="menuicon">
        <span></span>
        <span></span>
        <span></span>
    </label>
    <div id="side_wrap">

        <ul id="side_menu">
            <li style="height: 100px;">
            </li>
            <li><a href="/partners/main">&nbsp;&nbsp;&nbsp;PARTNERS</a></li>
            <li><a href="#">&nbsp;&nbsp;&nbsp;요&nbsp;&nbsp;금&nbsp;&nbsp;제</a>
                <ul>
                    <li><a href="/partners/planning">요금제안내</a></li>
                </ul>
            </li>
            <li><a href="#">&nbsp;&nbsp;&nbsp;견적&nbsp;의뢰</a>
                <ul>
                    <li><a href="/partners/bid">입찰의뢰</a></li>
                    <li><a href="/partners/construct_request">시공요청</a></li>
                </ul>
            </li>
            <li><a href="#">&nbsp;&nbsp;&nbsp;견적&nbsp;관리</a>
                <ul>
                    <li><a href="/partners/estimate_list">견적목록</a></li>
                </ul>
            </li>
            <li><a href="#">&nbsp;&nbsp;&nbsp;내&nbsp;&nbsp;공&nbsp;&nbsp;사</a>
                <ul>
                    <li><a href="/partners/interior_list">공사내역</a></li>
                    <li><a href="/partners/schedule_list">일정관리</a></li>
                    <li><a href="/partners/balance_details">정산내역</a></li>
                </ul>
            </li>
            <li><a href="#">&nbsp;&nbsp;&nbsp;시공&nbsp;사례</a>
                <ul>
                    <li><a href="/partners/upload">등록</a></li>
                    <li><a href="/partners/portfolio_list">수정/삭제</a></li>
                </ul>
            </li>
            <li><a href="#">&nbsp;&nbsp;&nbsp;광고&nbsp;관리</a>
                <ul>
                    <li><a href="/partners/marketing">노출프로모션</a></li>
                </ul>
            </li>
            <li><a href="#">&nbsp;&nbsp;&nbsp;고객&nbsp;관리</a>
                <ul>
                    <li><a href="/partners/customer_qna">고객문의</a></li>
                    <li><a href="/partners/review">고객후기</a></li>
                </ul>
            </li>
            <li><a href="#">&nbsp;&nbsp;&nbsp;My&nbsp;Page</a>
                <ul>
                    <li><a href="/partners/data_manage">내 정보관리</a></li>
                    <li><a href="/partners/pw_change">비밀번호 변경</a></li>
                </ul>
            </li>
        </ul>
    </div>
    <div id="cont_wrap">
        <header>
            <div id="top_bar">
                <div id=top_title>
                    <div id="menu_show_hide">

                      </div>
                    <div><img id="header_main_logo" src="/images/partners/dozip_logo.png" alt="메인로고"></div>
                    <div>PARTNERS PAGE</div>
                </div>
                <div class="msg">
						<span class="hide_1"> ${businessName} 님 환영합니다<span id="timer"></span></span>
                        <span class="hide_2"><input type="button" value="로그아웃" onclick="logout_check()"></span>
                </div>
            </div>

        </header>

        <script>
            $('#menu_show_hide_img').click(function () {
                //1180px
                let margin = $('#top_bar').css('margin-left');
                if (window.innerWidth > 1173) {
                    $('#side_wrap').toggle(400);


                    // if (margin == '0px') {
                    //     $('#side_wrap').css({'display': 'block'});
                    //    // $('#top_bar').css({'margin-left': '161px'});
                    //     //$('#footer_mediaquery').css({'margin-left': '160px'});
                    //     //$('#main_cont').css({'margin-left': '160px'});
                    //     //$('#fotter_setting').css({'display': 'block'});
                    // } else {
                    //     $('#side_wrap').css({'display': 'none'});
                    //   //  $('#top_bar').css({'margin-left': '0px'});
                    //    // $('#footer_mediaquery').css({'margin-left': '0px'});
                    //    // $('#main_cont').css({'margin-left': '0px'});
                    //    // $('#fotter_setting').css({'display': 'none'});
                    // }
                }
            });
        </script>
        <article id="main_cont">