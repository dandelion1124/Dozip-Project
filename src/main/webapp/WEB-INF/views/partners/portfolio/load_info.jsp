<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
<h1>포트폴리오 불러오기</h1>


<table border="1">
    <tr>
        <th>계약번호</th>
        <th>평수</th>
        <th>공사비용</th>
        <th>불러오기</th>
    </tr>
    <tr>
        <c:if test="${empty clist}">
            <th colspan="2">검색된 계약서가 없습니다</th>
        </c:if>
        <c:if test="${!empty clist}">
            <c:forEach var="c" items="${clist}">
                <td>${c.cont_no}</td>
                <td><input id="cont_area" value="${c.cont_area}"></td>
                <td><input id="cont_total" value="${c.cont_total}"></td>
                <td><button onclick="sendValue();">불러오기</button></td>
            </c:forEach>
        </c:if>
    </tr>
</table>
<script>
    function sendValue() {
        window.opener.document.getElementById("pf_area").value = document.getElementById("cont_area").value;
        window.opener.document.getElementById("pf_cost").value = document.getElementById("cont_total").value;
        window.opener.document.getElementById("sel_type").value ="주거공간";
        window.close();
    }
</script>
</body>
</html>