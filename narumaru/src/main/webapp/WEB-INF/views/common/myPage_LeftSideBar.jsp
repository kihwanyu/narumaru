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
				<div class="left-sidebar-li">
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
				<div class="left-sidebar-li">
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
				<div class="left-sidebar-li">
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
				<div class="left-sidebar-li">
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
				<div class="left-sidebar-li">
					나루 구독자 목록
				</div>
				<div align="right">
					<img src="resources/images/right_arrow.png" height="20px">
				</div>
			</li>
			<li>
				<div class="left-sidebar-li">
					포인트 결제/사용 내역
				</div>
				<div align="right">
					<img src="resources/images/right_arrow.png" height="20px">
				</div>
			</li>
			<li>
				<div class="left-sidebar-li">
					상품 구매 내역
					<!-- 이모티콘, 테마, 글꼴 -->
				</div>
				<div align="right">
					<img src="resources/images/right_arrow.png" height="20px">
				</div>
			</li>
			<li>
				<div class="left-sidebar-li">
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
		$("myInfo-div").click(function(){
			location.replace('');
		});
	});
	</script>
</body>
</html>