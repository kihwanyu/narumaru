<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

			<div class = "NoticeServiceView">
				<div  class ="noTitle">
					<label> 공지 사항</label>
					
					<div style = "float:right; width:80px;"><img src="${ contextPath }/resources/images/noticeList.jpg" class = "listBtnImg"><a href = "Notice.no"> 목록 </a></div>
				</div>
				 
				<ul class = "noticeContent">
					<li>
						
						<article>
							<header>
								<label>다국어 서비스 관련해 안내드립니다. </label>
								<p>2018년 4월 4일 오후 2:00 </p>
							</header>
							
							<hr>
			
							안녕하세요, 나루마루팀입니다.<br/>
							<br/>
							항상 나루마루를 사랑해주고 계신 여러분께 감사드리며, 오늘은 아쉬운 소식 한가지를 전해드립니다.<br/>
							<br/>
							나루마루에서 제공되고 있던 다국어 서비스 중 독일어, 프랑스어 지원이 2018년 4월 3일부터 순차적으로 중단됩니다. 이에 따라, 그동안 밴드를 독일어와 프랑스어로 보고 계셨던 분들은 영어로 밴드 서비스를 이용하게 됩니다. <br/>
							<br/>
							나루마루는 더 나은 글로벌 서비스를 제공하기 위해 언어별 지원체계에 대해 전체적으로 점검하는 시간을 갖고자 합니다. 프랑스어, 독일어로 밴드를 이용하시던 분들께는 넓은 이해를 부탁드리며, ​향후 더욱 좋은 서비스로 찾아뵐 수 있도록 최선을 다하겠습니다.<br/> 
							<br/>
							감사합니다.<br/>
							
						</article>
					</li>
					
					
				</ul>
		</div>	
	
	
</body>
</html>