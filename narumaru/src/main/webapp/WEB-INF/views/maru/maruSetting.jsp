<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
					<label>마루명 : </label><label style="align:center;"> ${ nm.nmTitle }</label><br>
					<label>생성일 : </label><label style="align:center;"> ${ nm.createDate }</label><br>
					<label>마루소개 : </label><label style="align:center;"> ${ nm.nmIntro }</label><br>
					<label>공개상태 : </label><label style="align:center;"> ${ nm.isOpen }</label>
				</div>
				
				<div class="settingBody" style="clear:both">
				<hr>
					설정 내용
				</div>
			</div>
		</div>
	</div>
</body>
</html>