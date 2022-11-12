<%@ page contentType="text/html; charset=UTF-8"%>
<link rel="stylesheet" type="text/css" href="/css/admin/admin_memList.css"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page = "./include/header.jsp"/>
<script src="../js/jquery.js" ></script>
<%-- 상단 공통부분 끝 --%>

<%-- 본문 내용 --%>
<div class = "memlist_wrap">
	<div class = "mem_info">
		<div class = "table_type">
			<p id = "table_info">원하는 관리 테이블을 선택하세요</p>
		</div>
	</div>
	<div class = "table_btn">
				<input type = "button" id = "mem_btn" value = "회원정보" onClick = "view(1)"/>
				<input type = "button" id = "part_btn" value = "파트너스정보" onClick = "view(2)"/>
	</div>

	<div id = "mem_cont">
		<!-- 검색 필터 -->
		<div id="msearch_filter">
			<h3 class="text-center">검색필터</h3>
			<div class="search_cont">
				<div class="input-group">
					<div class="input-group-btn search-panel">
						<select class="search_toggle" data-toggle="dropdown">
							<option>아이디</option>
							<option>이름</option>
							<option>연락처</option>
							<option>이메일</option>
							<option>주소1</option>
							<option>주소2</option>
						</select>
					</div>

					<input type="hidden" name="search_param" value="필터" id="search_param">
					<input type="text" class="search_box" name="x" placeholder="검색어를 입력하세요">
					<span class="input-group-btn">
							<button class="search_btn" value = "검색" type="button">검색</button>
						</span>
				</div>
			</div>
		</div>

		<div class = "mem_table">
			<script>
				function view(arg){
					var t1 = document.getElementById("tb_mem");
					var t2 = document.getElementById("tb_part");
					var t3 = document.getElementById("msearch_filter");
					var t4 = document.getElementById("psearch_filter");
					if(arg == 1){
						t1.style.display = "block";
						t2.style.display= "none";
						t3.style.display = "block";
						t4.style.display = "none";
					}
					else{
						t2.style.display = "block";
						t4.style.display = "block";
						t1.style.display = "none";
						t3.style.display = "none";
					}
				}
			</script>
			<table id = "tb_mem" border = "1" >
				<tr>
					<th width = "100" id = "tb_nick">아이디</th>
					<th width = "80" id = "tb_name">이름</th>
					<th width = "150" id = "tb_phone">연락처</th>
					<th width = "100" id = "tb_email_id">이메일 ID</th>
					<th width = "130" id = "tb_email_domain">이메일 Domain</th>
					<th width = "200" id = "tb_address1">가입유형</th>
					<th width="150" id = "tb_address2">가입날짜</th>
					<th id = "tb_dell">삭제여부</th>
				</tr>
				<c:if test = "${fn:length(mlist)==0}">
					<tr><td colspan="8">회원 리스트가 없습니다</td></tr>
				</c:if>
				<c:if test="${fn:length(mlist)!=0}">
					<c:forEach var="i" begin="0" end="${fn:length(mlist)-1}" step="1">
						<tr>
							<td id="nick">${mlist[i].mem_id}</td>
							<td id="name">${mlist[i].mem_name}</td>
							<td id="phone">${mlist[i].mem_tel}</td>
							<td id ="email_id">${mlist[i].mem_email}</td>
							<td id ="email_domain">${mlist[i].mem_domain}</td>
							<td id = "address1">${mlist[i].mem_joinType}</td>
							<td id = "address2">${mlist[i].mem_joinDate.substring(0,10)}</td>
							<td id = "tb_delete"><button id = "m_del" onclick="review_del()"><a id = "del_a" href="mem_del?mem_id=${mlist[i].mem_id}">삭제</a></button></td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
		</div>
	</div>
		<div class = "part_table">
			<div id="psearch_filter">
				<h3 class="text-center">검색필터</h3>
				<div class="search_cont">
					<div class="input-group">
						<div class="input-group-btn search-panel">
							<select class="search_toggle" data-toggle="dropdown">
								<option>사업자번호</option>
								<option>사업자명</option>
								<option>아이디</option>
								<option>대표자</option>
								<option>연락처</option>
								<option>이메일</option>
								<option>주소</option>
								<option>요금제</option>
							</select>
						</div>

						<input type="hidden" name="search_param" value="필터" id="search_param">
						<input type="text" class="search_box" name="x" placeholder="검색어를 입력하세요">
						<span class="input-group-btn">
							<button class="search_btn" value = "검색" type="button">검색</button>
						</span>
					</div>
				</div>
			</div>
			<table id = "tb_part" border = "1">
				<tr>
					<th width = "150" id = "comp_num">사업자 번호</th>
					<th width = "120" id = "comp_name">사업자명</th>
					<th width = "100" id = "tb_nick2">아이디</th>
					<th width = "100" id = "ceo">대표자명</th>
					<th width = "180" id = "ceo_tel">대표자연락처</th>
					<th width = "200" id = "ceo_email">대표자 이메일</th>
					<th width = "300" id = "comp_address">사업자 주소</th>
					<th width = "100" id = "plan">요금제</th>
				</tr>
				<c:if test="${fn:length(plist)==0}">
					<tr><td colspan="9">회원 리스트가 없습니다</td></tr>
				</c:if>
				<c:if test="${fn:length(plist)!=0}">
					<c:forEach var="i" begin="0" end = "${fn:length(plist)-1}" step="1">
						<tr>
							<td  id="co_num">${plist[i].businessNum}</td>
							<td  id="co_name">${plist[i].businessName }</td>
							<td  id="nick2">${plist[i].p_Id}</td>
							<td  id = "ceo">${plist[i]. p_Name}</td>
							<td  id = "ceo_tel">${plist[i].p_Tel}</td>
							<td  id ="ceo_email">${plist[i].p_MailId}</td>
							<td  id = "co_address">${plist[i].p_MailDomain}</td>
							<td  id = "co_plan">${plist[i].p_State}</td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
	</div>
</div>
<br><br>

<script>
	function review_del(){
		alert('해당 회원을 삭제하시겠습니까?');
	}
</script>



<%-- 하단 공통부분--%>
<jsp:include page = "./include/footer.jsp"/>