<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="./mypage_header.jsp" />
<%-- 상단 공통부분 끝 --%>
<style>
    #my_estimate_list {
        width: 99%;
        margin: 20px auto;
    }
    .my_estimate_wrap {
        width:100%;
        display: flex;
        justify-content:space-between;
        flex-direction: column;
        align-items: center;
    }
    .my_apply_cont {
        width: 90%;
    }
    .my_apply_table th {
        background-color: #f7f7f7;
        font-size: 0.9rem;
        height: 30px;
        border-bottom: 1px solid #B3B9BE;
        border-top: 2px solid #2b2a29;
    }
    .my_apply_table {
        width: 100%;
        text-align: center;
        border-collapse: collapse;
    }
    .my_apply_table td {
        border-bottom: 1px solid #B3B9BE;
        padding: 10px 0;
        font-size: 0.8rem;
    }
    .estimate_info {
        width: 100%;
        text-align: left;
        margin-left: 30px;
    }
    .estimate_info>ul>li {
        list-style: none;
        padding-left: 10px;
    }
    .page_area{
        text-align:center;
        margin-top: 10px;
    }
    #my_est_text {
        text-align: center;
        font-weight: bold;
        margin: 50px auto;
    }
    #my_est_text  a {
        text-decoration: underline;
        color: #347844;
    }
    #agree_btn {
        border: none;
        background-color: #0000FF;
        color: white;
        height: 25px;
    }
    #reject_btn {
        border: none;
        background-color: crimson;
        color: white;
        height: 25px;

    }
</style>

<%-- 견적신청내역 --%>
<div class="mypage_body" id="my_estimate_list">
    <div class="my_estimate_wrap">
        <div class="estimate_info">
            <p style="font-size: 1.7rem; font-weight: bold; margin: 0;">견적신청 내역 확인 (업체지정)</p>
            <ul style="padding:0px;">
                <li style="font-size: 0.8rem; margin-bottom: 7px;"><img src="/images/dozip/blt_check_red.jpg"/>&nbsp;고객님이 업체를 지정하여 신청한 견적 내역을 확인합니다.</li>
                <li style="font-size: 0.8rem; margin-bottom: 7px;"><img src="/images/dozip/blt_check_red.jpg"/>&nbsp;번호를 누르면 상세페이지에서 내용을 확인할 수 있습니다.</li>
                <li style="font-size: 0.8rem;"><img src="/images/dozip/blt_check_red.jpg"/>&nbsp;업체의 수락/거절 내용을 확인 할 수 있습니다.</li>
            </ul>
        </div>
        <hr style="width: 100%; border:0px; border-top: #7f8c8d double;"/>
        <p style="width: 90%; font-weight: bold;">${listcount}건의 신청내역이 있습니다.</p>
        <div class="my_apply_cont">
            <table class="my_apply_table">
                <tr>
                    <th>번호</th> <th>신청날짜</th> <th>공간유형</th> <th>공간선택</th> <th>평수</th>
                    <th>예산</th> <th>업체명</th> <th>진행상황</th> <th>계약진행</th>
                </tr>
                <c:if test="${fn:length(elist) == 0}">
                    <tr><td colspan="9"> 등록된 글이 없습니다.</td> </tr>
                </c:if>
                <c:if test="${fn:length(elist) != 0}">
                    <c:forEach var="i" begin="0" end="${fn:length(elist)-1}" step="1">
                        <tr>
                            <td id="num"><%--번호--%>
                                <c:set var="number" value="${(listcount-(5*(page-1)))-i}" />
                                <c:out value="${number}"/>
                            </td>
                            <td>${elist[i].est_date.substring(0,10)}</td><%--신청날짜--%>
                            <td>${elist[i].est_zoning}</td><%--공간유형--%>
                            <td>${elist[i].est_detail}</td><%--공간선택--%>
                            <td>${elist[i].est_areaP}</td><%--평수--%>
                            <td>${elist[i].est_bud}</td><%--예산--%>
                            <td>${elist[i].businessName}</td><%--업체명--%>
                            <td>${elist[i].est_check}</td><%--진행상황(수락/거절)--%>
                            <td>
                                <c:if test="${elist[i].est_check=='수락'}">
                                    <button type="button" id="agree_btn">계약요청</button>
                                    <button type="button" id="reject_btn">취소</button>
                                </c:if>
                                <c:if test="${elist[i].est_check!='수락'}">-</c:if>
                            </td>
                        </tr>
                    </c:forEach>
                </c:if>
            </table>

            <!-- 쪽번호 출력 -->
            <div class="page_area">
                <c:if test="${page<=1}"><img src="/images/dozip/left-arrow.png"></c:if>
                <c:if test="${page>1}"><a href="/dozip/my_est?page=${page-1}"><img src="/images/dozip/left-arrow.png"></a></c:if>

                <c:forEach var="p" begin="${startpage}" end="${endpage}" step="1">
                    <c:if test="${p==page}"><span style="color: #347844; font-weight: bold;">${p}</span></c:if>
                    <c:if test="${p!=page}"><a href="/dozip/my_est?page=${p}">${p}</a></c:if>
                </c:forEach>

                <c:if test="${page>=maxpage}"><img src="/images/dozip/right-arrow.png"></c:if>
                <c:if test="${page<maxpage}"><a href="/dozip/my_est?page=${page+1}"><img src="/images/dozip/right-arrow.png"></a></c:if>
            </div>
        </div>

    </div>
    <p id="my_est_text">견적신청을 통해 견적을 받아보세요!&nbsp;&nbsp;<a href="/dozip/apply">견적신청 하러가기</a></p>
</div>

<%-- 하단 공통부분 --%>
<jsp:include page="./mypage_footer.jsp" />