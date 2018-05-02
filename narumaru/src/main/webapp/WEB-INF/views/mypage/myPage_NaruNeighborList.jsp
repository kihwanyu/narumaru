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
		<c:set var="pageValue" value="NaruNeighborList" scope="request" />
		<jsp:include page="../common/myPage_LeftSideBar.jsp"/>	
			<div id="contents" style="background: white; color: black;">
				<div style="font-size: 15px; margin-bottom: 15px;">
					나루 이웃 목록
				</div>		
				<ul class="list-group">
					<c:forEach items="${nList }" var="neighbor">
						<li class="list-group-item">
							<div style="height: 60px; width: 60px; float: left;">
								<c:choose>
									<c:when test="${empty neighbor.profileName }">
										<img alt="profile_person" src="resources/images/profile_defalt.png" height="70%" width="50%">
									</c:when>
									<c:otherwise>
										<img alt="profile_person" src="resources/memberprofile/${neighbor.profileName }" height="70%" width="50%">
									</c:otherwise>
								</c:choose>
								
							</div>
							<div style="float: right;">
							<c:choose>
								<c:when test="${neighbor.result ne true }">
									<input type="button" value="추가" class="btn btn-default" onclick="neighborInsert(${neighbor.mno});">
								</c:when>
								<c:otherwise>
									<input type="button" value="삭제" class="btn btn-default" onclick="neighborDelete(${neighbor.mno});">
								</c:otherwise>
							</c:choose>
							</div>
							<div style="padding-top: 10px; padding-bottom: 10px;">
								${neighbor.email }&nbsp;&nbsp;(${neighbor.nicName }) &nbsp;&nbsp; 
								<c:choose>
									<c:when test="${neighbor.result eq true }">
										<font color="yellowgreen">서로이웃</font>
									</c:when>
									<c:otherwise>
										<font color="yellowblue">이웃</font>
									</c:otherwise>
								</c:choose>
							</div>
						</li>
					</c:forEach>
				</ul>
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
				<div class="pagingArea" align="center">
					<ul class="pagination">
					<li><a href="naruNeighborListView.me?currentPage=1"><<</a></li>
					<c:choose>
						<c:when test="${currentPage <= 1 }">
							<li class="active"><a href="#"><</a></li>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${backNextpage < 1 }">
									<li><a href="naruNeighborListView.me?currentPage=1"><</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="naruNeighborListView.me?currentPage=${backNextpage }"><</a></li>
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
								<li><a href="naruNeighborListView.me?currentPage=${p }">${p }</a></li>
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
									<li><a href="naruNeighborListView.me?currentPage=${maxPage }">></a></li>
								</c:when>
								<c:otherwise>
									<li><a href="naruNeighborListView.me?currentPage=${forwardNextpage }">></a></li>
								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>
					<li><a href="naruNeighborListView.me?currentPage=${maxPage }">>></a></li>
					</ul>
				</div>
			</div>
		</div>
		<script type="text/javascript">
		function neighborInsert(mno){
			var currentPage = ${currentPage };
			location.href = "myPageNeighborInsert.nc?mno="+mno+"&currentPage="+currentPage;
		}
		function neighborDelete(mno){
			var currentPage = ${currentPage };
			location.href = "myPageNeighborDelete.nc?mno="+mno+"&currentPage="+currentPage;
		}
		</script>
		<jsp:include page="../common/myPage_RightSideBar.jsp"/>
	</body>
</html>