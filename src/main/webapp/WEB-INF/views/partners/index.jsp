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
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

</head>
<body>
<c:if test="${empty p_id}">
<article id="join_wrap">
    <div id=signin_cont>
        <div id="signin_title">
            <div><a href="#"><img src="/images/partners/partners_logo.png" alt="메인로고"></a></div>
        </div>
        <form id="login_form">
            <div>
                <input type="text" name="p_Id" id="signin_id" placeholder="아이디">
                <span id="idcheck"></span>
            </div>
            <div>
                <input type="password" name="p_Pw" id="signin_pw" placeholder="비밀번호">
                <span id="pwcheck"></span>
            </div>
            <div>
                <input type="button" value="로그인" id="login" onclick="login_proc()"></div>
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
    <script>

    </script>
    </c:if>
    <c:if test="${!empty p_id }">
        <jsp:include page="include/header.jsp"/>
    <style>
        /* 잠시 옮겨놓음 */
        @media all and (max-width: 930px) {
            span.hide_1 {
                display: none;
            }
        }
        #pmain_cont {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            grid-gap: 1rem;
            grid-auto-rows: minmax(2em, auto);
            background: #B3B9BE;
        }
        #pmain_cont div {
          border: 2px solid rgba(0, 0, 255, 0.26);
        }
        .index_item:nth-child(1) {
            grid-column: 1/4;
            background: #00BFFF;
        }
    </style>


    <div id='pmain_cont'>
        <div class="index_item">
            <h1>대시보드</h1>
        </div>
        <div class="index_item">현재 시공중인 공사 완성도<br>
            월별 총 시공계약 : 60건<br>
            현재 진행중 시공 : 20건/60건<br>
            월별 시공 중단 : 1건<br>
        </div>
        <div class="index_item"> 월별 견적 신청 내역 <br><br>


            산야에 대고, 우리는 봄날의 아니더면, 이것이야말로 사막이다.
            소리다.이것은 산야에 어디 뿐이다. 인생에 기관과 청춘이
            만천하의 것이다. 불어 못할 우리 얼음이 오아이스도 행복스럽고 쓸쓸한 일월과
            봄바람이다. 소담스러운 사는가 길지 크고 것이다.  그들의 오직
            싸인 있는가? 속에서 그와 피고 들어 피부가 그리하였는가?

        </div>
        <div class="index_item"> 월별 입찰 내역<br><br>불러 그들은 심장의 어디 무엇을 위하여서.
            가슴이 밥을 장식하는 힘차게 열락의 위하여서, 듣는다. </div>
        <div class="index_item">월별 시공 내역<br><br></div>
        <div class="index_item"> 공지사항<br><br>않는 방황하였으며, 피가 이는
            하였으며, 대한 뿐이다. 장식하는 찾아 위하여서 청춘의 위하여서,</div>
        <div class="index_item"> 정산 예정 금액<br><br></div>
    </div>
    </c:if>
    <jsp:include page="include/footer.jsp"/>


		