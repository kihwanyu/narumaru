<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="marginAuto innerMenu">
		<div class="leftArea">
			<div class="maruProfile">
				<img src="resources/images/profile_defalt.png" class="size100per">
			</div>
			<br>
			<div class="maruName" style="cursor:default;">
				<h2>${ nm.nmTitle }</h2>
			</div><br>
			<div class="maruMember" style="cursor:default;">
				<div class="inlineBlock">
					${nm.nmIntro }
				</div>
			</div>
			<br>
			<div class="maruSetting">
			<hr>
			<br>
			<c:if test="${isOwner}">
				<label class="btn_label" for="open-pop2" style="margin-bottom:10px;">나루 설정</label>
				<label class="btn_label" onclick="toWrite()">글 작성</label>			
			</c:if>
			<c:if test="${!isOwner && isNeighbor == 0}">
				<label class="btn_label" onclick="addNeighbor()" style="margin-bottom:10px;">이웃 추가</label>
			</c:if>
			<c:if test="${!isOwner && isNeighbor >= 1}">
				<label class="btn_label" onclick="deleteNeighbor()" style="margin-bottom:10px;">이웃</label>
			</c:if>
			</div>
		</div>
		
		<div class="floatRight rightArea">
			<div class="rightMenu chat">
				<div class="rightTitle">이 나루의 이웃</div>
				<div class=neighborContent>
					<c:if test="${neList.size() == 0}">
						<label>아직 이웃이 없습니다.</label>
					</c:if>
					<c:forEach var="i" items="${neList}">
						<label class="pointer" onclick="location.href='boardListAll.bo?nmno=${i.nmno}'">${i.nmTitle}</label>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<script>
		function toWrite(){
			location.href="toNaruBoardWrite.na?nmno=" + ${nm.nmno};
		}
		
		function addNeighbor(){
			if(confirm("이웃으로 추가하시겠습니까?")){
				location.href="insertNeighbor.na?nmno=" + ${nm.nmno};
			}
		}
		
		function deleteNeighbor(){
			if(confirm("이웃을 해제하겠습니까?")){
				location.href="deleteNeighbor.na?nmno=" + ${nm.nmno};
			}
		}
	
	</script>
</body>
</html>