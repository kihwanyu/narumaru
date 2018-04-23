<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body class="maruBody">
	<jsp:include page="../common/topmenu.jsp"/>
	<jsp:include page="../common/middleMenu.jsp"/>
	<jsp:include page="../common/innerMenu.jsp"/>
	<div class="wrap">	
		<div class="dumi"></div>
		<div class="marginAuto content">
			<div id="calendar"></div>
		</div>
	</div>
</body>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="${ contextPath}/resources/js/moment.min.js"></script>
<script type="text/javascript" src="${ contextPath}/resources/js/fullcalendar/fullcalendar.min.js"></script>
<link rel="stylesheet" href="${ contextPath}/resources/css/fullcalendar.min.css"/>
<link rel="stylesheet" media='print' href="${ contextPath}/resources/css/fullcalendar.print.min.css"/>
<script src='${ contextPath}/resources/js/fullcalendar/lang/ko.js'></script>
<script>
  	$(document).ready(function() {

    $('#calendar').fullCalendar({
    	defaultDate: '<%=new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>',
      navLinks: true,
      editable: true,
      eventLimit: true, // allow "more" link when too many events
      height: 500
    });

  });

</script>
</html>