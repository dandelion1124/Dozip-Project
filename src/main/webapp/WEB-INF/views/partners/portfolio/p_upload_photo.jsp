<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp" />
<div id=photo_upload_title>
<h1>사진등록페이지</h1>
<p>포트폴리오에 등록할 사진을 첨부해주세요. 최대 5장까지 가능합니다</p>
</div>
<form action="upload_photo_ok.do" method="post"	enctype="multipart/form-data">
	<div id=uploda_photo_cont>
		<div>
			<div class="photo_inputfile">
				<input type="file" name="photo01" id="photo01" onchange="loadFile1(this)">
			</div>
			<div>
				<img alt="미리보기1" id="preview1" style="display: none;">
			</div>
		</div>
		<div>
			<div class="photo_inputfile">
				<input type="file" name="photo02" id="photo02" onchange="loadFile2(this)">
			</div>
			<div>
				<img alt="미리보기2" id="preview2" style="display: none;">
			</div>

		</div><div>
			<div class="photo_inputfile">
				<input type="file" name="photo03" id="photo03" onchange="loadFile3(this)">
			</div>
			<div>
				<img alt="미리보기3" id="preview3" style="display: none;">

			</div>
		</div><div>
			<div class="photo_inputfile">
				<input type="file" name="photo04" id="photo04" onchange="loadFile4(this)">
			</div>
			<div>
				<img alt="미리보기4" id="preview4" style="display: none;">
			</div>
		</div><div>
			<div class="photo_inputfile">
				<input type="file" name="photo05" id="photo05" onchange="loadFile5(this)">
			</div>
			<div>
				<img alt="미리보기5" id="preview5" style="display: none;">
			</div>
		</div></div>
	<div>	<input type="submit" value="등록">
	</div>
</form>
<jsp:include page="../include/footer.jsp" />