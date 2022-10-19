<%@page import="com.dozip.vo.PortfolioVO"%>
<%@page import="com.dozip.dao.PortfolioDAOImpl"%>
<%@page import="com.dozip.vo.PortfolioVO"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:include page = "../common/header.jsp"/>
<%-- 상단 공통부분 끝--%>
<link rel="stylesheet" type="text/css" href="/css/dozip/portfolio.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Anton' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Neucha' rel='stylesheet' type='text/css'>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script src="/js/dozip/portfolio.js" defer></script>
<script src="/js/dozip/jquery.js"></script>


	<div class="clear"></div>
		
	<!-- 본문영역-->
	
	<!-- 프리미엄 기업 리스트-->
		<div class = "premium_wrap">
			<div class = "premium_comp">
				
				<%--배너 시작 --%>
				<div id="wrapper">
			      <div id="slider-wrap">
			          <ul id="slider">
			             <li>                
							<img src="/images/dozip/portfolio/banner/final_bannerH.png">
			             </li>
			             
			             <li>
							<img src="/images/dozip/portfolio/banner/final_bannerJ.png">
			             </li>
			             
			             <li>
							<img src="/images/dozip/portfolio/banner/final_bannerM.png">
			             </li>
			             
			             <li>
							<img src="/images/dozip/portfolio/banner/final_bannerS.png">
			             </li>
			          </ul>
			          
			           <!--controls-->
			          <div class="btns" id="next"><i class="fa fa-arrow-right"></i></div>
			          <div class="btns" id="previous"><i class="fa fa-arrow-left"></i></div>
			          <div id="counter"></div>
			          
			          <div id="pagination-wrap">
			            <ul>
			            </ul>
			          </div>
			          <!--controls-->  
                 
      			</div>
   			</div>
   			<%-- 배너 종료 --%>
		</div>
	</div>
		<br>	
	<!-- 드롭다운 버튼 -->
	<div class = "port_wrap">
		<div class = "dropdown">
			<select name="d1" id="dd_group1" onchange="handleOnChange(this)">
				<option selected>주거유형</option>
				<option value="아파트">아파트</option>
				<option value="빌라">빌라</option>
				<option value="주택">주택</option>
				<option value="오피스텔">오피스텔</option>
			</select>
			<select name="d2" id="dd_group2" onchange="handleOnChange(this)">
				<option selected>상업유형</option>
				<option value="카페/식당">카페/식당</option>
				<option value="상가/매장">상가/매장</option>
				<option value="학원/교육">학원/교육</option>
				<option value="사무실">사무실</option>
				<option value="숙박/병원">숙박/병원</option>
				<option value = "간판">간판</option>
				<option value = "기타">기타</option>
			</select>
			<select name="d3" id="dd_group3" onchange="handleOnChange(this)">
				<option selected>스타일</option>
				<option value="모던">모던</option>
				<option value="미니멀">미니멀</option>
				<option value="내추럴">내추럴</option>
				<option value="빈티지">빈티지</option>
				<option value="심플">심플</option>
				<option value="럭셔리">럭셔리</option>
			</select>
			<select name="d4" id="dd_group4" onchange="handleOnChange(this)">
				<option value="0" selected>비용</option>
				<option value="999">1000만원 이하</option>
				<option value="1000">1000만원대</option>
				<option value="2000">2000만원대</option>
				<option value="3000">3000만원대</option>
				<option value="4000">4000만원대</option>
				<option value="5000">5000만원대</option>
				<option value="6000">6000만원 이상</option>
			</select>
			<select name="d5" id="dd_group5" onchange="handleOnChange(this)">
				<option value="0" selected>평수</option>
				<option value="10">10평</option>
				<option value="20">20평</option>
				<option value="30">30평</option>
				<option value="40">40평</option>
				<option value="50">50평</option>
				<option value="60">60평 이상</option>
			</select>
			<button onclick = "clear_btn()" class = "clear_btn">초기화</button>
			<button type="button" name = "submit">필터검색</button>
			<!-- 리스트 검색창 -->
			<div class = "search_wrap2">
				<div class = "search_list">
					<div id ="key_list">선택한 리스트 값</div>
					<button class = "list_btn">리스트 검색</button>
				</div>
			</div>
		</div>

		<%-- 드롭다운 선택한 값 리스트 검색창에 찍어 내기--%>
		<script>
			function handleOnChange(e) {
				// 선택된 데이터의 텍스트값 가져오기
				const text = e.options[e.selectedIndex].text;

				console.log(e.options);

				// 선택한 텍스트 출력
				document.getElementById('key_list').innerText
						= text;
			}
		</script>

		<!-- 드롭다운 끝 -->
		
		<%-- 초기화 버튼 클릭시 select 버튼 초기화 + 검색 초기화--%>
		<script>
			function clear_btn(){
				document.getElementById("dd_group1").value = "주거유형";
				document.getElementById("dd_group2").value = "상업유형";
				document.getElementById("dd_group3").value = "스타일";
				document.getElementById("dd_group4").value = 0;
				document.getElementById("dd_group5").value = 0;
				document.getElementById("key_list").innerText = "선택한 리스트 값";
				$('#dd_group1').show();
				$('#dd_group2').show();
				$('.card').show();
			}
		</script>


		<%-- 업체 검색시 해당 업체 출력--%>
		<script type="text/javascript">
		jQuery(function(event) {
		    $('.search_Btn').on('click',function(event) {
		        var val = $('#keyword').val();
		        if (val == "") {
		            $('.card').show();
		        } else {
		        	if(".bname:contains('"+val+"')") {
			            $('.card').hide();
			            $(".card:contains('"+val+"')").show();
		        	}else{
		        		$('.card').hide();
		        	}
		        }
		    });
		});
		</script>

		<!-- 검색창 -->
		<div class = "search_wrap">
			<div class = "search">
				<input type = "text" name = "keyword" id="keyword" placeholder="통합검색">
				<button  class = "search_Btn">
					<i class = "fas fa-search"></i>
				</button>
			</div>
		</div>
	</div>


		<!-- 카드 리스트 -->
		<div class="construction_list">
			<div class="top_utile">
				<p class="top_title">포트폴리오</p> 
 			</div>
 			
 			<!-- 반복문 시작-->
			<div class="cards-list">
				<c:if test = "${!empty plist}">
				<c:forEach var="i" begin="0" end="${fn:length(plist)-1}" step="1">
					<div class="card">
					  <div class="card_image"> 
					  	<img class = "ho" onclick = "location.href='port_detail?pf_no=${plist[i].pf_no}';" src= '${plist[i].pf_photo1}'/>
					  	<%-- onclick으로 클릭시 글번호를 넣어 상세로 연결되게 --%>
					  </div>
					  <div class="card_title">
						  	<li id = "bname" style="display: none">${plist[i].businessName}</li>
						   	<li class = "corp" id="pf_title">${plist[i].pf_title}</li>						   	
						   	<li class = "card_tag">
						   		<span id="pf_subtype">${plist[i].pf_subtype}</span>
						   		<span id="pf_concept">${plist[i].pf_concept}</span>
						   		<span id="pf_area">${plist[i].pf_area}평</span>
						   		<span id="pf_cost">${plist[i].pf_cost}만원대</span>
						   	</li>
					  </div>
					</div>
				</c:forEach>
				</c:if>
			</div> 
			
			
			<c:if test = "${empty plist}">
				<div id = "none_pf">포트폴리오 목록이 없습니다</div>
			</c:if>
 		</div>
 		<br><br>

<script>
	//검색기능
	$(document).on("click", "button[name='submit']", function (){
		var pf_subtype1 = $('#dd_group1').val();
		var pf_subtype2 = $('#dd_group2').val();
		var pf_concept = $('#dd_group3').val();
		var pf_cost = $('#dd_group4').val();
		var pf_area = $('#dd_group5').val();

		alert(pf_subtype1 +" "+pf_subtype2+" "+pf_concept+" "+pf_cost+" "+pf_area);

		$.ajax({
			url: '/dozip/port_search',
			type : 'get',
			async : false,
			data : {
				pf_subtype1: pf_subtype1,
				pf_subtype2: pf_subtype2,
				pf_concept: pf_concept,
				pf_cost: pf_cost,
				pf_area:pf_area
			} ,
			dataType : "json",
			cache: false,
			success: function (data) {
				var result="";

				$(data).each(function () {//each()함수로 반복
					result += "<div class='card'>"
					+ "<div class='card_image'>"
					+ "<img class = 'ho' onclick = 'location.href='port_detail?pf_no='"+this.pf_no+"';' src= '"+this.pf_photo1+"'/>"
					+ "</div> <div class='card_title'>"
					+ "<li id = 'bname' style='display: none'>"+this.businessName+"</li>"
					+ "<li class = 'corp' id='pf_title'>"+this.pf_title+"</li>"
					+ "<li class = 'card_tag'><span id='pf_subtype'>"+this.pf_subtype+"</span>"
					+ "<span id='pf_concept'>"+this.pf_concept+"</span>"
					+ "<span id='pf_area'>"+this.pf_area+"평</span>"
					+ "<span id='pf_cost'>"+this.pf_cost+"만원대</span>"
					+ "</li></div></div>"
				});

				$('.cards-list').html(result);//해당영역에 html()함수로 문자와 태그를 함께 변경 적용.
			},
			error: function () {
				alert('실패');
			}
		});

	});
</script>
 		

<%--하단 공통부분 --%>	
<jsp:include page = "../common/footer.jsp"/>	