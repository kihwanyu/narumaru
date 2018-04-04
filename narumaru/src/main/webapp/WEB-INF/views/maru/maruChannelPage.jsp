<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.maru-content{
		height:56px;
		background-color:white;
		border-top:1px solid lightgray;
		border-bottom:1px solid lightgray;
		align:center;
		padding-right: 200px;
		padding-left: 140px;
		margin-top:50px;
	}
	.maru-content span{
		font-size: 16px;
		line-height: 50px;
		padding:15px 15px;
		color:#757575;
	}
	.maru-content span:hover{
		color:#6666ff;
		border-bottom:2px solid;
	}
	.board-list{
		margin-top:30px;
		width: 100%;
		margin-left:200px;
		text-align:center; 
	}
	.board-inner{
		width:280px; 
		height:336px; 
		float:left;
		padding:20px;
	}
	.board-context{
		width:100%;
		height:100%;
		background:white;
		padding:5px;
	}
</style>
</head>
<body style="background:#f7f8f9;">
	<jsp:include page="../common/topmenu.jsp"/>
	<div class="maru-content">
		<div class="channel-list" align="center">
			<span><a href="#">사진</a></span>
			<span><a href="#">디자인</a></span>
			<span><a href="#">그림</a></span>
			<span><a href="#">DIY/공예</a></span>
			<span><a href="#">음악</a></span>
			<span><a href="#">영화</a></span>
			<span><a href="#">과학</a></span>
			<span><a href="#">IT</a></span>
			<span><a href="#">여행</a></span>
			<span><a href="#">동물</a></span>
			<span><a href="#">에세이</a></span>
			<span><a href="#">소설</a></span>
			<span><a href="#">만화</a></span>
		</div>
		<br>
		<div class="board-list">
		<c:forEach var="i" begin="1" end="16">
			<div class="board-inner">
				<div class="board-context">
					<img src="${contextPath}/resources/images/cosmos.jpg" style="width:90%;">
					<br>
					글설명들어갈곳
					<br><br>
					여기에메뉴들
					<br><br>
					기타등등
				</div>
			</div>
		</c:forEach>
		</div>
	</div><!-- 채널 종류 -->
	
	
</body>
</html>