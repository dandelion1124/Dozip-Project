<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="../include/header.jsp"/>
<style>
    #port_list_table {
        width: 70%;
        border-collapse: collapse;
        margin: 20px auto;
        text-align: center;
        box-shadow: 2px -2px 2px 0px #00008b4f;
    }
    #port_list_table thead{
        background: cornflowerblue;
    }
    #est_list_table th {
        font-weight: lighter;
    }
    table#port_list_table td {
        border-bottom: 1px solid slategrey;
        padding: 6px 0px;
    }
    table#port_list_table tbody tr:hover{
        background: #e0e6f1;
    }
    input.portEdit_btn {
        padding: 3px 5px;
        background: none;
        border: 1px solid steelblue;
        border-radius: 2px;
    }
    input.portEdit_btn:hover{
        background: cornflowerblue;
        cursor: pointer;
    }
</style>
<p style="margin-bottom: 10px"> | 시공사례 > 수정/삭제</p>
<h1> 포트폴리오 목록</h1>
<p>등록한 포트폴리오를 수정/삭제 할 수 있습니다</p>
<table id="port_list_table">
    <thead>
    <tr>
        <th>포트폴리호
            <br>번호</th>
        <th>제목</th>
        <th>등록날짜</th>
        <th>수정/삭제</th>
    </tr>
    </thead>
    <c:if test="${empty plist}">
        <tr>
            <th colspan="4"> 조회된 포트폴리오가 없습니다</th>
        </tr>
    </c:if>
    <c:if test="${!empty plist}">
        <c:forEach var="p" items="${plist}">
        <tr>
            <td>${p.pf_no}</td>
            <td style="text-align: left">${p.pf_title}</td>
            <td>${p.pf_regdate}</td>
            <td><input type="button" value="수정/삭제" class="portEdit_btn" onclick="location='/partners/p_modify?pf_no=${p.pf_no}'"></td>
        </tr>
        </c:forEach>
    </c:if>

</table>
<jsp:include page="../include/footer.jsp"/>

