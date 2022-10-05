<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../common/header.jsp" />
<%-- 상단 공통부분 끝 --%>
  <link rel="stylesheet" href="./css/apply_style_05.css">  
  <script src="./js/apply.js" defer></script>
  <script src="./js/jquery.js"></script>
  <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
  <script src="./js/sessionStorage.js"></script>

  <title>Step 5</title>
</head>

<body>
<form method="post">

  <div id="estimate_step05">
    <section aria-label="견적요청" class="estimate_yourcost">
      <div class="title">
        <h2>고객님의 견적요청내용입니다.</h2><h3></h3>
      </div>
          <p class="subtitle">견적요청내용을 확인하시고 맞다면 요청을 보내주세요.</p><br />
      <div class="estimate_box">
        <h3>고객님의 요청내용</h3>

        <h4>고객</h4>
        <h4>전화번호</h4>
        <h4>공간 유형</h4>
        <p>주거</p>
        <h4>건물 유형</h4>
        <p>아파트</p>
        <h4>면적 (공급면적)</h4>
        <p>123평 (3.3m2)</p>
        <h4>세부선택</h4>
        <p>바닥 : 장판</p>
        <p>조명 : 전체교체</p>
        <h4>고객님 예산</h4>
        <p>123,123만원</p>
      </div>
      </section>    
   <div class="nextpage">
    <button class="button" id="go-back" onclick="location.href='estimate_apply4.do'">이전</button>
    <button class="button" type="submit" id="go-next" onclick="test()">진행하기</button>
   </div>
  </div>
  </form>
</body>
 <%-- 하단 공통부분 --%>
<jsp:include page="../common/footer.jsp" />