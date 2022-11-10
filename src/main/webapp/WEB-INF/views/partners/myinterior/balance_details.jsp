<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../include/header.jsp"/>

<style>
    #balance_detail_title {
        font-size: 26px;
        font-weight: 530;
        border-bottom: 3px solid #000;
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
        padding: 2px 0px;
        background: #acb9e5;
    }

    #balance_detail_main_table_div tr {
        border-bottom: 1px solid grey;
    }

    #balance_detail_main_table_div td {
        padding: 2px 0px;
        text-align: center;
    }

    input.detail_button {
        background: #00BFFF;
        padding: 2px 10px;
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
<div id="balance_detail_top_cont">
    <div id="balance_detail_title">정산내역</div>
    <div id="balance_detail_msg">
        시공완료/시공중 정산내역을 확인할 수 있는 페이지입니다
    </div>
</div>

<div id="balance_detail_title_bar">
    <div id="balance_detail_select_status">
        <div id="balance_detail_select_status_div1">
            <input type="button" id="select_status_btn1" value="시공완료"></div>
        <div id="balance_detail_select_status_div2">
            <input type="button" id="select_status_btn2" value="시공중"></div>
        <div id="balance_detail_select_status_div3"></div>
    </div>
</div>


<%--
<div id="balance_detail_search_bar_div">
    <div id="balance_detail_search_bar1">
        <h4>시공완료 </h4>

    </div>
    <div id="balance_detail_search_bar2" style="display: none">
        <h4>시공중</h4>
    </div>
</div>

--%>
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
                    <td>${p.count} 건</td>
                    <td> <fmt:formatNumber value="${(p.pay_cost1 + p.pay_cost2 +p.pay_cost3)*10000}" pattern="#,###"/> 원</td>
                    <td><input type="button" value="상세내역" class="detail_button" onclick="balance_detail('${p.pay_date1}')"></td>
                </tr>
            </c:forEach>
        </c:if>
        <tr>
            <th>합계</th>
            <th>${pv.count} 건</th>
            <th><fmt:formatNumber value="${(pv.pay_cost1 + pv.pay_cost2 +pv.pay_cost3)*10000}" pattern="#,###"/> 원</th>
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
        <c:if test="${empty plist_ing}">
            <tr>
                <td colspan="4">조회된 목록이 없습니다</td>
            </tr>
        </c:if>
        <c:if test="${!empty plist_ing}">
            <c:forEach var="p" items="${plist_ing}">
                <tr>
                    <td>${p.pay_date1}</td>
                    <td>${p.count} 건</td>
                    <td> <fmt:formatNumber value="${(p.pay_cost1 + p.pay_cost2 +p.pay_cost3)*10000}" pattern="#,###"/> 원</td>
                    <td><input type="button" value="상세내역" class="detail_button" onclick="balance_detail_ing('${p.pay_date1}')"></td>
                </tr>
            </c:forEach>
        </c:if>
        <tr>
            <th>합계</th>
            <th>${pv_ing.count} 건</th>
            <th><fmt:formatNumber value="${(pv_ing.pay_cost1 + pv_ing.pay_cost2 +pv_ing.pay_cost3)*10000}" pattern="#,###"/> 원</th>
            <th></th>
        </tr>
    </table>
</div>
<script>
    function balance_detail(pay_date1) {


        var popupWidth = 1100;
        var popupHeight = 500;
        var popupX = (window.screen.width / 2) - (popupWidth / 2);
        // 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주었음
        var popupY = (window.screen.height / 2) - (popupHeight / 2);
        // 만들 팝업창 height 크기의 1/2 만큼 보정값으로 빼주었음F
        window.open(`./monthly_detail?pay_date=` + pay_date1, 'Child', 'width=' + popupWidth + ', height=' + popupHeight + ', top=' + popupY + ', left=' + popupX + 'resizable=no');
    }
    function balance_detail_ing(pay_date1) {

        var popupWidth = 1100;
        var popupHeight = 500;
        var popupX = (window.screen.width / 2) - (popupWidth / 2);
        // 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주었음
        var popupY = (window.screen.height / 2) - (popupHeight / 2);
        // 만들 팝업창 height 크기의 1/2 만큼 보정값으로 빼주었음F
        window.open(`./monthly_detail?pay_date_ing=` + pay_date1, 'Child', 'width=' + popupWidth + ', height=' + popupHeight + ', top=' + popupY + ', left=' + popupX + 'resizable=no');
    }
</script>






<script>

    const btn1 = document.getElementById("select_status_btn1");
    const btn2 = document.getElementById("select_status_btn2");
    const div1 = document.getElementById("balance_detail_select_status_div1");
    const div2 = document.getElementById("balance_detail_select_status_div2");
    const search1 = document.getElementById("balance_detail_search_bar1");
    const search2 = document.getElementById("balance_detail_search_bar2");
    const table1 = document.getElementById("balance_detail_main_table1");
    const table2 = document.getElementById("balance_detail_main_table2");

    const style = "border : 2px solid dimgray";
    btn1.onclick = function (event) {
        div1.style.cssText = 'border : 2px solid dimgray; background:cornflowerblue; border-bottom:transparent';
        div2.style.cssText = 'border:transparent; border-bottom:2px solid dimgray';
        table1.style.display = 'inline-table';
        table2.style.display = 'none';
        search1.style.display = 'block';
        search2.style.display = 'none';
    }
    btn2.onclick = function (event) {
        div1.style.cssText = 'border:transparent; border-bottom:2px solid dimgray; background:none';
        div2.style.cssText = 'border : 2px solid dimgray; background:cornflowerblue; border-bottom:transparent';
        table1.style.display = 'none';
        table2.style.display = 'inline-table';
        search1.style.display = 'none';
        search2.style.display = 'block';
    }


</script>
<jsp:include page="../include/footer.jsp"/>

