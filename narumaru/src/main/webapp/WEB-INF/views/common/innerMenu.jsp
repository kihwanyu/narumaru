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
	<div class="innerMenu">
		<div class="leftArea">
			<div class="maruProfile">
				마루 프로필 사진
			</div>
			<br>
			<div class="maruName">
				<h2>마루 이름</h2>
			</div><br>
			<div class="maruMember">
				마루 회원
			</div>
			<br>
			<div class="maruSetting">
			<hr>
				마루 설정
			</div>
		</div>
		
		<aside class="rightArea">
			<div class="chat">
				<div class="rightTitle">
					채팅
					<div class="newChat">새 채팅<div class="chatSub"><ul><li>비공개 채팅</li><li>공개 채팅</li></ul></div></div>
				</div>
				<div class="chatContent">
					<div class="chatPhoto"></div>
					<label>채팅방 이름</label>
				</div>
			</div>
		</aside>
	</div>
	<script>
	$(".newChat").click(function(){
	    $(".chatSub").toggle();
	});
	</script>
</body>
</html>