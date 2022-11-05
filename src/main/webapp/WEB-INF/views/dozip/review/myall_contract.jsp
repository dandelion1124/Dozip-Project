<%@ page contentType="text/html; charset=UTF-8"%>
<%-- 상단 공통부분 끝--%>
<link rel="stylesheet" type="text/css" href="/css/dozip/all_contract.css" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script src="/js/dozip/jquery.js"></script>


<style>
    #cont_table {
        width: 100%;
        text-align: center;
        border-collapse: collapse;
    }
    #cont_table th {
        background-color: #f7f7f7;
        font-size: 0.9rem;
        height: 30px;
        border-bottom: 1px solid #B3B9BE;
        border-top: 2px solid #2b2a29;
    }
    #cont_table td {
        border-bottom: 1px solid #B3B9BE;
        padding: 10px 0;
        font-size: 0.8rem;
    }
    #none_cont{
        font-weight: bold;
        font-size:1.4rem;
    }
</style>
<div class="clear"></div>

<div class = "wrap">
    <script>
        function select_contract(item){
            var cont_no = $(item).text();
            $('#selected').val(cont_no);
        }

        function insert(){
            var cont_no = $('#selected').val();
            opener.document.getElementById("tcont_no").value = cont_no;
        }
    </script>
    <table id = "cont_table">
        <tr>
            <th>번호</th>
            <th>계약서번호</th>
            <th>업체명</th>
            <th>공간정보</th>
            <th>착공날짜</th>
            <th>완공날짜</th>
            <th>평수</th>
            <th>총 공사금액</th>
        </tr>
    <c:if test = "${!empty clist}">
        <c:forEach var="i" begin="0" end="${fn:length(clist)-1}" step="1">
            <tr>
                <td id = "table_no">${i+1}</td>
                <td id = "tcont_no">
                    <a href="#" id = "co_no" onclick = "select_contract(this)" style="cursor:pointer">${clist[i].cont_no}</a>
                </td> <!--계약서번호-->
                <td id = "tpart_name">${clist[i].partners_name}</td> <!--업체명-->
                <td id = "tcont_title">${clist[i].cont_title}</td> <!--공간정보-->
                <td id = "t_cont_start">${clist[i].cont_start.substring(0,10)}</td> <!--착공날짜-->
                <td id = "t_cont_end">${clist[i].cont_end.substring(0,10)}</td> <!--완공날짜-->
                <td id = "t_cont_area">${clist[i].cont_area}평</td> <!--평수-->
                <td id = "t_cont_total">${clist[i].cont_total}만원</td>
            </tr>
        </c:forEach>
    </c:if>

    <c:if test="${empty clist}">
            <tr>
                <td id = "none_cont" colspan="8">해당 견적서 내역이 없습니다</td>
            </tr>
    </c:if>
    </table>
    <br><br>
    <hr>
    <form class = "search_cont" onsubmit="insert()" >
        <input type="text" readonly name="selected" id="selected">
        <button type="submit" onclick="window.close();">선택완료</button>
    </form>

</div>
