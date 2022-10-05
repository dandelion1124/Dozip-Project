<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:include page = "../common/header.jsp"/>
<%-- 상단 공통부분 끝 --%>
<link rel="stylesheet" type="text/css" href="/DoZip/css/comp_det.css" />
	<div class = "clear"></div>
	
	<!-- 본문영역 -->
	<br><br>
	<div class = "comp_wrap">
		<%-- 업체 명함 부분 --%>
		<div class = "comp_card">
			<div class=	"comp_img">
				<img id = "comp_logo" src = "/DoZip/images/portfolio/detail/frog.png"/>
			</div>
			<div class = "comp_name">
				<h2>${pc.businessName}</h2>
				<pre id = "comp_loca">${pc.pAddress}</pre>
			</div>	
			<div class = "comp_detail">
				<button type = "button" id = "comp">보증업체 (i)
					<span class = "tooltip-text">5000만원 예치금 보증회사</span>
				</button>
			</div>
		</div>
		<br><br>
		<hr>
		<%-- 제공 서비스 --%>
		<div class = "comp_service">
			<p id = service_title>제공 서비스</p>
			<div class = "service_images">
				<img id = "insu" src = "/DoZip/images/portfolio/detail/insurance.png"/>
				
				<img id = "scetch" src = "/DoZip/images/portfolio/detail/scetch.png"/>
				
				<img id = "3d" src = "/DoZip/images/portfolio/detail/3D.png"/>
				
				<img id = "credit" src = "/DoZip/images/portfolio/detail/credit.png"/>
				
			</div>
			<ul class = "service_cont">
				<li class = "insu_cont">보증보험</li>
				<li class = "scetch_cont">일반도면</li>
				<li class = "3d_cont">3D 도면</li>
				<li class = "credit_cont">카드결제</li>
			</ul>
		</div>
		<br><br>
		<hr>
		<%-- 업체 정보 --%>
		<div class = "comp_cont">
			<p id = "comp_title">업체정보</p>
			<p id = "comp_ceo">대표자 : ${pc.pName}</p>
			<p id = "comp_cont">전문분야 : 주거공간 / 상업공간</p>
			<p id = "comp_place">시공지역 : 서울/경기</p>
			<p id = "comp_year">경력 : 7년</p>
			<p id = "comp_where">주소 : ${pc.pAddress}</p>
			
			<br>
			<div id="map" style="width:60%;height:400px;"></div>

				<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	3d8bfa3cbe8aabf2dd47e365262af246"></script>
				<script>
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				    mapOption = { 
				        center: new kakao.maps.LatLng(37.28815527469634, 127.06061484018433), // 지도의 중심좌표
				        level: 3 // 지도의 확대 레벨
				    };
				
				// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
				var map = new kakao.maps.Map(mapContainer, mapOption); 
				
				
				// 마커가 표시될 위치입니다 
				var markerPosition  = new kakao.maps.LatLng(37.28815527469634, 127.06061484018433); 

				// 마커를 생성합니다
				var marker = new kakao.maps.Marker({
				    position: markerPosition
				});

				// 마커가 지도 위에 표시되도록 설정합니다
				marker.setMap(map);

				var iwContent = '<div style="padding:5px;">호철 디자인★<br><a href="https://map.kakao.com/link/map/호철 디자인,37.28815527469634,127.06061484018433" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/호철 디자인,37.28815527469634,127.06061484018433" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
				    iwPosition = new kakao.maps.LatLng(37.28815527469634, 127.06061484018433); //인포윈도우 표시 위치입니다

				// 인포윈도우를 생성합니다
				var infowindow = new kakao.maps.InfoWindow({
				    position : iwPosition, 
				    content : iwContent 
				});
				  
				// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
				infowindow.open(map, marker); 
				</script>
		</div>
		<br><br>
		<hr>
		<%-- 업체의 한마디 --%>
		<div class = "comp_ment">
			<p id = "comp_ment_title">전문가 한마디</p>
			<pre id = "comp_ment1">
			안녕하세요  여러분의 생활공간을 실용적이고 아름답게 만들어 드리는 호철 인테리어 입니다.
			
			- 체계적인 인테리어 디자인 기획
			
			고객 요구 분석을 통해 맞춤형 공간의 아름다움을 부여하고 고객의 니즈를 파악한 후, 삶과
			관련한 전반적인 요소를 고려해 전략적이고 체계적인 인테리어 디자인 기획을 하고 진행합니다.
			
			- 사람과 교감을 통한 공간 창출
			
			단순한 디자인에 그치지 않고, 사람과의 교감을 이끌어 내어 보다 만족스러운 공간을 만들어
			내고자 합니다. 
			호철 인테리어의 마음가짐은 고객에게 책임감과 전문성에 대한 자부심을 느끼게 합니다.
				
				
			</pre>
		</div>
		
			
	</div>
	
	<%-- 하단 공통부분--%>
<jsp:include page = "../common/footer.jsp"/>