<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>:: naru? maru! :: 1:1 문의하기 </title>
<style>
	.NoticeServiceView{
		display:inline-block;
	}
	
	.NoticeServiceView ul li, .questionTitle{
		
		background:white;
		width:792px;
		
		
	}
	
	.questionTitle{
		width:792px;
		margin-left: 40px;
		font-weight: bold;
		border:1px solid black;
		padding-top: 17px;
	    padding-left: 20px;
	    padding-bottom: 7px;
	    font-size:14px;
	}
	
	 
	 .noticeContent li{
	 	padding: 20px;
	 	border:0.5px solid lightgray;
	 	font-size: 12px;	 	
	 }
	 
	 ul{
		list-style:none;
		margin-bottom:20px;
		
	 } 
	
	 .questionTitle img{
	 	width:15px;
	 }
	 #emailTail{
	 	display:none;
	 }
	 .psComments{
	 	height:140px;
	 }
	 p{
	 	float:left;
	 	width:170px;
	 }
	 .psCheckDiv{
		margin-left: 170px;
	    padding-left: 20px;
	    background: #F7EEE7;
	    padding-top: 20px;
	    padding-bottom: 10px;
	    
			
	 }
	 .btnDiv{
	 	text-align:center;
	 	height:100px;
	 }
	 .submBtn{
	 	background:#8C8E8D;
	 	color:white;
	 	border: 1px solid #8C8E8D;
	 }
	 .rseBtn{
	 	background:lightgray;
	 	border:1px solid white;
	 	
	 }
	 .loginId, .narumaruName{
	 	width:565px;
	 }
	 .phoneHead{
	 	width:70px;
	 }
	 .phoneMiddle, .phoneTail{
	 	width:70px;
	 }
</style>
</head>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" scope="application" />
<body>
	<jsp:include page ="noMenubar.jsp"/>
	
	<div class = "NoticeServiceView">
			<div  class ="questionTitle">
				<label><img src= "${ contextPath }/resources/images/Pen.png"> 1대1 문의 등록하기</label>
			</div>
			
			<form action="questionForm.no" method="post" enctype="multipart/form-data">
				<ul class = "noticeContent">	
					<li>
						<div class = "QuestionT">
							<p> 문의 명 :</p>
							<input type = "text" name ="noTitle" id="faqTitle" class ="narumaruName">
							
						</div>
					</li>
					
					<li>
						<div class = "QuestionT">
							<p>문의 내용 </p>
							<textarea style="width:565PX;resize: none;height:185PX;" name ="noContent" id="faqContent"></textarea>
						</div>
					</li>
					
					<li>
						
						<p>파일첨부 </p> 
						<input type = "file" name="orFileName">
					</li>
					
					<li>
						<div class = "psComments">
							<p> 개인정보<br> 수집동의 </p>
							
							<div class ="psCheckDiv">
							<label> - 수집하는 개인정보 항목 : 이메일 주소, 휴대폰번호, 로그인 계정</label>
							<br>
							<span> 작성해주시는 개인정보는 문의 접수 및 고객 불만 해결을 위해 일정 기간 보관됩니다.<br>
								보관기간- 상담이력 5년 / 첨부파일: 1개월</span> <br><br>
								
							<input type ="checkbox" id="agree" > <label for="agree" > 동의합니다. </label>
							
							
							</div>
						</div>
					</li>
					
					
				</ul>
				<div class ="btnDiv">
					<input type ="submit" class ="submBtn" onclick="return submBtn();" value = "문의하기">&nbsp;&nbsp;
					<input type = "reset" class= "rseBtn" value = "메인으로 "> 
				</div>
				
				<script>
				function submBtn(){
					
						if ($(faqTitle).val() !="" && $(faqContent).val() != "" 
							&& $('input:checkbox').is(":checked") == true){
							return true;
						}
						
						if ($('input:checkbox').is(":checked") == false){
						   alert("정보 제공동의 및 정보 제 3자 제공 동의에 체크를 해주세요.");
						   return false;
						}
					
					
				}
				</script>
			</form>
		</div>	
		
		
</body>
</html>