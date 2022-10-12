<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../common/header.jsp" />
<link rel="stylesheet" type="text/css" href="/css/dozip/counsel.css" />
<%-- 상단 공통부분 끝 --%>

<div class="counsel_write_wrap">
	<div class="content_box">
	<div class="write_info">
		<p style="font-size: 1.7rem; font-weight: bold; margin: 0; margin-top: 20px;">문의글 작성</p>
		<ul style="padding:0px;">
			<li style="font-size: 0.8rem; margin-bottom: 7px;"><img src="/images/dozip/blt_check_red.jpg"/>&nbsp;한번 등록한 상담내용은 수정이 불가능합니다. 수정을 원하시는 경우, 삭제 후 재등록 하셔야 합니다.</li>
			<li style="font-size: 0.8rem; margin-bottom: 7px;"><img src="/images/dozip/blt_check_red.jpg"/>&nbsp;문의는 24시간 신청가능하며 접수된 내용은 빠른 시간내에 답변을 드리도록 하겠습니다.</li>
			<li style="font-size: 0.8rem;"><img src="/images/dozip/blt_check_red.jpg"/>&nbsp;각 항목을 모두 작성해주십시오.</li>
		</ul>
	</div>
	<hr style="width: 100%; border:0px; border-top: #7f8c8d double;"/>
	<div class="counsel_write_form_box">
		<form id="counsel_write_form" action="qna_write_ok" method="post">
			<p style="width: 80%; font-weight: bold;">문의글 작성</p>
			<table class="write_table">
				<tr>
					<th>제목</th>
					<td><input type="text" name="qna_title"  id="qna_title"  placeholder="제목을 입력해주세요"/></td>
				</tr>
				<tr>
					<th>문의유형</th>
					<td>
						<select name="qna_type" id="qna_type">
							<option selected>문의유형</option>
							<option value="1번 문의유형">1번 문의유형</option>
							<option value="2번 문의유형">2번 문의유형</option>
							<option value="3번 문의유형">3번 문의유형</option>
							<option value="4번 문의유형">4번 문의유형</option>
							<option value="5번 문의유형">5번 문의유형</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>문의내용</th>
					<td><textarea name="qna_cont" id="qna_cont" placeholder="문의내용을 상세히 적어주시면 상담에 도움이 됩니다."></textarea></td>
				</tr>
			</table>
			<div class="cw_btn_wrap">
				<button type="submit" id="qna_btn">작성완료</button>
			</div>
		</form>	
	</div>

	</div>

</div>

<%-- 하단 공통부분 --%>
<jsp:include page="../common/footer.jsp" />