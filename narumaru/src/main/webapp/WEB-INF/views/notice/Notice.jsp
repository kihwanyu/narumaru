<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html >
<html>
<head>

<title>:: naru? maru! :: 공지사항 </title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<style>

/* a 태그 링크 색, 방문한 페이지 색, hover 했을때 색 */

	.NoticeServiceView{
		display:inline-block;
	}
	
	.NoticeServiceView ul li, .noTitle{
		border:1px solid gray;
		background:white;
		width:792px;
		font-size: 15px;
		
	}
	
	.noTitle{
		width:792px;
		margin-left: 40px;
		font-weight: bold;
		
		padding-top: 17px;
	    padding-left: 20px;
	    padding-bottom: 7px;
	}
	
	 
	 .noticeContent li{
	 	cursor:pointer;
	 	padding: 20px;	 	
	 }
	 
	 .noticeContent li:hover{
	 	background:#FCC3C0;
	 	font-weight: bold;	
	 }
	 ul{
		list-style:none;
		margin-bottom:20px;
		
	 } 
</style>
</head>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" scope="application" />

<body>
	<jsp:include page ="noMenubar.jsp"/>
	
		<div class = "NoticeServiceView">
			<div  class ="noTitle">
				<label> 공지 사항</label>
			</div>
			 
			<ul class = "noticeContent">
				<li><a href = "noticeDetail.no">
					<p>다국어 서비스 관련해 안내해드립니다.</p>
					<o>2018년 4월 4일 오후 2:00</o>
					</a>	
				</li>
					
				<li>
					<p>Naru Maru 6.3 업데이트 소식.</p>
					<o>2018년 3월 23일 오후 2:00</o>
				</li>
				
				<li>
					<p>Naru Maru 4.3 업데이트 소식.</p>
					<o>2018년 3월 23일 오후 2:00</o>
				</li>
				
				<li>
					<p>Naru Maru 3.3 업데이트 소식.</p>
					<o>2018년 3월 23일 오후 2:00</o>
				</li>
				
				<li>
					<p>Naru Maru 1.1 업데이트 소식.</p>
					<o>2018년 3월 23일 오후 2:00</o>
				</li>
			</ul>
		</div>	
	
	
	
</body>
</html>