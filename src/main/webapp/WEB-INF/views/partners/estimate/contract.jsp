<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="/js/partners/jquery.js"></script>
<script src="/js/partners/contract.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="/css/partners/contract.css">
<form method="post" id="contract_form">
    <input type="hidden" value="${ev.mem_id}" name="mem_id">
    <input type="hidden" value="${ev.est_num}" name="est_num">
    <h4>NO-${ev.est_num}</h4>
    <div class="contract_title">인테리어 표준계약서</div>
    <div class="contract_summary">
        <span><b>(공사개요)</b></span>
        <table id="contract_table1" border="1">
            <tr>
                <th>공사명</th>
                <th colspan="2">
                    <input value='${ev.est_use} 시공의뢰(${ev.est_detail})' name="cont_title" size="40" readonly>
                </th>
            </tr>
            <tr>
                <th>공사장소(면적)</th>
                <th colspan="2" class="contract_area">
                    <p><input value="${ev.est_addr}" name="cont_location" size="40" readonly></p>
                    <p> (면적 : <input type="text" value="${ev.est_areaP}" size="1" name="cont_area" readonly> m<sup>2</sup>) </p>
                </th>
            </tr>
            <tr>
                <th rowspan="2">공사기간</th>
                <th>공사시작일</th>
                <td><input type="date" value="${ev.est_start}" name="cont_start" readonly>
                </td>
            </tr>
            <tr>
                <th>공사완료일</th>
                <td><input type="date" value="${ev.est_end}" name="cont_end" readonly>
                </td>
            </tr>
        </table>
        </br>
    </div>
    <div class="contract_money">
        <span><b>(공사대금)</b></span>
        <div>
            <p>① 총 공사금액 (￦[<input name="cont_total" id="cont_total" placeholder="금액입력" size="4" onkeyup="inputNumberFormat(this)">] 만원<br></p>
        </div>
        <div>
            <table id="contract_table2" border="1">
                <tr>
                    <th rowspan="4" style="width:15%;">대금 지급 시기</th>
                    <th style="width:5%;">횟 수</th>
                    <th style="width:25%;">금 액</th>
                    <th style="width:25%;">년 월 일</th>
                    <th style="width:8%;">내 역</th>
                </tr>
                <tr>
                    <th>1차</th>
                    <td> ￦<input name="cont_cost1" id="cont_cost1" placeholder="금액입력" size="4" onkeyup="inputNumberFormat(this)"> 만원</td>
                    <td><input type="date" name="cont_date1" id="cont_date1" placeholder="입력해주세요" max="${ev.est_start}"></td>
                    <th>계약금</th>
                </tr>
                <tr>
                    <th>2차</th>
                    <td> ￦<input name="cont_cost2" id="cont_cost2" placeholder="금액입력" size="4" onkeyup="inputNumberFormat(this)"> 만원</td>
                    <td><input type="date" name="cont_date2" id="cont_date2" placeholder="입력해주세요"  max="${ev.est_end}" min="${ev.est_start}"></td>
                    <th>중도금</th>
                </tr>
                <tr>
                    <th>3차</th>
                    <td> ￦<input name="cont_cost3" id="cont_cost3" placeholder="금액입력" size="4" onkeyup="inputNumberFormat(this)"> 만원</td>
                    <td><input type="date" name="cont_date3" id="cont_date3" placeholder="입력해주세요"  max="${ev.est_end}" min="${ev.est_start}"></td>
                    <th>잔금</th>
                </tr>
            </table>
        </div>
        <p>② "갑"은 전항의 공사대금지급과 관련하여 정당한 사유 없이 지급을 지연하여서는 안되며, 지연 시에는 미지급액에 대하여 지급일 다음 날로부터 완제일까지 연 6%의 지연이자를 지급하여야
            한다.</p>
        <p> &nbsp;&nbsp;"갑"과 "을"은 상호 신의와 성실을 원칙으로 이 계약서에 의하여 공사계약을 체결하고 계약서 2부를 작성하여 각각 1부씩 보관한다.</p>
        </br>
        <div>
            <p style="text-align:center;">
                <jsp:useBean id="now" class="java.util.Date" />
                <fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
                <input type="date" value="${today}" name="cont_date" id="cont_date" size="12" readonly>
            </p>
        </div>
        </br>
        <div>
            <table id="contract_table3">
                <tr>
                    <th colspan="2" style="width:50%" ;>발주자(시행자) "갑"</th>
                    <th colspan="2">수급자(시공자) "을"</th>
                </tr>
                <tr>
                    <th colspan="2">주 소 : <input value="${ev.est_addr}" name="customer_addr" readonly></th>
                    <%--고객 --%>
                    <th colspan="2">주 소 : <input value="불러와야함" name="partners_addr" readonly></th>
                    <%-- 파트너스 --%>
                </tr>
                <tr>
                    <th>상 호 / 성 명 : <input value="${ev.est_name}" size="8" name="customer_name" readonly></th>
                    <%-- 고객 --%>
                    <th class="contract_sign">(서명 또는 인)</th>
                    <th>상 호 / 성 명 : <input value="${businessName}" size="8" name="partners_name" readonly></th>
                    <%-- 파트너스 --%>
                    <th class="contract_sign">(서명 또는 인)</th>
                </tr>
                <tr>
                    <th colspan="2">사업자번호 / 주민번호 :</th>
                    <%-- 고객 --%>
                    <th colspan="2">사업자번호 / 주민번호 : <input value="${businessNum}" size="10" name="businessNum" readonly>
                    </th>
                    <%-- 파트너스 --%>
                </tr>
                <tr>
                    <th colspan="2">전 화 / FAX : <input value="${ev.est_phone}" name="customer_tel" readonly></th>
                    <%-- 고객 --%>
                    <th colspan="2">전 화 / FAX : <input name="partners_tel" id="partners_tel"  placeholder="입력해주세요"> </th>
                    <%-- 파트너스 --%>
                </tr>
            </table>
        </div>
        </br>
    </div>
    <div id="contract_btn">
        <input type="button" value="닫기" onclick="window.close()">
        <input type="button" value="계약하기" onclick="contract_write()">
    </div>
</form>
