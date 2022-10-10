<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
a#go_scheduleList {
    font-size: 20px;
    margin-left: 40px;
    color: saddlebrown;
}
#interiorList_title {
	font-size: 32px;
	font-weight: 600;
}
#interiorList_msg {
	color: darkslateblue;
    font-size: 21px;
    font-family: fantasy;
    margin-bottom: 10px;
}
#interiorList_explain {
	width: 94%;
    border: 4px solid #C1C1C1;
    padding: 10px 20px;
    margin: 0 auto;
}
#interiorList_top_cont{
	border-bottom: 4px solid #7F7F7F;
    padding-bottom: 35px;
    margin-bottom: 40px;
}
*{
line-height:2em;
}
table#interiorList_table{
 	margin: 20px auto;
    width: 97%;
    margin-top:0px;
}
thead#interiorList_table_thead {
    background: cornflowerblue;
}
div#interior_list_searchBar label {
    margin: 0px 12px;
}
#interior_list_searchBar {
	display: flex;
    float: right;
    margin-right: 2%;
    margin-bottom: 10px;
}
</style>
<div id='interiorList_top_cont'>
	<div id='interiorList_title'>내 공사내역<a id="go_scheduleList" href="schedule_list.do">일정관리</a>
	</div>
	<div id='interiorList_msg'>
		현재 시공중인 공사, 완료된 공사등 모든 공사내역을 확인할 수 있는 페이지
	</div>
	<div id='interiorList_explain'>
		공사 진행상황에 따라 고객에게 중도금, 잔금을 청구할 수 있습니다
	</div>
</div>
<div id='interior_list_searchBar'>
	<label for="interior_status">시공상태</label> <select id="interior_status">
		<option value="예정">예정</option>
		<option value="진행중">진행중</option>
		<option value="완료">완료</option>
	</select> <label for="balance_status">정산상태</label> <select id="balance_status">
		<option value="계약금완납">계약금완납</option>
		<option value="중도금신청">중도금신청</option>
		<option value="중도금완납">중도금완납</option>
		<option value="잔금신청">잔금신청</option>
		<option value="잔금완납">잔금완납</option>
	</select>
</div>

<table id="interiorList_table">
	<thead id="interiorList_table_thead">
	<tr>
		<th>계약번호</th>
		<th>시공상태(예정, 진행중, 완료)</th>
		<th>공사시작(예정)일</th>
		<th>공사마감(예정)일</th>
		<th>정산하기<br>(계약금,중도금,완납)
		</th>
		<th>견적서</th>
		<th>계약서</th>
		<th>시공 상세정보</th>
	</tr>
	
	</thead>
	<tbody>
	<tr>
		<td>10</td>
		<td>예정</td>
		<td>2022-10-10</td>
		<td>2022-10-20</td>
		<td>계약금지불완료</td>
		<td>보기</td>
		<td>보기</td>
		<td>보기</td>
	</tr>
	<tr>
		<td>11</td>
		<td>진행중</td>
		<td>2022-10-10</td>
		<td>2022-10-20</td>
		<td>중도금신청</td>
		<td>보기</td>
		<td>보기</td>
		<td>보기</td>

	</tr>
	<tr>
		<td>12</td>
		<td>완료</td>
		<td>2022-10-10</td>
		<td>2022-10-20</td>
		<td>중도금지불완료</td>
		<td>보기</td>
		<td>보기</td>
		<td>보기</td>
	</tr>
</tbody>
<tfoot>
</tfoot>

</table>


<jsp:include page="../include/footer.jsp" />

