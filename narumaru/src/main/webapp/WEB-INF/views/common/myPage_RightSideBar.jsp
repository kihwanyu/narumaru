<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#menu {
	background:white;
	position:absolute;
	left:50%;
	top: 133px;
	width: 200px;
	margin-left: 520px;
	box-shadow:1px 1px 10px #000;
}
.menubar-div {
	width:100%;
}
</style>
</head>
<body>
	<div id="menu">
		<div class="menubar-div" align="center" style="font-size: 15px; margin-top: 10px; margin-bottom: 10px;">
			최근 방문한 나루/마루
		</div>
		<div class="menubar-div" align="center">
			<div>
				<div class="list-group">
				  <a href="#" class="list-group-item">
				  	<img alt="" src="resources/images/defalt_group.png" width="60%" height="60%"><br>
				  	<font style="font-weight: bold; font-size: 15px;">나루/마루 이름</font>
				  </a>
				  <a href="#" class="list-group-item">
				  	<img alt="" src="resources/images/defalt_group.png" width="60%" height="60%"><br>
				  	<font style="font-weight: bold; font-size: 15px;">나루/마루 이름</font>
				  </a>
				  <a href="#" class="list-group-item">
				  	<img alt="" src="resources/images/defalt_group.png" width="60%" height="60%"><br>
				  	<font style="font-weight: bold; font-size: 15px;">나루/마루 이름</font>
				  </a>
				</div>
			</div>
		</div>
		<div class="menubar-div" align="center">
			<div>
				<div class="list-group">
				  <a href="#" class="list-group-item">공지사항</a>
				  <a href="#" class="list-group-item">1:1 문의</a>
				  <a href="#" class="list-group-item">FAQ</a>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(function(){
			var menuTop = parseInt($("#menu").css("top"));
			
			$(window).scroll(function(){
				$("#menu").stop().animate({"top":$(window).scrollTop()+menuTop+"px"},500);
			});
			
		});
	</script>
</body>
</html>