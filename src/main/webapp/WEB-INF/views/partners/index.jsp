<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>DOZIP PARTNERS</title>
    <link rel="stylesheet" href="/css/partners/join_style.css">
    <script src="/js/partners/jquery.js"></script>
    <script src="/js/partners/join.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>

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
            grid-template-columns: repeat(2, 1fr);
            grid-gap: 1rem;
            grid-auto-rows: minmax(1em, auto);
        }

        .index_item {
            padding: 10px;
            box-shadow: 2px 2px 8px 3px rgb(0 0 0 / 14%);
            background: #ffffff00;
            border-radius: 10px;
            transition: all .35s;
        }

        .index_item:nth-child(1) {
            grid-column: 1/4;
            display: flex;
            justify-content: center;
        }

        #pmain_cont .index_item:nth-child(1) div {
            min-width: 130px;
            height: 100px;
            border: none;
            padding: 10px;
            margin-left: 10px;
            display: grid;
        }

        #pmain_cont .index_item:nth-child(1) div button {
            border: none;
            background: none;
            font-size: 16px;
        }
        #pmain_cont .index_item:nth-child(1) div button:hover {
            font-weight: bold;

        }

        #pmain_cont .index_item:nth-child(1) div button:hover, #pmain_cont .index_item:nth-child(1) div label:hover {
            cursor: pointer;
        }

        .index_item:nth-child(4) {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            grid-gap: 1rem;
            grid-auto-rows: minmax(1em, auto);
            min-width: 60px;
            border: none;
            border-radius: 4px;
            padding: 10px;
            margin-left: 10px;
            grid-row: 2/4;
            grid-column: 3;
        }
        .index_item:nth-child(4) div{
            text-align: center;
        }

        #myChart, #myChart2, #myChart3 {
            border: 1px dotted #00000091;
            margin: 0 auto;
            border-radius: 3px;

        }

        canvas#myChart2 {
            margin-top: -20px;
        }

        i.xi-angle-right {
            margin-top: 80px;
        }

        .index_item div label {
            display: inline;
            width: 18px;
            margin: 0 auto;
            font-size: 26px;
            font-weight: bold;
        }

        .index_item div label:hover {
            color: #178BFF;
        }

        #mointhy_balnace {
            border: none;
            margin: 0 auto;
        }

        #mointhy_balnace th {
            text-align: left;
            font-size: 20px;
            width: 100px;
        }

        mointhy_balnace td {
            font-size: 16px;

        }

        .mointhy_balnace_title1 {
            margin-top: 15px;
            text-align: center;
            font-size: 2em;
        }

        .mointhy_balnace_title2 {
            text-align: center;
            margin: 20px 0px 30px 0px;
        }
        .index_item_count{
            margin-top: 7px;
        }
        .go_balance{
            padding-top: 15px;
            text-align: center;
        }
        .go_balance a {
            font-weight: bolder;

            text-decoration: none;
        }
        .go_balance a:visited{
            color: black;
        }
        .go_balance a:active{
            color: steelblue;
        }
    </style>

    <div id='pmain_cont'>
        <div class="index_item"> <%--grid 1 --%>
            <div>
                <label for="status01">0</label>
                <button id="status01">견적요청</button>
            </div>
            <i class="xi-angle-right"></i>
            <div>
                <label for="status02">0</label>
                <button id="status02">계약요청</button>

            </div>
            <i class="xi-angle-right"></i>
            <div>
                <label for="status03">0</label>
                <button id="status03">계약완료</button>
            </div>
            <i class="xi-angle-right"></i>
            <div>
                <label for="status04">0</label>
                <button id="status04">공사중</button>

            </div>
            <i class="xi-angle-right"></i>
            <div>
                <label for="status05">0</label>
                <button id="status05">공사완료</button>
            </div>

        </div>
        <div class="index_item"> <%--grid 2 --%>
            <canvas id="myChart" width="450" height="300"></canvas>
        </div>
        <div class="index_item"> <%--grid 3 --%>

            <h1 class="mointhy_balnace_title1"> 매출현황<span style="font-size: 18px">(${pv.pay_date1})</span></h1>
            <h2 class="mointhy_balnace_title2"><fmt:formatNumber
                    value="${(pv.pay_cost1 +pv.pay_cost2+ pv.pay_cost3)*10000}" pattern="#,###"/> 원</h2>


            <table id='mointhy_balnace'>
                <tr>
                    <th>계약금</th>
                    <td><fmt:formatNumber value="${pv.pay_cost1*10000}" pattern="#,###"/> 원</td>
                </tr>
                <tr>
                    <th>중도금</th>
                    <td><fmt:formatNumber value="${pv.pay_cost2*10000}" pattern="#,###"/> 원</td>
                </tr>
                <tr>
                    <th>잔&nbsp;&nbsp;&nbsp;금</th>
                    <td><fmt:formatNumber value="${pv.pay_cost3*10000}" pattern="#,###"/> 원</td>
                </tr>
                <tr>
                    <td class="go_balance" colspan="2"><a href="/partners/balance_details">보러가기></a> </td>
                </tr>
            </table>
        </div>
        <div class="index_item">  <%--grid 4 --%>
            <div>
                <div>고객 문의</div>
                <div class="index_item_count">0</div>
            </div>
            <div>
                <div> 시공 요청</div>
                <div class="index_item_count"> 0</div>
            </div>
            <div>
                <div> 계약 요청</div>
                <div class="index_item_count"> 0</div>
            </div>
            <div>
                <div> 포트폴리오</div>
                <div class="index_item_count">
                    <span style="font-weight: bolder; font-size: 14px; color: #0064CD"> ${portfolioCount}</span> 개
                </div>
            </div>
            <div>
                <div> 업체 평점</div>
                <div class="index_item_count">5 점</div>
            </div>
        </div>

        <div class="index_item"><br> <%--grid 5 --%>
            <canvas id="myChart2" width="450" height="300"></canvas>
        </div>
        <div class="index_item">  <%--grid 6 --%>
            <canvas id="myChart3" width="450" height="300"></canvas>

        </div>
    </div>
    <script>
        $('#status01').click(function () {
            location.href = '/partners/construct_request'
        });
        $('#status02').click(function () {
            location.href = '/partners/estimate_list'
        });
        $('#status03').click(function () {
            location.href = '/partners/interior_list'
        });
        $('#status04').click(function () {
            location.href = '/partners/interior_list'
        });
        $('#status05').click(function () {
            location.href = '/partners/balance_details'
        });
    </script>


    <script>
        const ctx = document.getElementById('myChart').getContext('2d');
        const myChart = new Chart(ctx, {
            // chart type(차트 형태) : bar, line, pie
            type: 'line',

            // chart data(차트 데이터-객체형태)
            data: {
                // labels -> x축에 들어갈 데이터
                labels: ['Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
                datasets: [{
                    // label : 차트제목
                    label: '월별 시공 현황',

                    // data : x축 label에 대응되는 데이터 값
                    data: [12, 19, 3, 5, 2, 3],

                    // 차트 스타일 지정
                    backgroundColor: [
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(153, 102, 255, 0.2)',
                        'rgba(255, 159, 64, 0.2)'
                    ],
                    borderColor: [
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 99, 132, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)'
                    ],
                    borderWidth: 2
                }]
            },
            options: {

                responsive: false,
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    </script>
    <script>
        let ctx2 = document.getElementById('myChart2').getContext('2d');
        const myChart2 = new Chart(ctx2, {
            // chart type(차트 형태) : bar, line, pie
            type: 'bar',

            // chart data(차트 데이터-객체형태)
            data: {
                // labels -> x축에 들어갈 데이터
                labels: ['Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
                datasets: [{
                    // label : 차트제목
                    label: '월별 정산 내역',
                    // data : x축 label에 대응되는 데이터 값
                    data: [12, 19, 3, 5, 2, 3],
                    // 차트 스타일 지정
                    backgroundColor: [

                        'rgba(255, 99, 132, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(153, 102, 255, 0.2)',
                        'rgba(255, 159, 64, 0.2)',
                        'rgba(54, 162, 235, 0.2)'
                    ],
                    borderColor: [

                        'rgba(255, 99, 132, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)',
                        'rgba(54, 162, 235, 1)'
                    ],
                    borderWidth: 2
                }]
            },
            options: {
                responsive: false,

                indexAxis: 'y',
                scales: {
                    x: {
                        beginAtZero: true
                    }
                }
            }
        });
    </script>
    <script>
        const ctx3 = document.getElementById('myChart3').getContext('2d');
        const myChart3 = new Chart(ctx3, {
            // chart type(차트 형태) : bar, line, pie
            type: 'pie',

            // chart data(차트 데이터-객체형태)
            data: {
                // labels -> x축에 들어갈 데이터
                labels: ['입찰', '지정'],
                datasets: [{
                    // label : 차트제목
                    label: '입찰/지정',

                    // data : x축 label에 대응되는 데이터 값
                    data: [12, 19],

                    // 차트 스타일 지정
                    backgroundColor: [
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 99, 132, 0.2)',
                        // 'rgba(255, 206, 86, 0.2)',
                        // 'rgba(75, 192, 192, 0.2)',
                        // 'rgba(153, 102, 255, 0.2)',
                        // 'rgba(255, 159, 64, 0.2)'
                    ],
                    borderColor: [
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 99, 132, 1)',
                        // 'rgba(255, 206, 86, 1)',
                        // 'rgba(75, 192, 192, 1)',
                        // 'rgba(153, 102, 255, 1)',
                        // 'rgba(255, 159, 64, 1)'
                    ],
                    borderWidth: 2
                }]
            },
            options: {
                responsive: false,
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    </script>
    </c:if>
    <jsp:include page="include/footer.jsp"/>


		