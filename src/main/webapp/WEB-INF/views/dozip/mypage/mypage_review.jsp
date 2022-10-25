<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="./mypage_header.jsp" />
<%-- 상단 공통부분 끝 --%>
<style>
    /* 고객센터문의 */
    #my_review_list {
        width: 99%;
        margin: 20px auto;
    }
    .rv_wrap {
        width:100%;
        display: flex;
        justify-content:space-between;
        flex-direction: column;
        align-items: center;
    }
    .my_rv_cont {
        width: 90%;
    }
    #review_write_btn {
        border: 0;
        font-size: 1.2rem;
        font-weight:bold;
        background-color: #347844;
        text-align: center;
        width: 30%;
        height: 45px;
    }
    #review_write_btn a {
        color: white;
    }
    #my_rv_text {
        text-align: center;
        font-weight: bold;
        margin-bottom: 200px;
    }
    #my_rv_text  a {
        text-decoration: underline;
        color: #347844;
    }
    .rv_info {
        width: 100%;
        text-align: left;
        margin-left: 30px;
    }
    .rv_info>ul>li {
        list-style: none;
        padding-left: 10px;
    }
    .review_box {
        margin: 40px auto;
        text-align: center;
    }
    .my_rv_table th {
        background-color: #f7f7f7;
        font-size: 0.9rem;
        height: 30px;
        border-bottom: 1px solid #B3B9BE;
        border-top: 2px solid #2b2a29;
    }
    .my_rv_table {
        width: 100%;
        text-align: center;
        border-collapse: collapse;
    }
    .my_rv_table td {
        border-bottom: 1px solid #B3B9BE;
        padding: 10px 0;
        font-size: 0.8rem;
    }
    .page_area{
        text-align:center;
        margin-top: 10px;
    }
</style>
<%-- 내 후기 관리 --%>
<div class="mypage_body" id="my_review_list">
    <div class="rv_wrap">
        <div class="rv_info">
            <p style="font-size: 1.7rem; font-weight: bold; margin: 0;">나의 후기</p>
            <ul style="padding:0px;">
                <li style="font-size: 0.8rem; margin-bottom: 7px;"><img src="/images/dozip/blt_check_red.jpg"/>&nbsp;내가 작성한 후기글을 확인 할 수 있습니다.</li>
                <li style="font-size: 0.8rem;"><img src="/images/dozip/blt_check_red.jpg"/>&nbsp;여기서 글을 수정하거나 삭제할 수 있습니다.</li>
            </ul>
        </div>
        <hr style="width: 100%; border:0px; border-top: #7f8c8d double;"/>
        <p style="width: 90%; font-weight: bold;">${listcount}건의 후기내역이 있습니다.</p>
        <div class="my_rv_cont">
            <table class="my_rv_table">
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
                <c:if test="${page>1}"><a href="/dozip/my_review?page=${page-1}"><img src="/images/dozip/left-arrow.png"></a></c:if>

                <c:forEach var="p" begin="${startpage}" end="${endpage}" step="1">
                    <c:if test="${p==page}"><span style="color: #347844; font-weight: bold;">${p}</span></c:if>
                    <c:if test="${p!=page}"><a href="/dozip/my_review?page=${p}">${p}</a></c:if>
                </c:forEach>

                <c:if test="${page>=maxpage}"><img src="/images/dozip/right-arrow.png"></c:if>
                <c:if test="${page<maxpage}"><a href="/dozip/my_review?page=${page+1}"><img src="/images/dozip/right-arrow.png"></a></c:if>
            </div>
        </div>
    </div>
    <div class="review_box"><button id="review_write_btn">
        <a href="/dozip/review_write" >리뷰 작성하기</a>
    </button></div>
    <p id="my_rv_text">다른 고객들의 리뷰를 보고싶다면? <a href="/dozip/review_main">다른 리뷰 보러가기</a></p>
</div>


<%-- 하단 공통부분 --%>
<jsp:include page="./mypage_footer.jsp" />