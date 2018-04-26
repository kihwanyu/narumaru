<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="resources/css/mypage.css"> <!-- mypageCss -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<title>Insert title here</title>
<style type="text/css">
</style>
</head>
<body>
	<jsp:include page="../common/topmenu.jsp"/>	
	<br>
		<br>
		<br>
		<div id="container" style="margin-top: 50px;">
		<jsp:include page="../common/myPage_LeftSideBar.jsp"/>
			<div id="contents">
				<c:choose>
					<c:when test="${empty point }">
						<div style="height:600px; background: white;">
							<div>
								<div align="center" style="color: black; font-size: 50px; margin-bottom: 120px;">
								<br>
								환급신청이 실패 되었습니다.
							</div>
								<div>
									<div align="left" style="color: black; font-size: 40px; width: 70%; margin-bottom: 30px;">
										환급신청 포인트 : 0 P
									</div>
									<div align="left" style="color: black; font-size: 40px; width: 70%; margin-bottom: 30px;">
										환급 수수료 : 0 원
									</div>
									<div align="left" style="color: black; font-size: 40px; width: 70%; margin-bottom: 30px;">
										환급 금액 : 0 원
									</div>
									<div align="left" style="color: black; font-size: 40px; width: 70%; margin-bottom: 30px;">
										잔여 포인트 : <fmt:formatNumber value="${currentPoint }" type="number"/> P
									</div>
								</div>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<div style="height:600px; background: white;">
							<div>
								<div align="center" style="color: black; font-size: 50px; margin-bottom: 60px;">
								<br>
								환급신청이 완료 되었습니다.
							</div>
								<div>
									<div align="left" style="color: black; font-size: 40px; width: 70%; margin-bottom: 30px;">
										환급신청 포인트 : <fmt:formatNumber value="${point }" type="number"/> P
									</div>
									<div align="left" style="color: black; font-size: 40px; width: 70%; margin-bottom: 30px;">
										환급 수수료 : <fmt:formatNumber value="${amount }" type="number"/> 원
									</div>
									<div align="left" style="color: black; font-size: 40px; width: 70%; margin-bottom: 30px;">
										환급 금액 : <fmt:formatNumber value="${point-amount }" type="number"/> 원
									</div>
									<div align="left" style="color: black; font-size: 40px; width: 70%; margin-bottom: 30px;">
										잔여 포인트 : <fmt:formatNumber value="${currentPoint-point }" type="number"/> P
									</div>
								</div>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		
		<jsp:include page="../common/myPage_RightSideBar.jsp"/>
</body>
</html>