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
		margin-top:10px;
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
		height:100%px;;
		background-color:#f7f8f9;
	}
	#binbb{
		width:1000px;
		margin:0 auto;
		padding-top:20px;
	}
</style>
</head>
<body>
	<jsp:include page="../common/topmenu.jsp"/>
	
	<div id="band_middle">
		<div id="binb">
			<label>'${searchCondition}' 게시글 검색 결과</label>
			<c:if test="${blist.size() > 0 }">
				<br>
				<div id="searchTop"  onclick="goNarumaru(${blist[0].nmno})">
					<div id="searchResultTitle">
						<span>${blist[0].bTitle}</span> <span style="color:lightgray;">(${blist[0].createDate})</span>
					</div>
					<div>
						<p id="searchContents">${blist[0].bContent}</p>
						<%-- <img src="${contextPath}/resources/memberprofile/${blist[0].profileName}" style="width:93px;height:93px;float:right;margin-top:15px;margin-right:20px;"> --%>
					</div>
					<div id="searchAcce">
						<span style="">댓글</span> <span id="reply">${blist[0].comments}</span><c:if test="${blist[0].bHidden ne null }"> <span style="color:gray">(결제가 포함된 글입니다.)</span></c:if>
					</div>
					<div id="searchTopMaru">
						<img src="resources/memberprofile/${blist[0].profileName}" style="width:30px;height:30px;float:left;margin:15px; border-radius: 5px;">
						<span><b>${blist[0].nmTitle}</b></span>
					</div>
				</div> <!-- end of searchTop -->
				<span style="float:right;" onclick="searchDetail('${searchCondition}')">검색결과 더보기 ></span>
			</c:if>
			<c:if test="${blist.size() == 0 }">
				<div id="searchTop">
					'${searchCondition}' 검색결과가 없습니다.
				</div> <!-- end of searchTop -->
			</c:if>
		</div> <!-- end of binb -->
	</div> <!-- end of band_middle -->
	
	<div id="band_bottom">
		<div id="binbb">
			<span style="font-size:20px;">마루 ${maruCount}</span>
			
			<%--몇개 표시할건지 설정 --%>
			<c:set var="maruEnd" value="${maruCount - 1}"/>
			<c:if test="${maruCount >= 3}">
				<c:set var="maruEnd" value="3"/>
			</c:if>
			<c:if test="${maruCount > 0 }">
				<c:forEach var="i" begin="0" end="${maruEnd}">
					<div id="searchMaru" style="margin-top:40px;" onclick="goNarumaru(${marulist[i].nmno})">
						<img src="resources/memberprofile/${marulist[i].profileName}" style="width:80px;height:80px; float:left;">
						<ul style="margin-left:50px; line-height:25px;">
							<li><b>${marulist[i].nmTitle}</b></li>
							<li>${marulist[i].nmIntro}</li>
							<!-- <li style="color:gray">멤버 x명</li> -->
						</ul>
					</div>
				</c:forEach>
				
				<c:if test="${maruCount > 4 }">
				<span style="float:right;" onclick="searchMaruDetail('${searchCondition}')">검색결과 더보기 ></span>
				</c:if>
			</c:if>
			
			<c:if test="${maruCount == 0 }">
				<div id="searchMaru" style="margin-top:40px;">
					'${searchCondition}' 검색 결과가 없습니다.
				</div>
			</c:if>
		</div>
	</div>
	<br>
	<div id="band_bottom">
		<div id="binbb">
			<span style="font-size:20px;">나루 ${naruCount}</span>
			
			<%--몇개 표시할건지 설정 --%>
			<c:set var="naruEnd" value="${naruCount - 1}"/>
			<c:if test="${naruCount >= 3}">
				<c:set var="naruEnd" value="3"/>
			</c:if>
			<c:if test="${naruCount > 0 }">
				<c:forEach var="i" begin="0" end="${naruEnd}">
					<div id="searchMaru" style="margin-top:40px;" onclick="goNarumaru(${marulist[i].nmno})">
						<img src="resources/memberprofile/${narulist[i].profileName}" style="width:80px;height:80px; float:left;">
						<ul style="margin-left:50px; line-height:25px;">
							<li><b>${narulist[i].nmTitle}</b></li>
							<li>${narulist[i].nmIntro}</li>
							<!-- <li style="color:gray">이웃 512명</li> -->
						</ul>
					</div>
				</c:forEach>
				
				<c:if test="${naruCount > 4 }">
				<span style="float:right;" onclick="searchNaruDetail('${searchCondition}')">검색결과 더보기 ></span>
				</c:if>
			</c:if>
			
			<c:if test="${naruCount == 0 }">
				<div id="searchMaru" style="margin-top:40px;">
					'${searchCondition}' 검색 결과가 없습니다.
				</div>
			</c:if>
		</div>
	</div>
	
	<script>
		function searchDetail(str){
			location.href="searchNarumaruBoardDetail.bo?searchCondition="+str;
		}
		
		function goNarumaru(nmno){
			location.href="boardListAll.bo?nmno=" + nmno;
		}
	</script>
	
</body>
</html>