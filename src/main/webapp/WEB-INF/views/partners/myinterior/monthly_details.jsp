<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="/js/utilities.js"></script>

<h1>월별상세내역</h1>

<table border="1">
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
                <td> ${p.customer_name}<span style="font-size: 14px">(${p.mem_id})</span></td>
                <td>${p.cont_title}</td>
                <td> <fmt:formatNumber value="${p.pay_cost1*10000}" pattern="#,###"/>원<span style="font-size: 14px">(${fn:substring(p.pay_date1,0,10)})</span></td>
                <c:choose>
                    <c:when test="${empty p.pay_cost2 }">
                        <td>예정</td>
                    </c:when>
                    <c:otherwise>
                        <td><fmt:formatNumber value="${p.pay_cost2*10000}" pattern="#,###"/>원<span style="font-size: 14px">(${fn:substring(p.pay_date2,0,10)})</span></td>
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${empty p.pay_cost3 }">
                        <td>예정</td>
                    </c:when>
                    <c:otherwise>
                        <td><fmt:formatNumber value="${p.pay_cost3*10000}" pattern="#,###"/>원<span style="font-size: 14px">(${fn:substring(p.pay_date3,0,10)})</span></td>
                    </c:otherwise>
                </c:choose>
            </tr>
        </c:forEach>
    </c:if>
</table>
<button onclick="window.close()">닫기</button>