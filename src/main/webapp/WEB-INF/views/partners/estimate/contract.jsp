<%@ page contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<style>
	#contract_table1{
	border:1px solid gray;
	border-collapse: collapse;
	background-color:white;
	margin:7px 0; font-size:16px;
		width:100%;
	}
	#contract_table2 {
		width: 100%;
		border-collapse: collapse;
		background-color:white;
		margin:7px 0;
	}

</style>

	<div class="contract_page">
		<div class="contract_title"><h1>인테리어 표준계약서</h1></div></br>
			<div class="contract_summary">
				<span><b>(공사개요)</b></span>
				<table id="contract_table1" border="1">
					<tr style="height:40px;">
						<th style="width:20%;">공사명</th> <th colspan="2"></th> 
					</tr>
					<tr style="height:40px;">
						<th >공사장소(면적)</th> 
						<th colspan="2"><p style="text-align:right;">(면적 : <input type="text"> m<sup>2</sup>) </p></th>
					</tr>
					<tr style="height:40px;">
						<th rowspan="2">공사기간</th> <th style="width:20%;">착 공</th> 
						<th><input type="text" style="width:70px;">년 <input type="text" style="width:70px;">월 <input type="text" style="width:70px;">일 </th>
					</tr>
					<tr style="height:40px;">
						<th>준 공</th>
						<th><input type="text" style="width:70px;">년 <input type="text" style="width:70px;">월 <input type="text" style="width:70px;">일 </th>
					</tr>
				</table></br>
			</div>
			
			<div class="contract_money">
				<span><b>(공사대금)</b></span>
				<div>
					<p>①총 공사금액 (￦[<input type="text">] 원정(부가가치세 별도임)<br></p>
				</div>
				<div>
					<table id="contract_table2" border="1">
						<tr style="height:40px;">
							<th rowspan="4" style="width:12%;">대금 지급 시기</th> <th style="width:8%;">횟 수</th> <th style="width:25%;">금 액</th> <th style="width:25%;">년 월 일</th> <th style="width:8%;">내 역</th> 
						</tr>
						<tr style="height:40px;">
							<th>1차</th> <th style="text-align:left;"> ￦</th> <th><input type="text" style="width:70px;">/<input type="text" style="width:70px;">/<input type="text" style="width:70px;"></th> <th>계약금</th>
						</tr>
						<tr style="height:40px;">
							<th>2차</th> <th style="text-align:left;"> ￦</th> <th><input type="text" style="width:70px;">/<input type="text" style="width:70px;">/<input type="text" style="width:70px;"></th> <th>중도금</th>
						</tr>
						<tr style="height:40px;">
							<th>3차</th> <th style="text-align:left;"> ￦</th> <th><input type="text" style="width:70px;">/<input type="text" style="width:70px;">/<input type="text"style="width:70px;"></th> <th>잔금</th>
						</tr>
					</table>
				</div>
				<div>
					<p>②"갑"은 전항의 공사대금지급과 관련하여 정당한 사유 없이 지급을 지연하여서는 안되며, 지연 시에는 미지급액에 대하여 지급일 다음 날로부터 완제일까지 연 6%의 지연이자를 지급하여야 한다.</p>
				</div></br>
				<div>
					<p> &nbsp;"갑"과 "을"은 상호 신의와 성실을 원칙으로 이 계약서에 의하여 공사계약을 체결하고 계약서 2부를 작성하여 각각 1부씩 보관한다.</p>
				</div></br>
				<div>
					<p style="text-align:center;"><input type="text" style="width:70px;">년 <input type="text" style="width:70px;">월 <input type="text" style="width:70px;">일</p>
				</div></br>
				<div>
					<table style="border:0px; width: 70%; text-align:left;">
						<tr>
							<th colspan="2" style="width:50%";>발주자(시행자) "갑"</th> <th colspan="2">수급자(시공자) "을"</th>
						</tr>
						<tr>
							<th colspan="2">주 소 :</th> <th>주 소:</th>
						</tr>
						<tr>
							<th>상 호 / 성 명 :</th> <th style="text-align:right;">(서명 또는 인)</th> <th>상 호 / 성 명 :</th> <th style="text-align:right;">(서명 또는 인)</th>
						</tr>
						<tr>
							<th colspan="2">사업자등록번호/주민등록번호 : </th> <th>사업자등록번호/주민등록번호 : </th>
						</tr>
						<tr>
							<th colspan="2">전 화 / FAX :</th> 	<th>전 화 / FAX :</th>
						</tr>
					</table>
				</div></br>
				
			</div>
		<input type="submit" value="계약하기">
		<input type="button" value="닫기" onclick="window.close()">

	</div>
