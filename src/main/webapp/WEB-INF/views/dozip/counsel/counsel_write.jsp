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
		<form id="counsel_write_form">
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
							<option value="문의유형" selected>문의유형</option>
							<option value="서비스안내">서비스안내</option>
							<option value="견적">견적</option>
							<option value="상담">상담</option>
							<option value="계약">계약</option>
							<option value="공사">공사</option>
							<option value="시공후">시공후</option>
							<option value="파트너스">파트너스</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>문의내용</th>
					<td><textarea name="qna_cont" id="qna_cont" placeholder="문의내용을 상세히 적어주시면 상담에 도움이 됩니다."></textarea></td>
				</tr>
			</table>
			<div class="cw_btn_wrap">
				<button type="button" id="qna_btn">작성완료</button>
			</div>
		</form>
	</div>

	</div>

	<script>
		document.getElementById('qna_btn').onclick = function (){
			let qna_title = $.trim($("#qna_title").val());
			let qna_type = $.trim($("#qna_type").val());
			let qna_cont = $.trim($("#qna_cont").val());

			if (qna_title === '') {
				alert('제목을 입력해주세요.');
				return false;
			}
			if (qna_type === '문의유형') {
				alert('문의유형을 선택해주세요.');
				return false;
			}
			if (qna_cont === '') {
				alert('내용을 입력해주세요.');
				return false;
			}

			$.ajax({
				url : '/dozip/qna_write_ok',
				type : 'post',
				data : {
					qna_title : qna_title,
					qna_type : qna_type,
					qna_cont : qna_cont
				},
				success : function() {
					alert('글이 작성되었습니다.');
					var myReferer = document.referrer;
					if(myReferer.substring(0,34)==="http://localhost:8084/dozip/my_qna"){
						location.replace("/dozip/my_qna");
					}else if(myReferer.substring(0,40)==="http://localhost:8084/dozip/counsel_main"){
						location.replace("/dozip/counsel_main");
					}
				},
				error:function(){
					alert("글 저장에 실패했습니다.");
				}
			});
		}
	</script>

</div>

<%-- 하단 공통부분 --%>
<jsp:include page="../common/footer.jsp" />