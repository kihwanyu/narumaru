<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
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
	.maru-content{
		height:120px;
		background-color:white;
		border-top:1px solid lightgray;
		border-bottom:1px solid lightgray;
		align:center;
		margin-top:50px;
	}
	.maru-content span{
		font-size: 16px;
		line-height: 50px;
		padding:15px 15px;
		color:#757575;
	}
	.maru-content span:hover{
		color:#6666ff;
		border-bottom:2px solid;
	}
	.board-list{
		margin-top:30px;
		width: 100%;
		margin-left:8.5%;
		text-align:center; 
	}
	.board-inner{
		width:400px; 
		height:500px; 
		float:left;
		padding:20px;
	}
	.board-context{
		width:100%;
		height:100%;
		background:white;
		padding:15px;
	}
</style>
</head>
<body style="background:#f7f8f9;">
	<jsp:include page="../common/topmenu.jsp"/>
	<div class="maru-content">
		<div class="channel-list" align="center" style="width:80%;">
			<%-- 채널 리스트 들어오는곳 --%>
		</div>
		<br>
		<div class="board-list">
		<%-- <c:forEach var="i" begin="1" end="12">
			<div class="board-inner">
				<div class="board-context">
					글 리스트 들어오는곳
				</div>
			</div>
		</c:forEach> --%>
		</div>
	</div><!-- 채널 종류 -->
	
	<script>
		function boardReload(cno){
			// 글 초기화
			$(".board-list").empty();
			
			// 글 리스트 가져옴
			$.ajax({
				url:"selectChannelBoardList.nm",
				type:"get",
				data:{"cno":cno},
				success:function(data){
					for(var i in data){
						$(".board-list").append('<div class="board-inner">'
							+'<div class="board-context">'
								+'<img src="resources/memberprofile/' + data[i].profileName + '" style="width:90%; height:50%;">'
								+'<br>'
								+data[i].bTitle
								+'<br><br>'
								+data[i].bContent
								+'<br><br>'
								+'댓글 수 ' + data[i].comments
							+'</div>'
						+'</div>')
					}
				},
				error:function(data){
					console.log("글 로딩 실패");
				}
			});
		}
		
		$(function(){
			// 채널 리스트 추가
			$.ajax({
				url:"selectChannelList.nm",
				type:"get",
				success:function(data){
					for(var i in data){
						$(".channel-list").append("<div class='btn btn-primary' style='margin:10px;' onclick='boardReload(" + data[i].cno +")'>" + data[i].cname + "</div>")
					}
				},
 				error:function(data){
					console.log("채널 로딩 실패");
				}			
			});
			
			boardReload(0);
		})
	</script>
	
</body>
</html>