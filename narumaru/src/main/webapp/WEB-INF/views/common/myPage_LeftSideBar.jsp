<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="resources/css/mypage_LeftSideBar.css">
</head>
<body>
	<c:set var="selected_li" value="class=\"selected-li\" style=\"background: #8C8E8D;\"" scope="page"/>
	
	<c:if test="${empty loginUser}">
		<c:set var="message" value="잘못된 접근입니다. 로그인 후 이용해주세요." scope="request"/>
		<jsp:forward page="../common/errorPage.jsp"/>
	</c:if>
	<div id="left-sidebar">
		<ul>
			<c:choose>
				<c:when test="${pageValue == 'myInfo'}">
					<li ${selected_li }>
				</c:when>
				<c:otherwise>
					<li>
				</c:otherwise>
			</c:choose>
			<!-- 스타일이 적용안되서 배경색을 인라인으로 적용 -->
				<div class="left-sidebar-li" id="myInfo-div">
					내 정보
				</div>
				<div align="right">
					<img src="resources/images/right_arrow.png" height="20px">
				</div>
			</li>
			<c:choose>
				<c:when test="${pageValue == 'myboard'}">
					<li ${selected_li }>
				</c:when>
				<c:otherwise>
					<li>
				</c:otherwise>
			</c:choose>
				<div class="left-sidebar-li" id="myboard-div">
					내가 쓴 글
				</div>
				<div align="right">
					<img src="resources/images/right_arrow.png" height="20px">
				</div>
			</li>
			<c:choose>
				<c:when test="${pageValue == 'loginRecord'}">
					<li ${selected_li }>
				</c:when>
				<c:otherwise>
					<li>
				</c:otherwise>
			</c:choose>
				<div class="left-sidebar-li" id="myLogin-div">
					로그인 기록
				</div>
				<div align="right">
					<img src="resources/images/right_arrow.png" height="20px">
				</div>
			</li>
			<c:choose>
				<c:when test="${pageValue == 'resisteredMaru'}">
					<li ${selected_li }>
				</c:when>
				<c:otherwise>
					<li>
				</c:otherwise>
			</c:choose>
				<div class="left-sidebar-li" id="resisteredMaru-div">
					가입 신청중인 마루
				</div>
				<div align="right">
					<img src="resources/images/right_arrow.png" height="20px">
				</div>
			</li>
			<c:choose>
				<c:when test="${pageValue == 'invitedMaru'}">
					<li ${selected_li }>
				</c:when>
				<c:otherwise>
					<li>
				</c:otherwise>
			</c:choose>
				<div class="left-sidebar-li" id="invitedMaru-div">
					초대 받은 마루
				</div>
				<div align="right">
					<img src="resources/images/right_arrow.png" height="20px">
				</div>
			</li>
			<c:choose>
				<c:when test="${pageValue == 'NaruNeighborList'}">
					<li ${selected_li }>
				</c:when>
				<c:otherwise>
					<li>
				</c:otherwise>
			</c:choose>
				<div class="left-sidebar-li" id="naruNeighborList-div">
					나루 구독자 목록
				</div>
				<div align="right">
					<img src="resources/images/right_arrow.png" height="20px">
				</div>
			</li>
			<c:choose>
				<c:when test="${pageValue == 'pointPaymentList'}">
					<li ${selected_li }>
				</c:when>
				<c:otherwise>
					<li>
				</c:otherwise>
			</c:choose>
				<div class="left-sidebar-li" id="pointPayment-div">
					포인트 결제/사용 내역
				</div>
				<div align="right">
					<img src="resources/images/right_arrow.png" height="20px">
				</div>
			</li>
			<c:choose>
				<c:when test="${pageValue == 'refund'}">
					<li ${selected_li }>
				</c:when>
				<c:otherwise>
					<li>
				</c:otherwise>
			</c:choose>
				<div class="left-sidebar-li" id="refund-div">
					포인트 환급 및 내역
					<!-- 이모티콘, 테마, 글꼴 -->
				</div>
				<div align="right">
					<img src="resources/images/right_arrow.png" height="20px">
				</div>
			</li>
		</ul>
	</div>
	
	
	<script type="text/javascript">
	$(function(){
		$("#myInfo-div").click(function(){
			location.replace('myInfoView.me');
		});
		$("#myboard-div").click(function(){
			location.replace('myboardView.me');
		});
		$("#myLogin-div").click(function(){
			location.replace('myLoginView.me');
		});
		$("#invitedMaru-div").click(function(){
			location.replace('invitedMaruView.me');
		});
		$("#resisteredMaru-div").click(function(){
			location.replace('resisteredMaruView.me');
		});
		$("#naruNeighborList-div").click(function(){
			location.replace('naruNeighborListView.me');
		});
		$("#pointPayment-div").click(function(){
			location.replace('pointPaymentView.me');
		});
		$("#refund-div").click(function(){
			location.replace('refundView.me');
		});
	});
	</script>
</body>
</html>