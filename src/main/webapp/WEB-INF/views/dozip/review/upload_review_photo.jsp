<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../common/header.jsp" />
<%-- 상단 공통부분 끝 --%>

<style>
    #r_photo_wrap{
        margin-top : 100px;
        margin-left : 50px;
        margin-botton : 50px;
    }

    .upload_zone{
        width: 70%;
        min-height : 200px;
        border : 3px solid #0A6EFF;
    }
    .input_wrap{
        margin-bottom: 10px;
    }

    #submitAction{
        margin-top : 10px;
    }
</style>
    <div id = r_photo_wrap>
        <h2>고객후기 사진등록</h2>
        <h3>고객후기 사진등록시 소정의 상품을 드립니다. 사진은 최대 5장까지 가능합니다</h3>
        <form action = "upload_rphoto_ok" method = "post" enctype = "multipart/form-data" id = "upload_rphoto_form" onsubmit="return upload_rcheck()">
            <div id = "upload_review_photo">
                <div class = "input_wrap">
                    <input type = "file" id = "images" name = "images" multiple='multiple'/>
                </div>
                <div class = "upload_zone" id = "upload_zone"></div>
                <div><input type = "submit" value = "사진등록" id = "submitAction"/></div>
            </div>
        </form>
    </div>


    <script>
        function upload_rcheck(){
            var n = document.getElementById("images");
            var len = "";
            if('files' in n){
                if(n.files.length>5){
                    alert("사진은 5개까지 등록가능합니다");
                    return false;
                }
            }
        }

        (
            image_View = function image_View(upload_zone, images){

                var upload_zone = document.getElementById(upload_zone);
                var images = document.getElementById(images)
                var select_files = [];

                // 이미지와 체크 박스를 감싸고 있는 div 속성
                var div_style = 'display:inline-block;position:relative;'
                    + 'width:200px;height:200px;margin:2px;border:1px solid darkslategrey;z-index:1';
                // 미리보기 이미지 속성
                var img_style = 'width:100%;height:100%;z-index:none';
                // 이미지안에 표시되는 체크박스의 속성
                var chk_style = 'width:40px;height:25px;position:absolute;font-size:15px;'
                    + 'right:0px;bottom:0px;z-index:999;border: 1px solid black';

                images.onchange = function(e){
                    var files = e.target.files;
                    var fileArr = Array.prototype.slice.call(files)
                    for(f of fileArr){
                        imageLoader(f);
                    }
                }


                // 탐색기에서 드래그앤 드롭 사용
                upload_zone.addEventListener('dragenter', function(e){
                    e.preventDefault();
                    e.stopPropagation();
                }, false)

                upload_zone.addEventListener('dragover', function(e){
                    e.preventDefault();
                    e.stopPropagation();

                }, false)

                upload_zone.addEventListener('drop', function(e){
                    var files = {};
                    e.preventDefault();
                    e.stopPropagation();
                    var dt = e.dataTransfer;
                    files = dt.files;
                    for(f of files){
                        imageLoader(f);
                    }

                }, false)

                /*첨부된 이미지를 배열에 넣고 미리보기 */
                imageLoader = function(file){
                    select_files.push(file);
                    var reader = new FileReader();
                    reader.onload = function(ee){
                        let img = document.createElement('img')
                        img.setAttribute('style', img_style)
                        img.src = ee.target.result;
                        upload_zone.appendChild(makeDiv(img, file));
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
                        for(f in select_files) {
                            var file = select_files[f];
                            dt.items.add(file);
                        }
                        images.files = dt.files;
                        var p = ele.parentNode;
                        upload_zone.removeChild(p)
                    }
                    div.appendChild(img)
                    div.appendChild(btn)
                    return div
                }
            }
        )('upload_zone', 'images')
    </script>



<%-- 하단 공통부분 --%>
<jsp:include page="../common/footer.jsp" />