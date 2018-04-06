<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
	#band_middle{
		margin-top:50px;
		width:100%;
		height:380px;
		background-color:#eef0f3;
	}
	#binb{
		width:1000px;
		height:100%;
		margin:0 auto;
		padding-top:30px;
	}
	#searchTop{
		margin-top:20px;
		width:100%; 
		height:250px; 
		background:white;
	}
	#searchResultTitle{
		width:100%;
		height:30px;
		border-bottom:1px solid #f5f5f5;
		padding-left:20px;
		font-size:15px;
		padding-top:10px;
	}
	#searchContents{
		width:80%;
		height:100px;
		float:left;
		margin-left:20px;
		margin-top:15px;
		font-size:14px;
	}
	#searchAcce{
		height:35px;
		width:100%;
		padding-left:20px;
		float:left;
		font-size:15px;
		border-bottom:1px solid #f5f5f5;
	}
	#searchTopMaru span{
		float:left; 
		top:16px; 
		position:relative;
	}
	#searchPage span{
		margin-right:15px;
	}
	#band_bottom{
		width:100%;
		height:850px;
		background-color:#f7f8f9;
	}
	#binbb{
		width:1000px;
		margin:0 auto;
		padding-top:20px;
	}
</style>
</head>
<body style="background:#eef0f3;">
	<jsp:include page="../common/topmenu.jsp"/>
	
	<div id="band_middle">
		<div id="binb">
			<label>게시글 검색 결과</label><label style="float:right;">가입 마루에서 검색</label><img src="${contextPath}/resources/images/find.png" style="float:right;width:15px;height:15px;margin-top:3px;">
			<br>
			<c:forEach var="i" begin="1" end="8">
				<div id="searchTop">
					<div id="searchResultTitle">
						<span>제목</span>
					</div>
					<div>
						<p id="searchContents">검색되서나온글ㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹ</p>
						<img src="${contextPath}/resources/images/dummy.png" style="width:93px;height:93px;float:right;margin-top:15px;margin-right:20px;">
					</div>
					<div id="searchAcce">
						<img src="${contextPath}/resources/images/smile.png" style="width:20px;height:20px;float:left;margin-top:5px;">
						<img src="${contextPath}/resources/images/smile.png" style="width:20px;height:20px;position:relative;left:-10px;top:5px;">
						<span style="margin-left:-10px; margin-top:-5px;">86</span>
						<span style="">댓글</span> <span id="reply">12</span>
					</div>
					<div id="searchTopMaru">
						<img src="${contextPath}/resources/images/cosmos.jpg" style="width:30px;height:30px;float:left;margin:15px; border-radius: 5px;">
						<span><b>뭔지는모르겠는데 아무는 개쩌는 마루</b></span>
					</div>
				</div> <!-- end of searchTop -->
			</c:forEach>
			
		</div> <!-- end of binb -->
	</div> <!-- end of band_middle -->
	
</body>
</html>