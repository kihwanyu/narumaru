<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
	<head>
		<title>myPage</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
		<style type="text/css">
		
		.tab_container {
		    border: 1px solid #eee;
		    border-top: none;
		    clear: both;
		    float: left;
		    width: 100%;
		    background: #FCC3C0;
		    margin-top:50px;
		    margin-bottom:50px;
		    padding-top: 100px;
		    padding-bottom: 100px;
		    padding-right: 10px;
			padding-left: 10px;
		}
		#container {
		    width: 100%;
		    margin: 0 auto;
		}
		#contents{
			width: 80%;
			vertical-align: middle;
			height: 700px;
		}
		.paymentTitle{
			font-size: 40px;
			margin-bottom: 50px;
		}
		.paymentInfo{
			margin-top:20px;
			margin-bottom:20px;
			padding-bottom: 10px;
			padding-top: 10px;
			padding-left: auto;
			padding-right: auto;
			font-size: 25px;
		}
		.closeBtn{
			padding: 20px;
			font-size: 15px;
		}
		</style>
		
	</head>
	<body>
	<!--  -->
		<div id="container" align="center">
		<c:set var="pageValue" value="pointPaymentList" scope="request" />
			
			<div id="contents">
				<div style="width: 100%;">
				    <div class="tab_container" align="center">
						<div style="color: black;">
							<div class="paymentTitle">
							결제가 완료되었습니다.
							</div>
							<div class="paymentInfo">
								결제 금액 : 1100 원
							</div>
							<div class="paymentInfo">
								구매 포인트 : 1000 P
							</div>							
							<div class="paymentInfo">
								보유 포인트 : 20000 P
							</div>		
							<div>
								<input type="button" value="창닫기" class="closeBtn">
							</div>					
						</div>    
				    </div>
				</div>
			</div>
			
		</div>
	</body>
</html>