<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../common/header.jsp" />
<%-- 상단 공통부분 끝 --%>
  <link rel="stylesheet" href="./css/apply_style_03.css">  
  <script src="./js/apply.js" defer></script>
  <script src="./js/jquery.js"></script>
  <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/> <!--달력css-->
  <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
  <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
  <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
  <script src="./js/sessionStorage.js"></script>
  <script>
   function check(){
	   var est_name = document.getElementById("name");
	   var est_phone = document.getElementById("phone");
	   var est_addr = document.getElementById("addr");
	   var est_desc = document.getElementById("paragraph");
	   
	   if(est_name.value == ""){
		   alert('성함을 알려주세요!');
		   name.focus();
		   return false;
	   }
	   if(est_phone.value == ""){
		   alert('전화번호을 알려주세요!');
		   phone.focus();
		   return false;
	   if(est_phone.value == ""){
		   alert('주소를 알려주세요!');
		   phone.focus();
		   return false;
	   }
	   if(est_desc.value == ""){
		   alert('세부 스타일을 알려주세요!');
		   paragraph.focus();
		   return false;
	   }
   }
  </script>
  
  <title>Step 3</title>
</head>
<body>
<form method="post" onsubmit="return check()" action="estimate_apply3_ok.do">

  <div id="estimate_step03">
    <section aria-label="예산 선택" class="estimate_yourcost">
      <div class="title">
        <h2>상세 내용을 알려주세요</h2><h3>3/4</h3>
      </div>
          <p class="subtitle">단 한번 입력으로 조건에 맞는 전문가들과 간편하게 상담 하세요</p><br />
      <div class="estimate_box">
        <h3>의뢰인 정보 입력</h3>
        <input type="text" id="name" name="name" placeholder="이름을 입력해주세요">
        <input type="text" id="phone" name="phone" placeholder="휴대폰 번호를 입력해 주세요">
        <button type="button" id="certify_phone" onclick="SessionStorage();">인증하기</button>
        <input type="text" id="addr" name="addr" placeholder="주소를 입력해 주세요">
        <button type="button" id="address_btn" onclick="test();">주소찾기</button>

        <div class="para">
        <h3>스타일을 알려주세요(1500자 내외)</h3>
        <p class="textCount">0자</p><p class="textTotal">/1500자</p>
      </div>
       <textarea id="paragraph" name="paragraph" maxlength="1500" placeholder="원하는 스타일에 대해 자유롭게 써주세요"></textarea>
      <%--   <form action="" method="post" enctype="multipart/form-data" name="">
          <input type="file" name="FileName">
      </form> --%>
      </div>
      </section>
     
  <!-- id : 고유한 식별 목적
             class : 재사용을 목적
             name : 컨트롤 요소값(value)을 서버로 전송하기위함-->

  <div class="nextpage">
    <button class="button" id="go-back" onclick="location.href='estimate_apply2.do'">이전</button>
    <button class="button" type="submit" id="go-next" onclick="SessionStorage_page03()">다음</button>
  </div>
  </div>
  </form>
</body>
<%-- 하단 공통부분 --%>
<jsp:include page="../common/footer.jsp" />