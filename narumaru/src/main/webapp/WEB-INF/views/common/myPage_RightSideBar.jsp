<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/mypage_RightSideBar.css">
</head>
<body>
	<div id="menu">
		<div class="help-div" align="center">
			Help
		</div>
	</div>
	<input type="file" id="profile-file" name="profile-file" onchange="LoadImg(this);">
	<script type="text/javascript">
		$(function(){
			var menuTop = parseInt($("#menu").css("top"));
			
			$(window).scroll(function(){
				$("#menu").stop().animate({"top":$(window).scrollTop()+menuTop+"px"},500);
			});
			
			$("#profile-file").hide();
			$("#profileImg").click(function(){
				$("#profile-file").click();
				console.log($("#profile").val());
			});
		});
		function LoadImg(value) {
			if(value.files && value.files[0]){
				
				var reader = new FileReader();
				reader.onload = function(e) {
					$("#profileImg").attr("src", e.target.result);
				}
			reader.readAsDataURL(value.files[0]);
			}
		}
	</script>
</body>
</html>