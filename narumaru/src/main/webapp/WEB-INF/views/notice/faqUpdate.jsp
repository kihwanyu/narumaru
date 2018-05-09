<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%
	pageContext.setAttribute("nr", "\r\n");
	pageContext.setAttribute("br", "<br>");
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<style>


	body{
	 	background:#F7EEE7;
	}
	ul{
		list-style:none;
		margin-bottom:20px;
		
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
	 	padding: 20px;	 	
	 }
	
	 .container{
	 	margin-top:40px;
	 }
	 .listBtnImg{
	 	width:18px;
	 
	 }
	 
	 header p{
	 	color:gray;
	 	font-size:13px;
	 }
	 header label{
	 	font-weight: bold;
	 }
</style>


<title>:: naru? maru! :: 공지사항 </title>
</head>
<body>
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application" />
	
		<jsp:include page = "noMenubar.jsp"/>
			<form action ="noticeUpdateCommit" method="post">
			<div class = "NoticeServiceView">
				<div  class ="noTitle">
					<label> FAQ </label>
					
					<div style = "float:right; width:80px;"><img src="${ contextPath }/resources/images/noticeList.jpg" class = "listBtnImg"><a href = "Notice.no"> 목록 </a></div>
				</div>
				 
				<ul class = "noticeContent">
					<li>
						
						<article>
							<header>
								<div style="display:none;">
									<input type="text" name="nid" value= "${ n.nid }">
									<input type="text" name="noType" value= "${ n.noType }">
									<input type="text" name="writerId" value= "${ n.writerId }">
									<input type="text" name="status" value= "${ n.status }">	
								</div>
							
							
								<input type= "text" name="noTitle" style="width:635px" value="${ n.noTitle }">
								
								<!-- 관리자일 경우에만 보이도록 -->
								
									<div style="float:right">
									
										<input type = "submit" class= "NoticeUpdateCommit" value= "수정저장">
									</div>

							</header>
							<hr>
<textarea name="noContent" style="resize:none;width:710px;height:250px;">
${fn:replace(n.noContent,nr,br)}
</textarea>
							<br><br>
						</article>
					</li>
					
					
				</ul>
		</div>
		</form>	
	
	
</body>
</html>