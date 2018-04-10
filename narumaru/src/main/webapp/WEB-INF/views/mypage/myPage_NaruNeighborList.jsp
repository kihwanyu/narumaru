<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<title>myPage</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="resources/css/mypage.css"> <!-- mypageCss -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<style type="text/css">
		* {
			color: black;
		}
		
		</style>
	</head>
	<body>
	<!--  -->
	<jsp:include page="../common/topmenu.jsp"/>	
		<br>
		<br>
		<br>
		<div id="container" style="margin-top: 50px;">
		<c:set var="pageValue" value="NaruNeighborList" scope="request" />
		<jsp:include page="../common/myPage_LeftSideBar.jsp"/>	
			<div id="contents" style="background: white;">
				<div style="font-size: 15px; margin-bottom: 15px;">
					나루 이웃 목록
				</div>		
				<ul class="list-group">
					<li class="list-group-item">
						<div style="height: 40px; width: 40px; float: left; margin-right: 20px;">
							<img alt="profile_person" src="resources/images/profile_defalt.png" height="100%" width="100%">
						</div>
						<div style="float: right;">
							<input type="button" value="삭제" class="btn btn-default">
						</div>
						<div style="padding-top: 10px; padding-bottom: 10px;">
							회원 이름
						</div>
					</li>
					<li class="list-group-item">
						<div style="height: 40px; width: 40px; float: left; margin-right: 20px;">
							<img alt="profile_person" src="resources/images/profile_defalt.png" height="100%" width="100%">
						</div>
						<div style="float: right;">
							<input type="button" value="삭제" class="btn btn-default">
						</div>
						<div style="padding-top: 10px; padding-bottom: 10px;">
							회원 이름
						</div>
					</li>
					<li class="list-group-item">
						<div style="height: 40px; width: 40px; float: left; margin-right: 20px;">
							<img alt="profile_person" src="resources/images/profile_defalt.png" height="100%" width="100%">
						</div>
						<div style="float: right;">
							<input type="button" value="삭제" class="btn btn-default">
						</div>
						<div style="padding-top: 10px; padding-bottom: 10px;">
							회원 이름
						</div>
					</li>     
				</ul>
				<div align="center" style="color: gray;">
					<ul class="pagination">
						<li><a href="#"><<</a></li>
						<li><a href="#"><</a></li>
						<li><a href="#">1</a></li>
						<li class="active"><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
						<li><a href="#">></a></li>
						<li><a href="#">>></a></li>
					</ul>
				</div>
			</div>
		</div>
		
		<jsp:include page="../common/myPage_RightSideBar.jsp"/>
	</body>
</html>