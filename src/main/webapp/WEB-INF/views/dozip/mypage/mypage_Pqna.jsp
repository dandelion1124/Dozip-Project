<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="./mypage_header.jsp" />
<%-- 상단 공통부분 끝 --%>
<link rel="stylesheet" type="text/css" href="/css/dozip/qna_popup.css" />
<style>
    /* 고객센터문의 */
    #my_partner_qna { width: 99%; margin: 20px auto; }
    .qna_wrap { width:100%; display: flex; justify-content:space-between; flex-direction: column; align-items: center; }
    .my_qna_cont { width: 90%; }
    #my_P_qna_write_btn { border: 0; font-size: 1.2rem; font-weight:bold; background-color: #347844; text-align: center; width: 30%; height: 45px; }
    #my_P_qna_write_btn a { color: white; }
    .qna_info { width: 100%; text-align: left; margin-left: 30px; }
    .qna_info>ul>li { list-style: none; padding-left: 10px; }
    .mqw_box { margin: 40px auto; text-align: center; }
    .my_qna_table th { background-color: #f7f7f7; font-size: 0.9rem; height: 30px; border-bottom: 1px solid #B3B9BE; border-top: 2px solid #2b2a29; }
    .my_qna_table { width: 100%; text-align: center; border-collapse: collapse; }
    .my_qna_table td { border-bottom: 1px solid #B3B9BE; padding: 10px 0; font-size: 0.8rem; }
    #head_num { width: 10%; }
    #head_title { width: 50%; }
    .page_area{ text-align:center; margin-top: 10px; }
</style>

<%-- 고객센터문의 --%>
<div class="mypage_body" id="my_partner_qna">
    <div class="qna_wrap">
        <div class="qna_info">
            <p style="font-size: 1.7rem; font-weight: bold; margin: 0;">업체 문의</p>
            <ul style="padding:0px;">
                <li style="font-size: 0.8rem; margin-bottom: 7px;"><img src="/images/dozip/blt_check_red.jpg"/>&nbsp;한번 등록한 상담내용은 수정이 불가능합니다. 수정을 원하시는 경우, 삭제 후 재등록 하셔야 합니다.</li>
                <li style="font-size: 0.8rem;"><img src="/images/dozip/blt_check_red.jpg"/>&nbsp;문의는 24시간 신청가능하며 접수된 내용은 빠른 시간내에 답변을 드리도록 하겠습니다.</li>
            </ul>
        </div>
        <hr style="width: 100%; border:0px; border-top: #7f8c8d double;"/>
        <p style="width: 90%; font-weight: bold;">${count}건의 문의내역이 있습니다.</p>
        <div class="my_qna_cont">
            <table class="my_qna_table">
                <tr>
                    <th id="head_num">번호</th> <th>업체명</th> <th id="head_title">제목</th> <th id="qna_state">답변상태</th><th id="head_date">작성일</th>
                </tr>
                <c:if test="${fn:length(qlist) == 0}">
                    <tr><td colspan="5"> 등록된 글이 없습니다.</td> </tr>
                </c:if>
                <c:if test="${fn:length(qlist) != 0}">
                    <c:forEach var="i" begin="0" end="${fn:length(qlist)-1}" step="1">
                        <tr>
                            <td id="num">
                                <c:set var="number" value="${(p.count-(p.pageSize*(p.page-1)))-i}" />
                                <c:out value="${number}"/>
                            </td>
                            <td id="partner_name">
                                <c:if test="${qlist[i].qna_level != 0}"><span></span></c:if>
                                <c:if test="${qlist[i].qna_level == 0}">${qlist[i].businessName}</c:if>
                            </td>
                            <td id="title" style="text-align: left; padding-left: 20px;">
                                <c:if test="${qlist[i].qna_level != 0}"><img src="/images/dozip/arrow.png"></c:if>
                                <a href="#" onclick="selectQna(${qlist[i].qna_no})">${qlist[i].qna_title}</a>
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

            <!-- 쪽번호 출력 -->
            <div class="page_area">
                <c:if test="${p.page<=1}"><img src="/images/dozip/left-arrow.png"></c:if>
                <c:if test="${p.page>1}"><a href="/dozip/my_Pqna?page=${p.page-1}"><img src="/images/dozip/left-arrow.png"></a></c:if>

                <c:forEach var="page" begin="${p.startpage}" end="${p.endpage}" step="1">
                    <c:if test="${page==p.page}"><span style="color: #347844; font-weight: bold;">${page}</span></c:if>
                    <c:if test="${page!=p.page}"><a href="/dozip/my_Pqna?page=${page}">${page}</a></c:if>
                </c:forEach>

                <c:if test="${p.page>=p.maxpage}"><img src="/images/dozip/right-arrow.png"></c:if>
                <c:if test="${p.page<p.maxpage}"><a href="/dozip/my_Pqna?page=${p.page+1}"><img src="/images/dozip/right-arrow.png"></a></c:if>
            </div>
        </div>
    </div>
    <div class="mqw_box"><button id="my_P_qna_write_btn">
        <a href="/dozip/pqna_write" >업체 문의글 작성하기</a>
    </button></div>
</div>

<div class="background">
    <div class="window">
        <div class="popup">
            <div id="title_box">&nbsp;&nbsp;&nbsp;글 내용 확인</div>
            <table id="qna_box">
                <tr><th>제목</th><td>내용</td></tr>
            </table>
            <div id="btn_wrap">
                <button type="button" id="delete">삭제하기</button>
                <button type="button" id="close">창닫기</button>
            </div>
        </div>
    </div>
</div>

<script>
    function selectQna(data){
        let qna_no = data;
        let result = ""
        $.getJSON("/dozip/select_qna/"+qna_no, function(data){
            result += "<tr><th>제목</th><td>"+data.qna_title+"</td></tr>"
                + "<tr><th>문의업체</th><td>"+data.businessName+"</td></tr>"
                + "<tr><th>문의유형</th><td>"+data.qna_type+"</td><tr>"
                + "<tr><th>작성일자</th><td>"+data.qna_date+"</td><tr>"
                + "<tr><th>내용</th><td id='cont'><textarea readonly disabled>"+data.qna_cont+"</textarea></td><tr>"
            $('#qna_box').html(result);
        })
        show ();
    }

    function show () {
        document.querySelector(".background").className = "background show";
    }
    function close () {
        document.querySelector(".background").className = "background";
    }
    document.querySelector("#close").addEventListener("click", close);

    $( ".my_qna_table tr " ).on( "mouseover", function() {
        $( this ).css( "background-color", "#FFF8E6" );/*FFF8E6/ECF7FF/EEF1FF*/
    });
    $( ".my_qna_table tr " ).on( "mouseleave", function() {
        $( this ).css( "background-color", "white" );
    });
</script>

<%-- 하단 공통부분 --%>
<jsp:include page="./mypage_footer.jsp" />