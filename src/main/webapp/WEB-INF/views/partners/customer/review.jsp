<%@ page contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp" />



	<div id="qna_title">
		<div class="title">고객 후기</div>
		<div class="message">시공 완료 후 고객께서 후기를 남긴 내역입니다</div>
	</div>
	<div id="search_bar">
		<div>
			<dt>검색조건</dt>
			<dd>
				<span>
					<div>
						<span>등록일</span><span class="period_cont"> 지난7일</span>
						<button type="button">▼</button>
					</div>
					<div>
						별점<span class="period_cont"> 전체</span>
						<button type="button">▼</button>
					</div>
					<div>
						상세조건
						<button type="button" id='detailed_search'>▼</button>
					</div>
					<div>
						초기화
						<button type="button">▼</button>
					</div>
				</span>
			</dd>
		</div>

	</div>

	<form id="search_conditon">
		<div id=search_conditon_wrap>
			<div id="search_conditon_sub_1">
				<div>
					<input type="button" value="오늘"> <input type="button"
						value="지난 7일"> <input type="button" value="지난 30일">
				</div>
				<div>
					<input type="date"> ~ <input type="date">
				</div>
			</div>
			<hr>
			<div>
				<label>별점</label> <select id="rate">
					<option value="whole" selected>전체</option>
					<option value="5">5점</option>
					<option value="4">4점</option>
					<option value="3">3점</option>
					<option value="2">2점</option>
					<option value="1">1점</option>
				</select>
			</div>
			<hr>
			<div>
				<label>시공진행상태</label> <select>
					<option>진행중</option>
					<option selected>완료</option>
					<option>기타</option>
				</select>
			</div>
			<hr>
			<div>
				<select id="search_condition">
					<option value="customer_name" selected>고객명</option>
					<option value="construction_style">시공스타일</option>
				</select> <input type="text" placeholder="입력">
			</div>

			<hr>
			<div id="search_conditon_hidemenu">
				<div>
				<input type="button" value="검색">
				<input type="reset" value="초기화"></div>
				<input type="button" value="검색 접기" id=hide_button
					onclick="display()">
			</div>
		</div>
	</form>


	<div>
		<table border="1">
			<tr>
				<th>↓↑</th>
				<th>등록일</th>
				<th>시공종류</th>
				<th>별점</th>
				<th>후기 코멘트</th>
				<th>작성자</th>
			</tr>
			<tr>
				<td colspan="6">검색 결과가 없습니다</td>
			</tr>
		</table>
	</div>

<jsp:include page="../include/footer.jsp" />


