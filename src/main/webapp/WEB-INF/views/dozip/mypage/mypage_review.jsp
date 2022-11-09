<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="./mypage_header.jsp" />
<%-- 상단 공통부분 끝 --%>
<style>
    #my_review_list { width: 99%; margin: 20px auto; }
    .rv_wrap { width:100%; display: flex; justify-content:space-between; flex-direction: column; align-items: center; }
    .my_rv_cont { width: 90%; }
    #review_write_btn { border: 0; font-size: 1.2rem; font-weight:bold; background-color: #347844; text-align: center; width: 30%; height: 45px; }
    #review_write_btn a { color: white; }
    #my_rv_text { text-align: center; font-weight: bold; margin-bottom: 200px; }
    #my_rv_text  a { text-decoration: underline; color: #347844; }
    .rv_info { width: 100%; text-align: left; margin-left: 30px; }
    .rv_info>ul>li { list-style: none; padding-left: 10px; }
    .review_box { margin: 40px auto; text-align: center; }
    .my_rv_table th { background-color: #f7f7f7; font-size: 0.9rem; height: 30px; border-bottom: 1px solid #B3B9BE; border-top: 2px solid #2b2a29; }
    .my_rv_table { width: 100%; text-align: center; border-collapse: collapse;}
    .my_rv_table td { border-bottom: 1px solid #B3B9BE; padding: 10px 0; font-size: 0.8rem; }
    .page_area{ text-align:center; margin-top: 10px; }
    .re_contt{ overflow: hidden; white-space: nowrap; text-overflow: ellipsis; word-break: break-all; max-width: 200px; min-width : 100px;  }
    #r_del{border:none; border-radius: 2px;color: white;background-color: #FF0033; height: 25px;}
</style>


<%-- 내 후기 관리 --%>
<div class="mypage_body" id="my_review_list">
    <div class="rv_wrap">
        <div class="rv_info">
            <p style="font-size: 1.7rem; font-weight: bold; margin: 0;">나의 후기</p>
            <ul style="padding:0px;">
                <li style="font-size: 0.8rem; margin-bottom: 7px;"><img src="/images/dozip/blt_check_red.jpg"/>&nbsp;내가 작성한 후기글을 확인 할 수 있습니다.</li>
                <li style="font-size: 0.8rem; margin-bottom: 7px;"><img src="/images/dozip/blt_check_red.jpg"/>&nbsp;제목을 누르면 해당 후기 상세글 페이지로 이동합니다.</li>
                <li style="font-size: 0.8rem;"><img src="/images/dozip/blt_check_red.jpg"/>&nbsp;여기서 글을 수정하거나 삭제할 수 있습니다.</li>
            </ul>
        </div>
        <hr style="width: 100%; border:0px; border-top: #7f8c8d double;"/>
        <p style="width: 90%; font-weight: bold;">${count}건의 후기내역이 있습니다.</p>
        <div class="my_rv_cont">
            <table class="my_rv_table">
                <tr>
                    <th style="width: 8% ">번호</th> <th  style="width: 110px;">계약번호</th>
                    <th style="width: 10%">제목</th> <th>내용</th><th style="width: 120px;">작성일</th>
                    <th style="width: 120px;">후기삭제</th>
                </tr>
                <c:if test="${fn:length(rlist) == 0}">
                    <tr><td colspan="6">등록된 후기가 없습니다</td></tr>
                </c:if>
                <c:if test="${fn:length(rlist)!=0}">
                    <c:forEach var="i" begin="0" end="${fn:length(rlist)-1}" step="1">
                        <tr id="r_tr">
                            <td id="num">
                                <c:set var="number" value="${(p.count-(p.pageSize*(p.page-1)))-i}" />
                                <c:out value="${number}"/>
                            </td>
                            <td id="cont_no">${rlist[i].cont_no}</td>
                            <td class = "re_title"><a href="review_detail?re_no=${rlist[i].re_no}">${rlist[i].re_title}</a></td>
                            <td class = "re_contt" style="width: 100px; padding-left: 50px;">${rlist[i].re_cont}</td>
                            <td>${rlist[i].re_date.substring(0,10)}</td>
                            <td><button id = "r_del" onclick="review_del()"><a href="review_del?re_no=${rlist[i].re_no}">삭제</a></button></td>
                        </tr>
                    </c:forEach>
                </c:if>
            </table>

            <!-- 쪽번호 출력 --><%--쪽번호는 page랑 stratpage, endpage 맞춰서 controller쪽 작성해주시면 되고 아래는 따로 수정 안해도 돼요!--%>
            <div class="page_area">
                <c:if test="${p.page<=1}"><img src="/images/dozip/left-arrow.png"></c:if>
                <c:if test="${p.page>1}"><a href="/dozip/my_review?page=${p.page-1}"><img src="/images/dozip/left-arrow.png"></a></c:if>

                <c:forEach var="page" begin="${p.startpage}" end="${p.endpage}" step="1">
                    <c:if test="${page==p.page}"><span style="color: #347844; font-weight: bold;">${page}</span></c:if>
                    <c:if test="${page!=p.page}"><a href="/dozip/my_review?page=${page}">${page}</a></c:if>
                </c:forEach>

                <c:if test="${p.page>=p.maxpage}"><img src="/images/dozip/right-arrow.png"></c:if>
                <c:if test="${p.page<p.maxpage}"><a href="/dozip/my_review?page=${p.page+1}"><img src="/images/dozip/right-arrow.png"></a></c:if>
            </div>
        </div>
    </div>
    <div class="review_box"><button id="review_write_btn">
        <a href="/dozip/review_write" >리뷰 작성하기</a>
    </button></div>
    <p id="my_rv_text">다른 고객들의 리뷰를 보고싶다면?&nbsp;&nbsp; <a href="/dozip/review_main">다른 리뷰 보러가기</a></p>
</div>

<script>
    $( ".my_rv_table tr " ).on( "mouseover", function() {
        $( this ).css( "background-color", "#ECF7FF" );/*FFF8E6/ECF7FF/EEF1FF*/
    });
    $( ".my_rv_table tr " ).on( "mouseleave", function() {
        $( this ).css( "background-color", "white" );
    });
</script>

<script>
    function review_del(){
        alert('후기를 삭제하시겠습니까?');
    }
</script>


<%-- 하단 공통부분 --%>
<jsp:include page="./mypage_footer.jsp" />