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
		width:1000px;
		margin-right:auto;
		margin-left:auto;
	}
	.innerMenu{
		height:100%;
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
		width:500px;
		margin-right:auto;
		margin-left:auto;
	}
	.innerTopUl{
		margin-right:auto;
		margin-left:auto;
	}
	.innerTopUl li{
		color:white;
		border:margin-right:20px;
		margin-left:20px;
		display:inline-block;
	}
	.innerTopUl li:hover {
		font-size: 1.5em;
		text-decoration: underline;
	}
	.leftArea{
		float:left;
		width:240px;
	}
	.rightArea{
		float:right;
		width:240px;
	}
	.content{
		margin-top:100px;
		margin-right:auto;
		margin-left:auto;
		width:500px;		
	}
</style>
</head>
<body>
	<div class="innerMenu">
		<div class="innerTop">
			<div class="innerTopMenu">
				<ul class="innerTopUl">
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
		</div>
		<aside class="rightArea">
			<div class="chat">
				채팅
			</div>
		</aside>
	</div>	
</body>
</html>