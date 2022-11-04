<%@ page contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../include/header.jsp" />

<style>
#scheduleList_title a {
    font-size: 16px;
    margin-left: 40px;
    color: saddlebrown;
}
#scheduleList_title{
	font-size: 32px;
	font-weight: 600;
}


</style>

<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
<%--오늘 날짜 불러오기 코드 -필요하면 사용 --%>


<script>
    let allData = JSON.parse('${json}'); //달력에 담을 json 데이터
    let allDataArray=[];
    let oneDayData={};
    let scheduleData;

    for(let i=0; i< allData.length;i++) {
        oneDayData ={
            'title': allData[i].cont_no+"번 "+allData[i].cont_title,
            'start': allData[i].cont_date1,
            'end': allData[i].cont_date3,
        }
        allDataArray.push(oneDayData);
    }



	document.addEventListener('DOMContentLoaded', function() {
		let calendarEl = document.getElementById('calendar');
		let calendar = new FullCalendar.Calendar(calendarEl, {
			headerToolbar : {
				left : 'prevYear,prev,next,nextYear today',
				center : 'title',
				right : 'dayGridMonth,dayGridWeek,dayGridDay'
			},
			initialDate : '${today}',
			navLinks : true, // can click day/week names to navigate views
			//editable : true,
			dayMaxEvents : true, // allow "more" link when too many events
			events :allDataArray
		});
		calendar.render();
	});
</script>













<script>
	$(function() {
		$('.fc-event-title').click(function() {
			alert('hello~');
		});
	});
</script>

<div id="scheduleList_title">
일정관리<a href="interior_list">내공사내역</a>		</div>


<div id='calendar' style="width: 90%; margin: 20px;"></div>





<jsp:include page="../include/footer.jsp" />

