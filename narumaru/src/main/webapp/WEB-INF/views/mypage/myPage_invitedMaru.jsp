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
		<c:set var="pageValue" value="invitedMaru" scope="request" />
		<jsp:include page="../common/myPage_LeftSideBar.jsp"/>	
			<div id="contents" style="background: white; color: black;">
				<div style="font-size: 15px; margin-bottom: 15px;">
					초대받은 마루
				</div>		
				<ul class="list-group">
					<c:forEach items="${InvateMemberList }" var="InvateMember">
						<li class="list-group-item">
							<div style="height: 40px; width: 40px; float: left; margin-right: 20px;">
								<img alt="profile_maru" src="resources/images/defalt_group.png" height="100%" width="100%">
							</div>
							<div style="float: right;">
								<input type="button" value="수락" class="btn btn-default" onclick="invateAccept(${InvateMember.ino}, ${InvateMember.nmno});">
								<input type="button" value="거절" class="btn btn-default" onclick="invateReject(${InvateMember.ino});">
							</div>
							<div style="padding-top: 10px; padding-bottom: 10px;">
								${InvateMember.nm_title } 초대자  : ${InvateMember.maru_manager }
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
					<li><a href="invitedMaruView.me?currentPage=1"><<</a></li>
					<c:choose>
						<c:when test="${currentPage <= 1 }">
							<li class="active"><a href="#"><</a></li>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${backNextpage < 1 }">
									<li><a href="invitedMaruView.me?currentPage=1"><</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="invitedMaruView.me?currentPage=${backNextpage }"><</a></li>
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
								<li><a href="invitedMaruView.me?currentPage=${p }">${p }</a></li>
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
									<li><a href="invitedMaruView.me?currentPage=${maxPage }">></a></li>
								</c:when>
								<c:otherwise>
									<li><a href="invitedMaruView.me?currentPage=${forwardNextpage }">></a></li>
								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>
					<li><a href="invitedMaruView.me?currentPage=${maxPage }">>></a></li>
					</ul>
				</div>
			</div>
		</div>
		
		<jsp:include page="../common/myPage_RightSideBar.jsp"/>
		<script type="text/javascript">
			function invateAccept(ino, nmno){
				location.href ="invateAccept.ma?ino="+ino+"&nmno="+nmno;
			}
			function invateReject(ino){
				location.href ="invateReject.ma?ino="+ino;
			}
		</script>
	</body>
</html>