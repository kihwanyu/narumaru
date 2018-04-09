<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Insert title here</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<style>

/* a 태그 링크 색, 방문한 페이지 색, hover 했을때 색 */
 a:link { color: black; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: black; text-decoration: none;}


	body{
	 	background:#F7EEE7;
	}
	
	
	.noHead{
	 	background:white;
	 	width:100%;
	 	height: 100px;
   		border: 2px solid lightgray;
    
	} 
	.noHead img{
		margin-top: 20px;
	}
	.btn-group-vertical{
		width: 187px;
		background:yellow;
		top:0px;
		display:inline-block;
		float:left
	}
	.btn-group-vertical button{
		background:#8C8E8D;
	    height: 50px;
	    border: 1px solid lightgray;
	    text-align: left;
	    font-size:15px;
	}
	

	 .container{
	 	margin-top:40px;
	 }
	 
</style>
</head>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" scope="application" />

<body>
	<!-- 꼭대기 이미지 -->
	<div class = "noHead" align="center">
		<img src="${ contextPath }/resources/images/logo.png"/>
	</div>
	
	<div class = "container">
		<div class="btn-group-vertical">
			<button type="button" class="btn btn-primary" onclick ="location.href='Notice.no'" > 공지사항 </button>
			<button type="button" class="btn btn-primary" onclick = "location.href='FAQ.no'"> FAQ </button>
			<button type="button" class="btn btn-primary" onclick = "location.href='question.no'"> 1:1 문의 </button>
		</div>
	</div>	

</body>
</html>