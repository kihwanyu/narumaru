<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html >
<html>
<head>

<title>:: naru? maru! :: 공지사항 </title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<style>

/* a 태그 링크 색, 방문한 페이지 색, hover 했을때 색 */

	.NoticeServiceView{
		display:inline-block;
	}
	
	.noticeContent li, .noTitle{
		border:1px solid gray;
		background:white;
		width:792px;
		font-size: 15px;
		
	}
	
	.noTitle{
		width:792px;
		margin-left: 40px;
		font-weight: bold;
		
		padding-top: 17px;
	    padding-left: 20px;
	    padding-bottom: 7px;
	}
	
	 
	 .noticeContent li{
	 	cursor:pointer;
	 	padding: 20px;	 	
	 }
	 
	 .noticeContent li:hover{
	 	background:#FCC3C0;
	 	font-weight: bold;	
	 }
	 ul{
		list-style:none;
		margin-bottom:20px;
		
	 } 
	 .pagination li{
	 	width:30px;
	 	height:30px;
	 	background:white;
	 	border:1px solid black;
	 	text-align:center;
	 }
</style>
</head>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" scope="application" />

<body>
	<jsp:include page ="noMenubar.jsp"/>
	
		<div class = "NoticeServiceView">
			<div  class ="noTitle">
				<label> 공지 사항</label>
			</div>
			 
			<ul class = "noticeContent">
				<c:forEach items ="${ noList }" var="Notice">
					<li>
						<a href = "noticeDetail.no?bno=${Notice.nid}">
						<p>${ Notice.noTitle }</p>
						
						<p><fmt:parseDate value="${Notice.createDate }" var="noticePostDate" pattern="yyyy-MM-dd"/>
						<fmt:formatDate value="${noticePostDate}" pattern="yyyy년  MM월  dd일"/></p>
						
						</a>
					</li>
				</c:forEach>
	
			</ul>
			<!--  -->
			<!-- 페이지 처리 -->
			<c:set var="currentPage" value="${pi.currentPage }"/>
			<c:set var="limit" value="${pi.limit }"/>
			<c:set var="startPage" value="${pi.startPage }"/>
			<c:set var="endPage" value="${pi.endPage }"/>
			<c:set var="maxPage" value="${pi.maxPage }"/>
							
			<c:set var="backNextPageVal" value="${currentPage/limit }" />
			<c:set var="backNextTemp" value="${backNextPageVal-0.9 }"/>
			<fmt:parseNumber var="backNextTemp" integerOnly="true" value="${backNextTemp }"/> 
			<!-- int 형변환 -->
			<c:set var="backNextpage" value="${backNextTemp*limit+1 }"/>
			<!-- int 형변환 -->
			<fmt:parseNumber var="backNextpage" integerOnly="true" value="${backNextpage }"/> 
			<c:set var="forwardNextPageVal" value="${currentPage/limit }"/>
			<c:set var="forwardNextTemp" value="${forwardNextPageVal+0.9 }"/>
			<!-- int 형변환 -->
			<fmt:parseNumber var="forwardNextTemp" integerOnly="true" value="${forwardNextTemp }"/> 							
			<c:set var="forwardNextpage"  value="${forwardNextTemp*limit+1 }"/>
			<!-- int 형변환 -->
			<fmt:parseNumber var="forwardNextpage" integerOnly="true" value="${forwardNextpage }"/>  
			<div class="pagingArea">
					<ul class="pagination">
					<li><a href="noticeSelectList.no?currentPage=1"><<</a></li>
					<c:choose>
						<c:when test="${currentPage <= 1 }">
							<li class="active"><a href="#"><</a></li>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${backNextpage < 1 }">
									<li ><a href="noticeSelectList.no?currentPage=1"><</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="noticeSelectList.no?currentPage=${backNextpage }"><</a></li>
								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>
					<c:forEach var="p" begin="${startPage }" end="${endPage }" step="1">
						<c:choose>
							<c:when test="${p == currentPage }">
								<li class="active"><a href="#">${p }</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="noticeSelectList.no?currentPage=${p }">${p }</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:choose>
						<c:when test="${currentPage >= maxPage }">
							<li class="active"><a href="#">></a></li>	
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${forwardNextpage > maxPage }">
									<li><a href="noticeSelectList.no?currentPage=${maxPage }">></a></li>
								</c:when>
								<c:otherwise>
									<li><a href="noticeSelectList.no?currentPage=${forwardNextpage }">></a></li>
								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>
					<li><a href="noticeSelectList.no?currentPage=${maxPage }">>></a></li>
				</ul>
			</div>
		</div>	

	
</body>
</html>