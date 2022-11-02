<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="/js/dozip/jquery.js"></script>
<style>
    div.contract_title {
        font-size: 33px;
        text-align: center;
        margin-bottom: 30px;
    }

    #contract_table1 {
        border: 1px solid gray;
        border-collapse: collapse;
        background-color: white;
        margin: 7px 0;
        font-size: 16px;
        width: 100%;
    }

    #contract_table2 {
        width: 100%;
        border-collapse: collapse;
        background-color: white;
        margin: 7px 0;
    }

    #contract_table1 tr, #contract_table2 tr {
        height: 40px;
    }

    #contract_table1 th:first-of-type, #contract_table2 th:first-of-type {
        width: 20%;
    }

    th.contract_area p:first-of-type {
        padding-left: 15px;
        float: left;
        display: inline-flex;
        margin: 0px;
    }

    th.contract_area p:last-of-type {
        padding-right: 15px;
        float: right;
        display: inline-flex;
        margin: 0px;
    }

    #contract_table3 {
        border: 0px;
        width: 100%;
        text-align: left;
    }

    th.contract_sign {
        text-align: right;
        padding-right: 30px;
    }
    div#contract_btn input{
        float: right;
        margin: 9px;
    }
</style>

<form id="cont_form">
    <input type="hidden" value="${c.mem_id}" name="mem_id">
    <input type="hidden" value="${c.cont_no}" name="cont_no">
    <input type="hidden" value="${c.est_num}" name="est_num">
    <input type="hidden" value="${c.businessNum}" name="businessNum">
    <h4>계약번호 : ${c.cont_no} </h4>
    <div class="contract_title">인테리어 표준계약서</div>
    <div class="contract_summary">
        <span><b>(공사개요)</b></span>
        <table id="contract_table1" border="1">
            <tr>
                <th>공사명</th>
                <th colspan="2">${c.cont_title.substring(0, c.cont_title.length() - 2)})</th>
            </tr>
            <tr>
                <th>공사장소(면적)</th>
                <th colspan="2" class="contract_area">
                    <p>${c.cont_location}</p>
                    <p> (면적 : ${c.cont_area} m<sup>2</sup>) </p>
                </th>
            </tr>
            <tr>
                <th rowspan="2">공사기간</th>
                <th>착 공</th>
                <td>&nbsp;&nbsp;${c.cont_start.substring(0,10)}</td>
            </tr>
            <tr>
                <th>준 공</th>
                <td>&nbsp;&nbsp;${c.cont_end.substring(0,10)}</td>
            </tr>
        </table>
        </br>
    </div>
    <div class="contract_money">
        <span><b>(공사대금)</b></span>
        <div>
            <p>① 총 공사금액 (&nbsp;&nbsp;￦[${c.cont_total}] 원정(부가가치세 별도임))<br></p>
        </div>
        <div>
            <table id="contract_table2" border="1">
                <tr>
                    <th rowspan="4" style="width:12%;">대금 지급 시기</th>
                    <th style="width:8%;">횟 수</th>
                    <th style="width:25%;">금 액</th>
                    <th style="width:25%;">년 월 일</th>
                    <th style="width:8%;">내 역</th>
                </tr>
                <tr>
                    <th>1차</th>
                    <td>&nbsp;&nbsp;￦${c.cont_cost1}</td>
                    <td>&nbsp;&nbsp;${c.cont_date1.substring(0,10)}</td>
                    <th>계약금</th>
                </tr>
                <tr>
                    <th>2차</th>
                    <td>&nbsp;&nbsp;￦${c.cont_cost2}</td>
                    <td>&nbsp;&nbsp;${c.cont_date2.substring(0,10)}</td>
                    <th>중도금</th>
                </tr>
                <tr>
                    <th>3차</th>
                    <td>&nbsp;&nbsp;￦${c.cont_cost3}</td>
                    <td>&nbsp;&nbsp;${c.cont_date3.substring(0,10)}</td>
                    <th>잔금</th>
                </tr>
            </table>
        </div>
            <p>② "갑"은 전항의 공사대금지급과 관련하여 정당한 사유 없이 지급을 지연하여서는 안되며, 지연 시에는 미지급액에 대하여 지급일 다음 날로부터 완제일까지 연 6%의 지연이자를 지급하여야
                한다.</p>
            <p> &nbsp;&nbsp;"갑"과 "을"은 상호 신의와 성실을 원칙으로 이 계약서에 의하여 공사계약을 체결하고 계약서 2부를 작성하여 각각 1부씩 보관한다.</p>
        </br>
        <div>
            <p style="text-align:center;">${c.cont_date.substring(0,10)}</p>
        </div>
        </br>
        <div>
            <table id="contract_table3">
                <tr>
                    <th colspan="2" style="width:50%";>발주자(시행자) "갑"</th>
                    <th colspan="2">수급자(시공자) "을"</th>
                </tr>
                <tr>
                    <th colspan="2">주 소 : ${c.customer_addr}</th>
                    <%--고객 --%>
                    <th colspan="2">주 소 : ${c.partners_addr}</th>
                    <%-- 파트너스 --%>
                </tr>
                <tr>
                    <th>상 호 / 성 명 : ${c.customer_name}</th>
                    <%-- 고객 --%>
                    <th class="contract_sign">(서명 또는 인)</th>
                    <th>상 호 / 성 명 : ${c.partners_name}</th>
                    <%-- 파트너스 --%>
                    <th class="contract_sign">(서명 또는 인)</th>
                </tr>
                <tr>
                    <th colspan="2">사업자번호 / 주민번호 :
                        <c:if test="${c.customer_number == ' '}"><input size="20" style="background-color: #92d1fc" name="customer_number" id="customer_number"></c:if>
                        <c:if test="${c.customer_number!= ' '}">${c.customer_number}</c:if>
                    </th>
                    <%-- 고객 --%>
                    <th colspan="2">사업자번호 / 주민번호 : ${c.businessNum}</th>
                    <%-- 파트너스 --%>
                </tr>
                <tr>
                    <th colspan="2">전 화 / FAX : ${c.customer_tel}</th>
                    <%-- 고객 --%>
                    <th colspan="2">전 화 / FAX : ${c.partners_tel}</th>
                    <%-- 파트너스 --%>
                </tr>
            </table>
        </div>
        </br>

    </div>
    <div id="contract_btn">
    <input type="button" value="닫기" onclick="window.close()">
    <c:if test="${c.customer_number == ' '}"><input type="button" id="cont_btn" value="계약하기"></c:if>
    <c:if test="${c.customer_number != ' '}">  </c:if>
    </div>
</form>
<script>
    document.getElementById("cont_btn").onclick = function (){
        function params_list() {
            var params = {};  //배열 선언
            var data = $("#cont_form").serializeArray(); //폼태그에 있는 데이터 담기

            $.each(data, function () { //반복문
                var name = $.trim(this.name);  //name 변수에 this.data 의 name 파라미터 값
                var value = $.trim(this.value);  //value 변수에 this.data 의 value 값
                params[name] = value; //params 배열에 키, 값 쌍으로 저장
            });
            return params;
        }

        $.ajax({
            url : '/dozip/contract_ok',
            type : 'post',
            data : {
                data:JSON.stringify(params_list())
            },
            success : function(data) {
                alert("계약이 완료되었습니다.");
                opener.parent.location.reload();
                location.close();
            },
            error:function(error){
                alert("실패했습니다.");
            }
        })
    }

</script>
