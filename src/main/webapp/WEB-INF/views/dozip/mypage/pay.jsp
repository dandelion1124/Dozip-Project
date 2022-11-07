<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="/js/dozip/jquery.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
    body { margin: 0px; }
    #title > p { background-color: #347844; color: white; font-size: 1.5rem; font-weight: bold; padding-left: 15px; padding-top: 10px; padding-bottom: 10px; }
    #pay_box { width: 63%; margin: 50px auto; background-color: #DFE8F8; padding: 20px; border-radius: 5px; }
    #pay_table { margin: 5px auto; background-color: white; padding: 20px; border-top: 2px solid black; font-size: 0.9rem; padding-bottom: 40px;}
    .line { height: 30px; }
    .line input { border: none; padding-left: 20px; }
    .line > th, td { border-bottom: 1px solid lightgray; }
    #cost1 { color:red; font-weight: bold; padding-left: 20px; }
    #pay_btn { margin-top: 40px; border: none; width: 150px; height: 30px; background-color: #347844; color: white; font-weight: bold; font-size: 1.1rem; }
</style>

<div id="title"><p>결제창</p></div>
<form id="pay_box">
    <table id="pay_table">
        <tr class="line"><th colspan="2" style="border-bottom: none; padding-bottom: 30px; font-size: 1.1rem;">< 결 제 내 역 ></th></tr>
        <tr class="line">
            <th>계약 번호</th><td><input type="text" id="cont_no" value="${cont_no}" readonly></td>
        </tr>
        <tr class="line">
            <th>결제 종류</th><td><input type="text" id="name" value="${name}" readonly></td>
        </tr>
        <tr class="line">
            <th>결제 금액</th><td><input type="hidden" id="cost" value="${cost}" readonly><span id="cost1">${cost}</span> 원</td>
        </tr>
        <tr>
            <th colspan="2"><button type="button" id="pay_btn">결 제 하 기</button></th>
        </tr>
    </table>
</form>


<script>
    document.getElementById("pay_btn").onclick = function() {
        let cont_no = $.trim($("#cont_no").val());
        let name = $.trim($("#name").val());
        let cost = $.trim($("#cost").val());

        let res = confirm("결제를 진행하시겠습니까?");

        if(res) {
            $.ajax({
                url: '/dozip/pay_ok',
                type: 'post',
                dataType: 'json',
                data: {
                    cont_no: cont_no,
                    name: name,
                    cost: cost
                },
                success: function (data) {
                    alert(data.res);
                    opener.parent.location.reload();
                    window.close();
                },
                error: function () {
                    alert("실패했습니다.");
                }
            });
        }
    }

    function change(str){
        let inMoney = $(str).text();
        let outMoney = (parseInt(inMoney)*10000).toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
        return outMoney;
    }

    $(document).ready(function(){
        $('#cost1').text(change('#cost1'));
    })
</script>