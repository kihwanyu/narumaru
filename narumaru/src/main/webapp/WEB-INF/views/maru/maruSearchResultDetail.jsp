<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
		padding-bottom:30px;
	}
	#searchContents{
		width:80%;
		height:100px;
		float:left;
		margin-left:20px;
		margin-top:15px;
		font-size:1.3em;
		overflow:hidden;
		word-wrap:break-word; 
		text-overflow: ellipsis;
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
			<label>'${searchCondition}' 게시글 검색 결과 ${blist.size()}</label>
			<c:forEach var="b" items="${blist}">
				<br>
				<div id="searchTop"  onclick="goNarumaru(${b.nmno})">
					<div id="searchResultTitle">
						<span>${b.bTitle}</span> <span style="color:lightgray;">(${b.createDate})</span>
					</div>
					<div>
						<p id="searchContents">${b.bContent}</p>
						<%-- <img src="${contextPath}/resources/memberprofile/${blist[0].profileName}" style="width:93px;height:93px;float:right;margin-top:15px;margin-right:20px;"> --%>
					</div>
					<div id="searchAcce">
						<span style="">댓글</span> <span id="reply">${b.comments}</span> <c:if test="${b.bHidden ne null }"><span style="color:gray">(결제가 포함된 글입니다.)</span></c:if>
					</div>
					<div id="searchTopMaru">
						<img src="resources/memberprofile/${b.profileName}" style="width:30px;height:30px;float:left;margin:15px; border-radius: 5px;">
						<span><b>${b.nmTitle}</b></span>
					</div>
				</div> <!-- end of searchTop -->
			</c:forEach>
		</div> <!-- end of binb -->
	</div> <!-- end of band_middle -->
	<script>
		function goNarumaru(nmno){
			location.href="boardListAll.bo?nmno=" + nmno;
		}
	</script>
</body>
</html>