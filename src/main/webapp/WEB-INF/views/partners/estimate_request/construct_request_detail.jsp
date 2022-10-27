<%@ page contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

	<div class="request_detail_page">
		<div class="my_bid_detail_icon">
			<a href="/partners/construct_request"
				class="to_my_bid"><img src="/images/partners/bid_list.png" width="65px" height="65px"></a>
		</div>		
		<div class="request_list_detail_container">
			<div class="go_bid_detail"></div>
			<div class="request_detail">
				<p class="label_badge">
					<c:set var = "length" value = "${fn:length(e.est_detail)}"/>
					<c:set var = "est_detail" value = "${fn:substring(e.est_detail,0,length-1)}"/>
					<span class="label_val1"><b>${e.est_use}</b></span>
					<span class="label_val2"><b>${est_detail}</b></span>
				</p>
				<div class="request_detail_title">
				<h3>${e.addr} ${e.est_use} 원상복구 견적 문의</h3>
				</div>
				
				<div class="greeb_box_container">
					<div class="green_box">
						<ul class="box-cell5">
							<li class="detail_info_cons">
								<div class="dt">
									<p class="ico1"><b>희망 예산</b></p>
								</div>
								<div class="dd"><b>${e.est_bud}만원</b></div>
							</li>
							<li class="detail_info_cons">
								<div class="dt">
									<p class="ico2"><b>견적 신청일</b></p>
								</div>
								<c:set var = "est_date" value = "${fn:split(e.est_date,' ')}"/>
								<div class="dd"><b>${est_date[0]}</b></div>
							</li>
							<li class="detail_info_cons">
								<div class="dt">
									<p class="ico3"><b>희망 시공시작일</b></p>
								</div>
								<div class="dd"><b>${e.est_start}</b></div>
							</li>
							<li class="detail_info_cons_ex">
								<div class="dt">
									<p class="ico4"><b>희망 시공종료일</b></p>
								</div>
								<div class="dd"><b>${e.est_end}</b></div>
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
										<span class="download_mark"><img src="/images/partners/downloadmark.png" width="20px" height="20px"></span>
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
								<dd class="sec-cont">${e.est_zoning}</dd>
							</dl>
							<dl class="sec-item">
								<dt class="sec-title">건물유형</dt>
								<dd class="sec-cont">${e.est_use}</dd>
							</dl>
							<dl class="sec-item">
								<dt class="sec-title">인테리어 종류</dt>
								<dd class="sec-cont">[${est_detail}]</dd>
							</dl>
							<dl class="sec-item">
								<dt class="sec-title">세부 선택</dt>
								<dd class="sec-cont">${e.est_detail01} ${e.est_detail02} ${e.est_detail03} ${e.est_detail04}
									${e.est_detail05} ${e.est_detail06} ${e.est_detail07} ${e.est_detail08}</dd>
							</dl>
							<dl class="sec-item">
								<dt class="sec-title">시공 규모 (평 수)</dt>
								<dd class="sec-cont">${e.est_areaM}m<sup>2</sup>(${e.est_areaP}평)</dd>
							</dl>
							<dl class="sec-item">
								<dt class="sec-title">시공 주소</dt>
								<dd class="sec-cont">${e.est_addr}</dd>
							</dl>
							<dl class="sec-item">
								<dt class="sec-title">희망 예산</dt>
								<dd class="sec-cont">${e.est_bud}</dd>
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
								<dd class="sec-cont">${e.est_desc}</dd>
							</dl>
						</div>
					</div>
				</div>
			</div>
			<div class="bottom_color">
			</div>
		</div>
	</div>

<jsp:include page="../include/footer.jsp" />