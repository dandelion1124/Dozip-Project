<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="./mypage_header.jsp" />
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="/css/dozip/qna_popup.css" />
<%-- 상단 공통부분 끝 --%>
<style>
    .my_wrap { width: 97%; margin: 0 auto;}
    .box { margin: 10px; margin-bottom: 30px; }
    #row { display: flex; justify-content: space-between; flex-wrap: wrap; }
    #row>div{ width: 23%; padding-left: 10px; border-radius: 5px; background-color: #2C3E50; color: white; }
    .p_cont{ font-size: 1.8rem; font-weight: bold; margin: 0; }
    #row2 { display: flex; justify-content: space-between; flex-wrap: wrap; }
    #row2>div{ width: 49%; padding-left: 10px; }
    .p_title { margin-bottom: 0; }
    .p_link { margin-top: 5px; margin-bottom: 5px; text-align: right; padding-right: 10px; font-size: 0.8rem; }
    .p_link>a{color: white;}
    .img_box { align-self: center; margin-right: 10px; }
    .txt_box{ width: 70%; }
    .my_qna_cont { width: 100%; }
    .my_qna_table th { background-color: #f7f7f7; font-size: 0.9rem; height: 30px; border-bottom: 1px solid #B3B9BE; border-top: 2px solid #2b2a29; }
    .my_qna_table { width: 100%; text-align: center; border-collapse: collapse; }
    .my_qna_table td { border-bottom: 1px solid #B3B9BE; padding: 10px 0; font-size: 0.8rem; }
    .profile { display: flex; margin: 20px auto; }
    #pf_title { margin-top: 20px; margin-left: 10px; }
    .long{ overflow: hidden; white-space: nowrap; text-overflow: ellipsis; word-break: break-all; max-width : 130px; min-width : 100px; }
    .move_btn { border: none; height: 30px; background-color: #347844; border-radius: 5px; }
    .move_btn > a { color: white; }
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
                <img src="/images/dozip/icons8-estimate-48.png" style="width:70px; height:70px;" />
            </div>
            <div class="txt_box">
                <p class="p_title">나의 견적서(지정)</p>
                <p class="p_cont">${pListCount} 건</p>
                <p class="p_link"><a href="/dozip/my_est">견적내역 확인하기 >> </a></p>
            </div>
        </div>
        <div class="p01" style="display: flex">
            <div class="img_box">
                <img src="/images/dozip/icons8-estimate-48.png" style="width:70px; height:70px;" />
            </div>
            <div class="txt_box">
                <p class="p_title">나의 견적서(입찰)</p>
                <p class="p_cont">${eListCount} 건</p>
                <p class="p_link"><a href="/dozip/my_est2">견적내역 확인하기 >> </a></p>
            </div>
        </div>
        <div class="p01" style="display: flex">
            <div class="img_box">
                <img src="/images/dozip/icons8-review-64.png" style="width:64px; height:64px; margin-left: 5px; margin-bottom: 5px;" />
            </div>
            <div class="txt_box">
                <p class="p_title">나의 후기</p>
                <p class="p_cont">${rListCount} 건</p>
                <p class="p_link"><a href="/dozip/my_review">후기 확인하기 >> </a></p>
            </div>
        </div>
        <div class="p01" style="display: flex">
            <div class="img_box">
                <img src="/images/dozip/icons8-question-64.png" style="width:64px; height:64px;" />
            </div>
            <div class="txt_box">
                <p class="p_title">나의 문의</p>
                <p class="p_cont">${qListCount}건 / ${pqListCount}건</p>
                <p class="p_link"><a href="/dozip/my_Pqna">문의글 확인하기 >> </a></p>
            </div>
        </div>
    </div>
    <div class="box">
        <h3>My 알림&nbsp;<img src="/images/dozip/icons8-notice-64.png" style="width:30px; height:30px;"/></h3>
        <p>오늘 날짜 : ${now}</p>
        <div class="my_qna_cont">
            <table class="my_qna_table">
                <tr>
                    <th style="width: 150px;">말머리</th> <th style="width: 180px;">관련번호</th> <th>알림내용</th> <th style="width: 150px;">이동</th>
                </tr>
                <c:if test="${fn:length(plist) == 0 && fn:length(eplist) == 0 && fn:length(clist) == 0 && fn:length(blist) == 0}">
                    <tr><td colspan="4"> 등록된 글이 없습니다.</td> </tr>
                </c:if>
                <c:if test="${fn:length(plist) != 0}">
                    <c:forEach var="p" items="${plist}">
                        <tr>
                            <td>결제관련</td>
                            <td>계약번호<br/>${p.cont_no}</td>
                            <td><b style="color:red;">${p.pay_state}</b>이 들어왔습니다.<br/>확인 후 결제를 진행해주세요.</td>
                            <td><button class="move_btn"><a href="/dozip/my_contD?cont_no=${p.cont_no}">확인하기</a></button></td>
                        </tr>
                    </c:forEach>
                </c:if>
                <c:if test="${fn:length(eplist) != 0}">
                    <c:forEach var="ep" items="${eplist}">
                        <tr>
                            <td>견적관련</td>
                            <td>견적번호<br/>${ep.est_num}</td>
                            <td>업체(<b style="color: blue;">${ep.businessName}</b>)가 요청하신 견적서를 <b style="color: blue;">수락</b>했습니다.</td>
                            <td><button class="move_btn"><a href="/dozip/my_est">확인하기</a></button></td>
                        </tr>
                    </c:forEach>
                </c:if>
                <c:if test="${fn:length(clist) != 0}">
                    <c:forEach var="c" items="${clist}">
                        <tr>
                            <td>계약관련</td>
                            <td>계약번호<br/>${c.cont_no}</td>
                            <td>업체(<b style="color: #9B51E0;">${c.businessName}</b>)가 계약서를 보냈습니다.<br/>계약을 진행해주세요.</td>
                            <td><button class="move_btn"><a href="/dozip/my_cont">확인하기</a></button></td>
                        </tr>
                    </c:forEach>
                </c:if>
                <c:if test="${fn:length(blist) != 0}">
                    <c:forEach var="b" items="${blist}">
                        <tr>
                            <td>입찰관련</td>
                            <td>견적번호<br/>${b.est_num}</td>
                            <td>업체(<b style="color: green;">${b.businessName}</b>)가 입찰에 참여했습니다.<br/>내용을 확인해주세요.</td>
                            <td><button class="move_btn"><a href="/dozip/my_est2">확인하기</a></button></td>
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
                        <th>구분</th><th>답변상태</th><th>제목</th><th>작성일</th>
                    </tr>
                    <c:if test="${fn:length(qlist) == 0}">
                        <tr><td colspan="4"> 등록된 글이 없습니다.</td> </tr>
                    </c:if>
                    <c:if test="${fn:length(qlist) != 0}">
                        <c:forEach var="q" items="${qlist}">
                            <tr>
                                <td>
                                    <c:if test="${q.businessNum==null}">고객센터</c:if>
                                    <c:if test="${q.businessNum!=null}">업체</c:if>
                                </td>
                                <td id="state">
                                    <c:if test="${q.qna_level != 0}"><span></span></c:if>
                                    <c:if test="${q.qna_level == 0}">${q.reply_state}</c:if>
                                </td>
                                <td id="title" class="long">
                                    <c:if test="${q.qna_level != 0}"><img src="/images/dozip/arrow.png"></c:if>
                                    <a href="#" onclick="selectQna(${q.qna_no})">${q.qna_title}</a>
                                </td>
                                <td id="date">${q.qna_date.substring(0,10)}</td>
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
                        <th>제목</th> <th>내용</th><th>작성일</th>
                    </tr>
                    <c:if test="${rListCount == 0}">
                        <tr><td colspan="3"> 등록된 글이 없습니다.</td> </tr>
                    </c:if>
                    <c:if test="${rListCount != 0}">
                        <c:forEach var="r" items="${rlist}">
                            <tr>
                                <td class="long"><a href="review_detail?re_no=${r.re_no}">${r.re_title}</a></td>
                                <td class="long">${r.re_cont}</td>
                                <td>${r.re_date.substring(0,10)}</td>
                            </tr>
                        </c:forEach>
                    </c:if>
                </table>
            </div>
        </div>
    </div>
    <button id="btn" type="button">테스트</button>
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
    document.getElementById('btn').onclick = function (){
        swal("테스트");
    }

    function selectQna(data){
        let qna_no = data;
        let result = ""
        $.getJSON("/dozip/select_qna/"+qna_no, function(data){
            result += "<tr><th>제목</th><td>"+data.qna_title+"</td></tr>"
                if(data.businessName!=null){
                    result += "<tr><th>문의업체</th><td>"+data.businessName+"</td></tr>"
                }
            result += "<tr><th>문의유형</th><td>"+data.qna_type+"</td><tr>"
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
</script>
<%-- 하단 공통부분 --%>
<jsp:include page="./mypage_footer.jsp" />