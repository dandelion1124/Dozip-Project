<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="./mypage_header.jsp" />
<%-- 상단 공통부분 끝 --%>

<div>
    <p>로그아웃 기능(위치 임시로 지정)</p>
    <span>${id} 님 활동</span> <button id="logout_btn" onclick="location='/dozip/logout_ok';">로그아웃</button>
</div>

<%-- 하단 공통부분 --%>
<jsp:include page="./mypage_footer.jsp" />