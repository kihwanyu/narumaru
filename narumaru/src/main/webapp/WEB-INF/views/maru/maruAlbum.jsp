<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
			<div class="album">
				<div class="albumTitle">앨범<div class="createAlbum">앨범 만들기</div></div>
				<div class="albumBar">
				<hr>
					<span class="sort">정렬</span>
					<div class="modify">관리</div>
				</div>
				<div class="albumContent">
				<hr>
					앨범 내용
				</div>
			</div>
		</div>
	</div>
</body>
</html>