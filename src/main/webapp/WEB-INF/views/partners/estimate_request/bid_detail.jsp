<%@ page contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
			<a href="./my_bid"
				class="to_my_bid" target="_blank"><img src="/images/partners/bid_list.png" width="55px" height="55px"></a>
		</div>		
		<div class="request_list_detail_container">
			<div class="go_bid_detail">
				<a href="./bid" class="list_go">
					<span class="ico_back"><img src="/images/partners/list-arrow.png"></span>
					<span class="list_go_text">목록으로</span>
				</a>
			</div>
			<%--<c:if test="${!empty elist}"> --%>
			<%--<c:forEach var="e" items="${elist}"> --%>
			<div class="request_detail">
				<p class="request_detail_day">
					모집중 D-<span></span>
				</p>
				<p class="label_badge">
					<span class="label_val1">${e.est_use}</span>
					<span class="label_val2">${e.est_detail}</span>
				</p>
				<div class="request_detail_title">
				<h3> 견적 문의</h3>
				</div>
				
				<div class="greeb_box_container">
					<div class="green_box">
						<ul class="box-cell5">
							<li class="detail_info">
								<div class="dt">
									<p class="ico1">희망 예산</p>
								</div>
								<div class="dd">${e.est_bud}0000원</div> <!-- 500만원 -->
							</li>
							<li class="detail_info">
								<div class="dt">
									<p class="ico2">모집마감일</p>
								</div>
								<div class="dd">${e.est_dateEnd}</div>
							</li>
							<li class="detail_info">
								<div class="dt">
									<p class="ico3">희망 시공시작일</p>
								</div>
								<div class="dd">${e.est_start}</div>
							</li>
							<li class="detail_info">
								<div class="dt">
									<p class="ico4">희망 시공종료일</p>
								</div>
								<div class="dd">${e.est_end}</div>
							</li>							
							<li class="detail_info_ex">
								<div class="dt">
									<p class="ico5">참여 파트너수</p>
								</div>
								<div class="dd"></div>
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
										<div class="download_mark">
											<label for="project_img" class="file_label" style="cursor:pointer;">  <!-- label for과 input id가 같아야 적용됨 -->
												<img src="/images/partners/downloadmark.png" width="20px" height="20px" >
												프로젝트 첨부파일
											</label>
											<input type="file" id="project_img" name="project_img" accept="image/*" style="visibility: hidden;">
										</div>

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
								<dd class="sec-cont">${e.est_zoning}</dd>
							</dl>
							<dl class="sec-item">
								<dt class="sec-title">건물유형</dt>
								<dd class="sec-cont">${e.est_use}</dd>
							</dl>
							<dl class="sec-item">
								<dt class="sec-title">인테리어 종류</dt>
								<dd class="sec-cont">[${e.est_detail}]</dd>
							</dl>
							<dl class="sec-item">
								<dt class="sec-title">세부 선택</dt>
								<dd class="sec-cont">${e.est_detail01}/</dd> <!-- 가공필요 -->
							</dl>
							<dl class="sec-item">
								<dt class="sec-title">시공 규모(평 수)</dt>
								<dd class="sec-cont">${e.est_areaM}m<sup>2</sup>(${e.est_areaP}평)</dd>
							</dl>
							<dl class="sec-item">
								<dt class="sec-title">시공 주소</dt>
								<dd class="sec-cont">${e.est_addr}</dd>
							</dl>
							<dl class="sec-item">
								<dt class="sec-title">희망 예산</dt>
								<dd class="sec-cont">${e.est_bud}0000원</dd>
							</dl>
							<dl class="sec-item">
								<dt class="sec-title">희망 시공시작일</dt>
								<dd class="sec-cont">${e.est_start}</dd>
							</dl>							
							<dl class="sec-item">
								<dt class="sec-title">희망 시공완료일</dt>
								<dd class="sec-cont">${e.est_end}</dd>
							</dl>							
							<dl class="sec-item">
								<dt class="sec-title">희망 스타일</dt>
								<dd class="sec-cont">
									${e.est_desc}
								</dd>
							</dl>


							<form method="post" action="bid_detail_ok?no=${e.est_num}">
								<div>
									<div class="bid_part_div">
										<button type="button" id="bid_participate">입찰 신청하기</button>
									</div>
									<div id="bid_part_detail">
											<div class="bid_detail01">입찰가</div>
											<div class="bid_detail_text01"><input type="text" id="bid_price" name="bid_price" size="10"/><br/></div>
											<div class="bid_detail02" >예상 공사시작일</div>
											<div class="bid_detail_text02"><input type="text" id="bid_start" name="bid_start"  size="10"/><br/></div>
											<div class="bid_detail04" >예상 공사종료일</div>
											<div class="bid_detail_text03"><input type="text" id="bid_end" name="bid_end"  size="10"/><br/></div>
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
			<%--</c:forEach>--%>
			<%--</c:if>--%>
			<div class="bottom_color"></div>
		</div>
	</div>

<jsp:include page="../include/footer.jsp" />