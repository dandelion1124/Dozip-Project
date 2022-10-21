<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="./mypage_header.jsp" />
<%-- 상단 공통부분 끝 --%>
<link rel = "stylesheet" type = "text/css" href = "/css/dozip/cont.css"/>

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
    .contract_info {
        width: 100%;
        text-align: left;
        margin-left: 30px;
    }
    .contract_info>ul>li {
        list-style: none;
        padding-left: 10px;
    }

</style>

<%-- 견적신청내역 --%>
<div class="mypage_body" id="my_contract_list">
    <div class="my_contract_wrap">
        <div class="contract_info">
            <p style="font-size: 1.7rem; font-weight: bold; margin: 0;">계약번호 : ${c.cont_no} </p>
            <ul style="padding:0px;">
                <li style="font-size: 0.8rem; margin-bottom: 7px;"><img src="/images/dozip/blt_check_red.jpg"/>&nbsp;고객님의 계약진행 내역을 확인할 수 있습니다.</li>
            </ul>
        </div>
        <hr style="width: 100%; border:0px; border-top: #7f8c8d double;"/>

        <%-- 상세내용 불러옴 --%>
        <div class="follow_title_wrap">
            <p id="follow_title">현재진행상태</p>
            <div class="progress_bar"><div class="progress"></div></div><p id="progress_percent">45%</p>
        </div>
        <div class="my_contract_info2">
            <table>
                <tr>
                    <th>대기중</th><th rowspan="2" class="next_arrow">>></th>
                    <th>계약완료</th><th rowspan="2" class="next_arrow">>></th>
                    <th>공사중</th><th rowspan="2" class="next_arrow">>></th><th>공사완료</th>
                </tr>
                <tr>
                    <td>0</td><td>0</td><td style="color: blue;">1</td><td>0</td>
                </tr>
            </table>
        </div>

        <div class="ppp">
            <div class="my_contract_cont2">
                <p>요약내용</p>
                <div class="contract_summary">
                    <table id="contract_summary_table">
                        <tr>
                            <th class="cst_th">업체명</th> <th class="cst_th">:&nbsp;</th> <td class="cst_td">${c.businessName}</td>
                        </tr>
                        <tr>
                            <th class="cst_th">공사일정</th> <th class="cst_th">:&nbsp;</th> <td class="cst_td">${c.cont_start} - ${c.cont_end}</td>
                        </tr>
                        <tr>
                            <th class="cst_th">공사금액</th> <th class="cst_th">:&nbsp;</th> <td class="cst_td">${c.cont_total}원</td>
                        </tr>
                        <tr>
                            <th class="cst_th">공간유형</th> <th class="cst_th">:&nbsp;</th> <td class="cst_td">${c.cont_title}</td>
                        </tr>
                        <tr>
                            <th class="cst_th">평수</th> <th class="cst_th">:&nbsp;</th> <td class="cst_td">${c.cont_area}평</td>
                        </tr>
                    </table>
                    <div class="contract_view_wrap">
                        <button id="apply_view">신청서 확인하기</button>
                        <button id="contract_view">계약서 확인하기</button>
                    </div>
                </div>
            </div>
            <div class="contract_pay">
                <p>결제내역</p>
                <div class="contarct_pay_wrap">
                    <table class="contarct_pay_table">
                        <tr style="height: 50px;">
                            <th colspan="3" class="cpt_th" id="ttt">총 공사대금 <span id="total_pay">${c.cont_total}</span> 원 </th> <th class="cpt_th">요청일</th> <th class="cpt_th">결제일</th>
                        </tr>
                        <tr>
                            <th class="cpt_th">계약금</th> <th class="cpt_th">:</th> <td class="cpt_td">${c.cont_cost1}</td> <td class="cpt_td">${c.cont_date1}</td> <td class="cpt_td">2022.11.02</td>
                        </tr>
                        <tr>
                            <th class="cpt_th">중도금</th> <th class="cpt_th">:</th> <td class="cpt_td">${c.cont_cost2}</td> <td class="cpt_td">${c.cont_date2}</td> <td class="cpt_td">2022.11.16</td>
                        </tr>
                        <tr>
                            <th class="cpt_th">잔금</th> <th class="cpt_th">:</th> <td class="cpt_td">${c.cont_cost3}</td> <td class="cpt_td">${c.cont_date3}</td> <td class="cpt_td">-</td>
                        </tr>
                    </table>
                    <div class="pay_wrap">
                        <select name="pay_select" id="pay_select">
                            <option selected>결제선택</option>
                            <option value="1">계약금</option>
                            <option value="2">중도금</option>
                            <option value="3">잔금</option>
                        </select>
                        <span>선택한 결제 금액</span>
                        <button id="pay_btn">결제하기</button>
                    </div>
                </div>
            </div>
        </div>
        <%-- 상세내용 불러옴 --%>


    </div>
</div>

<%-- 하단 공통부분 --%>
<jsp:include page="./mypage_footer.jsp" />