<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
	#band_middle{
		margin-top:50px;
		width:100%;
		height:320px;
		background-color:#eef0f3;
	}
	#binb{
		width:1000px;
		height:100%;
		margin:0 auto;
		padding-top:30px;
	}
	#searchTop{
		margin-top:10px;
		width:100%; 
		height:250px; 
		background:white;
	}
</style>
</head>
<body>
	<jsp:include page="../common/topmenu.jsp"/>
	
	<div id="band_middle">
		<div id="binb">
			<label>�Խñ� �˻� ���</label><label style="float:right;">���� ���翡�� �˻�</label><img src="${contextPath }/resources/images/find.png" style="float:right;width:15px;height:15px;margin-top:3px;">
			<br>
			<div id="searchTop">
				<span id="searchTextSpan" style="width:100%; height:100%; padding:15px;">�˻��� ���� ������ ���⿡ ǥ�õɰɤ���������������������������������������������������������������</span>
			</div>
		</div>
	</div>
</body>
</html>