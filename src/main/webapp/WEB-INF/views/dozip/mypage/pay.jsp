<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="/js/dozip/jquery.js"></script>

<p>넘어온 값 확인</p>
<form id="pay_box">
    계약 번호 : <input type="text" id="cont_no" value="${cont_no}"><br/>
    결제 종류 : <input type="text" id="name" value="${name}"><br/>
    결제 금액 : <input type="text" id="cost" value="${cost}">
</form>
<br/>
<button type="button" id="pay_btn">결제하기</button>

<script>
    document.getElementById("pay_btn").onclick = function() {
        var cont_no = $.trim($("#cont_no").val());
        var name = $.trim($("#name").val());
        var cost = $.trim($("#cost").val());

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
</script>