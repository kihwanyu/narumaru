<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.searchArea{
		padding:auto;
	}
	.searchBtn{
		float:right;
	}
	.boardInsert{
		width:500px;
		height:150px;
		border:1px solid lightgray;
	}
	.boardInsertTab{
		height:30px;
		background:gray;
	}
</style>
</head>
<body>
	<jsp:include page="../common/topmenu.jsp"/>
	<div class="wrap">
		<jsp:include page="../common/innerMenu.jsp"/>
		<div class="content">
			<div class="searchArea">
				<input type="text" name="search" style="background:none; width:440px; height:40px;">
				<button class="searchBtn"><img src="${contextPath }/resources/images/magnifying-glass-481818_640.png" style="width:35px; height:35px;"></button>
			</div>
			<br>
			<div class="boardInsert">
				<div class="boardInsertcontent">
					
				</div>
				<div class="boardInsertTab">
					<ul class="ul boardInsertUl">
						<li>탭1</li>
						<li>탭2</li>
						<li>탭3</li>
						<li>탭4</li>
						<li>탭5</li>
						<li>탭6</li>
					</ul>
				</div>
			</div>	
		</div>
	</div>
</body>
</html>