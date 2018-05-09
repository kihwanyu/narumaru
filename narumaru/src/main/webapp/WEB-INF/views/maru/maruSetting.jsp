<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!-- <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/naruInsertBoard.css">
</head>
<body class="maruBody">
	<jsp:include page="../common/topmenu.jsp"/>
	<jsp:include page="../common/middleMenu.jsp"/>
	<jsp:include page="../common/innerMenu.jsp"/>
	<div class="wrap">	
		<div class="dumi"></div>
		<div class="marginAuto content">
			<div class="settingContent">
				<div class="settingTitle">
					마루 설정
				</div>
				<hr>
				<div class="maruMaster">
					<div class="writerPhoto">사진</div>									
				<div class="settingBody" style="clear:both">
				<label>마루명 : </label><label style="align:center;"> ${ nm.nmTitle }</label><br>
					<c:set var="channelArr">
						문화/예술(100), 여행(200), 패션/뷰티(300), 팬클럽(400), 인문/과학(500), 동물(600), 나이(700), 방송/연예(800), 친목/모임(900), 종교/봉사(1000),
						음악(1100) 경제(1200), IT/기술(1300), 게임(1400), 어학/외국어(1500), 만화(1600), 일상/이야기(1700), 스포츠/레저(1800), 건강(1900), 결혼/가정(2000),
		                           만화/애니메이션(2100), 정치/사회(2200), 교육/공부(2300), 취미/DIY(2400), 취업/자기개발(2500), 맛집/요리/생활(2600)
					</c:set>
					<c:forEach items="${ channelArr }" var="channel" varStatus="status">					
						<c:if test="${ nm.cno eq fn:substring(channel, fn:indexOf(channel, '(')+1, fn:indexOf(channel, ')'))}">
						<label>마루 채널 : </label><label style="align:center;"> ${ fn:substring(channel, 0, fn:indexOf(channel, "("))  }</label><br>

						</c:if>
					</c:forEach>
				<label>마루소개 : </label><label style="align:center;"> ${ nm.nmIntro }</label><br>
				<label>공개상태 : </label><label style="align:center;"> ${ nm.isOpen }</label><br>
				<label>생성일 : </label><label style="align:center;"> ${ nm.createDate }</label>
				</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>