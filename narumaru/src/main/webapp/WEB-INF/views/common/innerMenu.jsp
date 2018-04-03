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
	.wrap{	
		background:red;
		width:1000px;
		margin-right:auto;
		margin-left:auto;
	}
	.ul li{
		display:inline-block;
	}
	.innerMenu{
		background:yellow;
		width:1000px;
		margin-top:50px;
		margin-right:auto;
		margin-left:auto;
		position:fixed;	
		
	}
	.innerTop{
		background:yellowgreen;
		height:30px;
		margin-bottom:10px;
	}
	.innerTopMenu{
		background:green;
		width:500px;
		height:100%;
		margin-right:auto;
		margin-left:auto;
	}
	.innerTopUl{
		border:1px solid black;
		background:lightgray;
		margin-right:auto;
		margin-left:auto;
	}
	.innerTopUl li{
		border:1px solid black;
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
		width:240px;
	}
	.maruProfile{
		width:200px;
		height:150px;
		border:1px solid lightgray;
	}
	.maruName{
		border:1px solid lightgray;
		width:200px;
	}
	.maruMember{
		border:1px solid lightgray;
		width:200px;
	}
	.maruSetting{
		border:1px solid lightgray;
		width:200px;
	}
	.rightArea{
		border:1px solid lightgray;
		float:right;
		width:240px;
	}
	.rightTitle{
		border:1px solid lightgray;
		padding:10px;
	}
	.chatContent{
		padding:10px;
		border:1px solid lightgray;
	}
	.content{
		background:lightyellow;
		width:500px;
		position:relative;
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
			<div class="maruName">
				마루 이름
			</div>
			<div class="maruMember">
				마루 회원
			</div>
			<div class="maruSetting">
				마루 설정
			</div>
		</div>
		<aside class="rightArea">
			<div class="chat">
				<div class="rightTitle">
					채팅
				</div>
				<div class="chatContent">
					채팅방1
				</div>
			</div>
		</aside>
	</div>	
</body>
</html>