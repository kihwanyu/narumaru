<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.dumi{
		height:50px;
	}
	.content{
		height:2000px;
	}
	.searchArea{	
		background:white;	
		padding:auto;
	}
	.searchBtn{
		float:right;
	}
	.boardInsert{
		background:white;
		width:500px;
		height:150px;
		border:1px solid lightgray;			
	}
	.textArea{
		width:99%;
		height:90%;
		resize:none;
	}
	.boardInsert li{
		margin-right:20px;
	}
	.boardInsertcontent{
		height:100px;
	}
	.boardInsertTab{
		height:50px;
		background:gray;
		bottom:0px;
	}
	.boardInsertUl{
		float:left;
		width:400px;
	}
	.inertBoardBtn{
		float:right;
		height:100%;
	}
	.board{
		border:1px solid lightgray;
		margin-top:10px;
		background:white;
	}
	.boardInfo{
		padding:10px;
		height:50px;
	}
	.writerPhoto{
		height:40px;
		width:40px;
		border:1px solid lightgray;
		display:inline-block;	
	}
	.boardBtn{
		height:40px;
		width:40px;
		float:right;
		border:1px solid lightgray;
	}
	.boardContent{
		padding:20px;
	}
	.boardfoot{
		height:50px;
		bottom:0px;
	}
	.footUl{
		margin-left:auto;
		martgin-right:auto;
	}
	.footUl li{
		float:left;
	}
	.insertReply{
		padding:auto;
	}
	.insertReplyBtn{
		float:right;
	}	
</style>
</head>
<body>
	<jsp:include page="../common/topmenu.jsp"/>
	<jsp:include page="../common/middleMenu.jsp"/>
	<jsp:include page="../common/innerMenu.jsp"/>
	<div class="wrap">
		
		<div class="dumi">
			
		</div>
		<div class="content">
			<div class="searchArea">
				<input type="text" name="search" style="background:none; width:440px; height:40px;">
				<button class="searchBtn"><img src="${contextPath }/resources/images/magnifying-glass-481818_640.png" style="width:35px; height:35px;"></button>
			</div>
			<br>
			<div class="boardInsert">
				<div class="boardInsertcontent">
					<textArea class="textArea">
						
						
					</textArea>
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
					<button class="inertBoardBtn">작성</button>
				</div>
				
				
				<div class="board">
					<div class="boardInfo">
						<div class="writerPhoto">사진</div>
						<label>이름</label>
						<label>날짜</label>
						<div class="boardBtn">버튼</div>
					</div>
					<div class="boardContent">
						내용
					</div>
					<div class="boardfoot">
						<hr>
						<ul class="footUl">
							<li>이모티콘</li>
							<li>댓글쓰기</li>
							<li>공유하기</li>
						</ul>
					</div>
					<div class="insertReply">
						<input type="text" name="insertReply" style="background:none; width:440px; height:40px;">
						<button class="insertReplyBtn"><img src="${contextPath }/resources/images/magnifying-glass-481818_640.png" style="width:35px; height:35px;"></button>
					</div>
				</div>
				
			</div>	
		</div>
	</div>
</body>
</html>