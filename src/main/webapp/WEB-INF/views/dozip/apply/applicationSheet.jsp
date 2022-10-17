<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../common/header.jsp" />
<%-- 상단 공통부분 끝 --%>
<link rel="stylesheet" href="/css/dozip/apply_style.css" />
<script src="/js/dozip/apply.js" defer></script>
<script src="/js/dozip/jquery.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script> <%-- 달력 --%>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/> <!--달력css-->
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script> <%-- 달력 --%>

  </head>
<body>

<!-- counters -->
<section class="counters">
    <div class="container">
        <ul class="clearfix">
            <li>
                <h3>3,587</h3>
                <h4>누적 견적신청수</h4>
                <span class="bar"></span>
            </li>
        </ul>
    </div>
</section><!--//counters -->


<form method="post" action="apply_ok">
<div class="page1" >
    <title>인테리어 견적 신청서</title>

    <article id="estimate_step01">
      <div>
        <section aria-label="공간 유형 선택" class="building_types">
          <div class="title">
          <h2>어떤 공간의 시공을 원하시나요?</h2><h3>1/4</h3>
          </div>
          <br/>
          <div class="estimate_box">
          <h3>공간 유형</h3>
            <input type="radio" value="주거" id="1" name="est_zoning" checked><label for="1">주거</label>
            <input type="radio" value="상가" id="2" name="est_zoning"><label for="2">상가</label>
          </div>
        </section>
      </div>
      <div class="estimate_box">
        <h3>건물 유형</h3>
        <div id = "type01" >
          <div>
          <input type="radio" id="ty1" name="est_use" value="아파트"><label for="ty1">아파트</label>
          <input type="radio" id="ty2" name="est_use" value="빌라"><label for="ty2">빌라</label>
          </div>
          <div>
            <input type="radio" id="ty3" name="est_use" value="주택"><label for="ty3">주택</label>
            <input type="radio" id="ty4" name="est_use" value="오피스텔"><label for="ty4">오피스텔</label>
          </div>
          </div>
           <div id="type02" style="display: none;">
            <div>
            <input type="radio" id="ty5" name="est_use" value="사무실"><label for="ty5">사무실</label>
            <input type="radio" id="ty6" name="est_use" value="상가/매장"><label for="ty6">상가/매장</label>
            </div>
            <input type="radio" id="ty7" name="est_use" value="카페/식당"><label for="ty7">카페/식당</label>
            <input type="radio" id="ty8" name="est_use" value="학원/교육"><label for="ty8">학원/교육</label>
            <div>
            <input type="radio" id="ty9" name="est_use" value="숙박/병원"><label for="ty9">숙박/병원</label>
            <input type="radio" id="ty10" name="est_use" value="간판"><label for="ty10">간판</label>
            </div>
            <input type="radio" id="ty11" name="est_use" value="기타"><label for="ty11">기타</label>
           </div>
      </div>
      <!-- id : 고유한 식별 목적
           class : 재사용을 목적
           name : 컨트롤 요소값(value)을 서버로 전송하기위함-->
      <div class = "estimate_calculator">
        <h3>평수 (공급면적)</h3><br/>
        <input type="text" id="cal1" name="areaP" maxlength="3" placeholder=0 onclick="change()" onkeyup="calculator(1);" value="0">&nbsp;평 -&nbsp;<input type="text" id="cal2" name="areaM" placeholder=0 onkeyup="calculator(2);" value="0">&nbsp;m2
      </div>
      <div class="areaBoxComponent">
        <h3>원하는 공간 선택</h3>
        <div class="123">
          <input type="checkbox" id="allCk" name="checkAll" class="checkbox" data-name="전체선택">
          <input type="checkbox" id="wall" name="check" data-name="도배/벽" value="도배/벽" class ="checkbox"/>
          <input type="checkbox" id="floor" name="check" data-name="바닥" value="바닥" class ="checkbox"/>
          <input type="checkbox" id="kitchen" name="check" data-name="주방" value="주방" class ="checkbox"/>
          <input type="checkbox" id="washroom" name="check" data-name="욕실" value="욕실" class ="checkbox"/>
          <input type="checkbox" id="porch" name="check" data-name="현관" value="현관" class ="checkbox"/>
          <input type="checkbox" id="window" name="check" data-name="발코니/샷시" value="발코니/샷시" class ="checkbox"/>
          <input type="checkbox" id="light" name="check" data-name="조명" value="조명" class ="checkbox"/>
          <input type="checkbox" id="door" name="check" data-name="문" value="문" class ="checkbox"/>
        </div>
      </div>

      <!-- 상세 시공 도배/벽 -->
      <article class="section_detail_select" id="detail01" name="detail" style="display: none;">
      <div class = "detail_select">
            <h3 class="detail_title">도배/벽</h3>
        <ul aria-label="도배/벽 선택 목록" class="detail_item">
            <li class="btn_line_detail">
                <input type="radio" id="group_wallpaper_item_0" name="group_wallpaper_item" value="합지">
                <label for="group_wallpaper_item_0">
                    <span class="h4 select_detail__title">합지</span>
                    <p class="select_detail__desc">일반 종이 벽지로 친환경적</p>
                    <span class="expect_price">326만원~</span>
                </label>

                <input type="radio" id="group_wallpaper_item_1" name="group_wallpaper_item" value="실크">
                <label for="group_wallpaper_item_1">
                    <span class="h4 select_detail__title">실크</span>
                    <p class="select_detail__desc">코팅된 종이로 오염에 강함</p>
                    <span class="expect_price">445만원~</span>
                </label></li>
            <li class="btn_line_detail">
                <input type="radio" id="group_wallpaper_item_2" name="group_wallpaper_item" value="합지+실크">
                <label for="group_wallpaper_item_2">
                    <span class="h4 select_detail__title">합지+실크</span>
                    <p class="select_detail__desc">거실 실크+방 합지 조합</p>
                    <span class="expect_price">374만원~</span>
                </label>

                <input type="radio" id="group_wallpaper_item_3" name="group_wallpaper_item" value="타일">
                <label for="group_wallpaper_item_3">
                    <span class="h4 select_detail__title">타일</span>
                    <p class="select_detail__desc">내구성이 강하고 고급스러움</p>
                </label></li>
            <li class="btn_line_detail">
                <input type="radio" id="group_wallpaper_item_4" name="group_wallpaper_item" value="대리석">
                <label for="group_wallpaper_item_4">
                    <span class="h4 select_detail__title">대리석</span>
                    <p class="select_detail__desc">천연소재로 고급스러움</p>
                    <span class="expect_price">360만원~</span>
                </label>

                <input type="radio" id="group_wallpaper_item_5" name="group_wallpaper_item" value="페인트">
                <label for="group_wallpaper_item_5">
                    <span class="h4 select_detail__title">페인트</span>
                    <p class="select_detail__desc">다양한 색 조합 가능</p>
                </label></li>
        </ul>
        <h4 class="detail_item">추가선택</h4>
        <ul class="clearfix detail_item">
            <li class="btn_line_detail"><input type="checkbox" id="group_wallpaper_option_0" value="몰딩">
                <label for="group_wallpaper_option_0">
                    <span class="h4 select_detail__title">몰딩</span>
                    <p class="select_detail__desc">천장과 벽 사이의 마감</p>
                </label></li>
        </ul>
        </div>
    </article>

    <!-- 상세 시공 바닥 -->
    <article class="section_detail_select" id="detail02" name="detail" style="display: none;">
    <div class = "detail_select">
      <h3 class="detail_title">바닥</h3>
  <ul aria-label="바닥 선택 목록" class="detail_item">
      <li class="btn_line_detail">
          <input type="radio" id="group_floor_item_0" name="group_floor_item" value="장판">
          <label for="group_floor_item_0">
              <span class="h4 select_detail__title">장판</span>
              <p class="select_detail__desc">오염과손상에강함</p>
              <span class="expect_price">240만원~</span>
          </label>
          <input type="radio" id="group_floor_item_1" name="group_floor_item" value="강마루">
          <label for="group_floor_item_1">
              <span class="h4 select_detail__title">강마루</span>
              <p class="select_detail__desc">원목느낌의 코팅합판마루</p>
              <span class="expect_price">592만원~</span>
          </label></li>

      <li class="btn_line_detail">
          <input type="radio" id="group_floor_item_2" name="group_floor_item" value="타일">
          <label for="group_floor_item_2">
              <span class="h4 select_detail__title">타일</span>
              <p class="select_detail__desc">내구성이강하고고급스러움</p>
              <span class="expect_price">380만원~</span>
          </label>
          <input type="radio" id="group_floor_item_3" name="group_floor_item" value="포세린타일">
          <label for="group_floor_item_3">
              <span class="h4 select_detail__title">포세린타일</span>
              <p class="select_detail__desc">내구성이 강하고 고급스러움</p>
              <span class="expect_price">1000만원~</span>
          </label></li>

      <li class="btn_line_detail">
          <input type="radio" id="group_floor_item_4" name="group_floor_item" value="대리석">
          <label for="group_floor_item_4">
              <span class="h4 select_detail__title">대리석</span>
              <p class="select_detail__desc">천연소재로 고급스러움</p>
              <span class="expect_price">360만원~</span>
          </label>
          </li>
  </ul>
  <h4 class="detail_item">추가선택</h4>
  <ul class="clearfix detail_item">
      <li class="btn_line_detail"><input type="checkbox" id="group_floor_option_1" value="걸레받이">
          <label for="group_floor_option_1">
              <span class="h4 select_detail__title">걸레받이</span>
              <p class="select_detail__desc">벽과 바닥재 사이의마감</p>
          </label></li>
  </ul>
  </div>
</article>

<!-- 상세 시공 주방 -->
<article class="section_detail_select" id="detail03" name="detail" style="display: none;">
<div class = "detail_select">
  <h3 class="detail_title">주방</h3>
<ul aria-label="주방 선택 목록" class="detail_item">
 <li class="btn_line_detail">
    <input type="checkbox" id="group_kitchen_item_0" name="group_kitchen_item" value="전체교체">
     <label for="group_kitchen_item_0">
      <span class="h4 select_detail__title">전체선택</span>
       <span class="expect_price">550만원~</span>
     </label>
    <input type="checkbox" id="group_kitchen_item_1" name="group_kitchen_item" value="필름">
     <label for="group_kitchen_item_1">
      <span class="h4 select_detail__title">필름</span>
       <p class="select_detail__desc">상부장,하부장등필름시공</p>
       <span class="expect_price">550만원~</span>
     </label>
 </li>

  <li class="btn_line_detail">
      <input type="checkbox" id="group_kitchen_item_2" name="group_kitchen_item" value="타일">
      <label for="group_kitchen_item_2">
          <span class="h4 select_detail__title">타일</span>
          <p class="select_detail__desc">벽면타일교체</p>
          <span class="expect_price">45만원~</span>
      </label>
      <input type="checkbox" id="group_kitchen_item_3" name="group_kitchen_item" value="싱크대">
      <label for="group_kitchen_item_3">
          <span class="h4 select_detail__title">싱크대</span>
          <p class="select_detail__desc">상부장,하부장만 교체</p>
      </label></li>

  <li class="btn_line_detail">
      <input type="checkbox" id="group_kitchen_item_4" name="group_kitchen_item" value="가구">
      <label for="group_kitchen_item_4">
          <span class="h4 select_detail__title">가구</span>
          <p class="select_detail__desc">내장고장등맞춤가구제작</p>
      </label>
      <input type="checkbox" id="group_kitchen_item_5" name="group_kitchen_item" value="아일랜드식탁">
      <label for="group_kitchen_item_5">
          <span class="h4 select_detail__title">아일랜드식탁</span>
          <span class="expect_price">120만원~</span>
      </label></li>
</ul>
</div>
</article>

<!-- 상세 시공 욕실 -->
<article class="section_detail_select" id="detail04" name="detail" style="display: none;">
<div class = "detail_select">
    <h3 class="detail_title">욕실</h3>
  <ul aria-label="욕실 선택 목록" class="detail_item">
    <li class="btn_line_detail">
        <input type="checkbox" id="group_washroom_item_0" name="group_washroom_item" value="전체교체">
        <label for="group_washroom_item_0">
            <span class="h4 select_detail__title">전체교체</span>
            <span class="expect_price">420만원~</span>
        </label>
        <input type="checkbox" id="group_washroom_item_1" name="group_washroom_item" value="수납장/선반">
        <label for="group_washroom_item_1">
            <span class="h4 select_detail__title">수납장/선반</span>
            </label></li>
        <li class="btn_line_detail">
            <input type="checkbox" id="group_washroom_item_2" name="group_washroom_item" value="도기">
            <label for="group_washroom_item_2">
                <span class="h4 select_detail__title">도기</span>
                <p class="select_detail__desc">세면대,변기등도기만교체</p>
                <span class="expect_price">64만원~</span>
                </label></li>
    <li class="btn_line_detail">
        <input type="checkbox" id="group_washroom_item_3" name="group_washroom_item" value="타일">
        <label for="group_washroom_item_3">
            <span class="h4 select_detail__title">타일</span>
            <p class="select_detail__desc">바닥과벽면타일교체</p>
            <span class="expect_price">322만원~</span>
        </label></li>
  </ul>
  </div>
  </article>
  
<!-- 상세 시공 현관 -->
<article class="section_detail_select" id="detail05" name="detail" style="display: none;">
<div class = "detail_select">
    <h3 class="detail_title">현관</h3>
  <ul aria-label="욕실 선택 목록" class="detail_item">
    <li class="btn_line_detail">
        <input type="checkbox" id="group_porch_item_0" name="group_porch_item" value="신발장">
        <label for="group_porch_item_0">
            <span class="h4 select_detail__title">신발장</span>
            <span class="expect_price">128만원~</span>
        </label>
        <input type="checkbox" id="group_porch_item_1" name="group_porch_item" value="타일">
        <label for="group_porch_item_1">
            <span class="h4 select_detail__title">타일</span>
            <span class="expect_price">24만원~</span>
            </label></li>
        <li class="btn_line_detail">
            <input type="checkbox" id="group_porch_item_2" name="group_porch_item" value="가벽설치">
            <label for="group_porch_item_2">
                <span class="h4 select_detail__title">가벽설치</span>
                <span class="expect_price">60만원~</span>
                </label>
                <input type="checkbox" id="group_porch_item_3" name="group_porch_item" value="필름">
                <label for="group_porch_item_3">
                    <span class="h4 select_detail__title">필름</span>
                    <span class="expect_price">60만원~</span>
                </label>
            </li>
    <li class="btn_line_detail">
        <input type="checkbox" id="group_porch_item_4" name="group_porch_item" value="중문">
        <label for="group_porch_item_4">
            <span class="h4 select_detail__title">중문</span>
            <span class="expect_price">130만원~</span>
        </label>
    </li>
  </ul>
  </div>
  </article>
  <!-- 상세 시공 발코니/샷시 -->
<article class="section_detail_select" id="detail06" name="detail" style="display: none;">
<div class = "detail_select">
    <h3 class="detail_title">발코니/샷시</h3>
  <ul aria-label="발코니/샷시 선택 목록" class="detail_item">
    <li class="btn_line_detail">
        <input type="radio" id="group_window_item_0" name="group_window_item" value="전체교체">
        <label for="group_window_item_0">
            <span class="h4 select_detail__title">전체교체</span>
            <p class="select_detail__desc">내창/외창모두철거후교체</p>
            <span class="expect_price">1720만원~</span>
        </label></li>
        <li class="btn_line_detail">
        <input type="radio" id="group_window_item_1" name="group_window_item" value="부분교체">
        <label for="group_window_item_1">
            <span class="h4 select_detail__title">부분교체</span>
            <p class="select_detail__desc">부분적으로철거후교체</p>
            <span class="expect_price">528만원~</span>
            </label></li>
        <li class="btn_line_detail">
            <input type="radio" id="group_window_item_2" name="group_window_item" value="필름만시공">
            <label for="group_window_item_2">
                <span class="h4 select_detail__title">필름만시공</span>
                <p class="select_detail__desc">창들에필름만시공</p>
                <span class="expect_price">304만원~</span>
                </label>
            </li>
        </ul>
        <h4 class="detail_item">추가선택</h4>
        <ul class="clearfix detail_item">
            <li class="btn_line_detail"><input type="checkbox" id="group_window_option_0" value="페인트">
                <label for="group_window_option_0">
                    <span class="h4 select_detail__title">페인트</span>
                    <p class="select_detail__desc">천장과 벽 사이의 마감</p>
                </label>
            </li>
        </ul>
        </div>
  </article>

  <!-- 상세 시공 조명 -->
<article class="section_detail_select" id="detail07" name="detail" style="display: none;">
<div class = "detail_select">
    <h3 class="detail_title">조명</h3>
  <ul aria-label="조명 선택 목록" class="detail_item">
    <li class="btn_line_detail">
        <input type="radio" id="group_light_item_0" name="group_light_item" value="전체교체">
        <label for="group_light_item_0">
            <span class="h4 select_detail__title">전체교체</span>
            <p class="select_detail__desc">새로운위치에교체</p>
            <span class="expect_price">449만원~</span>
        </label></li>
        <li class="btn_line_detail">
        <input type="radio" id="group_light_item_1" name="group_light_item" value="조명,스위치,콘센트만">
        <label for="group_light_item_1">
            <span class="h4 select_detail__title">조명,스위치,콘센트만</span>
            <p class="select_detail__desc">기존위치에교체</p>
            <span class="expect_price">158만원~</span>
            </label></li>
        <li class="btn_line_detail">
            <input type="radio" id="group_light_item_2" name="group_light_item" value="전기공사만">
            <label for="group_light_item_2">
                <span class="h4 select_detail__title">전기공사만</span>
                <p class="select_detail__desc">원하는위치에전기공사</p>
                <span class="expect_price">96만원~</span>
                </label>
            </li>
        </ul>
        </div>
  </article>
  
  <!-- 상세 시공 문 -->
  <article class="section_detail_select" id="detail08" name="detail" style="display: none;">
  <div class = "detail_select">
    <h3 class="detail_title">문</h3>
<ul aria-label="문 선택 목록" class="detail_item">
    <li class="btn_line_detail">
        <input type="radio" id="group_door_item_0" name="group_door_item" value="전체교체">
        <label for="group_door_item_0">
            <span class="h4 select_detail__title">전체교체</span>
            <p class="select_detail__desc">문틀과문짝모두새로설치</p>
            <span class="expect_price">326만원~</span>
        </label>
	<li class="btn_line_detail">
        <input type="radio" id="group_door_item_1" name="group_door_item" value="부분교체">
        <label for="group_door_item_1">
            <span class="h4 select_detail__title">부분교체</span>
            <p class="select_detail__desc">문틀과문짝부분교체</p>
            <span class="expect_price">445만원~</span>
        </label>
        </li>
	<li class="btn_line_detail">        
        <input type="radio" id="group_door_item_2" name="group_door_item" value="필름">
        <label for="group_door_item_2">
            <span class="h4 select_detail__title">필름</span>
            <p class="select_detail__desc">문틀과문짝에시공가능</p>
            <span class="expect_price">374만원~</span>
        </label>
        </li>
</ul>
</div>
    </article>

<%-- 다음페이지 버튼 --%>
      <div class="nextpage">
        <button type="button" onclick="apply01_check()">다음단계</button>
      </div>
    </article>
</div>

  <%-- 2페이지 --%>
    <div class="page2" hidden>
    <title>Step 2</title>
        <div id="estimate_step02">
            <section aria-label="예산 선택" class="estimate_yourcost">
                <div class="title">
                    <h1>예산과 일정을 알려주세요.</h1><h3>2/4</h3>
                </div>
                <div>
                    <p>단 한번 입력으로 조건에 맞는 전문가들과 간편하게 상담 하세요.</p><br />
                </div>
            </section>
            <div class="estimate_box">
                <br/><h2>예산</h2>
                <div class="your_cost">
                    <input type="text" id="estimate_cost" name="est_bud" maxlength="7" placeholder="예산을 입력해주세요" onkeyup="inputNumberFormat(this);"/>
                    <h3>만원</h3>
                </div>
                <br/><br/><br/><br/><hr/>
            </div>
            <div class="estimate_date">
               <br/><br/> <h2>희망 시공일정</h2><br/><br/>
                <span style="font-size:20px">오늘 날짜 : <span id="today"></span></span>
                <br>
                <br>
                    <br/>
                    <label for="est_start">시작일</label>&nbsp;
                    <input type="text" name="est_start" id="est_start">
                    ~
                    <label for="est_end">종료일</label>&nbsp;
                    <input type="text" name="est_end" id="est_end">
            </div>

            <!-- id : 고유한 식별 목적
                       class : 재사용을 목적
                       name : 컨트롤 요소값(value)을 서버로 전송하기위함-->

            <div class="nextpage">
                <button type="button" class="go_back" onclick="page_back02()">이전</button>
                <button type="button" class="go_next" onclick="apply02_check()">다음</button>
            </div>
        </div>
    </div>

  <%-- 3 페이지 --%>
    <div class = "page3" hidden>
    <title>Step 3</title>
        <div class="estimate_step03">
            <section aria-label="예산 선택" class="estimate_yourcost">
                <div class="title">
                    <h2>상세 내용을 알려주세요</h2><h3>3/4</h3>
                </div>
                <p class="subtitle">단 한번 입력으로 조건에 맞는 전문가들과 간편하게 상담 하세요</p><br />
                <div class="estimate_box_page3">
                    <h3>의뢰인 정보 입력</h3>
                    <input type="text" id="name" name="name" placeholder="이름을 입력해주세요">
                    <input type="text" id="phone" name="phone" oninput="hypenTel(this)" placeholder="휴대폰 번호를 입력해 주세요" maxlength="13"/>
                    <button type="button" id="certify_phone" >인증하기</button>
                    <input type="text" id="addr" name="addr" placeholder="주소를 입력해 주세요">
                    <button type="button" id="address_btn" >주소찾기</button>

                    <div class="para">
                        <h3>스타일을 알려주세요(1500자 내외)</h3>
                        <p class="textCount">0자</p><p class="textTotal">/1500자</p>
                    </div>
                    <textarea id="paragraph" name="paragraph" maxlength="1500" placeholder="원하는 스타일에 대해 자유롭게 써주세요"></textarea>

                </div>
                <div class="nextpage">
                    <button type="button" class="go_back" onclick="page_back03()" >이전</button>
                    <button type="button" class="go_next" onclick="apply03_check()">다음</button>
                </div>
            </section>

            <!-- id : 고유한 식별 목적
                       class : 재사용을 목적
                       name : 컨트롤 요소값(value)을 서버로 전송하기위함-->
        </div>
    </div>
  <%-- 4페이지 --%>
    <div class= "page4" hidden>
        <section aria-label="주소 선택& 근처 업체" class="youraddr">
            <div class="title">
                <h2>근처의 인테리어업체와 직접 연락할 수 있어요.</h2><h3>4/4</h3>
            </div>
            <div id="msg2">
                <p id="p1"><b>${vo.mem_name }</b> 님 근처에 <b>${count} </b>개의 인테리어 업체가 있습니다.<br/>
                    클릭해서 직접 상담해 볼 수 있어요.</p>
            </div>
            <div class = "estimate_box">
                <div class = "companies">
                    <%--
                            pdto.setBusiness_num(rs.getString("business_num"));
                            pdto.setBusinessName(rs.getString("businessName"));
                            pdto.setpTel(rs.getNString("pTel"));
                            pdto.setpAddress(rs.getString("pAddress")); --%>

                    <c:forEach var ="p" items="${list }">

                        <div id=partners_info>
                            <input id="${p.businessName }" type="checkbox"> <label for="${p.businessName }"> ${p.businessName }	</label><br>
                            전화번호 : ${p.pTel }<br>
                            주소 :${p.pAddress}<br>
                            사업자 번호 : ${p.business_num }

                        </div>

                    </c:forEach>

                </div>

                <div class="nextpage">
                    <button type="button" class="go_back" onclick="page_back04()">이전</button>
                    <button type="button" class="go_next" onclick="apply04_check()">다음</button>
                </div>
            </div>
        </section>
    </div>

    <%-- 5페이지 --%>
    <div class = "page5" hidden>
    <title>Step 5</title>

        <div id="estimate_step05">
            <section aria-label="견적요청" class="estimate_yourcost">
                <div class="title">
                    <h2>고객님의 견적요청내용입니다.</h2><h3></h3>
                </div>
                <p class="subtitle">견적요청내용을 확인하시고 맞다면 요청을 보내주세요.</p><br />
                <div class="estimate_box_page4">
                    <table class="tg" style= "table-layout: fixed; width: 460px">
                        <colgroup>
                            <col style="width: 300px">
                            <col style="width: 200px">
                        </colgroup>

                        <tbody>
                        <tr class="table">
                            <td class="left">고객님 성함</td>
                            <td class="right"><div id="get_name"></div></td>
                        </tr>
                        <tr class="table">
                            <td class="left">전화번호</td>
                            <td class="right"><div id="get_phone"></div></td>
                        </tr>
                        <tr class="table">
                            <td class="left">주소</td>
                            <td class="right"><div id="get_addr"></div></td>
                        </tr>
                        <tr class="table">
                            <td class="left">공간유형</td>
                            <td class="right"><div id="get_zoning"></div></td>
                        </tr>
                        <tr class="table">
                            <td class="left">건물유형</td>
                            <td class="right"><div id="get_use"></div></td>
                        </tr>
                        <tr class="table">
                            <td class="left">면적 (공급면적)</td>
                            <td class="right"><div id="get_area"></div>평</td>
                        </tr>
                        <tr class="table">
                            <td class="left">세부선택</td>
                            <td class="right"><div id="get_detail"></div></td>
                        </tr>
                        <tr class="table">
                            <td class="left">고객님의 예산</td>
                            <td class="right"><div id="get_cost"></div>만원</td>
                        </tr>
                        <tr class="table">
                            <td class="left">날짜</td>
                            <td class="right"><div id="get_start"></div> ~ <div id="get_end"></div></td>
                        </tr>
                        </tbody>
                    </table>

                </div>
                <input type="hidden" id="d" name="d">
                <input type="hidden" id="d3" name="d3">
                <input type="hidden" id="d4" name="d4">
                <input type="hidden" id="d5" name="d5">
                <div class="nextpage">
                    <button type="button" class="go_back" onclick="page_back05()">이전</button>
                    <button class="go_next" >진행하기</button>
                </div>
            </section>
        </div>
    </div>
</form>
</body>




<script>

    function apply04_check(){ /*4 페이지 유효성 검증 */
        $('.page4').hide();
        $('.page5').show();
    }
    function apply03_check(){ /*3 페이지 유효성 검증 */
        var est_name = document.getElementById("name").value;
        var est_phone = document.getElementById("phone").value;
        var est_addr = document.getElementById("addr").value;
        var est_desc = document.getElementById("paragraph").value;
        document.getElementById("get_name").innerText = est_name;
        document.getElementById("get_phone").innerText = est_phone;
        document.getElementById("get_addr").innerText = est_addr;
        //document.getElementById("get_desc").innerText = est_desc;

        if(est_name == ""){
            alert('성함을 알려주세요!');
            name.focus();
            return false;
        }
        if(est_phone == "") {
            alert('전화번호을 알려주세요!');
            phone.focus();
            return false;
        }if(est_addr == "") {
            alert('주소를 알려주세요!');
            addr.focus();
            return false;
        }
        if (est_desc == "") {
            alert('세부 스타일을 알려주세요!');
            paragraph.focus();
            return false;
        }
        $('.page3').hide();
        $('.page4').show();
    }
    function apply02_check() { /*2 페이지 유효성 검증 */
        var est_bud = document.getElementById("estimate_cost").value;
        var est_start = document.getElementById("est_start").value;
        var est_end = document.getElementById("est_end").value;
        document.getElementById("get_cost").innerText = est_bud;
        document.getElementById("get_start").innerText = est_start;
        document.getElementById("get_end").innerText = est_end;

        if(est_bud == "") {
            alert('예산을 입력해주세요!');
            return false;
        }
        else if(est_start == "") {
            alert('시작일을 알려주세요!');
            est_start.focus();
            return false;
        }
        else if(est_end == "") {
            alert('종료일을 알려주세요!');
            est_end.focus();
            return false;
        }
        $('.page2').hide();
        $('.page3').show();
    }
function apply01_check() { /*1 페이지 유효성 검증 */
        var area = document.getElementById('cal1').value
        document.getElementById("get_area").innerText = area;

	if ($(':radio[name="est_use"]:checked').length < 1) {
		alert('건물 유형을 선택해 주세요!');
		return false;

	}
	if($('#cal1').val()=="" ||$('#cal1').val()==0){
		alert('평수를 입력해 주세요!');
		return false;

	}
	if($('#cal2').val()=="" ||$('#cal2').val()==0){
		alert('평수를 입력해 주세요!');
		return false;

	}
	if ($(':checkbox[name="check"]:checked').length < 1) {
		alert('원하는 공간을 선택 주세요!');
		return false;
	}

    /*체크박스 배열로 값받기*/
    var a ='';
    var zoning = document.getElementsByName('est_zoning');
    for(var i=0; i<zoning.length; i++){
        if(zoning[i].checked){
            a+=zoning[i].value;
        }
    }
    document.getElementById("get_zoning").innerText = a;

    var est_use ='';
    var use = document.getElementsByName('est_use');
    for(var i=0; i<use.length; i++){
        if(use[i].checked){
            est_use += use[i].value;
        }
    }
    document.getElementById("get_use").innerText = est_use;

    var all = '';
    var detail_val = document.getElementsByName("check");
    for(var i=0; i<detail_val.length; i++){
        if(detail_val[i].checked){
            all+=detail_val[i].value+"/";
        }
    }

    document.getElementById("d").value = all;
    document.getElementById("get_detail").innerText = all;

    var all2 = '';
    var detail03_val = document.getElementsByName("group_kitchen_item");
    for(var i=0; i<detail03_val.length; i++){
        if(detail03_val[i].checked){
            all2+=detail03_val[i].value+"/";
        }
    }

    document.getElementById("d3").value = all2;

    var all3 = '';
    var detail04_val = document.getElementsByName("group_washroom_item");
    for(var i=0; i<detail04_val.length; i++){
        if(detail04_val[i].checked){
            all3+=detail04_val[i].value+"/";
        }
    }

    document.getElementById("d4").value = all3;

    var all4 = '';
    var detail05_val = document.getElementsByName("group_porch_item");
    for(var i=0; i<detail05_val.length; i++){
        if(detail05_val[i].checked){
            all4+=detail05_val[i].value+"/";
        }
    }

    document.getElementById("d5").value = all4;
    /*체크박스 배열로 값받기 끝*/

    $('.page1').hide();
    $('.page2').show();
}

    <%-- 뒤로가기 버튼 --%>
    function page_back02() {
        $('.page2').hide();
        $('.page1').show();
    }
    function page_back03() {
        $('.page3').hide();
        $('.page2').show();
    }
    function page_back04() {
        $('.page4').hide();
        $('.page3').show();
    }
    function page_back05() {
        $('.page5').hide();
        $('.page4').show();
    }

</script>
 <%-- 하단 공통부분 --%>
<jsp:include page="../common/footer.jsp" />