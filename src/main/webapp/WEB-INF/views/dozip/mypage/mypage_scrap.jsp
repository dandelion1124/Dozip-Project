<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="./mypage_header.jsp" />
<%-- 상단 공통부분 끝 --%>
<style>
    /* 고객센터문의 */
    #my_scrap_list {
        width: 99%;
        margin: 20px auto;
    }
    .scrap_wrap {
        width:100%;
        display: flex;
        justify-content:space-between;
        flex-direction: column;
        align-items: center;
    }
    .my_scrap_cont {
        width: 90%;
    }
    #my_scrap_text {
        text-align: center;
        font-weight: bold;
        margin-top: 40px;
        margin-bottom: 200px;
    }
    #my_scrap_text  a {
        text-decoration: underline;
        color: #347844;
    }
    .scrap_info {
        width: 100%;
        text-align: left;
        margin-left: 30px;
    }
    .scrap_info>ul>li {
        list-style: none;
        padding-left: 10px;
    }
    .my_scrap_table th {
        background-color: #f7f7f7;
        font-size: 0.9rem;
        height: 30px;
        border-bottom: 1px solid #B3B9BE;
        border-top: 2px solid #2b2a29;
    }
    .my_scrap_table {
        width: 100%;
        text-align: center;
        border-collapse: collapse;
    }
    .my_scrap_table td {
        border-bottom: 1px solid #B3B9BE;
        padding: 10px 0;
        font-size: 0.8rem;
    }
    .page_area{
        text-align:center;
        margin-top: 10px;
    }
</style>
<%-- 내 스크랩 관리 --%>
<div class="mypage_body" id="my_scrap_list">
    <div class="scrap_wrap">
        <div class="scrap_info">
            <p style="font-size: 1.7rem; font-weight: bold; margin: 0;">나의 스크랩</p>
            <ul style="padding:0px;">
                <li style="font-size: 0.8rem; margin-bottom: 7px;"><img src="/images/dozip/blt_check_red.jpg"/>&nbsp;내가 스크랩 한 포트폴리오를 확인 할 수 있습니다.</li>
            </ul>
        </div>
        <hr style="width: 100%; border:0px; border-top: #7f8c8d double;"/>
        <p style="width: 90%; font-weight: bold;">${listcount}건의 스크랩 내역이 있습니다.</p>
        <div class="my_scrap_cont">
            <table class="my_scrap_table">
                <tr>
                    <th>번호</th> <th>제목</th> <th>답변상태</th><th>작성일</th>
                </tr>
                <tr>
                    <td>임시번호</td> <td>임시제목</td> <td>임시상태</td> <td>임시일</td>
                </tr>

            </table>

            <!-- 쪽번호 출력 --><%--쪽번호는 page랑 stratpage, endpage 맞춰서 controller쪽 작성해주시면 되고 아래는 따로 수정 안해도 돼요!--%>
            <div class="page_area">
                <c:if test="${page<=1}"><img src="/images/dozip/left-arrow.png"></c:if>
                <c:if test="${page>1}"><a href="/dozip/my_scrap?page=${page-1}"><img src="/images/dozip/left-arrow.png"></a></c:if>

                <c:forEach var="p" begin="${startpage}" end="${endpage}" step="1">
                    <c:if test="${p==page}"><span style="color: #347844; font-weight: bold;">${p}</span></c:if>
                    <c:if test="${p!=page}"><a href="/dozip/my_scrap?page=${p}">${p}</a></c:if>
                </c:forEach>

                <c:if test="${page>=maxpage}"><img src="/images/dozip/right-arrow.png"></c:if>
                <c:if test="${page<maxpage}"><a href="/dozip/my_scrap?page=${page+1}"><img src="/images/dozip/right-arrow.png"></a></c:if>
            </div>
        </div>
    </div>

    <div id="my_scrap_text">마음에 드는 포트폴리오가 있다면 스크랩 하세요! <br/>
        <p style="margin-top: 5px;"><a href="/dozip/port">포트폴리오 보러가기</a></p>
    </div>
</div>


<%-- 하단 공통부분 --%>
<jsp:include page="./mypage_footer.jsp" />