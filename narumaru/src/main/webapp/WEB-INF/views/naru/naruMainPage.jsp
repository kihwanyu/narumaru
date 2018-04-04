<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ talib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>
<!DOCTYPE html>
<html>
<head>
<style>
	.nmain{
		margin-top:50px;
		margin-left:10%;
		margin-right:auto;
		padding-left: 10px;
		display: inline-block;
	}
	
	.area1 {
		width:300px;
		height:200px;
		background:red;
		float:left;
	}
	.area2 {
		width:700px;
		height:1000px;
		background:green;
		padding-left: 10px;
		float:left;
	}
	.area3 {
		width:200px;
		height:400px;
		background:yellow;
	}
	
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<jsp:include page="../common/topmenu.jsp"/>
	<div class="nmain">
		<div class="area1">
		
		</div>
		<div class="area2">
		
		</div>
		<div class="area3">
		
		</div>
		
	</div>
	


</body>
</html>