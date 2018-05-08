<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<title>myPage</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="resources/css/mypage.css"> <!-- mypageCss -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</head>
	<body>
	<!--  -->
	<jsp:include page="../common/topmenu.jsp"/>	
		<br>
		<br>
		<br>
		<div id="container" style="margin-top: 50px;">
		<c:set var="pageValue" value="loginRecord" scope="request" />
		<jsp:include page="../common/myPage_LeftSideBar.jsp"/>	
			<div id="contents" style="background: white; color: black;">
				<div style="font-size: 15px; margin-bottom: 15px;">
					로그인 기록
				</div>		
				 <table class="table table-condensed" >
					<thead>
						<tr>
							<th width="35%">일자</th>
							<th width="50%">IP</th>
							<th width="15%">국가</th>
						</tr>
					</thead>
					<tbody>
						
						<c:forEach items="${loginList }" var="loginList">
											<tr>
												<td>${loginList.time }</td>
												<td>${loginList.userIp }</td>
												<td>${loginList.success_value }</td>
											</tr>
										</c:forEach>
					</tbody>
				</table>
				<div align="center" style="color: gray;">
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
								<li><a href="myLoginView.me?currentPage=1"><<</a></li>
								<c:choose>
									<c:when test="${currentPage <= 1 }">
										<li class="active"><a href="#"><</a></li>
									</c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${backNextpage < 1 }">
												<li><a href="myLoginView.me?currentPage=1"><</a></li>
											</c:when>
											<c:otherwise>
												<li><a href="myLoginView.me?currentPage=${backNextpage }"><</a></li>
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
											<li><a href="myLoginView.me?currentPage=${p }">${p }</a></li>
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
												<li><a href="myLoginView.me?currentPage=${maxPage }">></a></li>
											</c:when>
											<c:otherwise>
												<li><a href="myLoginView.me?currentPage=${forwardNextpage }">></a></li>
											</c:otherwise>
										</c:choose>
									</c:otherwise>
								</c:choose>
								<li><a href="myLoginView.me?currentPage=${maxPage }">>></a></li>
								</ul>
							</div>
				</div>
			</div>
		</div>
		
		<jsp:include page="../common/myPage_RightSideBar.jsp"/>
		<!--  -->
	</body>
</html>