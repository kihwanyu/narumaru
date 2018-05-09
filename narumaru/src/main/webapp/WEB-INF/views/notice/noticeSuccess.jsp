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

	.successContent, .noTitle{
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
	
	
	 .noticeContent{
		list-style:none;
		margin-bottom:20px;
		padding-left:40px;
		
	 } 
	 .container{
	 	display:none;
	 }
	 
	 .successContent{
	 	 padding-left: 20px;
   		 padding-top: 20px;
	 }
	 #mainBtn{
	 	background:#8C8E8D;
	 	color:white;
	 	border: 1px solid #8C8E8D;
	 	width: 120px;
   	    height: 37px;
	 }
	
	  #mainBtn:hover{
	 	cursor:pointer;
	    width:122px;
	    height:39px;
	    font-weight:bold;
	 }
	 
	
</style>
</head>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" scope="application" />

<body>
	<jsp:include page ="noMenubar.jsp"/>
	
		<div class = "NoticeServiceView" style="margin-top:50px;width:1200px;margin-left:auto; margin-right:auto; " >
			<div class ="NoticeSubServiceView" style="width:1000px;margin:auto">
				<div  class ="noTitle">
					<label> 등록 완료 </label>
				</div>
			 
				<div class = "noticeContent">
					<div class ="successContent">
						<div style ="width:750px; text-align:center;margin-top: 20px;font-size: 25px;">
							<p> 1:1 문의 등록이 완료 되었습니다. </p>
						</div>
						<br><br>
						<div style="width:750px;text-align:center">
						<button style="margin-bottom:30px;" id="mainBtn" onclick="mainBtn()"> 메인으로 </button>
						</div>
					</div>
						
					
				</div>
			</div>
		</div>	

		<script>
			function mainBtn(){
				location.href ="goHome.nm";
			}
		</script>
</body>
</html>
