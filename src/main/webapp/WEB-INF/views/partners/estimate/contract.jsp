<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="/js/partners/jquery.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


<style>
    table input, #cont_total,#cont_date
    {
        border: none;
        color: #0064CD;
    }
    #cont_date{
        font-size: 18px;
    }
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
    #contract_table1 input{
        font-size: 16px;

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

    div#contract_btn input {
        float: right;
        margin: 9px;
    }
</style>
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
        <script>
            function inputNumberFormat(obj) {
                obj.value = comma(uncomma(obj.value));
            }
            function comma(str) {
                str = String(str);
                return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
            }
            function uncomma(str) {
                str = String(str);
                return str.replace(/[^\d]+/g, '');
            }
        </script>
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
    <script>
        function contract_write() {
            if($.trim($('#cont_total').val())=='' || $.trim($('#cont_cost1').val())=='' ||
                $.trim($('#cont_date1').val())==''|| $.trim($('#cont_cost2').val())=='' ||
                $.trim($('#cont_date2').val())==''|| $.trim($('#cont_cost3').val())=='' ||
                $.trim($('#cont_date3').val())=='' || $.trim($('#partners_tel').val())=='')
            {
                swal('NOTICE','계약 내용을 빠짐없이 입력해주세요','error');
                return false;
            }
            function params_list() {
                var params = {};  //배열 선언
                var data = $("#contract_form").serializeArray(); //폼태그에 있는 데이터 담기

                $.each(data, function () { //반복문
                    var name = $.trim(this.name);  //name 변수에 this.data 의 name 파라미터 값
                    var value = $.trim(this.value);  //value 변수에 this.data 의 value 값
                    params[name] = value; //params 배열에 키, 값 쌍으로 저장
                });
                return params;
            }

            $.ajax({
                type: 'post',
                url: 'write_contract_ok',
                data: {
                    data: JSON.stringify(params_list())
                },
                datatype: "json",
                success: function (data) {
                    if (data.status == 1) {
                        alert('계약서 작성 완료!')
                        window.opener.location.href = '/partners/estimate_list'
                        self.close()
                    }
                }
            });
        }
    </script>
</form>
