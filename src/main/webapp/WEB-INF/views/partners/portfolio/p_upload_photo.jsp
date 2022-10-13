<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp" />
<style>
	#upload_photo_cont {
		margin: 50px;
		display: flex;
		width: 400px;
		justify-content: space-around;
		border-bottom: 4px solid slategray;
	}
	#upload_photo_cont input[type=submit] {
		width: 73px;
		border: none;
		background: deepskyblue;
		padding: 6px;
		font-size: 14px;
		border-radius: 4px;
	}
</style>

<div id=photo_upload_title>
<h1>사진등록페이지</h1>
<p>포트폴리오에 등록할 사진을 첨부해주세요. 최대 5장까지 가능합니다</p>
</div>
<form action="upload_photo_ok" method="post" enctype="multipart/form-data" id="upload_photo_form">
	<div id=upload_photo_cont>
		<div>
			<div class="photo_inputfile">
				<input  type="file" name="photos" multiple="multiple" placeholder="파일 등록">
			</div>
		</div>


	<div>	<input type="submit" value="등록">
	</div>
	</div>
</form>
<jsp:include page="../include/footer.jsp" />