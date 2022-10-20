<%@ page contentType="text/html; charset=UTF-8"%>
<%-- 상단 공통부분 끝--%>
<link rel="stylesheet" type="text/css" href="/css/dozip/all_contract.css" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div class="clear"></div>

<div class = "wrap">
    <c:if test = "${!empty clist}">
        <c:forEach var="i" begin="0" end="${fn:length(clist)-1}" step="1">
        <table border="1">
            <tr>
                <th>번호</th>
                <th>계약서번호</th>
                <th>업체명</th>
                <th>공간정보</th>
                <th>착공날짜</th>
                <th>완공날짜</th>
                <th>평수</th>
            </tr>
            <tr>
                <td>1</td>
                <td>${clist[i].cont_no}</td>
                <td>${clist[i].partners_name}</td>
                <td>${clist[i].cont_title}</td>
                <td>${clist[i].cont_start}</td>
                <td>${clist[i].cont_end}</td>
                <td>${clist[i].cont_area}</td>
            </tr>
        </table>
        </c:forEach>
    </c:if>

    <c:if test="${empty clist}">
        <table>
            <tr>
                <th>번호</th>
                <th>계약서번호</th>
                <th>업체명</th>
                <th>공간정보</th>
                <th>공사기간</th>
                <th>평수</th>
            </tr>
            <tr aria-colspan="6">
                <td>해당 견적서 내역이 없습니다</td>
            </tr>
        </table>
    </c:if>
</div>
