<%@ page contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp" />
<style>
#scheduleList_title a {
    font-size: 20px;
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
			events : [ {
				title : 'All Day Event',
				start : '2022-09-01'
			}, {
				title : 'Long Event',
				start : '2022-09-07',
				end : '2022-09-10'
			}, {
				title : '테스트',
				start : '2022-09-01',
				end : '2022-09-03'
			}, {
				groupId : 999,
				title : 'Repeating Event',
				start : '2022-09-09T16:00:00'
			}, {
				groupId : 999,
				title : 'Repeating Event',
				start : '2022-09-16T16:00:00'
			}, {
				title : 'Conference',
				start : '2022-09-11',
				end : '2022-09-13'
			}, {
				title : 'Meeting',
				start : '2022-09-12T10:30:00',
				end : '2022-09-12T12:30:00'
			}, {
				title : 'Lunch',
				start : '2022-09-12T12:00:00'
			}, {
				title : 'Meeting',
				start : '2022-09-12T14:30:00'
			}, {
				title : 'Happy Hour',
				start : '2022-09-12T17:30:00'
			}, {
				title : 'Dinner',
				start : '2022-09-12T20:00:00'
			}, {
				title : 'Birthday Party',
				start : '2022-09-13T07:00:00'
			}, {
				title : 'Click for Google',
				url : 'http://google.com/',
				start : '2022-09-28'
			}, {
				title : '테스트중',
				url : 'http://localhost:8084/DoZip/home.do',
				start : '2022-10-15'
			}  ]
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
일정관리<a href="interior_List.do">내공사내역</a>		</div>


<div id='calendar' style="width: 90%; margin: 20px;"></div>





<jsp:include page="../include/footer.jsp" />

