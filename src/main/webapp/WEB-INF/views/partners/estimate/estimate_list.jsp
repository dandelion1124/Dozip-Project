<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="../include/header.jsp"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="stylesheet" href="/css/partners/estimate.css">
<style>
    table#est_list_table input[type=button]:hover {
        background: #00BFFF;
        border-radius: 3px;
        opacity:80%;
        text-decoration: underline;
    }
</style>
<p> | 견적관리 > 견적목록</p>
<div id="estlist_top_cont">
    <div id="estlist_title">견적목록</div>
    <div id="estlist_msg">
       계약서를 작성 한 후 계약금 지불이 완료되면 시공 일정에 맞추어 공사를 진행해주시기 바랍니다
    </div>
    <div id='est_list_explain'>

        <h3>계약이 파기되는 상황 </h3>
        <p><img src="/images/dozip/blt_check_red.jpg"> 고객이 계약금을 견적 완료일로부터 3일내로 지급하지 않을경우<br>
            <img src="/images/dozip/blt_check_red.jpg"> 고객이나 파트너스가 계약을 원치 않을경우 </p>
        <img src="/images/dozip/blt_check_red.jpg"> <b>이럴 경우에는 제시된 계약금의 전부를 상대방에게 지불해야한다</b>
    </div>
</div>
<table id='est_list_table'>
    <thead>
    <tr>
        <th>NO</th>
        <th>시공상세정보</th>
        <th>공사대금(만원)</th>
        <th>시공일정</th>
        <th>계약진행상황</th>
        <th>계약날짜</th>
        <th>비고</th>
    </tr>
    </thead>
    <tbody>
    <c:if test="${!empty elist }">
        <c:forEach var="e" items="${elist}">
            <c:if test="${empty clist}">   <%--계약서 테이블이 없다면 --%>
                <tr>
                    <td>${e.est_num}</td>
                    <td><input class='est_detail btn' type="button" value="${e.est_addr} 시공요청" onclick="est_detail(${e.est_num})"></td>
                    <td><fmt:formatNumber value="${e.est_bud}" type="number"/>만원</td>
                    <td>${fn:substring(e.est_start,0,10)}~ ${fn:substring(e.est_end,0,10)}</td>

                    <td>
                        <button class="write_contract_btn" onclick="write_contract('${e.est_num}')">
                            계약서작성하기
                        </button>
                    </td>
                    <td>계약서 작성전</td>
                    <td>
                        <button onclick="est_cancel()" class="cancel_contract_btn">계약해지</button>
                    </td>
                </tr>
            </c:if> <%--${empty clist}--%>
            <c:if test="${e.est_check=='계약요청'}">
                <tr>
                    <td>${e.est_num} </td>
                    <td><input class='est_detail btn' type="button" value="${e.est_addr} 시공요청" onclick="est_detail('${e.est_num}')"></td>
                    <td><fmt:formatNumber value="${e.est_bud}" type="number"/>만원</td>
                    <td>${fn:substring(e.est_start,0,10)}~ ${fn:substring(e.est_end,0,10)}</td>
                    <td>
                        <button class="write_contract_btn" onclick="write_contract('${e.est_num}')">
                            계약서작성하기
                        </button>
                    </td>
                    <td>계약서 작성전</td>
                    <td>
                        <button onclick="est_cancel()" class="cancel_contract_btn">계약해지</button>
                    </td>
                </tr>
            </c:if> <%--${e.est_num!=c.est_num}--%>

            <c:if test="${!empty clist}">
                <c:forEach var="c" items="${clist}">
                     <c:if test="${e.est_num==c.est_num && e.est_check != '계약완료'}">
                         <tr>
                            <td>${c.est_num}</td>
                            <td><input class='est_detail btn' type="button" value="${c.cont_location} 시공요청" onclick="est_detail('${c.est_num}')"></td>
                            <td><fmt:formatNumber value="${c.cont_total}" type="number"/>만원</td>
                            <td>${fn:substring(c.cont_start,0,10)}~ ${fn:substring(c.cont_end,0,10)}</td>
                            <td>${e.est_check}</td>
                            <td>${fn:substring(c.cont_date,0,10)}</td>
                            <td>
                              <button onclick="est_cancel()" class="cancel_contract_btn">계약해지</button>
                            </td>
                       </tr>
                     </c:if> <%--${e.est_num==c.est_num}--%>
                </c:forEach>
            </c:if> <%--${!empty clist}--%>
     </c:forEach> <%-- elist --%>
    </c:if>  <%--${!empty elist }--%>



    <c:if test="${empty elist}">
        <tr><th colspan="7">      조회된 견적 목록이 없습니다   </th></tr>
    </c:if>
    <script>
        function write_contract(est_num) {
            window.open('/partners/write_contract?est_num=' +est_num, '계약서', 'width=745, height=955, top=0, left=100, resizable=no')
        }
    </script>
    </tbody>
</table>
<script>
    function est_detail(est_num) {
        var popupWidth = 910;
        var popupHeight = 1000;
        var popupX = (window.screen.width / 2) - (popupWidth / 2);
        // 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주었음
        var popupY = (window.screen.height / 2) - (popupHeight / 2);
        // 만들 팝업창 height 크기의 1/2 만큼 보정값으로 빼주었음
        window.open(`./detail?est_num=` + est_num, 'Child', 'width=' + popupWidth + ', height=' + popupHeight + ', top=' + popupY + ', left=' + popupX + 'resizable=no');
    }
    function est_cancel() {
        confirm('해지 하실 경우 계약금이 패널티로 부과됩니다. 해지하시겠습니까?');
    }
</script>
<jsp:include page="../include/footer.jsp"/>