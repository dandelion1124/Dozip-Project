<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="../common/header.jsp" />
<%-- 상단 공통부분 끝 --%>
<link rel = "stylesheet" type = "text/css" href = "../css/myscrap.css"/>

<div class="mypage_wrap">
	<%--상단 메뉴부분 --%>
	<div class="mypage_menu">
		<div class="mypage_menu_main">
			<button id="myact" onclick="on_myact_sub()">나의활동</button>
			<button id="mycontract" onclick="on_mycontract_sub()">계약관리</button>
			<button id="myqna" onclick="on_myqna_sub()">질문관리</button>
		</div>
		<div class="mypage_menu_sub_box">
			<div class="mypage_menu_sub"  id="myact_sub">
				<button onclick="on_my_info()">내정보</button>
				<button onclick="on_my_info_modify()">정보수정</button>
				<button onclick="on_my_pwd_modify()">비밀번호변경</button>
				<button onclick="on_my_scrap_view()">스크랩</button>
				<button onclick="on_my_review_list()">후기관리</button>
			</div>
			<div class="mypage_menu_sub" id="mycontract_sub">
				<button onclick="on_my_apply_list()">견적신청목록</button>
				<!-- <button onclick="on_my_contract()">계약관리</button> -->
			</div>
			<div class="mypage_menu_sub" id="myqna_sub">
				<button onclick="on_my_counsel_list()">고객센터문의</button>
				<button onclick="on_my_partner_qna()">업체문의</button>
			</div>
		</div>
	</div>
	<%--상단 메뉴부분 끝--%>

	<div class="clear"></div>
	
	<%--본문 내용부분--%>
	<div class="mypage_body_wrap">
	
		<%-- 내정보 --%>
		<div class="mypage_body" id="my_info">
			<div class="my_info_wrap">
				<div id="mp"><span>${id} 님 활동</span> <button id="logout_btn" onclick="location='member_logout.do';">로그아웃</button></div>
				<hr />
				<div id="span_box"><span>신청내역<span class="num_text">2 건</span></span>
				<span>|</span>
				<span>스크랩<span class="num_text">23 개</span></span></div>
			</div>
			<div class="notice_wrap">
				<p>알림내역</p>
				<p>${m.mem_name }</p>					
			</div>
		</div>
		
		<%-- 정보수정 --%>
		<div class="mypage_body" id="my_info_modify">
		<div id="mim_wrap">
			<p id="mim_title">내 정보 수정</p>
			<form class="mim_table_box" method="post"  action="member_edit_ok.do" >
				<table class="mim_table">
					<tr>
						<th>아이디</th><td><input type="text" name="mem_id" id="mem_id" readonly value="${id}"></td>
					</tr>
					<tr>
						<th>이름</th><td><input type="text" name="mem_name" id="mem_name" value="${m.mem_name}"></td>
					</tr>
					<tr>
						<th>연락처</th><td><input type="text" name="mem_tel" id="mem_tel" value="${m.mem_tel}"></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td id="emailbox">
							<input type="text"  name="mem_email"  id="mem_email" value="${m.mem_email}" />
							<span>@</span>
							<input type="text"  name="mem_domain"  id="mem_domain" value="${m.mem_domain}"/>
							<select name="domain_list" id="domain_list" onchange="changeSelect(this.value);">
								<option selected>직접입력</option>
								<option value="naver.com">naver.com</option>
								<option value="daum.net">daum.net</option>
								<option value="gmail.com">gamil.com</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>주소</th>
						<td>
						<input type="text" name="mem_zip" id="mem_zip" readonly placeholder="우편번호" value="${m.mem_zip}"/>
						<input type="text" name="mem_addr1" id="mem_addr1" readonly placeholder="주소" value="${m.mem_addr1}"/>
						<a id="search_btn" onclick="openAddr()">주소검색</a>
						<br/>
						<input type="text" name="mem_addr2" id="mem_addr2" placeholder="상세주소를 입력해주세요." value="${m.mem_addr2}"/>
						</td>
					</tr>
				</table>
					<button type="submit" id="mim_btn">수정하기</button>
			</form>
		</div>
		</div>
		
		<%-- 비밀번호변경 --%>
		<div class="mypage_body" id="my_pwd_modify">
			<div class="mpm_wrap">
				<p id="mpm_title">비밀번호 변경</p>
				<form method="post"  onsubmit="return pwd_check();" action="mypage_pwd.do" class="my_pwd_modify_box"  >
					<p>기존 비밀번호</p>
					<input type="password" name="current_pwd" id="current_pwd" placeholder="기존 비밀번호를 입력해주세요."/>
					<p>새 비밀번호</p>
					<p id="infotext_s">영문, 숫자를 포함한 8자 이상의 비밀번호를 입력해주세요. (특수문자는 허용되지 않습니다.)</p>
					<input type="password" name="new_pwd" id="new_pwd" placeholder="새로운 비밀번호를 입력해주세요."/>
					<p>비밀번호 확인</p>
					<input type="password" name="new_pwd_check" id="new_pwd_check" placeholder="다시 한 번 입력해주세요."/>
					<div id="mpm_btn_wrap"><button type="submit" id="mpm_btn" >비밀번호 변경</button></div>
				</form>
			</div>
		</div>
		
		<%-- 내스크랩 확인 --%>
		<div class="mypage_body" id="my_scrap_view">
			<div class="scrap_wrap">
				<div class="scrap_top">
					<p class="scrap_title">스크랩 전체</p>
					<p class="scrap_sub">종합 인테리어 9개</p>
				</div>

				<%
					for (int i = 1; i < 4; i++) {
				%>
				<div class="scrap_body">
					<div class="card 1">
						<div class="card_image">
							<img onclick="location = './port_detail.jsp';"
								src="/DoZip/images/portfolio/port010.png" />
						</div>
						<div class="card_title">
							<li>#모던 #30평 #2000만원대</li>
						</div>
					</div>

					<div class="card 2">
						<div class="card_image">
							<img onclick="location = './port_detail.jsp';"
								src="/DoZip/images/portfolio/port011.png" />
						</div>
						<div class="card_title">
							<li>#필라테스 #40평 #3000만원대</li>
						</div>
					</div>

					<div class="card 3">
						<div class="card_image">
							<img onclick="location = './port_detail.jsp';"
								src="/DoZip/images/portfolio/port015.png" />
						</div>
						<div class="card_title ">
							<li>#모던 #30평 #4000만원대</li>
						</div>
					</div>
				</div>
				<%
					}
				%>
				<br>
				<br>
				<button type="button" id="more">더보기</button>
			</div>
		</div>


		<%-- 내 후기 확인 --%>
		<div class="mypage_body" id="my_review_list">
			<div class="mrl_wrap">
				<p id="mrl_title">내가 작성한 후기</p>
				<%! int i=0; %>
				<%-- 나중에 if문으로 데이터가 없으면 내역이 없다는 문구를 노출시킬 예정 --%>
				<% for(i=1; i<3; i++) { %>
				<div class="big_review" id="b_review">
					<img id="big_img" src="/DoZip/images/ex01.png" />
					<div class="big_review_cont">
						<p id="review_title"><%=i %>번 글제목</p>
						<p id="review_cont">집닥을 통해 여러군데 견적을 받았어요. 그 중에 여기가 견적서도 빨리 보내주고 제가 원하는 가격에 최대한 맞춰서 인테리어를 도와주셨어요! 요즘 인테리어 사기가 많아서 고민하고 걱정했는데 확실하게 일 처리 해주시고 전기부터 소방까지 꼼꼼하게 챙겨주셨어요. 벽지나 타일을 고르는데 고민이 많은데 추천도 잘 해주시고 지금도 대 만족 하고 있습니다</p>
						<p id="review_tag"><button>주거유형</button><button>스타일</button><button>평수</button></p>
						<p id="review_info">글쓴이 고객님 | 2022.04.23</p>
						<p id="revie_go">해당 리뷰보러 가기 >> </p>
					</div>
				</div>
				<%} %>
				<div id="mrl_info">
					<p>작성된 후기가 없다면? <a href="../review/review_write.jsp" id="mrl_review_write">후기작성하기</a></p>
				</div>
			</div>
		</div>
		
		<%-- 견적신청내역 --%>
		<div class="mypage_body" id="my_apply_list">
			<div class="my_apply_wrap">
				<div class="my_apply_info">
					<p>신청한 견적 내역을 확인합니다.</p>
					<p>번호를 누르면 상세내용을 확인할 수 있습니다. </p>
				</div>
				<div class="my_apply_title">
					<p>견적신청내역</p>
				</div>
				<div class="my_apply_cont">
					<table>
						<tr>
							<th>번호</th> <th>신청날짜</th> <th>공간유형</th> <th>공간선택</th> <th>평수</th> <th>예산</th> <th>업체명</th> <th>진행상황</th>
						</tr>
						<% for(i=1; i<3; i++) { %>
						<tr>
							<td><a href="#" onclick="on_my_contract()"><%=i %>번</a></td> <td>신청날짜</td> <td>공간유형</td> <td>공간선택</td> <td>평수</td> <td>예산</td> <td>업체명</td> <td>진행상황</td>
						</tr>
						<%} %>
					</table>
				</div>
				
				<div class="my_apply_title">
					<p>간편신청내역</p>
				</div>
				<div class="my_apply_cont">
					<table>
						<tr>
							<th>번호</th> <th>신청날짜</th> <th>업체명</th> <th>진행상황</th>
						</tr>
						<% for(i=1; i<3; i++) { %>
						<tr>
							<td><a href="#" onclick="on_my_contract()"><%=i %>번</a></td> <td>신청날짜</td><td>업체명</td> <td>진행상황</td>
						</tr>
						<%} %>
					</table>
				</div>
			</div>
		</div>
		
		<%-- 계약관리 --%>
		<div class="mypage_body" id="my_contract">
			<div class="my_contract_wrap">
				<p id="my_cont_title">계약상세내역</p>
				<div class="follow_title_wrap">
					<p id="follow_title">현재진행상태</p>
					<div class="progress_bar"><div class="progress"></div></div><p id="progress_percent">45%</p>
				</div>
				<div class="my_contract_info">
					<table>
						<tr>
							<th>대기중</th><th rowspan="2" class="next_arrow">>></th>
							<th>계약완료</th><th rowspan="2" class="next_arrow">>></th>
							<th>공사중</th><th rowspan="2" class="next_arrow">>></th><th>공사완료</th>
						</tr>
						<tr>
							<td>0</td><td>0</td><td style="color: blue;">1</td><td>0</td>
						</tr>
					</table>
				</div>
				<div class="ppp">
				<div class="my_contract_cont">
					<p>요약내용</p>
					<div class="contract_summary">
						<table id="contract_summary_table">
							<tr>
								<th class="cst_th">업체명</th> <th class="cst_th">:&nbsp;</th> <td class="cst_td">별별인테리어</td>
							</tr>
							<tr>
								<th class="cst_th">공사일정</th> <th class="cst_th">:&nbsp;</th> <td class="cst_td">2022.11.02 - 2022.12.02</td>
							</tr>
							<tr>
								<th class="cst_th">공사금액</th> <th class="cst_th">:&nbsp;</th> <td class="cst_td">10,000,000원</td>
							</tr>
							<tr>
								<th class="cst_th">공간유형</th> <th class="cst_th">:&nbsp;</th> <td class="cst_td">아파트</td>
							</tr>
							<tr>
								<th class="cst_th">평수</th> <th class="cst_th">:&nbsp;</th> <td class="cst_td">34평</td>
							</tr>
						</table>
						<div class="contract_view_wrap">
							<button id="apply_view">신청서 확인하기</button>
							<button id="contract_view">계약서 확인하기</button>
						</div>
					</div>
				</div>
				<div class="contract_pay">
					<p>결제내역</p>
					<div class="contarct_pay_wrap">
						<table class="contarct_pay_table">
							<tr style="height: 50px;">
								<th colspan="3" class="cpt_th" id="ttt">총 공사대금 <span id="total_pay">10,000,000</span> 원 </th> <th class="cpt_th">요청일</th> <th class="cpt_th">결제일</th>
							</tr>
							<tr>
								<th class="cpt_th">계약금</th> <th class="cpt_th">:</th> <td class="cpt_td">1,000,000</td> <td class="cpt_td">2022.11.01</td> <td class="cpt_td">2022.11.02</td>
							</tr>
							<tr>
								<th class="cpt_th">중도금</th> <th class="cpt_th">:</th> <td class="cpt_td">4,500,000</td> <td class="cpt_td">2022.11.15</td> <td class="cpt_td">2022.11.16</td>
							</tr>
							<tr>
								<th class="cpt_th">잔금</th> <th class="cpt_th">:</th> <td class="cpt_td">4,500,000</td> <td class="cpt_td">-</td> <td class="cpt_td">-</td>
							</tr>
						</table>
						<div class="pay_wrap">
							<select name="pay_select" id="pay_select">
								<option selected>결제선택</option>
								<option value="1">계약금</option>
								<option value="2">중도금</option>
								<option value="3">잔금</option>
							</select>
							<span>선택한 결제 금액</span>
							<button id="pay_btn">결제하기</button>
						</div>
					</div>
				</div>
				</div>
			</div>
		</div>
		
		<%-- 고객센터문의 --%>
		<div class="mypage_body" id="my_counsel_list">
			<div class="my_qna">
			<div class="my_qna_title"><p>나의 문의</p></div>
			<div class="my_qna_cont">
				<table>
					<tr>
						<th id="head_num">번호</th> <th id="head_title">제목</th> <th id="qna_state">답변상태</th><th id="head_date">작성일</th>
					</tr>
					<c:if test="${fn:length(qlist) == 0}">
						<tr><td colspan="4"> 등록된 글이 없습니다.</td> </tr>
					</c:if>	
					<c:if test="${fn:length(qlist) != 0}">
					<c:forEach var="i" begin="0" end="${fn:length(qlist)-1}" step="1">		
						<tr>
							<td id="num">
								<c:set var="number" value="${(listcount-(5*(page-1)))-i}" />
								<c:out value="${number}"/>
							</td>
							<td id="title">
								<c:if test="${qlist[i].qna_level != 0}">=></c:if>
								<a href="#">${qlist[i].qna_title}</a>
							</td>
							<td id="state">${qlist[i].reply_state}</td> <td id="date">${qlist[i].qna_date}</td>
						</tr>
					</c:forEach>
					</c:if>
				</table>
				
				<!-- 쪽번호 출력 -->
				<div class="page_area">
					<c:if test="${page<=1}">[이전]</c:if>
					<c:if test="${page>1}"><a href="mypage_go.do?page=${page-1}">[이전]</a></c:if>
					
					<c:forEach var="p" begin="${startpage}" end="${endpage}" step="1">
						<c:if test="${p==page}">${p}</c:if>
						<c:if test="${p!=page}"><a href="mypage_go.do?page=${p}">[${p}]</a></c:if>
					</c:forEach>
					
					<c:if test="${page>=maxpage}">[다음]</c:if>
					<c:if test="${page<maxpage}"><a href="mypage_go.do?page=${page+1}">[다음]</a></c:if>
				</div>
			</div>
			</div>
			<div class="mqw_box"><button id="my_qna_write_btn">
				<a href="counsel_write.do" >문의글 작성하기</a>
			</button></div>
			<p id="my_qna_text">더 많은 질문을 확인하고 싶다면? <a href="../counsel/counsel_main.jsp">자주하는 질문 보러가기</a></p>
		</div>
		
		<%-- 업체문의 --%>
		<div class="mypage_body" id="my_partner_qna">
			<div class="my_P_qna">
			<div class="my_P_qna_title"><p>업체 문의</p></div>
			<div class="my_P_qna_cont">
				<table>
					<tr>
						<th id="head_num">번호</th> <th>업체명</th> <th id="head_title">제목</th> <th id="qna_state">답변상태</th><th id="head_date">작성일</th>
					</tr>
					<c:if test="${fn:length(qlist2) == 0}">
						<tr><td colspan="5"> 등록된 글이 없습니다.</td> </tr>
					</c:if>	
					<c:if test="${fn:length(qlist2) != 0}">					
					<c:forEach var="i" begin="0" end="${fn:length(qlist2)-1}" step="1">
						<tr>
							<td id="num">
								<c:set var="number" value="${(listcountP-(5*(pageP-1)))-i}" />
								<c:out value="${number}"/>
							</td>
							<td id="partner_name">
								<c:if test="${qlist2[i].qna_level != 0}"><span></span></c:if>
								<c:if test="${qlist2[i].qna_level == 0}"><a href="#">${qlist2[i].businessName}</a></c:if>
							</td> 
							<td id="title">
								<c:if test="${qlist2[i].qna_level != 0}">
								<span style="color:blue; font-weight:bold;">=> Re: </span><a href="#">${qlist2[i].qna_cont}</a> <%-- 발표용으로 잠시 내용을 노출함 --%>
								</c:if>
								<c:if test="${qlist2[i].qna_level == 0}">${qlist2[i].qna_title}</c:if>
							</td>
							<td id="state">
								<c:if test="${qlist2[i].qna_level != 0}"><span></span></c:if>
								<c:if test="${qlist2[i].qna_level == 0}">${qlist2[i].reply_state}</c:if>
							</td> 
							<td id="date">${qlist2[i].qna_date}</td>
						</tr>
					</c:forEach>
					</c:if>
				</table>
				
				<!-- 쪽번호 출력 -->
				<div class="page_area">
					<c:if test="${pageP<=1}">[이전]</c:if>
					<c:if test="${pageP>1}"><a href="mypage_go.do?pageP=${pageP-1}">[이전]</a></c:if>
					
					<c:forEach var="p" begin="${startpageP}" end="${endpageP}" step="1">
						<c:if test="${p==pageP}">${p}</c:if>
						<c:if test="${p!=pageP}"><a href="mypage_go.do?pageP=${p}">[${p}]</a></c:if>
					</c:forEach>
					
					<c:if test="${pageP>=maxpageP}">[다음]</c:if>
					<c:if test="${pageP<maxpageP}"><a href="mypage_go.do?pageP=${pageP+1}">[다음]</a></c:if>
				</div>
			</div>
			</div>
			<div class="mqw_box"><button id="my_P_qna_write_btn">
				<a href="counsel_partner_write.do" >업체 문의글 작성하기</a>
			</button></div>
		</div>
		
	</div>

</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function openAddr(){
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
            	document.getElementById("mem_zip").value = data.zonecode;
            	document.getElementById("mem_addr1").value = data.address; // 주소 넣기
                document.getElementById("mem_addr2").focus(); //상세입력 포커싱
            }
        }).open();
    }
</script>

<%-- 하단 공통부분 --%>
<jsp:include page="../common/footer.jsp" />