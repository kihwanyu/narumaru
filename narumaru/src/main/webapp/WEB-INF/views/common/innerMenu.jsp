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
				마루 프로필 사진
			</div>
			<br>
			<div class="maruName">
				<h2>마루 이름</h2>
			</div><br>
			<div class="maruMember">
				<div class="inlineBlock pointer maruMemberView">
					맴버
				</div>
				<div class="floatRight pointer maruMemberInvateView">
					초대
				</div>
			</div>
			<br>
			<div class="pointer maruSetting">
			<hr>
				마루 설정				
			</div>
		</div>
		
		<div class="floatRight rightArea">
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
		</div>
	</div>
	<script>
	$(".newChat").click(function(){
	    $(".chatSub").toggle();
	});
	$(".maruMemberView").click(function(){
	    location.href="showMaruMember.ma";
	});
	$(".maruMemberInvateView").click(function(){
	    location.href="showMaruMemberInvate.ma";
	});
	$(".maruSetting").click(function(){
	    location.href="showMaruSetting.ma";
	});
	</script>
</body>
</html>