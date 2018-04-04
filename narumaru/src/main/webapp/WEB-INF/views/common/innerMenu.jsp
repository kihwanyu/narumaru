<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	/* div{
		border:1px solid black;
	} */
	body{
		background: #eef0f3;
	}
	.wrap{	
		/* background:red; */
		width:1000px;
		margin-right:auto;
		margin-left:auto;
		
	}
	.ul li{
		display:inline-block;
	}
	.innerMenu{
		/* background:yellow; */
		width:1000px;
		margin-top:50px;
		margin-right:auto;
		margin-left:auto;
		position:relative;			
	}
	.innerTop{
		background:yellowgreen;
		height:30px;
		width:1000px;
		margin-bottom:10px;	
		position:fixed;		
	}
	.innerTopMenu{
		/* background:green; */
		width:500px;
		height:100%;
		margin-right:auto;
		margin-left:auto;
	}
	.innerTopUl{
		/* border:1px solid black; */
		/* background:lightgray; */
		margin-right:auto;
		margin-left:auto;
	}
	.innerTopUl li{
		/* border:1px solid black; */
		color:white;
		margin-right:20px;
		margin-left:20px;
	}
	.innerTopUl li:hover {
		font-size: 1.5em;
		text-decoration: underline;
	}
	.leftArea{
		float:left;
		top:100px;
		width:240px;
		position:fixed;	
	}
	.maruProfile{
		width:200px;
		height:150px;
		border:1px solid lightgray;
	}
	.maruName{
		width:200px;
	}
	.maruMember{
		width:200px;
	}
	.maruSetting{
		width:200px;
	}
	.rightArea{
		background:white;
		border:1px solid lightgray;
		float:right;
		width:240px;
		right:280px;
		top:100px;
		position:fixed;
	}
	.rightTitle{
		border:1px solid lightgray;
		padding:10px;
	}
	.chatContent{
		padding:10px;
		border:1px solid lightgray;
	}
	.newChat{
		float:right;
	}
	.chatPhoto{
		float:left;
		border:1px solid lightgray;
		width:25px;
		height:25px;
	}
	.content{
		/* background:lightyellow; */
		width:500px;
		/* position:relative; */
		top:100px;
		margin-right:auto;
		margin-left:auto;	
	}
</style>
</head>
<body>
	<div class="innerMenu">
		<div class="innerTop">
			<div class="innerTopMenu">
				<ul class="ul innerTopUl">
					<li>전체글</li>
					<li>사진첩</li>
					<li>일정</li>
					<li>멤버</li>
				</ul>
			</div>
		</div>
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
					<a href="#" class="newChat">새 채팅</a>
				</div>
				<div class="chatContent">
					<div class="chatPhoto"></div>
					<label>채팅방 이름</label>
				</div>
			</div>
		</aside>
	</div>
</body>
</html>