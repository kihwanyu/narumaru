<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.0/moment.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/2.7.3/fullcalendar.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/2.7.3/fullcalendar.min.css"/>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/2.7.3/fullcalendar.print.css"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../common/topmenu.jsp"/>
	<jsp:include page="../common/middleMenu.jsp"/>
	<jsp:include page="../common/innerMenu.jsp"/>
	<div class="wrap">	
		<div class="dumi"></div>
		<div class="content">
			<div id="calender"></div>
		</div>
	</div>
<script type="text/javascript">	
	$(function(){
	 	calendarEvent();
	});
	
	function calendarEvent(){
		 $("#calender").html("");
		 var date = new Date();
		 var d = date.getDate();
		 var m = date.getMonth();
		 var y = date.getFullYear();
		 var calendar = $('#calender').fullCalendar({
			  header: {
				   left: "",
				   center: "title",
				//    right: "month,basicWeek,basicDay"
				   right: "today prev,next"
			  },
			  editable: true,
			  titleFormat: {
				   month: "yyyy년 MMMM",
				   week: "[yyyy] MMM dd일{ [yyyy] MMM dd일}",
				   day: "yyyy년 MMM d일 dddd"
			  },
			  allDayDefault: false,
			  defaultView: "month",
			  editable: false,
			  monthNames: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
			  monthNamesShort: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
			  dayNames: ["일요일","월요일","화요일","수요일","목요일","금요일","토요일"],
			  dayNamesShort: ["일","월","화","수","목","금","토"],
			  buttonText: {
				   today : "오늘",
				   month : "월별",
				   week : "주별",
				   day : "일별",
			  },
			  events : eventData,
			  timeFormat : "HH:mm"
		 });
	}
</script>
</body>
</html>