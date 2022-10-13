<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>DOZIP PARTNERS</title>
    <link rel="stylesheet" href="/css/partners/join_style.css">
    <script src="/js/partners/jquery.js"></script>
    <script src="/js/partners/join.js"></script>
</head>
<body>
<c:if test="${empty id}">
<article id="join_wrap">
    <div id=signin_cont>
        <div id="signin_title">
            <div><a href="#"><img src="/images/partners/partners_logo.png" alt="메인로고"></a></div>
        </div>
        <form action="login_ok" method="post" id="로그인 폼" onsubmit="return login_check();">
            <div>
                <input type="text" name="pId" id="signin_id" placeholder="아이디">
                <span id="idcheck"></span>
            </div>
            <div>
                <input type="password" name="pPw" id="signin_pw" placeholder="비밀번호">
                <span id="pwcheck"></span>
            </div>
            <div>
                <input type="submit" value="로그인" id="login"></div>
            <div id=bottom_button1>
                <div id=id_save>
                    <div><input type="checkbox" id=id_save_checkbox></div>
                    <div>
                        <button type="button" id=id_save_button>아이디 저장</button>
                    </div>
                </div>
                <div><input type="button" id="signup_button" value="회원가입" onclick="location='/partners/signup'"></div>
            </div>
        </form>
        <div id=bottom_button2>
            <div> 아이디 또는 비밀번호를 잃어버리셨다면 ?</div>
            <div><input type="button" id="" value="문의하기" onclick="location='partners_findinfo'"></div>
        </div>
    </div>
    </c:if>
    <c:if test="${!empty id }">
        <jsp:include page="include/header.jsp"/>
    <style>
        /* 잠시 옮겨놓음 */
        @media all and (max-width: 930px) {
            span.hide_1 {
                display: none;
            }
        }
        #pmain_cont > div {

            border: 1px solid black;
            width: 400px;
            height: 300px;
            margin: 20px;
            padding: 30px;
        }
        #pmain_cont {
            display: flex;
            flex-wrap: wrap;
        }
    </style>

    <div id='pmain_title'>
        <h1>대시보드</h1>
    </div>
    <div id='pmain_cont'>
        <div>현재 시공중인 공사 완성도<br>
            월별 총 시공계약 : 60건<br>
            현재 진행중 시공 : 20건/60건<br>
            월별 시공 중단 : 1건<br>
        </div>
        <div> 월별 견적 신청 내역</div>
        <div> 월별 입찰 내역</div>
        <div>월별 시공 내역</div>
        <div> 공지사항</div>
        <div> 정산 예정 금액</div>
    </div>
    </c:if>
    <jsp:include page="include/footer.jsp"/>


		