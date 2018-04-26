<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="marginAuto innerMenu">
		<div class="leftArea">
			<div class="maruProfile">
				<img src="resources/images/profile_defalt.png" class="size100per">
			</div>
			<br>
			<div class="maruName" style="cursor:default;">
				<h2>${ nm.nmTitle }</h2>
			</div><br>
			<div class="maruMember" style="cursor:default;">
				<div class="inlineBlock">
					${nm.nmIntro }
				</div>
			</div>
			<br>
			<c:if test="${isOwner}">
				<div class="pointer maruSetting">
				<hr>
				<br>
				<label class="btn_label" for="open-pop2" style="margin-bottom:10px;">나루 설정</label>
				<label class="btn_label" onclick="toWrite()">글 작성</label>			
				</div>
			</c:if>
		</div>
		
		<!-- <div class="floatRight rightArea">
			<div class="rightMenu chat">
				<div class="rightTitle">
					채팅
					<div class="pointer floatRight newChat">새 채팅<div class="sub chatSub"><ul><li>비공개 채팅</li><li>공개 채팅</li></ul></div></div>
				</div>
				<div class="chatContent">
					<div class="chatPhoto"></div>
					<label>채팅방 이름</label>
				</div>
			</div>
			
			<div class="rightMenu album" style="top:200px;">
				<div class="rightTitle">
					앨범
					<div class="floatRight pointer moreAlbum"><a href="showMaruAlbum.ma">더보기</a></div>
				</div>
				<div class="albumMiniContent">
					<div class="photoThumb"></div>
				</div>
			</div>
		</div> -->
	</div>
	<script>
		function toWrite(){
			location.href="toNaruBoardWrite.na?nmno=" + ${nm.nmno};
		}
	
	</script>
</body>
</html>