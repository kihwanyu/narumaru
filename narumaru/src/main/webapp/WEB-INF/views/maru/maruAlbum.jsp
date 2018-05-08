<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!-- <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet"/>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
</head>
<body class="maruBody">
	<jsp:include page="../common/topmenu.jsp"/>
	<jsp:include page="../common/middleMenu.jsp"/>
	<jsp:include page="../common/innerMenu.jsp"/>
	<div class="marginAuto wrap">	
		<div class="dumi"></div>
		<div class="marginAuto content">
			<div class="album">
				<div class="albumTitle">앨범</div>
				<!-- <div class="albumBar">
				<hr>
					<span class="sort">정렬</span>
					<div class="floatRight modify">관리</div>
				</div> -->
				<div class="albumContent">
				<hr>
				<c:forEach var="b" begin="${beginPage}" end="${newPage}" items="${ list }">
					<div class="photoThumb">${ b.bContent }</div>	
				</c:forEach>				
				</div>
			</div>
		</div>
	</div>

</body>
</html>