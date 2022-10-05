<%@ page contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp" />

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />




		<div class="request_page">
			<form method="post" action="bid_board_list.do">
			<div class="request_spot">
				<h2 class="item_title">입찰의뢰</h2>
						<div class="search_box">
					    <input class="search-txt" type="text" placeholder="검색어를 입력해 주세요">
					    <button class="search-btn" type="submit">
					    	<img src="./images/search.png" width="20px" height="20px">
					    </button>
						</div>
					<div class="my_bid_icon">
						<a href="./my_bid.do"
							class="to_my_bid" target="_blank"><img src="./images/bid_list.png" width="55px" height="55px"></a>
					</div>
			</div>
			<div class="request_list_container">
				<div class="request_list">
					<div class="request_list_top">
						<input type="checkbox" id="filter"> 
							<label for="filter" class="filter">완료 의뢰 건 제외</label> 
						<div class="request_list_top_right">
							<select class="fd_search_filter" id="pr_order" data-self="pr_order" data-type="simple">
								<option value="recent">최신 등록 순</option>
								<option value="due_date">마감 임박 순</option>
								<option value="request_budget">예산 규모 순</option>
							</select>
						</div>
					</div>
					<div class="request_list_card">
						<div class="request_list_item01">
							<p class="request_day">
								모집중 D-<span>2</span>
							</p>
							<p class="label_badge">
								<span class="label_val1">사무실</span>
								<span class="label_val2">도배/바닥/욕실 공사</span>
							</p>
							<p class="request_title">
								<a href="./bid_detail.jsp">목동 사무실 원상복구 견적 문의</a>
							</p>
							<div class="request_desc_div">
								<p class="request_desc">
								1. 이사예정이 7/19(화)이라 18일까지는 완료가 되어야 합니다.(기존3층에 임대사무실 사용 후 9층 매매완료하여 이사) 이사예정인 사무실은 15일 오전중에 공실이 됩니다.</br>
								2. 바닥재은 어두운계열로, 벽면은 합판이 덧대어져있는것 같은데 페이트 혹은 들뜨지않게 마감처리하여 깔끔하게 될 수 있도록 페인트 혹은 벽지 두가지 생각하고 있습니다.
								3. 전등갓이 불량하여 변경이 이뤄져야합니다.
								4. 외부시트지 디자인작업이 필요합니다.
								</p>
							</div>
								<ul class="request_info">
									<li class="info">
										<p class="request_info_tit">희망 예산</p>
										<p class="request_info_val">
											<span><b>5000000</b></span>
										</p>
									</li>
									<li class="info">
										<p class="request_info_tit">모집 마감일</p>
										<p class="request_info_val">
											<span><b>2022.08.31</b></span>
										</p>
									</li>
									<li class="info">
										<p class="request_info_tit">희망 시공시작일</p>
										<p class="request_info_val">
											<span><b>2022.09.01</b></span>
										</p>
									</li>
									<li class="info">
										<p class="request_info_tit">희망 시공종료일</p>
										<p class="request_info_val">
											<span><b>2022.09.12</b></span>
										</p>
									</li>
								</ul>
						</div>
						<div class="request_list_item02">
							<ul class="company_profile">
								<li class="info2">
									<p class="key">시공규모</p>
									<p class="val"><b>21.96m<sup>2</sup>(10평)</b></p></li>
								<li class="info2">
									<p class="key">시공주소</p>
									<p class="val"><b>경기 성남시</b></p></li>
								<li class="info2">
									<p class="key">참여 파트너수</p>
									<p class="val"><b>3</b></p></li>
							</ul>
							<div class="bid_detail">
								<a href="./bid_detail.do" class="btn-d-view" >자세히 보기</a>
							</div>
						</div>						
					</div></br>
					
					<div class="request_list_card">
						<div class="request_list_item01">
							<p class="request_day">
								모집중 D-<span>2</span>
							</p>
							<p class="label_badge">
								<span class="label_val1">사무실</span>
								<span class="label_val2">도배/바닥/욕실 공사</span>
							</p>
							<p class="request_title">
								<a href="./bid_detail.jsp">목동 사무실 원상복구 견적 문의</a>
							</p>
							<div class="request_desc_div">
								<p class="request_desc">
								1. 이사예정이 7/19(화)이라 18일까지는 완료가 되어야 합니다.(기존3층에 임대사무실 사용 후 9층 매매완료하여 이사) 이사예정인 사무실은 15일 오전중에 공실이 됩니다.</br>
								2. 바닥재은 어두운계열로, 벽면은 합판이 덧대어져있는것 같은데 페이트 혹은 들뜨지않게 마감처리하여 깔끔하게 될 수 있도록 페인트 혹은 벽지 두가지 생각하고 있습니다.
								3. 전등갓이 불량하여 변경이 이뤄져야합니다.
								4. 외부시트지 디자인작업이 필요합니다.
								</p>
							</div>
								<ul class="request_info">
									<li class="info">
										<p class="request_info_tit">희망 예산</p>
										<p class="request_info_val">
											<span><b>5000000</b></span>
										</p>
									</li>
									<li class="info">
										<p class="request_info_tit">모집 마감일</p>
										<p class="request_info_val">
											<span><b>2022.08.31</b></span>
										</p>
									</li>
									<li class="info">
										<p class="request_info_tit">희망 시공시작일</p>
										<p class="request_info_val">
											<span><b>2022.09.01</b></span>
										</p>
									</li>
									<li class="info">
										<p class="request_info_tit">희망 시공종료일</p>
										<p class="request_info_val">
											<span><b>2022.09.12</b></span>
										</p>
									</li>
								</ul>
						</div>
						<div class="request_list_item02">
							<ul class="company_profile">
								<li class="info2">
									<p class="key">시공규모</p>
									<p class="val"><b>21.96m<sup>2</sup>(10평)</b></p></li>
								<li class="info2">
									<p class="key">시공주소</p>
									<p class="val"><b>경기 성남시</b></p></li>
								<li class="info2">
									<p class="key">참여 파트너수</p>
									<p class="val"><b>3</b></p></li>
							</ul>
							<div class="bid_detail">
								<a href="./bid_detail.do" class="btn-d-view" >자세히 보기</a>
							</div>
						</div>						
					</div></br>
					
					<div class="request_list_card">
						<div class="request_list_item01">
							<p class="request_day">
								모집중 D-<span>2</span>
							</p>
							<p class="label_badge">
								<span class="label_val1">사무실</span>
								<span class="label_val2">도배/바닥/욕실 공사</span>
							</p>
							<p class="request_title">
								<a href="./bid_detail.jsp">목동 사무실 원상복구 견적 문의</a>
							</p>
							<div class="request_desc_div">
								<p class="request_desc">
								1. 이사예정이 7/19(화)이라 18일까지는 완료가 되어야 합니다.(기존3층에 임대사무실 사용 후 9층 매매완료하여 이사) 이사예정인 사무실은 15일 오전중에 공실이 됩니다.</br>
								2. 바닥재은 어두운계열로, 벽면은 합판이 덧대어져있는것 같은데 페이트 혹은 들뜨지않게 마감처리하여 깔끔하게 될 수 있도록 페인트 혹은 벽지 두가지 생각하고 있습니다.
								3. 전등갓이 불량하여 변경이 이뤄져야합니다.
								4. 외부시트지 디자인작업이 필요합니다.
								</p>
							</div>
								<ul class="request_info">
									<li class="info">
										<p class="request_info_tit">희망 예산</p>
										<p class="request_info_val">
											<span><b>5000000</b></span>
										</p>
									</li>
									<li class="info">
										<p class="request_info_tit">모집 마감일</p>
										<p class="request_info_val">
											<span><b>2022.08.31</b></span>
										</p>
									</li>
									<li class="info">
										<p class="request_info_tit">희망 시공시작일</p>
										<p class="request_info_val">
											<span><b>2022.09.01</b></span>
										</p>
									</li>
									<li class="info">
										<p class="request_info_tit">희망 시공종료일</p>
										<p class="request_info_val">
											<span><b>2022.09.12</b></span>
										</p>
									</li>
								</ul>
						</div>
						<div class="request_list_item02">
							<ul class="company_profile">
								<li class="info2">
									<p class="key">시공규모</p>
									<p class="val"><b>21.96m<sup>2</sup>(10평)</b></p></li>
								<li class="info2">
									<p class="key">시공주소</p>
									<p class="val"><b>경기 성남시</b></p></li>
								<li class="info2">
									<p class="key">참여 파트너수</p>
									<p class="val"><b>3</b></p></li>
							</ul>
							<div class="bid_detail">
								<a href="./bid_detail.do" class="btn-d-view" >자세히 보기</a>
							</div>
						</div>						
					</div></br>
				</div>
			</div>
				<!--  
				<div class="bottom-btn-wrap">
					<button type="button" class="more_button"><img src="../images/more_plus.png"></br><span>더보기</span></button>
				</div> -->
			</form>
		</div>
<jsp:include page="../include/footer.jsp" />


