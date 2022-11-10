<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="/js/utilities.js"></script>
<style>
    #monthly_details_title {
        text-align: center;
    }

    #monthly_details_table {
        border-collapse: collapse;
        margin: 0 auto;
    }

    #monthly_details_table tr:first-child {
        border-top: 3px solid black;
        border-bottom: 1px solid black;
    }

    #monthly_details_table tr {
        border-bottom: 1px solid black;

    }

    #monthly_details_table th {
        padding: 6px 1px;
    }

    #monthly_details_table td {
        font-size: 13px;
        padding: 6px 5px;


    }

    #monthly_details_table tr:last-child {
        border-bottom: none;
    }

    body {
        background: rgba(208, 208, 208, 0.49);
    }
</style>
<h1 id="monthly_details_title">${month}월 상세내역<span style="font-size: 18px">(총 <fmt:formatNumber value="${totalMontlyBal*10000}"
                                                                                      pattern="#,###"/>원)</span></h1>
<table id="monthly_details_table">
    <tr>
        <th>계약번호</th>
        <th>의뢰인</th>
        <th>공사제목</th>
        <th>계약금</th>
        <th>중도금</th>
        <th>잔금</th>
    </tr>
    <c:if test="${empty plist}">
        <tr>
            <th colspan="6">조회된 내역이 없습니다</th>
        </tr>
    </c:if>
    <c:if test="${!empty plist}">
        <c:forEach var="p" items="${plist}">
            <tr>
                <td onclick="show_contract('${p.cont_no}')">${p.cont_no}</td>
                <td> ${p.customer_name}<span style="font-size: 12px">(${p.mem_id})</span></td>
                <td>${p.cont_title}</td>
                <td><fmt:formatNumber value="${p.pay_cost1*10000}" pattern="#,###"/>원<span
                        style="font-size: 12px">(${fn:substring(p.pay_date1,0,10)})</span></td>
                <c:choose>
                    <c:when test="${empty p.pay_cost2 }">
                        <td>예정</td>
                    </c:when>
                    <c:otherwise>
                        <td><fmt:formatNumber value="${p.pay_cost2*10000}" pattern="#,###"/>원<span
                                style="font-size: 12px">(${fn:substring(p.pay_date2,0,10)})</span></td>
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${empty p.pay_cost3 }">
                        <td>예정</td>
                    </c:when>
                    <c:otherwise>
                        <td><fmt:formatNumber value="${p.pay_cost3*10000}" pattern="#,###"/>원<span
                                style="font-size: 12px">(${fn:substring(p.pay_date3,0,10)})</span></td>
                    </c:otherwise>
                </c:choose>
            </tr>
        </c:forEach>
    </c:if>
    <tr>
        <th colspan="6">
            <button onclick="window.close()">닫기</button>
        </th>
    </tr>
</table>
