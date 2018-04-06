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
			<div class="searchArea">
				<input type="text" name="search" style="background:none; width:440px; height:40px;">
				<button class="searchBtn"><img src="${contextPath }/resources/images/find.png" style="width:35px; height:35px;"></button>
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
			</div>

			<div class="board">
				<div class="boardInfo">
					<div class="writerPhoto">사진</div>
					<label>이름</label> <label>날짜</label>
					<div class="showSub boardBtn">
						버튼
						<div class="sub boardSub">
							<ul>
								<li>주소복사</li>
								<li>공유하기</li>
								<li>북마크</li>
								<li>신고하기</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="boardContent">내용</div>
				<div class="boardfoot">
					<hr>
					<ul class="footUl">
						<li class="showSub emotionBtn">이모티콘
							<div class="sub emotionSub">이모티콘</div>
						</li>
						<li class="insertReplyShow">댓글보기()</li>
						<li class="showSub shereBtn">공유하기
							<div class="sub shereSub">개발중인 기능입니다</div>
						</li>
					</ul>
				</div>
				<div class="insertReply">
					<hr>
					<button class="showSub attachBtn">
						+
						<div class="sub attachSub">
							<ul>
								<li>사진</li>
								<li>파일</li>
							</ul>
						</div>
					</button>
					<input type="text" name="insertReply"
						style="background: none; width: 400px; height: 40px;">
					<button class="insertReplyBtn">
						<img src="${contextPath }/resources/images/find.png"
							style="width: 35px; height: 35px;">
					</button>
					<div class="replyArea">
						<hr>
						<div class="writerPhoto">사진</div>
						<label>이름</label> <label>날짜</label>
						<div class="replyContent">내용</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<script>
		$(".insertReplyShow").click(function(){
			$(this).parent().parent().siblings(".insertReply").toggle();
			
		});
		$(".showSub").click(function(){
			$(this).children().toggle();
			
		});
	</script>
</body>
</html>