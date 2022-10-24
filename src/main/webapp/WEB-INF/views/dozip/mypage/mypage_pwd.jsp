<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="./mypage_header.jsp" />
<%-- 상단 공통부분 끝 --%>
<style>
    /*비밀번호 변경*/
    #my_pwd_modify {
        width: 99%;
        margin: 20px auto;
    }
    .mpm_wrap {
        width:100%;
        display: flex;
        justify-content:space-between;
        flex-direction: column;
        align-items: center;
    }
    .my_pwd_modify_box {
        width: 80%;
        margin: 0 auto;
    }
    .mpm_table {
        width: 100%;
        /*border-collapse: collapse;*/
        border-top: 2px solid #1d1d1d;
    }
    .mpm_table th {
        font-size: 0.9rem;
        width: 20%;
        height: 70px;
        border-bottom: 1px solid #B3B9BE;
        background-color: #f8f8f8;
    }
    .mpm_table td {
        border: none;
        text-decoration: none;
        border-bottom: 1px solid #B3B9BE;
        background-color: white;
    }
    .mpm_table td>input{
        width: 60%;
        height: 25px;
        margin: 5px 0;
        margin-left: 20px;
    }
    #infotext_s {
        color: #0A6EFF;
        font-size: 0.8rem;
        margin:0px;
        padding-left: 20px;
    }
    #mpm_btn_wrap {
        display: flex;
        align-items: center;
    }
    #mpm_btn {
        width: 40%;
        color: white;
        font-size: 1.2rem;
        padding: 10px 0px;
        font-weight: bold;
        border: none;
        background-color: #347844;
        margin: 30px auto;
        letter-spacing: 2px;
    }
    .pwd_info {
        width: 100%;
        text-align: left;
        margin-left: 30px;
    }
    .pwd_info>ul>li {
        list-style: none;
        padding-left: 10px;
    }
</style>
<%-- 비밀번호변경 --%>
<div class="mypage_body" id="my_pwd_modify">
    <div class="mpm_wrap">
        <div class="pwd_info">
            <p style="font-size: 1.7rem; font-weight: bold; margin: 0;">비밀번호 변경</p>
            <ul style="padding:0px;">
                <li style="font-size: 0.8rem; margin-bottom: 7px;"><img src="/images/dozip/blt_check_red.jpg"/>&nbsp;아이디와 같은 비밀번호나 주민등록번호, 생일, 학번, 전화번호 등 개인정보와 관련된 숫자나 연속된 숫자, 통일 반복된 숫자 등</li>
                <li style="font-size: 0.8rem;">&nbsp;&nbsp; 다른 사람이 쉽게 알아 낼 수 있는 비밀번호는 사용하지 않도록 주의하여 주시기 바랍니다..</li>
            </ul>
        </div>
        <hr style="width: 100%; border:0px; border-top: #7f8c8d double;"/>
        <p style="width: 80%; font-weight: bold;">비밀번호 변경</p>
        <form class="my_pwd_modify_box"  >
            <table class="mpm_table">
                <tr>
                    <th>기존 비밀번호</th>
                    <td><input type="password" name="current_pwd" id="current_pwd" placeholder="기존 비밀번호를 입력해주세요."/></td>
                </tr>
                <tr>
                    <th>새 비밀번호</th>
                    <td>
                        <p id="infotext_s">영문, 숫자를 포함한 8자 이상의 비밀번호를 입력해주세요. (특수문자는 허용되지 않습니다.)</p>
                        <input type="password" name="new_pwd" id="new_pwd" placeholder="새로운 비밀번호를 입력해주세요."/>
                    </td>
                </tr>
                <tr>
                    <th>비밀번호 확인</th>
                    <td><input type="password" name="new_pwd_check" id="new_pwd_check" placeholder="다시 한 번 입력해주세요."/></td>
                </tr>
            </table>
            <div id="mpm_btn_wrap"><button type="button" id="mpm_btn" onclick="return change_pwd();" >비밀번호 변경</button></div>
        </form>
    </div>
</div>

<script>
    /*document.getElementById("mpm_btn").onclick = function() {
        var current_pwd = $.trim($("#current_pwd").val());
        var new_pwd = $.trim($("#new_pwd").val());

        $.ajax({
            url : '/dozip/edit_pwd_ok',
            type : 'post',
            dataType : 'json',
            data : {
                current_pwd : current_pwd,
                new_pwd : new_pwd
            },
            success : function(data) {
                alert(data.message);
                location.reload();
            },
            error:function(){
                alert("실패했습니다.");
            }
        });
    }*/
</script>

<%-- 하단 공통부분 --%>
<jsp:include page="./mypage_footer.jsp" />