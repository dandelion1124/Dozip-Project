<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="../common/header.jsp" />
<%-- 상단 공통부분 끝 --%>
<style>
    .menu_list ul {
        list-style: none;
        margin:0;
        padding: 0;
        display: block;
        margin-block-start: 0.5em;
        margin-block-end: 1em;
        margin-inline-start: 0px;
        margin-inline-end: 0px;
        padding-inline-start: 20px;
    }
    .menu_list li {
        display: list-item;
        text-align: -webkit-match-parent;
        margin:0;
        padding: 0;
        font-size: 0.8rem;
    }
    .left-side-bar {
        width: 12%;
        margin-left: 50px;
        margin-top: 50px;
        padding: 10px;
        float: left;
    }
    .menu_title {
        font-weight: bold;
        font-size: 1.0rem;
    }
    .navigator>li>ul>li {
        margin-bottom: 5px;
    }
    .content_wrap {
        width: 75%;
        float: left;
        margin-left: 50px;
        margin-top: 50px;
        padding: 10px;
    }
    .content_box {
        /*background-color: #f8f8f8;*/
        width: 100%;
        margin-top: 5px;
        border: 1px dotted #7f8c8d;
        border-top: 5px #2b2a29 solid;
    }
    .menu_list {
        background-color: #f8f8f8;
        padding: 10px;
    }
    .heading {
        color: #fff;
        background-color: #555;
        font-size: 1.2rem;
        text-align: center;
        width: 100%;
        font-weight: bold;
        height: 45px;
    }
</style>
<div class="left-side-bar">
    <div style="text-align: center; font-size: 1.2rem; font-weight: bold">마 이 페 이 지</div>
    <div class="heading">
        <p style="padding-top: 10px; padding-bottom: 10px;">MENU</p>
    </div>
    <div class="menu_list">
        <ul class="navigator">
            <li>
                <a class="menu_title">MY 나의활동</a>
                <ul>
                    <li><a>내정보</a></li>
                    <li><a href="/dozip/my_edit">회원정보수정</a></li>
                    <li><a href="/dozip/my_pwd">비밀번호 변경</a></li>
                    <li><a>스크랩관리</a></li>
                    <li><a>후기관리</a></li>
                </ul>
            </li>
            <li>
                <a class="menu_title">MY 계약관리</a>
                <ul>
                    <li><a href="/dozip/my_cont">나의계약</a></li>
                    <li><a href="/dozip/my_est">견적신청관리(지정)</a></li>
                    <li><a href="/dozip/my_est2">견적신청관리(자유)</a></li>
                </ul>
            </li>
            <li>
                <a class="menu_title">MY 질문관리</a>
                <ul>
                    <li><a href="/dozip/my_qna">고객센터문의</a></li>
                    <li><a href="/dozip/my_Pqna">업체문의</a></li>
                </ul>
            </li>
        </ul>
    </div>
</div>

<div class="content_wrap">
    <div style="font-size: 0.9rem; margin-bottom:15px;"> | My Page > 메뉴선택 > 메뉴선택 </div>
    <div class="content_box">