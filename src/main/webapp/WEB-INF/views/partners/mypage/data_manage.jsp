<%@ page  contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp" />
<link rel="stylesheet" href="/css/partners/partners_style2.css">
<%--주소검색 API --%>
<script src='/js/address.js'></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<%

	/* String [] value= request.getParameterValues("pService");
	for(String val: value){
		out.print(val+"<br>");`
	} */
%>
<script>
	function selectAll1(selectAll)  {
		const checkboxes
				= document.getElementsByName('pRes_build_type');

		checkboxes.forEach((checkbox) => {
			checkbox.checked = selectAll.checked;
		})
	}
	function selectAll2(selectAll)  {
		const checkboxes
				= document.getElementsByName('pRes_space_type');

		checkboxes.forEach((checkbox) => {
			checkbox.checked = selectAll.checked;
		})
	}
	function selectAll3(selectAll)  {
		const checkboxes
				= document.getElementsByName('pCom_build_type');

		checkboxes.forEach((checkbox) => {
			checkbox.checked = selectAll.checked;
		})
	}
	function selectAll4(selectAll)  {
		const checkboxes
				= document.getElementsByName('pCom_space_type');

		checkboxes.forEach((checkbox) => {
			checkbox.checked = selectAll.checked;
		})
	}

	$(function() {
		$('#resi-down').click(function() {
			$('#residence-wrap').toggle(400);
		});
	});


</script>
<article>
	<div>
		<div class="request_spot">
			<div class="request_color">
				<h2 class="item_title" >내 정보관리</h2>

				<div class="item_tab_box" >
					<div role="tablist" class="item_tab_inbox" id="business-link">
						<div id="tab1"><a href="#business-link" class="tab-link" >사업자 정보</a></div>
						<div id="tab2"><a href="#additional-link" class="tab-link">부가 정보</a></div>
						<div id="tab3"><a href="#p_Homepg" class="tab-link">선호 시공정보</a></div>
						<div id="tab4"><a href="#representative-link" class="tab-link">담당자 정보</a></div>
						<div id="tab5"><a href="#payment-link" class="tab-link">정산 정보</a></div>
					</div>
				</div>
			</div>
		</div>
		<div class="all_information">
			<form method="post" action="data_manage_ok">
				<fieldset id="business">
					<legend>
						<b>사업자 정보</b>
					</legend>
					<div class="business-01">
						<div class="business-01-1">
							<label><b>사업자등록번호</b></label><br />
							<div>
								<input type="text" id="businessNum" name="businessNum" value="${p.businessNum}" readonly size="30">
								<!--  <input type="text" id="business_num" name="business_num" size="5">
                                <input type="text" id="business_num" name="business_num" size="5"> -->
							</div>
						</div>
						<br />
						<div class="business-01-2">
							<label><b>상호</b></label><br />
							<div>
								<input type="text" id="businessName" name="businessName" value="${p.businessName}" readonly size="30">
							</div>
						</div>
					</div>
					<br />
					<div class="business-03">
						<label><b>대표자 이름</b></label><br />
						<div>
							<input type="text" id="p_Name" name="p_Name" value="${p.p_Name}" readonly size="30">
						</div>
						<br />
					</div>
					<div class="business-04">
						<label><b>대표자 연락처</b></label><br />
						<div>
							<input type="text" id="p_Tel" name="p_Tel" value="${p.p_Tel}" size="30">
						</div>
						<br />
					</div>
					<div class="business-05" id="additional-link">
						<label><b>영업장 주소</b></label><br />
						<div>
							<!--  <input type="text" size="5" disabled="true">
                            <input type="text" size="10" disabled="true">
                            <button type="button">변경</button> -->
						</div>
						<div>
                            <%--주소 검색 API 코드 --%>

							<input type="text" id="p_Address" name="p_Address"  size="30" value="${p.p_Address}" readonly />
							<input type="button" class="address_button" value="주소검색" onclick="sample6_execDaumPostcode()">
							<input type="text" id="sample6_postcode" readonly placeholder="우편번호"  size="4" name="pf_zipcode">
							<input type="text" id="sample6_address"  name ="pf_addr1" readonly  placeholder="주소" size="30">
							<input type="text" id="sample6_detailAddress" name ="pf_addr2" placeholder="상세주소">
							<input type="text" id="sample6_extraAddress" name ="pf_addr3" readonly placeholder="참고항목" size=10>





                            <%--주소 검색 API 코드 --%>
                             </div>
						<br />
					</div>
				</fieldset>

				<fieldset id="additional">
					<legend>
						<b>부가 정보</b>
					</legend>
					<div class="additional-01">
						<label><b>전문가 한마디</b></label><br />
						<textarea id="p_Shortstate" name="p_Shortstate" autocomplete="off"
								  placeholder="(EX. 따듯함이 느껴지는 원목과 화이트 컬러의 내추럴 스타일, 33평 아파트 인테리어입니다.)" rows="5">${ps.p_Shortstate}</textarea>
						<span class="text">0/2000</span>
					</div>
					<div class="additional-02">
						<label class="upload_image_title"><b>대표 인테리어 이미지</b></label><br />
						<div class="upload_image_size">(권장 이미지 사이즈 750 x 600)</div>
						<div tabindex="0" class="upload_image" >
							<label for="p_Int_img" class="upload_lbl">  <!-- label for과 input id가 같아야 적용됨 -->
								<img src="/images/partners/upload_plus.png" width="40px" height="40px">
							</label>
							<input type="file" id="p_Int_img" name="p_Int_img" accept="image/*">
						</div>
						<br />
					</div>
					<div class="additional-03">
						<label class="upload_image_title"><b>파트너스 로고 이미지</b></label><br />
						<div class="upload_image_size">(권장 이미지 사이즈 300 x 300)</div>
						<div tabindex="0" class="upload_image" >
							<label for="p_Comp_logo" class="upload_lbl">
								<img src="/images/partners/upload_plus.png" width="40px" height="40px">
							</label>
							<input type="file" id="p_Comp_logo" name="p_Comp_logo" accept="image/*">
						</div>
						<br />
					</div>
					<div class="additional-04">
						<label><b>제공 서비스</b></label><br />
						<div>제공하는 서비스를 모두 선택해 주세요.</div>

						<label for="service1" class="lbl-checkbox"> <input type="checkbox" name="pService" id="service1" value="3D도면">3D도면</label>
						<label for="service2" class="lbl-checkbox"> <input type="checkbox" name="pService" id="service2" value="일반도면">일반도면</label>
						<label for="service3" class="lbl-checkbox"> <input type="checkbox" name="pService" id="service3" value="카드결제">카드결제</label>
						<label for="service4" class="lbl-checkbox"> <input type="checkbox" name="pService" id="service4" value="쇼룸">쇼룸</label>
						<label for="service5" class="lbl-checkbox"> <input type="checkbox" name="pService" id="service5" value="정부지원사업">정부지원사업</label></br>
						<label for="service6" class="lbl-checkbox-disabled"><input type="checkbox" name="pService" id="service6" value="두집예치제">두집예치제</label>
						<label class="deposit_label">예치금</label> <input type="text" id="deposit_money" name="pBalance" <%--value="${ps.pBalance}"--%> >
						<p class="red">* 두집예치제는 두집(****-****)으로 추가 문의주세요.</p>
						<div class="current-service">
							<label>현재 제공하는 서비스</label>

						</div>
					</div>



					<div class="additional-05">
						<label><b>홈페이지</b></label><br />
						<textarea class="homepage" autocomplete="off" name="p_Homepg" id="p_Homepg" placeholder="홈페이지를 입력하세요" rows="3">${ps.p_Homepg}</textarea>
					</div>
					<br />


					<!--
                    <div class="additional-06">
                        <label><b>업체사진(실내)</b></label><br />
                        <div tabindex="0" class="upload_image2" >
                            <label for="choosefile" class="upload_lbl2">
                                <img src="../images/upload_plus.png" width="40px" height="40px">
                            </label>
                            <input type="file" id="choosefile" name="file" accept="image/*">
                        </div>
                        <br />
                    </div>
                    <div class="additional-07">
                        <label><b>업체사진(실외)</b></label><br />
                        <div tabindex="0" class="upload_image2" >
                            <label for="choosefile" class="upload_lbl2">
                                <img src="../images/upload_plus.png" width="40px" height="40px">
                            </label>
                            <input type="file" id="choosefile" name="file" accept="image/*">
                        </div>
                    </div>
                    -->

				</fieldset>



				<fieldset id="preference">
					<legend>
						<b>선호 시공정보</b>
					</legend>
					<div>
						<span class="resi-down" style="border:0px; background-color:white; cursor:pointer; "><b>주거공간 ▼</b></span>
					</div>

					<div class="residence-wrap">
						<div>
							<b><span class="red">*</span></b><span> <b>건물 유형(최소 2개 이상)</b></span>
						</div>
						<div class="residence">
							<label for="res_build_all" class="lbl-checkbox"> <input type="checkbox" name="p_Res_build_type_all" id="res_build_all" value="" onclick="selectAll1(this)"></input> 전체</label><br />
							<div>
								<label for="res_build01" class="lbl-checkbox"> <input type="checkbox" name="p_Res_build_type" id="res_build01" value="아파트">아파트</label>
								<label for="res_build02" class="lbl-checkbox"> <input type="checkbox" name="p_Res_build_type" id="res_build02" value="빌라">빌라</label>
								<label for="res_build03" class="lbl-checkbox"> <input type="checkbox" name="p_Res_build_type" id="res_build03" value="주택">주택</label>
								<label for="res_build04" class="lbl-checkbox"> <input type="checkbox"name="p_Res_build_type" id="res_build04" value="오피스텔">오피스텔</label>
							</div> <!-- label의 for와 input의 id가 같아야 label값 눌러도 선택됨 -->
						</div>
						<br />

						<div>
							<b><span class="red">*</span></b><span> <b>가능한 공간</b></span>
						</div>
						<div class="residence" >
							<label for="res_space_all" class="lbl-checkbox"> <input type="checkbox" name="p_Res_space_type_all" id="res_space_all" value="" onclick="selectAll2(this)"></input>전체</label><br />
							<!-- <h5 class="sigong">시공</h5>  -->
							<div>
								<!--  <input type="checkbox" id="wall" name="check" data-name="도배/벽"  class ="checkbox"/> -->
								<label for="res_space01" class="lbl-checkbox"> <input type="checkbox" name="p_Res_space_type" id="res_space01" value="도배/벽">도배/벽</label>
								<label for="res_space02" class="lbl-checkbox"> <input type="checkbox" name="p_Res_space_type" id="res_space02" value="바닥">바닥</label>
								<label for="res_space03" class="lbl-checkbox"> <input type="checkbox" name="p_Res_space_type" id="res_space03" value="주방">주방</label>
								<label for="res_space04" class="lbl-checkbox"> <input type="checkbox" name="p_Res_space_type" id="res_space04" value="욕실">욕실</label>
								<label for="res_space05" class="lbl-checkbox"> <input type="checkbox" name="p_Res_space_type" id="res_space05" value="현관">현관</label>
								<label for="res_space06" class="lbl-checkbox"> <input type="checkbox" name="p_Res_space_type" id="res_space06" value="발코니/샷시">발코니/샷시</label>
								<label for="res_space07" class="lbl-checkbox"> <input type="checkbox" name="p_Res_space_type" id="res_space07" value="조명">조명</label>
								<label for="res_space08" class="lbl-checkbox"> <input type="checkbox" name="p_Res_space_type" id="res_space08" value="문">문</label>
								<!--  			<label for="check22" class="lbl-checkbox"> <input type="checkbox" id="check22">도장</input></label>
                                            <label for="check23" class="lbl-checkbox"> <input type="checkbox" id="check23">필름</input></label>
                                            <label for="check24" class="lbl-checkbox"> <input type="checkbox" id="check24">목공</input></label>
                                            <label for="check25" class="lbl-checkbox"> <input type="checkbox" id="check25">문</input></label>
                                            <label for="check26" class="lbl-checkbox"> <input type="checkbox" id="check26">전기</input></label>
                                            <label for="check27" class="lbl-checkbox"> <input type="checkbox" id="check27">조명</input></label>
                                            <label for="check28" class="lbl-checkbox"> <input type="checkbox" id="check28">가구</input></label>
                                            <label for="check29" class="lbl-checkbox"> <input type="checkbox" id="check29">기타</input></label> -->
							</div>

							<!-- 		<h5 class="gicho">기초공사</h5>
                                    <div>
                                        <label for="check30" class="lbl-checkbox"> <input type="checkbox" id="check30">철거</input></label>
                                        <label for="check31" class="lbl-checkbox"> <input type="checkbox" id="check31">설비</input></label>
                                        <label for="check32" class="lbl-checkbox"> <input type="checkbox" id="check32">방수</input></label>
                                        <label for="check33" class="lbl-checkbox"> <input type="checkbox" id="check33">단열</input></label>
                                        <label for="check34" class="lbl-checkbox"> <input type="checkbox" id="check34">확장</input></label>
                                    </div> -->
						</div>
						<br />
					</div>

					<div>
						<span><b>상업공간</b></span> <span>▼</span>
					</div>

					<div class=''>
						<div>
							<b><span class="red">*</span></b><span> <b>건물 유형(최소 3개 이상)</b></span>
						</div>
						<div class="commercial" >
							<label for="com_build_all" class="lbl-checkbox"> <input type="checkbox" name="p_Com_build_type_all" id="com_build_all" value="" onclick="selectAll3(this)"></input> 전체</label><br />
							<div>
								<label for="com_build01" class="lbl-checkbox"> <input type="checkbox" name="p_Com_build_type" id="com_build01" value="사무실">사무실</label>
								<label for="com_build02" class="lbl-checkbox"> <input type="checkbox" name="p_Com_build_type" id="com_build02" value="상가/매장">상가/매장</label>
								<label for="com_build03" class="lbl-checkbox"> <input type="checkbox" name="p_Com_build_type" id="com_build03" value="카페/식당">카페/식당</label>
								<label for="com_build04" class="lbl-checkbox"> <input type="checkbox" name="p_Com_build_type" id="com_build04" value="학원/교육">학원/교육</label>
								<label for="com_build05" class="lbl-checkbox"> <input type="checkbox" name="p_Com_build_type" id="com_build05" value="숙박/병원">숙박/병원</label>
								<label for="com_build06" class="lbl-checkbox"> <input type="checkbox" name="p_Com_build_type" id="com_build06" value="간판">간판</label>
								<label for="com_build07" class="lbl-checkbox"> <input type="checkbox" name="p_Com_build_type" id="com_build07" value="기타">기타</label>
							</div>
						</div>
						<br />

						<div>
							<b><span class="red">*</span></b><span> <b>가능한 공간</b></span>
						</div>
						<div class="commercial" >
							<label for="com_space_all" class="lbl-checkbox"> <input type="checkbox" name="p_Com_space_type_all" id="com_space_all" value="" onclick="selectAll4(this)"></input> 전체
							</label><br />
							<!--  <h5 class="sigong">시공</h5> -->
							<div id="representative-link">
								<label for="com_space01" class="lbl-checkbox"> <input type="checkbox" name="p_Com_space_type" id="com_space01" value="도배/벽">도배/벽</label>
								<label for="com_space02" class="lbl-checkbox"> <input type="checkbox" name="p_Com_space_type" id="com_space02" value="바닥">바닥</label>
								<label for="com_space03" class="lbl-checkbox"> <input type="checkbox" name="p_Com_space_type" id="com_space03" value="주방">주방</label>
								<label for="com_space04" class="lbl-checkbox"> <input type="checkbox" name="p_Com_space_type" id="com_space04" value="욕실">욕실</label>
								<label for="com_space05" class="lbl-checkbox"> <input type="checkbox" name="p_Com_space_type" id="com_space05" value="현관">현관</label>
								<label for="com_space06" class="lbl-checkbox"> <input type="checkbox" name="p_Com_space_type" id="com_space06" value="발코니/샷시">발코니/샷시</label>
								<label for="com_space07" class="lbl-checkbox"> <input type="checkbox" name="p_Com_space_type" id="com_space07" value="조명">조명</label>
								<label for="com_space08" class="lbl-checkbox"> <input type="checkbox" name="p_Com_space_type" id="com_space08" value="문">문</label>
							</div>
							<!--  		<h5 class="gicho">기초공사</h5>
                                    <div>
                                        <label for="check68" class="lbl-checkbox"> <input type="checkbox" id="check68">철거</input></label>
                                        <label for="check69" class="lbl-checkbox"> <input type="checkbox" id="check69">설비</input></label>
                                        <label for="check70" class="lbl-checkbox"> <input type="checkbox" id="check70">방수</input></label>
                                        <label for="check71" class="lbl-checkbox"> <input type="checkbox" id="check71">단열</input></label>
                                        <label for="check72" class="lbl-checkbox"> <input type="checkbox" id="check72">확장</input></label>
                                        <label for="check73" class="lbl-checkbox"> <input type="checkbox" id="check73">간판</input></label>
                                    </div> -->
						</div>
						<br />
					</div>

					<div>
						<label></label>
					</div>
				</fieldset>

				<fieldset id="representative">
					<legend><b>담당자 정보</b></legend>
					<div>
						<div>
							<label><b>주거 담당자</b></label>
							<div><input type="text" size="20" id="p_Res_person_name" name="p_Res_person_name" value="${ps.p_Res_person_name}" placeholder="담당자명"></div></br>
							<label><b>담당자 연락처</b></label>
							<div><input type="text" size="20" id="p_Res_person_tel" name="p_Res_person_tel" value="${ps.p_Res_person_tel}" placeholder="담당자 연락처"></div>
							<label>
								<input type="checkbox" aria-hidden="false">
								<span class="">대표자 정보와 동일 <!----></span>
							</label>
						</div></br>
						<div>
							<label><b>상업 담당자</b></label>
							<div><input type="text" size="20" id="p_Com_person_name" name="p_Com_person_name" value="${ps.p_Com_person_name}" placeholder="담당자명"></div></br>
							<label id="payment-link"><b>담당자 연락처</b></label>
							<div><input type="text" size="20" id="p_Com_person_tel" name="p_Com_person_tel" value="${ps.p_Com_person_tel}" placeholder="담당자 연락처"></div>
							<label>
								<input type="checkbox" aria-hidden="false">
								<span class="">대표자 정보와 동일 <!----></span>
							</label>
						</div>
					</div>
				</fieldset>


				<fieldset id="payment">
					<legend><b>정산 정보</b></legend>

					<!--
                     <div>
                         <label><b>세금계산서 이메일</b></label>
                         <div><input type="text" size="20"></div></br>
                     </div>
                     -->

					<div>
						<label><b>입금계좌</b></label>
						<div><input type="text" size="20" id="p_Account_bank" name="p_Account_bank" value="${ps.p_Account_bank}" placeholder="은행명"></div>
						<div><input type="text" size="20" id="p_Account_name"name="p_Account_name" value="${ps.p_Account_name}" placeholder="예금주"></div>
						<div><input type="text" size="20" id="p_Account_num" name="p_Account_num" value="${ps.p_Account_num}" placeholder="계좌번호"></div>
					</div></br>
					<div>
						<div class="representative-01">
							<label class="upload_image_title"><b>통장 사본</b></label><br>
							<div tabindex="0" class="upload_image">
								<label for="p_Account_file" class="upload_lbl">
									<img src="/images/partners/upload_plus.png" width="40px" height="40px">
								</label>
								<input type="file" id="p_Account_file" name="p_Account_file" accept="image/*">
							</div>
							<br>
						</div>
						<div class="representative-02">
							<label class="upload_image_title"><b>사업자 등록증 사본</b></label><br>
							<div tabindex="0" class="upload_image">
								<label for="p_Business_lic_file" class="upload_lbl">
									<img src="/images/partners/upload_plus.png" width="40px" height="40px">
								</label>
								<input type="file" id="p_Business_lic_file" name="p_Business_lic_file" accept="image/*">
							</div>
							<br>
						</div>
						<p class="red">* 입금계좌, 통장 사본, 사업자 등록증 사본은 1회만 입력 가능합니다.
							수정희망 시 집닥담당자 (1600-3069) 에게 문의 해주세요.</p>
					</div>
				</fieldset>

				<div class="data_edit_button_tag">
					<input type="submit" id="data_edit_button" value="정 보 수 정" /> <!-- onclick="location.href='date_manage.do'" -->
				</div></br>
			</form>
		</div>
	</div>
</article>


<jsp:include page="../include/footer.jsp" />


		