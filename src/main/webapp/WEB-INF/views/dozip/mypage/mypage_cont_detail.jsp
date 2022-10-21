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

        <h2>내용부분</h2>

    </div>
</div>

<%-- 하단 공통부분 --%>
<jsp:include page="./mypage_footer.jsp" />