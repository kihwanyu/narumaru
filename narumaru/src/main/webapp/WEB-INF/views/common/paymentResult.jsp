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
		* {
			font-family: 'Nanum Gothic', sans-serif;
			font-weight: bold;
		}
		.tab_container {
		    border: 1px solid #eee;
		    border-top: none;
		    clear: both;
		    float: left;
		    width: 100%;
		    background: #FCC3C0;
		    margin-top:30px;
		    margin-bottom:30px;
		    padding-top: 100px;
		    padding-bottom: 70px;
		    padding-right: 10px;
			padding-left: 10px;
			border-radius: 10px;
			box-shadow: 2px 2px 5px 0 gray;
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
			font-size: 35px;
			margin-bottom: 50px;
		}
		.paymentInfo{
			margin-top:20px;
			margin-bottom:20px;
			margin-left:5px;
			padding-bottom: 10px;
			padding-top: 10px;
			padding-left: auto;
			padding-right: auto;
			font-size: 20px;
			text-align: left;
		}
		.closeBtn{
			padding: 20px;
			font-size: 15px;
			font-family: 'Nanum Gothic', sans-serif;
			font-weight: bold;
		}
		
		</style>
		
	</head>
	<body>
	<!--  -->
		<div id="container" align="center">
			
			<div id="contents">
				<div style="width: 100%;">
				    <div class="tab_container" align="center">
						<div style="color: black; width: 70%;">
							
							<div class="paymentTitle">
								<c:if test="${errorWhether eq true}">
									결제가 완료되었습니다.
								</c:if>
								<c:if test="${errorWhether eq false}">
									결제가 실패되었습니다.
								</c:if>
							</div>
							
							<div style="width: 60%; background: white; padding: 5px; margin-bottom: 50px; border-radius: 10px; box-shadow: 2px 2px 5px 0 gray;">
								<c:if test="${errorWhether eq true }">
									<div class="paymentInfo">
										결제 금액 : <fmt:formatNumber value="${p.amount }" pattern="#,###" /> 원
									</div>
									<div class="paymentInfo">
										구매 포인트 : <fmt:formatNumber value="${p.point }" pattern="#,###" /> P
									</div>							
									<div class="paymentInfo">
										보유 포인트 : <fmt:formatNumber value="${totalPoint }" pattern="#,###" /> P
									</div>
								</c:if>
								<c:if test="${errorWhether eq false }">
									<div class="paymentInfo">
										${errorMessage }
									</div>	
								</c:if>	
							</div>
							<div>
								<input type="button" value="창닫기" id="closeBtn" class="closeBtn btn btn-default">
							</div>					
						</div>    
				    </div>
				</div>
			</div>
			
		</div>
		<script type="text/javascript">
			$(function(){
				$("#closeBtn").click(function(){
					window.close();  
				});
			});
		</script>
	</body>
</html>