<%@ page contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
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
<script>
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');

		var calendar = new FullCalendar.Calendar(calendarEl, {
			headerToolbar : {
				left : 'prevYear,prev,next,nextYear today',
				center : 'title',
				right : 'dayGridMonth,dayGridWeek,dayGridDay'
			},
			initialDate : '2022-09-12',
			navLinks : true, // can click day/week names to navigate views
			editable : true,
			dayMaxEvents : true, // allow "more" link when too many events
			// events : /*json 데이터 */


            //     [ {
			// 	title : '테스트중',
			// 	url : 'http://localhost:8084/dozip/home',
			// 	start : '2022-10-15'
			// }  ]
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

