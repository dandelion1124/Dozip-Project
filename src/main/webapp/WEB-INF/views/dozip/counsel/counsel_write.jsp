<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../common/header.jsp" />
<%-- 상단 공통부분 끝 --%>

<div class="counsel_write_wrap">
	<div class="counsel_write_title">
		<hr/>
		<p>고객센터 - 문의하기</p>
	</div>
	<div class="counsel_write_form_box">
		<form id="counsel_write_form" action="counsel_write_ok.do" method="post">
			<span>제목<br/></span>
			<input type="text" name="qna_title"  id="qna_title"  placeholder="제목을 입력해주세요"/><br/>
			<span>문의유형<br/></span>
			<select name="qna_type" id="qna_type">
				<option selected>문의유형</option>
				<option value="1번 문의유형">1번 문의유형</option>
				<option value="2번 문의유형">2번 문의유형</option>
				<option value="3번 문의유형">3번 문의유형</option>
				<option value="4번 문의유형">4번 문의유형</option>
				<option value="5번 문의유형">5번 문의유형</option>
			</select><br />
			<span>문의내용<br /></span>
			<textarea name="qna_cont" id="qna_cont" placeholder="문의내용을 상세히 적어주시면 상담에 도움이 됩니다."></textarea><br/>
    		<div class="cw_btn_wrap"><button type="submit" id="qna_btn">작성완료</button></div>
		</form>	
	</div>



</div>

<%-- 하단 공통부분 --%>
<jsp:include page="../common/footer.jsp" />