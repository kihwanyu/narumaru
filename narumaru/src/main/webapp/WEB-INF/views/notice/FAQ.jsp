<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	.FaqServiceView{
		display:inline-block;
	}
	
	.noticeContent li, .noTitle{
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
	 .Qsearch{
	 	font-size:15px;
	 	margin-left:40px;
	 }
	 .subMenu li{
	 
	 	width:200px;
	 }
	 
</style>
<title>:: Naru ? Maru ! :: FAQ </title>
</head>
<body>
	<jsp:include page = "noMenubar.jsp"/>
	
	<div class = "FaqServiceView">
			<div class = "FAQCategory">
				<input type = "text" class = "Qsearch" placeholder="검색어를 입력해주세요"/>
				<ul class = "subMenu">
					<li>자주 묻는 질문</li>
					<li>회원가입, 로그인 질문</li>
					<li>초대</li>
					<li>알림, 새소식</li>
					<li>나루마루 설정</li>
					<li>마루 멤버</li>
					<li>기타</li>
				
				</ul>
			</div>
			<div  class ="noTitle">
				<label> 자주 묻는 질문</label>
			</div>
			 
			<ul class = "noticeContent">
				<li><a href = "noticeDetail.no">
					<p>다국어 서비스 관련해 안내해드립니다.</p>
					<p>2018년 4월 4일 오후 2:00</p>
					</a>	
				</li>
					
				<li>
					<p>Naru Maru 6.3 업데이트 소식.</p>
					<p>2018년 3월 23일 오후 2:00</p>
				</li>
				
				<li>
					<p>Naru Maru 4.3 업데이트 소식.</p>
					<p>2018년 3월 23일 오후 2:00</p>
				</li>
				
				<li>
					<p>Naru Maru 3.3 업데이트 소식.</p>
					<p>2018년 3월 23일 오후 2:00</p>
				</li>
				
				<li>
					<p>Naru Maru 1.1 업데이트 소식.</p>
					<p>2018년 3월 23일 오후 2:00</p>
				</li>
			</ul>
		</div>	
		
		<!-- 씨발 ................. 좆 됐따  -->
</body>
</html>