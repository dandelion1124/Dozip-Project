<%@ page  contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp" />
<%@ page import="com.partners.dao.PartnersDAO" %>
<%@ page import="com.partners.dto.PartnersDTO" %>
<%
	
	/* String [] value= request.getParameterValues("pService");
	for(String val: value){
		out.print(val+"<br>");
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
			  			<div id="tab3"><a href="#pHomepg" class="tab-link">선호 시공정보</a></div>
			  			<div id="tab4"><a href="#representative-link" class="tab-link">담당자 정보</a></div>
			  			<div id="tab5"><a href="#payment-link" class="tab-link">정산 정보</a></div>  			
			  		</div>
			  	</div>
		  	</div>
  		</div>    
    <div class="all_information">
		<form method="post" action="data_manage_edit_ok.do">
			<fieldset id="business">
				<legend>
					<b>사업자 정보</b>
				</legend>
				<div class="business-01">
					<div class="business-01-1">
						<label><b>사업자등록번호</b></label><br />
						<div>
							<input type="text" id="business_num" name="business_num" value="${p.business_num}" size="30"> 
							<!--  <input type="text" id="business_num" name="business_num" size="5">
							<input type="text" id="business_num" name="business_num" size="5"> -->
						</div>
					</div>
					<br />
					<div class="business-01-2">
						<label><b>상호</b></label><br />
						<div>
							<input type="text" id="businessName" name="businessName" value="${p.businessName}" size="30">
						</div>
					</div>
				</div>
				<br />
				<div class="business-03">
					<label><b>대표자 이름</b></label><br />
					<div>
						<input type="text" id="pName" name="pName" value="${p.pName}" size="30">
					</div>
					<br />
				</div>
				<div class="business-04">
					<label><b>대표자 연락처</b></label><br />
					<div>
						<input type="text" id="pTel" name="pTel" value="${p.pTel}" size="30">
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
						<input type="text"  id="pAddress" name="pAddress" value="${p.pAddress}" size="30">
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
						<textarea id="pShortstate" name="pShortstate" autocomplete="off"
							placeholder="(EX. 따듯함이 느껴지는 원목과 화이트 컬러의 내추럴 스타일, 33평 아파트 인테리어입니다.)" rows="5">${ps.pShortstate}</textarea>
					<span class="text">0/2000</span>
				</div>
				<div class="additional-02">
					<label class="upload_image_title"><b>대표 인테리어 이미지</b></label><br />
					<div class="upload_image_size">(권장 이미지 사이즈 750 x 600)</div>
					<div tabindex="0" class="upload_image" >
						<label for="pInt_img" class="upload_lbl">  <!-- label for과 input id가 같아야 적용됨 -->
							<img src="./images/upload_plus.png" width="40px" height="40px">
						</label>
						<input type="file" id="pInt_img" name="pInt_img" accept="image/*">
					</div>
					<br />
				</div>
				<div class="additional-03">
					<label class="upload_image_title"><b>파트너스 로고 이미지</b></label><br />
					<div class="upload_image_size">(권장 이미지 사이즈 300 x 300)</div>
					<div tabindex="0" class="upload_image" >
						<label for="pComp_logo" class="upload_lbl">
							<img src="./images/upload_plus.png" width="40px" height="40px">
						</label>
						<input type="file" id="pComp_logo" name="pComp_logo" accept="image/*">
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
						<label class="deposit_label">예치금</label> <input type="text" id="deposit_money" name="pBalance" value="${ps.pBalance}" >
						<p id="red">* 두집예치제는 두집(****-****)으로 추가 문의주세요.</p>
					<div class="current-service">
						<label>현재 제공하는 서비스</label>
					
					</div>
				</div>
					


				<div class="additional-05">
					<label><b>홈페이지</b></label><br />
					<textarea class="homepage" autocomplete="off" name="pHomepg" id="pHomepg" placeholder="홈페이지를 입력하세요" rows="3">${ps.pHomepg}</textarea>
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
					<span><b>주거공간</b></span> <span>▼</span>
				</div>

				<div class=''>
					<div>
						<b><span id="red">*</span></b><span> <b>건물 유형(최소 2개 이상)</b></span>
					</div>
					<div class="residence">
							<label for="res_build_all" class="lbl-checkbox"> <input type="checkbox" name="pRes_build_type_all" id="res_build_all" value="" onclick="selectAll1(this)"></input> 전체</label><br />
						<div>
							<label for="res_build01" class="lbl-checkbox"> <input type="checkbox" name="pRes_build_type" id="res_build01" value="아파트">아파트</input></label>
							<label for="res_build02" class="lbl-checkbox"> <input type="checkbox" name="pRes_build_type" id="res_build02" value="빌라">빌라</input></label>
							<label for="res_build03" class="lbl-checkbox"> <input type="checkbox" name="pRes_build_type" id="res_build03" value="주택">주택</input></label>
							<label for="res_build04" class="lbl-checkbox"> <input type="checkbox"name="pRes_build_type" id="res_build04" value="오피스텔">오피스텔</input></label>
						</div> <!-- label의 for와 input의 id가 같아야 label값 눌러도 선택됨 -->
					</div>
					<br />

					<div>
						<b><span id="red">*</span></b><span> <b>가능한 공간</b></span>
					</div>
					<div class="residence" >
						<label for="res_space_all" class="lbl-checkbox"> <input type="checkbox" name="pRes_space_type_all" id="res_space_all" value="" onclick="selectAll2(this)"></input>전체</label><br />
						<!-- <h5 class="sigong">시공</h5>  -->
						<div>
							<!--  <input type="checkbox" id="wall" name="check" data-name="도배/벽"  class ="checkbox"/> -->
							<label for="res_space01" class="lbl-checkbox"> <input type="checkbox" name="pRes_space_type" id="res_space01" value="도배/벽">도배/벽</input></label>
							<label for="res_space02" class="lbl-checkbox"> <input type="checkbox" name="pRes_space_type" id="res_space02" value="바닥">바닥</input></label>
							<label for="res_space03" class="lbl-checkbox"> <input type="checkbox" name="pRes_space_type" id="res_space03" value="주방">주방</input></label>
							<label for="res_space04" class="lbl-checkbox"> <input type="checkbox" name="pRes_space_type" id="res_space04" value="욕실">욕실</input></label>
							<label for="res_space05" class="lbl-checkbox"> <input type="checkbox" name="pRes_space_type" id="res_space05" value="현관">현관</input></label>
							<label for="res_space06" class="lbl-checkbox"> <input type="checkbox" name="pRes_space_type" id="res_space06" value="발코니/샷시">발코니/샷시</input></label>
							<label for="res_space07" class="lbl-checkbox"> <input type="checkbox" name="pRes_space_type" id="res_space07" value="조명">조명</input></label>
							<label for="res_space08" class="lbl-checkbox"> <input type="checkbox" name="pRes_space_type" id="res_space08" value="문">문</input></label>
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
						<b><span id="red">*</span></b><span> <b>건물 유형(최소 3개 이상)</b></span>
					</div>
					<div class="commercial" >
							<label for="com_build_all" class="lbl-checkbox"> <input type="checkbox" name="pCom_build_type_all" id="com_build_all" value="" onclick="selectAll3(this)"></input> 전체</label><br />
						<div>
							<label for="com_build01" class="lbl-checkbox"> <input type="checkbox" name="pCom_build_type" id="com_build01" value="사무실">사무실</input></label>
							<label for="com_build02" class="lbl-checkbox"> <input type="checkbox" name="pCom_build_type" id="com_build02" value="상가/매장">상가/매장</input></label>
							<label for="com_build03" class="lbl-checkbox"> <input type="checkbox" name="pCom_build_type" id="com_build03" value="카페/식당">카페/식당</input></label>
							<label for="com_build04" class="lbl-checkbox"> <input type="checkbox" name="pCom_build_type" id="com_build04" value="학원/교육">학원/교육</input></label>
							<label for="com_build05" class="lbl-checkbox"> <input type="checkbox" name="pCom_build_type" id="com_build05" value="숙박/병원">숙박/병원</input></label>
							<label for="com_build06" class="lbl-checkbox"> <input type="checkbox" name="pCom_build_type" id="com_build06" value="간판">간판</input></label>
							<label for="com_build07" class="lbl-checkbox"> <input type="checkbox" name="pCom_build_type" id="com_build07" value="기타">기타</input></label>
						</div>
					</div>
					<br />

					<div>
						<b><span id="red">*</span></b><span> <b>가능한 공간</b></span>
					</div>
					<div class="commercial" >
						<label for="com_space_all" class="lbl-checkbox"> <input type="checkbox" name="pCom_space_type_all" id="com_space_all" value="" onclick="selectAll4(this)"></input> 전체
						</label><br />
						<!--  <h5 class="sigong">시공</h5> -->
						<div id="representative-link">
							<label for="com_space01" class="lbl-checkbox"> <input type="checkbox" name="pCom_space_type" id="com_space01" value="도배/벽">도배/벽</input></label>
							<label for="com_space02" class="lbl-checkbox"> <input type="checkbox" name="pCom_space_type" id="com_space02" value="바닥">바닥</input></label>
							<label for="com_space03" class="lbl-checkbox"> <input type="checkbox" name="pCom_space_type" id="com_space03" value="주방">주방</input></label>
							<label for="com_space04" class="lbl-checkbox"> <input type="checkbox" name="pCom_space_type" id="com_space04" value="욕실">욕실</input></label>
							<label for="com_space05" class="lbl-checkbox"> <input type="checkbox" name="pCom_space_type" id="com_space05" value="현관">현관</input></label>
							<label for="com_space06" class="lbl-checkbox"> <input type="checkbox" name="pCom_space_type" id="com_space06" value="발코니/샷시">발코니/샷시</input></label>
							<label for="com_space07" class="lbl-checkbox"> <input type="checkbox" name="pCom_space_type" id="com_space07" value="조명">조명</input></label>
							<label for="com_space08" class="lbl-checkbox"> <input type="checkbox" name="pCom_space_type" id="com_space08" value="문">문</input></label>
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
						<div><input type="text" size="20" id="pRes_person_name" name="pRes_person_name" value="${ps.pRes_person_name}" placeholder="담당자명"></div></br>
						<label><b>담당자 연락처</b></label>
						<div><input type="text" size="20" id="pRes_person_tel" name="pRes_person_tel" value="${ps.pRes_person_tel}" placeholder="담당자 연락처"></div>
						<label>
							<input type="checkbox" aria-hidden="false">
							<span class="">대표자 정보와 동일 <!----></span>
						</label>			
					</div></br>
					<div>
						<label><b>상업 담당자</b></label>
						<div><input type="text" size="20" id="pCom_person_name" name="pCom_person_name" value="${ps.pCom_person_name}" placeholder="담당자명"></div></br>
						<label id="payment-link"><b>담당자 연락처</b></label>
						<div><input type="text" size="20" id="pCom_person_tel" name="pCom_person_tel" value="${ps.pCom_person_tel}" placeholder="담당자 연락처"></div>		
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
					<div><input type="text" size="20" id="pAccount_bank" name="pAccount_bank" value="${ps.pAccount_bank}" placeholder="은행명"></div>
					<div><input type="text" size="20" id="pAccount_name"name="pAccount_name" value="${ps.pAccount_name}" placeholder="예금주"></div>	
					<div><input type="text" size="20" id="pAccount_num" name="pAccount_num" value="${ps.pAccount_num}" placeholder="계좌번호"></div>						
				</div></br>
				<div>
						<div class="representative-01">
							<label class="upload_image_title"><b>통장 사본</b></label><br>
							<div tabindex="0" class="upload_image">
								<label for="pAccount_file" class="upload_lbl">
									<img src="./images/upload_plus.png" width="40px" height="40px">
								</label>
								<input type="file" id="pAccount_file" name="pAccount_file" accept="image/*">
							</div>
							<br>
						</div>
						<div class="representative-02">
							<label class="upload_image_title"><b>사업자 등록증 사본</b></label><br>
							<div tabindex="0" class="upload_image">
								<label for="pBusiness_lic_file" class="upload_lbl">
									<img src="./images/upload_plus.png" width="40px" height="40px">
								</label> 
								<input type="file" id="pBusiness_lic_file" name="pBusiness_lic_file" accept="image/*">
							</div>
							<br>
						</div>
						<p id="red">* 입금계좌, 통장 사본, 사업자 등록증 사본은 1회만 입력 가능합니다. 
						수정희망 시 집닥담당자 (1600-3069) 에게 문의 해주세요.</p>
				</div>
			</fieldset>
			
			<div class="data_edit_button_tag">
				<input type="submit" id="data_edit_bu mtton" value="정보수정" /> <!-- onclick="location.href='date_manage.do'" -->
			</div>
			</form>
     </div>
    </div>
  </article>


<jsp:include page="../include/footer.jsp" />


		