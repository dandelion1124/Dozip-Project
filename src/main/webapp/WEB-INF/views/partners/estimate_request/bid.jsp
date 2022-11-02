<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>




<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
		<div class="request_page">
			<form method="post" action="">
			<div class="request_spot">
				<h2 class="item_title">입찰의뢰</h2>
				<!--
					<select name="my_bid_option" style="border:1px solid lightgray; width: 50px;">
						<option value="all">전체</option>
						<option value="success">입찰 성공</option>
						<option value="fail">입찰 실패</option>
					</select> -->
					<div class="search_box">
					    <input class="search-txt" name="find_name" id="find_name" type="text" placeholder="검색어를 입력해 주세요"/>
					    <button class="search-btn" type="submit" onclick="location.href='/partners/my_bid'">
					    	<img src="/images/partners/search.png" width="20px" height="20px">
					    </button>
					</div>
					<div class="my_bid_icon">
						<a href="/partners/my_bid"
							class="to_my_bid"><img src="/images/partners/bid_list.png" width="55px" height="55px"></a>
					</div>
			</div>
			<div class="request_list_container">
				<div class="request_list">
					<div class="request_list_top">
						<!--
						<input type="checkbox" id="filter"> 
							<label for="filter" class="filter">완료 의뢰 건 제외</label> -->
						<div class="request_list_top_right">
							<!--
							<select class="fd_search_filter" name="find_field" id="pr_order" data-self="pr_order" data-type="simple">
								<option value="recent">최신 등록 순</option>
								<option value="due_date">마감 임박 순</option>
								<option value="request_budget">예산 규모 순</option>
							</select> -->
						</div>
					</div>
				<c:if test="${empty elist}">
					<div class="request_list_card">
						<p style="font-size:25px; height:100px; background-color: aliceblue; text-align: center; line-height: 100px;">
							조회된 입찰 리스트가 없습니다.</p>
					</div>
				</c:if>
				<c:if test="${!empty elist}">
					<c:forEach var="e" items="${elist}">
						<c:if test="${empty e.businessNum}">
					<div class="request_list_card">
						<div class="request_list_item01">
							<p class="request_day">
								<%--<c:set var="now" value="<%=new java.util.Date()%>" /> -->
								<%--<fmt:formatDate var="now" value="${now}" pattern="yyyy-MM-dd HH:mm:ss"/> -->
								<%--<fmt:parseDate var="endDate" value="${e.est_dateEnd}" pattern="yyyy-MM-dd HH:mm:ss"/> --%>
								<%--<fmt:formatDate var="formatEndDate" value="${e.est_dateEnd}" pattern="yyyy-MM-dd"/> -->
								<%--<fmt:parseDate var="enddate"  value="${e.est_dateEnd}" pattern="yyyy-MM-dd"/> --%>
								<span>
									<c:if test="${e.remaindate > 0}">모집중 D-${e.remaindate}</c:if>
									<c:if test="${e.remaindate == 0}">모집중 D-day</c:if>
									<c:if test="${e.remaindate < 0}">모집완료</c:if>
									<%-- <c:if test="${e.est_check != 0}">모집완료</c:if>  --%>
								</span>
							</p>
							<p class="label_badge">
								<span class="bid_number">${e.est_num}</span>
								<span class="label_val1"><b>${e.est_use}</b></span>
								<span class="label_val2">
								<c:set var = "length" value = "${fn:length(e.est_detail)}"/>
    							<c:set var = "est_detail" value = "${fn:substring(e.est_detail,0,length-1)}"/>
									<b>${est_detail}</b>
								</span>
							</p>
							<p class="request_title">
								<a href="/partners/bid_detail?no=${e.est_num}">${e.addr} ${e.est_use} 견적 문의</a> <%--${e.est_addr} 가공해서 넣어야 --%>
							</p>
							<div class="request_desc_div">
								<p class="request_desc">${e.est_desc}</p>
							</div>
								<ul class="request_info">
									<li class="info">
										<p class="request_info_tit">희망 예산</p>
										<p class="request_info_val">
											<span><b>${e.est_bud}만원</b></span>
										</p>
									</li>
									<li class="info">
										<p class="request_info_tit">모집 마감일</p>
										<p class="request_info_val">
												<c:set var = "est_dateEnd" value = "${fn:split(e.est_dateEnd,' ')}"/>
											<span><b>${est_dateEnd[0]}</b></span>
										</p>
									</li>
									<li class="info">
										<p class="request_info_tit">희망 시공시작일</p>
										<p class="request_info_val">
											<c:set var = "est_start" value = "${fn:split(e.est_start,' ')}"/>
											<span><b>${est_start[0]}</b></span>
										</p>
									</li>
									<li class="info">
										<p class="request_info_tit">희망 시공종료일</p>
										<p class="request_info_val">
											<c:set var = "est_end" value = "${fn:split(e.est_end,' ')}"/>
											<span><b>${est_end[0]}</b></span>
										</p>
									</li>
								</ul>
						</div>
						<div class="request_list_item02">
							<ul class="company_profile">
								<li class="info2">
									<p class="key">시공규모</p>
									<p class="val"><b>${e.est_areaM}m<sup>2</sup>(${e.est_areaP}평)</b></p></li>
								<li class="info2">
									<p class="key">시공주소</p>
									<p class="val"><b>${e.addr} </b></p></li>
								<li class="info2">
									<p class="key">참여 파트너수</p>
									<p class="val"><b> </b></p></li>
							</ul>
							<div class="bid_detail">
								<a href="/partners/bid_detail?no=${e.est_num}" class="btn-d-view"><b>자세히 보기</b></a>
							</div>
						</div>						
					</div></br>
						</c:if>
					</c:forEach>
				</c:if>
				</div>
			</div>
				<!--  
				<div class="bottom-btn-wrap">
					<button type="button" class="more_button"><img src="../images/more_plus.png"></br><span>더보기</span></button>
				</div> -->
			</form>
		</div>
<jsp:include page="../include/footer.jsp" />


