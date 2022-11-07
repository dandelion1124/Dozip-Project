<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../common/header.jsp" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 상단 공통부분 끝 --%>
<link rel="stylesheet" href="/css/dozip/apply_style.css" />
<script src="/js/dozip/apply.js" defer></script>
<script src="/js/dozip/jquery.js"></script>
<script src='/js/address.js'></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <%--주소검색 API --%>


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
                <h3>${count}</h3>
                <h4>누적 견적신청수</h4>
                <span class="bar"></span>
            </li>
        </ul>
    </div>
</section><!--//counters -->


<form method="post" action="apply_ok" enctype="multipart/form-data">
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
          <input type="checkbox" id="wall" name="check" data-name="도배/벽" value="도배,벽" class ="checkbox"/>
          <input type="checkbox" id="floor" name="check" data-name="바닥" value="바닥" class ="checkbox"/>
          <input type="checkbox" id="kitchen" name="check" data-name="주방" value="주방" class ="checkbox"/>
          <input type="checkbox" id="washroom" name="check" data-name="욕실" value="욕실" class ="checkbox"/>
          <input type="checkbox" id="porch" name="check" data-name="현관" value="현관" class ="checkbox"/>
          <input type="checkbox" id="window" name="check" data-name="발코니/샷시" value="발코니,샷시" class ="checkbox"/>
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
        <input type="checkbox" id="group_washroom_item_1" name="group_washroom_item" value="수납장">
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


    <jsp:include page="./sheet_page2.jsp" /> <%--2페이지 --%>
    <jsp:include page="./sheet_page3.jsp" /> <%--3페이지 --%>
    <jsp:include page="./sheet_page4.jsp" /> <%--4페이지 --%>
    <jsp:include page="./sheet_page5.jsp" /> <%--5페이지 --%>

<script>

function apply01_check() { /*1 페이지 유효성 검증 */
        var area = document.getElementById('cal1').value
        document.getElementById("get_area").innerText = area;

        var area2 = document.getElementById('cal2').value
        document.getElementById("get_area2").innerText = area2;

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
    document.getElementById("get_detail").innerText = all.substring(0, all.length - 1);

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
    window.scrollTo({ top: 0, behavior: "smooth" });
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