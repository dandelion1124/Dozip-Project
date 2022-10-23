<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../common/header.jsp" />
<%-- 상단 공통부분 끝 --%>

    <div id = r_photo_wrap>
        <h2>고객후기 사진등록</h2>
        <h3>고객후기 사진등록시 소정의 상품을 드립니다. 사진은 최대 5장까지 가능합니다</h3>
        <form action = "upload_rphoto_ok" method = "post" enctype = "multipart/form-data" id = "upload_rphoto_form" onsubmit="return upload_rcheck()">
            <div id = "upload_review_photo">
                <input type = "file" id = "images" name = "images" multiple='multiple'/>
                <div id = "image_zone" data-placeholder = '사진을 첨부하려면 선택을 클릭하거나 파일을 드래그앤드롭 하세요'></div>
                <div><input type = "submit" value = "등록"></div>
            </div>
        </form>
    </div>



<%-- 하단 공통부분 --%>
<jsp:include page="../common/footer.jsp" />