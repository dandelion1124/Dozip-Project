<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<script src="/js/partners/jquery.js"></script>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style>
        #load_info_table{
            margin: 40px auto;
            border-collapse: collapse;

        }
        #load_info_table input {
            border:none;
            background: #f2f2f2;
        }
        body{
            background: #f2f2f2;
        }
        table#load_info_table caption {
            margin-bottom: 20px;
        }
        table#load_info_table th {
            background: darkgrey;
        }
        table#load_info_table th, table#load_info_table td {
            padding: 5px 2px;
        }
    </style>
</head>
<body>

<table border="1" id="load_info_table">
    <caption>포트폴리오 불러오기</caption>
    <tr>
        <th>계약번호</th>
        <th>공사제목</th>
        <th>평수</th>
        <th>공사비용</th>
        <th>불러오기</th>
    </tr>

        <c:if test="${empty clist}">
        <tr>
            <th colspan="2">검색된 계약서가 없습니다</th>
        </tr>
        </c:if>
        <c:if test="${!empty clist}">
            <c:forEach var="c" items="${clist}">
        <tr>
                <%-- 공사유형, 공사 세부유형, 우편번호, 주소1, 주소2, 주소3, 평수, 공사비용 --%>
                <%-- est_zoning, est_use, est_zipcode, customer_addr, est_addr2, est_addr3, cont_area, cont_total --%>
                <input type="hidden" value="${c.est_zoning}">
                <input type="hidden" value="${c.est_use}">
                <input type="hidden" value="${c.est_zipcode}">
                <input type="hidden" value="${c.customer_addr}">
                <input type="hidden" value="${c.est_addr2}">
                <input type="hidden" value="${c.est_addr3}">


                <td>${c.cont_no}</td>
                <td>${c.cont_title}</td>
                <td><input id="cont_area" value="${c.cont_area}" readonly></td>
                <td><input id="cont_total" value="${c.cont_total}" readonly></td>
                <td><button onclick="sendValue('${c.est_zoning}','${c.est_use}','${c.est_zipcode}','${c.customer_addr}','${c.est_addr2}','${c.est_addr3}','${c.cont_area}','${c.cont_total}');">불러오기</button></td>
            </c:forEach>
        </tr>
        </c:if>

</table>
<script>
    function sendValue(pf_type,pf_subtype,pf_zipcode,pf_addr1,pf_addr2,pf_addr3,pf_area,pf_cost) {
        if(pf_type=='상가'){
            window.opener.document.getElementById("sel_type").value ='상업공간';
            window.opener.document.getElementById("sel_business").value = pf_subtype;
            $("#sel_house", opener.document).css('display','none');
            $("#sel_business", opener.document).css('display','inline');
        }
        else {
            window.opener.document.getElementById("sel_type").value ='주거공간';
            window.opener.document.getElementById("sel_house").value = pf_subtype;
        }

        window.opener.document.getElementById("sample6_postcode").value =pf_zipcode;
        window.opener.document.getElementById("sample6_address").value = pf_addr1;
        window.opener.document.getElementById("sample6_detailAddress").value = pf_addr2;
        window.opener.document.getElementById("sample6_extraAddress").value = pf_addr3;
        window.opener.document.getElementById("pf_area").value = pf_area;
        window.opener.document.getElementById("pf_cost").value = pf_cost;

        window.close();
    }
</script>
</body>
</html>