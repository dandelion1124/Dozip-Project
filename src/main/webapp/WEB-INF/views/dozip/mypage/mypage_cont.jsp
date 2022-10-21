<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="./mypage_header.jsp" />
<%-- 상단 공통부분 끝 --%>
<style>
    #my_contract_list {
        width: 99%;
        margin: 20px auto;
    }
    .my_contract_wrap {
        width:100%;
        display: flex;
        justify-content:space-between;
        flex-direction: column;
        align-items: center;
    }
    .my_contract_cont {
        width: 90%;
    }
    .my_contract_table th {
        background-color: #f7f7f7;
        font-size: 0.9rem;
        height: 30px;
        border-bottom: 1px solid #B3B9BE;
        border-top: 2px solid #2b2a29;
    }
    .my_contract_table {
        width: 100%;
        text-align: center;
        border-collapse: collapse;
    }
    .my_contract_table td {
        border-bottom: 1px solid #B3B9BE;
        padding: 10px 0;
        font-size: 0.8rem;
    }
    .contract_info {
        width: 100%;
        text-align: left;
        margin-left: 30px;
    }
    .contract_info>ul>li {
        list-style: none;
        padding-left: 10px;
    }
    .page_area{
        text-align:center;
        margin-top: 10px;
    }

</style>

<%-- 견적신청내역 --%>
<div class="mypage_body" id="my_contract_list">
    <div class="my_contract_wrap">
        <div class="contract_info">
            <p style="font-size: 1.7rem; font-weight: bold; margin: 0;">내 계약내역 확인</p>
            <ul style="padding:0px;">
                <li style="font-size: 0.8rem; margin-bottom: 7px;"><img src="/images/dozip/blt_check_red.jpg"/>&nbsp;고객님의 계약진행 내역을 확인할 수 있습니다.</li>
                <li style="font-size: 0.8rem; margin-bottom: 7px;"><img src="/images/dozip/blt_check_red.jpg"/>&nbsp;계약번호를 클릭하면 자세한 내용을 확인 할 수 있습니다.</li>
                <li style="font-size: 0.8rem;"><img src="/images/dozip/blt_check_red.jpg"/>&nbsp;기한에 맞춰 결제를 진행해주십시오.</li>
            </ul>
        </div>
        <hr style="width: 100%; border:0px; border-top: #7f8c8d double;"/>
        <p style="width: 90%; font-weight: bold;">${listcount}건의 계약내역이 있습니다.</p>
        <div class="my_contract_cont">
            <table class="my_contract_table">
                <tr>
                    <th>계약번호</th> <th>업체명</th> <th>내용</th> <th>공사시작일</th> <th>공사종료일</th>
                    <th>총금액</th> <th>견적서확인</th> <th>계약서확인</th>
                </tr>
                <c:if test="${fn:length(clist) == 0}">
                    <tr><td colspan="8"> 등록된 글이 없습니다.</td> </tr>
                </c:if>
                <c:if test="${fn:length(clist) != 0}">
                    <c:forEach var="i" begin="0" end="${fn:length(clist)-1}" step="1">
                        <tr>
                            <td id="num"><a href="/dozip/my_contD">${clist[i].cont_no}</a></td><%--계약번호--%>
                            <td id="date">${clist[i].businessName}</td><%--업체명--%>
                            <td id="date">${clist[i].cont_title}</td><%--계약제목--%>
                            <td id="date">${clist[i].cont_start}</td><%--시작일--%>
                            <td id="date">${clist[i].cont_end}</td><%--종료일--%>
                            <td id="date">${clist[i].cont_total}</td><%--총금액--%>
                            <td id="date"><button type="button">견적서보기</button></td><%--견적서확인--%>
                            <td id="date"><button type="button">계약서보기</button></td><%--계약서확인--%>
                        </tr>
                    </c:forEach>
                </c:if>
            </table>

            <!-- 쪽번호 출력 -->
            <div class="page_area">
                <c:if test="${page<=1}"><img src="/images/dozip/left-arrow.png"></c:if>
                <c:if test="${page>1}"><a href="/dozip/my_cont?page=${page-1}"><img src="/images/dozip/left-arrow.png"></a></c:if>

                <c:forEach var="p" begin="${startpage}" end="${endpage}" step="1">
                    <c:if test="${p==page}"><span style="color: #347844; font-weight: bold;">${p}</span></c:if>
                    <c:if test="${p!=page}"><a href="/dozip/my_cont?page=${p}">${p}</a></c:if>
                </c:forEach>

                <c:if test="${page>=maxpage}"><img src="/images/dozip/right-arrow.png"></c:if>
                <c:if test="${page<maxpage}"><a href="/dozip/my_cont?page=${page+1}"><img src="/images/dozip/right-arrow.png"></a></c:if>
            </div>
        </div>

    </div>
</div>

<%-- 하단 공통부분 --%>
<jsp:include page="./mypage_footer.jsp" />