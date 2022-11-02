<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="./mypage_header.jsp" />
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<%-- 상단 공통부분 끝 --%>
<style>
    .my_wrap { width: 97%; margin: 0 auto;}
    .box {
        /*border: 1px solid black;*/
        margin: 10px;
        margin-bottom: 30px;
    }
    #row {
        display: flex;
        justify-content: space-between;
        flex-wrap: wrap;
    }
    #row>div{
        /*border: 1px solid black;*/
        width: 24%;
        padding-left: 10px;
        border-radius: 5px;
        background-color: #2C3E50;
        color: white;
    }
    .p_cont{
        font-size: 2.0rem;
        font-weight: bold;
        margin: 0;
    }
    #row2 {
        display: flex;
        justify-content: space-between;
        flex-wrap: wrap;
    }
    #row2>div{
        border: 1px solid black;
        width: 49%;
        padding-left: 10px;
        border-radius: 5px;
    }
    .p_title {
        margin-bottom: 0;
    }
    .p_link {
        margin-top: 5px; margin-bottom: 5px;
        text-align: right;
        padding-right: 10px;
        font-size: 0.8rem;
    }
    .p_link>a{color: white;}
    .img_box {
        align-self: center;
        margin-right: 10px;
    }
    .txt_box{
        width: 70%;
    }

    .my_qna_cont {
        width: 100%;
    }
    .my_qna_table th {
        background-color: #f7f7f7;
        font-size: 0.9rem;
        height: 30px;
        border-bottom: 1px solid #B3B9BE;
        border-top: 2px solid #2b2a29;
    }
    .my_qna_table {
        width: 100%;
        text-align: center;
        border-collapse: collapse;
    }
    .my_qna_table td {
        border-bottom: 1px solid #B3B9BE;
        padding: 10px 0;
        font-size: 0.8rem;
    }
    .profile {
        display: flex;
        margin: 20px auto;
    }
    #pf_title {
        margin-top: 20px;
        margin-left: 10px;
    }
</style>
<div class="my_wrap">
    <div class="profile">
        <c:if test="${m.mem_pf==null}">
            <img src="/images/dozip/profile/null.png" style="width:70px; height:70px;" />
        </c:if>
        <c:if test="${m.mem_pf!=null}">
            <img src="/images/dozip/profile/${m.mem_pf}.png" style="width:70px; height:70px;" />
        </c:if>
        <h2 id="pf_title">${m.mem_name}</h2><h4 style="margin-top: 28px;">&nbsp;(${id})님 환영합니다.</h4>
    </div>
    <div class="box" id="row">
        <div class="p01" style="display: flex">
            <div class="img_box">
                <img src="/images/dozip/icons8-paper-80.png" style="width:70px; height:70px;" />
            </div>
            <div class="txt_box">
                <p class="p_title">나의 견적서(지정)</p>
                <p class="p_cont">10개</p>
                <p class="p_link"><a>견적내역 확인하기 >> </a></p>
            </div>
        </div>
        <div class="p01" style="display: flex">
            <div class="img_box">
                <img src="/images/dozip/icons8-document-66.png" style="width:70px; height:70px;" />
            </div>
            <div class="txt_box">
                <p class="p_title">나의 견적서(자유)</p>
                <p class="p_cont">10개</p>
                <p class="p_link"><a>견적내역 확인하기 >> </a></p>
            </div>
        </div>
        <div class="p01" style="display: flex">
            <div class="img_box">
                <img src="/images/dozip/icons8-regular-file-64.png" style="width:70px; height:70px;" />
            </div>
            <div class="txt_box">
                <p class="p_title">나의 후기</p>
                <p class="p_cont">10개</p>
                <p class="p_link"><a>후기 확인하기 >> </a></p>
            </div>
        </div>
        <div class="p01" style="display: flex">
            <div class="img_box">
                <img src="/images/dozip/icons8-document-64.png" style="width:70px; height:70px;" />
            </div>
            <div class="txt_box">
                <p class="p_title">나의 문의</p>
                <p class="p_cont">10개</p>
                <p class="p_link"><a>문의글 확인하기 >> </a></p>
            </div>
        </div>
    </div>
    <div class="box">
        <h3>My 알림&nbsp;<img src="/images/dozip/icons8-notice-64.png" style="width:30px; height:30px;"/></h3>
        <p>오늘 날짜 : ${now}</p>
        <div class="my_qna_cont">
            <table class="my_qna_table">
                <tr>
                    <th>알림일자</th> <th>말머리</th> <th>알림내용</th> <th>이동</th>
                </tr>
                <c:if test="${fn:length(qlist) == 0}">
                    <tr><td colspan="4"> 등록된 글이 없습니다.</td> </tr>
                </c:if>
                <c:if test="${fn:length(qlist) != 0}">
                    <c:forEach var="i" begin="0" end="${fn:length(qlist)-1}" step="1">
                        <tr>
                            <td id="num">
                                <c:set var="number" value="${(listcount-(5*(page-1)))-i}" />
                                <c:out value="${number}"/>
                            </td>
                            <td id="title" style="text-align: left; padding-left: 20px;">
                                <c:if test="${qlist[i].qna_level != 0}"><img src="/images/dozip/arrow.png"></c:if>
                                <a href="#">${qlist[i].qna_title}</a>
                            </td>
                            <td id="state">
                                <c:if test="${qlist[i].qna_level != 0}"><span></span></c:if>
                                <c:if test="${qlist[i].qna_level == 0}">${qlist[i].reply_state}</c:if>
                            </td>
                            <td id="date">${qlist[i].qna_date}</td>
                        </tr>
                    </c:forEach>
                </c:if>
            </table>
        </div>
    </div>
    <div class="box" id="row2">
        <div>
            <h3>나의 문의글</h3>
            <div class="my_qna_cont">
                <table class="my_qna_table">
                    <tr>
                        <th>제목</th> <th>답변상태</th><th>작성일</th>
                    </tr>
                    <c:if test="${fn:length(qlist) == 0}">
                        <tr><td colspan="4"> 등록된 글이 없습니다.</td> </tr>
                    </c:if>
                    <c:if test="${fn:length(qlist) != 0}">
                        <c:forEach var="i" begin="0" end="${fn:length(qlist)-1}" step="1">
                            <tr>
                                <td id="num">
                                    <c:set var="number" value="${(listcount-(5*(page-1)))-i}" />
                                    <c:out value="${number}"/>
                                </td>
                                <td id="title" style="text-align: left; padding-left: 20px;">
                                    <c:if test="${qlist[i].qna_level != 0}"><img src="/images/dozip/arrow.png"></c:if>
                                    <a href="#">${qlist[i].qna_title}</a>
                                </td>
                                <td id="state">
                                    <c:if test="${qlist[i].qna_level != 0}"><span></span></c:if>
                                    <c:if test="${qlist[i].qna_level == 0}">${qlist[i].reply_state}</c:if>
                                </td>
                                <td id="date">${qlist[i].qna_date}</td>
                            </tr>
                        </c:forEach>
                    </c:if>
                </table>
            </div>
        </div>
        <div>
            <h3>나의 후기</h3>
            <div class="my_qna_cont">
                <table class="my_qna_table">
                    <tr>
                        <th>제목</th> <th>답변상태</th><th>작성일</th>
                    </tr>
                    <c:if test="${fn:length(qlist) == 0}">
                        <tr><td colspan="4"> 등록된 글이 없습니다.</td> </tr>
                    </c:if>
                    <c:if test="${fn:length(qlist) != 0}">
                        <c:forEach var="i" begin="0" end="${fn:length(qlist)-1}" step="1">
                            <tr>
                                <td id="num">
                                    <c:set var="number" value="${(listcount-(5*(page-1)))-i}" />
                                    <c:out value="${number}"/>
                                </td>
                                <td id="title" style="text-align: left; padding-left: 20px;">
                                    <c:if test="${qlist[i].qna_level != 0}"><img src="/images/dozip/arrow.png"></c:if>
                                    <a href="#">${qlist[i].qna_title}</a>
                                </td>
                                <td id="state">
                                    <c:if test="${qlist[i].qna_level != 0}"><span></span></c:if>
                                    <c:if test="${qlist[i].qna_level == 0}">${qlist[i].reply_state}</c:if>
                                </td>
                                <td id="date">${qlist[i].qna_date}</td>
                            </tr>
                        </c:forEach>
                    </c:if>
                </table>
            </div>
        </div>
    </div>
    <button id="btn" type="button">테스트</button>
</div>
<script>
    document.getElementById('btn').onclick = function (){
        swal("테스트");
    }
</script>
<%-- 하단 공통부분 --%>
<jsp:include page="./mypage_footer.jsp" />