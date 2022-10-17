<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:include page = "../common/header.jsp"/>
<%-- 상단 공통부분 끝 --%>
<link rel="stylesheet" type="text/css" href="/css/dozip/comp_det.css" />
	<div class = "clear"></div>
	
	<!-- 본문영역 -->
	<br><br>
	<div class = "comp_wrap">
		<%-- 업체 명함 부분 --%>
		<div class = "flip">
			<div class = "comp_card">
				<div class = "front">
					<div class=	"comp_img">
						<img id = "comp_logo" src = "/images/dozip/portfolio/detail/frog.png"/>
						<button type = "button" id = "comp">보증업체 (i)
							<span class = "tooltip-text">5000만원 예치금 보증회사</span>
						</button>
					</div>

					<div class = "comp_name">
						<h2>${pc.businessName}</h2>
						<%--
						현재 pAddress 불러오지 못하는 오류 생김
						<pre id = "comp_loca">${pc.pAddress}</pre>
						--%>
					</div>

					<%-- 제공 서비스 --%>
					<div class = "comp_service">
						<p id = service_title>제공 서비스</p>
						<div class = "service_images">
							<img id = "insu" src = "/images/dozip/portfolio/detail/insurance.png"/>

							<img id = "scetch" src = "/images/dozip/portfolio/detail/scetch.png"/>

							<img id = "3d" src = "/images/dozip/portfolio/detail/3D.png"/>

							<img id = "credit" src = "/images/dozip/portfolio/detail/credit.png"/>

						</div>
						<ul class = "service_cont">
							<li class = "insu_cont">보증보험</li>
							<li class = "scetch_cont">일반도면</li>
							<li class = "3d_cont">3D 도면</li>
							<li class = "credit_cont">카드결제</li>
						</ul>
					</div>
				</div>
				<div class = "back">
					<%-- 업체 정보 --%>
					<div class = "comp_cont">
						<p id = "comp_title">업체정보</p>
						<%--
						<p id = "comp_ceo">대표자 : ${pc.pName}</p>
						--%>
						<p id = "comp_cont">전문분야 : 주거공간 / 상업공간</p>
						<p id = "comp_place">시공지역 : 서울/경기</p>
						<p id = "comp_year">경력 : 7년</p>
						<%--
						<p id = "comp_where">주소 : ${pc.pAddress}</p>
						--%>
					</div>
				</div>
			</div>
		</div>
	</div>

			<div id="map" style="width:40%;height:400px;"></div>

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
	<%-- 하단 공통부분--%>
<jsp:include page = "../common/footer.jsp"/>