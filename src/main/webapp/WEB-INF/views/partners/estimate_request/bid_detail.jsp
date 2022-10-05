<%@ page contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp" />

<script>
$(function() {
	$('#bid_participate').click(function() {
		$('#bid_part_detail').toggle(400);
		$('.bid_complete_button').toggle(400);
	});
});
$(function() {
	$('#hide_button').click(function() {
		$('#search_conditon').hide(400);
	});
});


</script>

	<div class="request_detail_page">
		<div class="my_bid_detail_icon">
			<a href="./my_bid.do"
				class="to_my_bid" target="_blank"><img src="./images/bid_list.png" width="55px" height="55px"></a>
		</div>		
		<div class="request_list_detail_container">
			<div class="go_bid_detail">
				<a href="./bid.do" class="list_go">
					<span class="ico_back"><img src="./images/list-arrow.png"></span>
					<span class="list_go_text">목록으로</span>
				</a>
			</div>
			<div class="request_detail">
				<p class="request_detail_day">
					모집중 D-<span>2</span>
				</p>
				<p class="label_badge">
					<span class="label_val1">사무실</span>
					<span class="label_val2">도배/바닥/욕실 공사</span>
				</p>
				<div class="request_detail_title">
				<h3>목동 사무실 원상복구 견적 문의</h3>
				</div>
				
				<div class="greeb_box_container">
					<div class="green_box">
						<ul class="box-cell5">
							<li class="detail_info">
								<div class="dt">
									<p class="ico1">희망 예산</p>
								</div>
								<div class="dd">5000000</div> <!-- 500만원 -->
							</li>
							<li class="detail_info">
								<div class="dt">
									<p class="ico2">모집마감일</p>
								</div>
								<div class="dd">2022.07.20</div>
							</li>
							<li class="detail_info">
								<div class="dt">
									<p class="ico3">희망 시공시작일</p>
								</div>
								<div class="dd">2022.09.01</div>
							</li>
							<li class="detail_info">
								<div class="dt">
									<p class="ico4">희망 시공종료일</p>
								</div>
								<div class="dd">2022.09.12</div>
							</li>							
							<li class="detail_info_ex">
								<div class="dt">
									<p class="ico5">참여 파트너수</p>
								</div>
								<div class="dd">3개 사</div>
							</li>
						</ul>
					</div>
				</div>
				<div class="detail_option">
					<div class="detail-op-sec">
						<div class="sec-head-title">첨부파일</div>
						</hr>
						<div class="sec-cont-wrap">
							<div class="file-box">
								<ul class="file-list">
									<li class="attach_file_list">
										<a href="javascript:void(0);" class="btn-file">
										<span class="download_mark"><img src="./images/downloadmark.png" width="20px" height="20px"></span>
										 프로젝트 첨부파일
										</a>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="detail-op-sec">
						<div class="sec-head">
							<div class="sec-head-title">
								의뢰 세부 정보
							</div></hr>
						</div>
						<div class="sec-cont-wrap">
							<dl class="sec-item">
								<dt class="sec-title">공간유형</dt>
								<dd class="sec-cont">주거</dd>
							</dl>
							<dl class="sec-item">
								<dt class="sec-title">건물유형</dt>
								<dd class="sec-cont">사무실</dd>
							</dl>
							<dl class="sec-item">
								<dt class="sec-title">인테리어 종류</dt>
								<dd class="sec-cont">[도배/바닥/욕실]</dd>
							</dl>
							<dl class="sec-item">
								<dt class="sec-title">세부 선택</dt>
								<dd class="sec-cont"></dd>
							</dl>
							<dl class="sec-item">
								<dt class="sec-title">시공 규모(평 수)</dt>
								<dd class="sec-cont">21.96m<sup>2</sup>(10평)</dd>
							</dl>
							<dl class="sec-item">
								<dt class="sec-title">시공 주소</dt>
								<dd class="sec-cont">경기도 성남시 수정구 위례서일로22</dd>
							</dl>
							<dl class="sec-item">
								<dt class="sec-title">희망 예산</dt>
								<dd class="sec-cont">5000000</dd>
							</dl>
							<dl class="sec-item">
								<dt class="sec-title">희망 시공시작일</dt>
								<dd class="sec-cont">2022.08.13</dd>
							</dl>							
							<dl class="sec-item">
								<dt class="sec-title">희망 시공완료일</dt>
								<dd class="sec-cont">2022.08.28</dd>
							</dl>							
							<dl class="sec-item">
								<dt class="sec-title">희망 스타일</dt>
								<dd class="sec-cont">
									1. 이사예정이 7/19(화)이라 18일까지는 완료가 되어야 합니다.(기존3층에 임대사무실 사용 후 9층
									매매완료하여 이사) 이사예정인 사무실은 15일 오전중에 공실이 됩니다.2. 바닥재은 어두운계열로,
									벽면은 합판이 덧대어져있는것 같은데 페이트 혹은 들뜨지않게 마감처리하여 깔끔하게 될 수 있도록 페인트 혹은 벽지
									두가지 생각하고 있습니다.<br>3. 전등갓이 불량하여 변경이 이뤄져야합니다.<br>4.
									외부시트지 디자인작업이 필요합니다.
								</dd>
							</dl>
							<form method="post" action="bid_detail_ok.do">
								<div>
									<div class="bid_part_div">
										<button type="button" id="bid_participate">입찰 신청하기</button>
									</div>
									<div id="bid_part_detail">
											<div class="bid_detail01">입찰가</div>
											<div class="bid_detail_text01"><input type="text" id="bid_price" name="bid_price" size="10"/><br/></div>
											<div class="bid_detail02" >예상 공사기간</div>
											<div class="bid_detail_text02"><input type="text" id="bid_period" name="bid_period"  size="10"/><br/></div>
											<div class="bid_detail03">업체 공사 스타일 설명</div>
											<textarea id="bid_detail" name="bid_detail" rows="5" ></textarea>
									</div>
									<div class="bid_complete_button">
										<input type="submit" id="bid_complete" value="신청완료">
									</div>
								</div>
							</form>	
						</div>

					</div>
				</div>
			</div>
			<div class="bottom_color"></div>
		</div>
	</div>

<jsp:include page="../include/footer.jsp" />