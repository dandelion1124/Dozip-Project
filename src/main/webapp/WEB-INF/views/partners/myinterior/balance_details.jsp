<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="../include/header.jsp"/>
<style>
    #balance_detail_title {
        font-size: 26px;
        font-weight: 530;
        border-bottom: 4px solid #000;
    }

    #balance_detail_msg {
        color: darkslateblue;
        font-size: 16px;
        font-family: fantasy;
        margin-bottom: 10px;
    }

    * {
        line-height: 2em;
    }

    #balance_detail_top_cont {
        padding-bottom: 20px;
    }

    #balance_detail_select_status input {
        background: none;
        width: 100%;
        height: 40px;
        margin: 0px;
        border: 1px solid #B3B9BE;
        border-bottom: transparent;
    }

    #balance_detail_select_status input:active {
        background: dimgray;
    }

    #balance_detail_search_bar_div > div {
        width: 95.5%;
        height: 100px;
        border: 3px solid dimgray;
        margin: 40px 0px;
        padding: 14px;
    }

    div#balance_detail_select_status {
        display: flex;
        margin-bottom: 20px;
    }

    #balance_detail_select_status_div1 {
        width: 15%;
        border: 2px solid dimgray;
        border-bottom: transparent;
        background: cornflowerblue;
    }

    #balance_detail_select_status_div2 {
        width: 15%;
        border-bottom: 2px solid dimgray;
        border-left: transparent;
    }

    #balance_detail_select_status_div3 {
        width: 70%;
        border-bottom: 2px solid dimgray;
    }

    #balance_detail_main_table_div table {
        width: 100%;
        border: none;
        border-collapse: collapse;
        margin-bottom: 50px;
    }

    #balance_detail_main_table_div th {
        padding: 10px 20px;
        background: #acb9e5;
    }

    #balance_detail_main_table_div tr {
        border-bottom: 1px solid grey;
    }

    #balance_detail_main_table_div td {
        padding: 7px 20px;
        text-align: center;
    }

    input.detail_button {
        background: #00BFFF;
        padding: 6px 10px;
        border: none;
        border-radius: 3px;
        color: white;
    }

    input.detail_button:active {
        background: #B3B9BE;
        color: black;
    }
</style>
<p> | 내공사 > 정산내역</p>
${pay_state}
<input type="radio" value="시공완료" name="test" id="select_status_btn1" <c:if test="${pay_state=='시공완료'}"> checked</c:if>    >
<input type="radio" value="시공중" name="test" id="select_status_btn2" <c:if test="${pay_state=='시공중'}"> checked</c:if>>
<div id="balance_detail_top_cont">
    <div id="balance_detail_title">정산내역</div>
    <div id="balance_detail_msg">
        시공완료/시공중 정산내역을 확인할 수 있는 페이지입니다
    </div>
</div>

<div id="balance_detail_title_bar">
    <div id="balance_detail_select_status">
        <div id="balance_detail_select_status_div1">
            <label for="select_status_btn1">시공완료</label></div>
        <div id="balance_detail_select_status_div2">
            <label for="select_status_btn2">시공중</label></div>
        <div id="balance_detail_select_status_div3"></div>
    </div>
</div>
<div id="balance_detail_search_bar_div">
    <div id="balance_detail_search_bar1">
        <h1>시공완료 정산 내역 검색바 기능 구상중</h1>

    </div>
    <div id="balance_detail_search_bar2" style="display: none">
        <h1 style="color:darkgoldenrod">시공중 정산 내역 검색바 기능 구상중</h1>
    </div>
</div>
<div id="balance_detail_main_table_div">

    <table id="balance_detail_main_table1">
        <tr>
            <th>기간</th>
            <th>완료건수</th>
            <th>정산 금액</th>
            <th>상세내역</th>
        </tr>

        <c:if test="${empty plist}">
            <tr>
                <td colspan="4">조회된 목록이 없습니다</td>
            </tr>
        </c:if>
        <c:if test="${!empty plist}">
            <c:forEach var="p" items="${plist}">
            <tr>
                <td>${p.pay_date1}</td>
                <td>${p.count}</td>
                <td>${p.pay_cost1 + p.pay_cost2 +p.pay_cost3} 만원</td>
                <td><input type="button" value="상세내역" class="detail_button"></td>
            </tr>
            </c:forEach>
        </c:if>
        <tr>
            <th>합계</th>
            <th>${pv.count}건</th>
            <th>${pv.pay_cost1 + pv.pay_cost2 +pv.pay_cost3} 만원</th>
            <th></th>
        </tr>
    </table>
    <table id="balance_detail_main_table2" style="display: none;">
        <tr>
            <th>기간</th>
            <th>진행중공사</th>
            <th>정산 금액</th>
            <th>상세내역</th>
        </tr>
        <tr>
            <td>sample</td>
            <td>sample</td>
            <td>sample</td>
            <td><input type="button" value="상세내역" class="detail_button"></td>
        </tr>
        <tr>
            <td>sample</td>
            <td>sample</td>
            <td>sample</td>
            <td><input type="button" value="상세내역" class="detail_button"></td>
        </tr>
        <tr>
            <td>2022년 7월</td>
            <td>sample</td>
            <td>sample</td>
            <td><input type="button" value="상세내역" class="detail_button"></td>
        </tr>
        <tr>
            <td>2022년 8월</td>
            <td>sample</td>
            <td>sample</td>
            <td><input type="button" value="상세내역" class="detail_button"></td>
        </tr>
        <tr>
            <td>2022년 9월</td>
            <td>sample</td>
            <td>sample</td>
            <td><input type="button" value="상세내역" class="detail_button"></td>
        </tr>
        <tr>
            <td>2022년 10월</td>
            <td>sample</td>
            <td>sample</td>
            <td><input type="button" value="상세내역" class="detail_button"></td>
        </tr>
        <tr>
            <th>합계</th>
            <th>100건</th>
            <th>1,000,000원</th>
            <th></th>
        </tr>
    </table>
</div>




<script>

    let btn1 = document.getElementById("select_status_btn1");
    let btn2 = document.getElementById("select_status_btn2");
    let div1 = document.getElementById("balance_detail_select_status_div1");
    let div2 = document.getElementById("balance_detail_select_status_div2");
    let search1 = document.getElementById("balance_detail_search_bar1");
    let search2 = document.getElementById("balance_detail_search_bar2");
    let table1 = document.getElementById("balance_detail_main_table1");
    let table2 = document.getElementById("balance_detail_main_table2");

    let style = "border : 2px solid dimgray";

    $('#select_status_btn1').click(function (){
        location='/partners/balance_details?pay_state='+'시공완료';

        div1.style.cssText = 'border : 2px solid dimgray; background:cornflowerblue; border-bottom:transparent';
        div2.style.cssText = 'border:transparent; border-bottom:2px solid dimgray';
        table1.style.display = 'inline-table';
        table2.style.display = 'none';
        search1.style.display = 'block';
        search2.style.display = 'none';

    });
    $('#select_status_btn2').click(function (){
        location='/partners/balance_details?pay_state='+'시공중';
        div1.style.cssText = 'border:transparent; border-bottom:2px solid dimgray; background:none';
        div2.style.cssText = 'border : 2px solid dimgray; background:cornflowerblue; border-bottom:transparent';
        table1.style.display = 'none';
        table2.style.display = 'inline-table';
        search1.style.display = 'none';
        search2.style.display = 'block';
    });



</script>
<jsp:include page="../include/footer.jsp"/>

