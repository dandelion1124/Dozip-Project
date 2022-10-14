<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp" />
<style>
	input#photos {
		margin-top: 20px;
	}
	#att_zone {
		width: 95%;
		min-height: 200px;
		padding: 3px;
		margin: 30px 0px;
		border: 2px solid darkslategrey;
		/*font-size: 20px;*/
	}
	#att_zone:empty:before {
		content: attr(data-placeholder);
		color: #999;
		font-size: .9em;
	}
	#upload_photo_cont input[type=submit] {
		width: 73px;
		border: none;
		background: deepskyblue;
		padding: 6px;
		font-size: 14px;
		border-radius: 4px;
		margin-bottom: 20px;
	}
</style>

<div id=photo_upload_title>
	<h1>사진등록페이지</h1>
	<p>포트폴리오에 등록할 사진을 첨부해주세요. 최대 5장까지 가능합니다</p>
</div>
<form action="upload_photo_ok" method="post" enctype="multipart/form-data" id="upload_photo_form">
	<div id=upload_photo_cont>

		<input type='file' name="photos" id='photos' multiple='multiple' />
		<div id='att_zone'
			 data-placeholder='파일을 첨부 하려면 파일 선택 버튼을 클릭하거나 파일을 드래그앤드롭 하세요'></div>
		<div>	<input type="submit" value="등록"> </div>

	</div>
</form>

<script>
	( /* att_zone : 이미지들이 들어갈 위치 id, btn : file tag id */
			imageView = function imageView(att_zone, btn){

				var attZone = document.getElementById(att_zone);
				var photos = document.getElementById(btn)
				var sel_files = [];

				// 이미지와 체크 박스를 감싸고 있는 div 속성
				var div_style = 'display:inline-block;position:relative;'
						+ 'width:200px;height:200px;margin:2px;border:1px solid darkslategrey;z-index:1';
				// 미리보기 이미지 속성
				var img_style = 'width:100%;height:100%;z-index:none';
				// 이미지안에 표시되는 체크박스의 속성
				var chk_style = 'width:40px;height:25px;position:absolute;font-size:15px;'
						+ 'right:0px;bottom:0px;z-index:999;border: 1px solid black';

				photos.onchange = function(e){
					var files = e.target.files;
					var fileArr = Array.prototype.slice.call(files)
					for(f of fileArr){
						imageLoader(f);
					}
				}


				// 탐색기에서 드래그앤 드롭 사용
				attZone.addEventListener('dragenter', function(e){
					e.preventDefault();
					e.stopPropagation();
				}, false)

				attZone.addEventListener('dragover', function(e){
					e.preventDefault();
					e.stopPropagation();

				}, false)

				attZone.addEventListener('drop', function(e){
					var files = {};
					e.preventDefault();
					e.stopPropagation();
					var dt = e.dataTransfer;
					files = dt.files;
					for(f of files){
						imageLoader(f);
					}

				}, false)
				/*첨부된 이미리즐을 배열에 넣고 미리보기 */
				imageLoader = function(file){
					sel_files.push(file);
					var reader = new FileReader();
					reader.onload = function(ee){
						let img = document.createElement('img')
						img.setAttribute('style', img_style)
						img.src = ee.target.result;
						attZone.appendChild(makeDiv(img, file));
					}

					reader.readAsDataURL(file);
				}

				/*첨부된 파일이 있는 경우 checkbox와 함께 attZone에 추가할 div를 만들어 반환 */
				makeDiv = function(img, file){
					var div = document.createElement('div')
					div.setAttribute('style', div_style)

					var btn = document.createElement('input')
					btn.setAttribute('type', 'button')
					btn.setAttribute('value', '삭제')
					btn.setAttribute('delFile', file.name);
					btn.setAttribute('style', chk_style);
					btn.onclick = function(ev){
						var ele = ev.srcElement;
						var delFile = ele.getAttribute('delFile');
						for(var i=0 ;i<sel_files.length; i++){
							if(delFile== sel_files[i].name){
								sel_files.splice(i, 1);
							}
						}
						dt = new DataTransfer();
						for(f in sel_files) {
							var file = sel_files[f];
							dt.items.add(file);
						}
						photos.files = dt.files;
						var p = ele.parentNode;
						attZone.removeChild(p)
					}
					div.appendChild(img)
					div.appendChild(btn)
					return div
				}
			}
	)('att_zone', 'photos')

</script>
<jsp:include page="../include/footer.jsp" />