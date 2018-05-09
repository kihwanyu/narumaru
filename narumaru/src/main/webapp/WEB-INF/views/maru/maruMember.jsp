<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet"/>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
</head>
<body class="maruBody">
	<jsp:include page="../common/topmenu.jsp"/>
	<jsp:include page="../common/middleMenu.jsp"/>
	<jsp:include page="../common/innerMenu.jsp"/>
	<div class="wrap">	
		<div class="dumi"></div>
		<div class="marginAuto content">
			<div class="memberList">
				<div class="memberTitle">
					<div class="inlineBlock memberCount">멤버</div>
					<%-- <div class="floatRight invateMember">멤버 초대</div>
					<div class="searchArea">
						<input type="text" name="search" style="background:none; width:440px; height:40px;">
						<button class="floatRight searchBtn"><img src="${contextPath }/resources/images/find.png" style="width:35px; height:35px;"></button>
					</div>
					<hr> --%>
				</div>
				<div class="memberContent">

					<div class="memberBody">
						
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script>
	$(function(){
		var nmno = ${ nm.nmno };
		$.ajax({
			url:"selectMaruMemberList.ma",
			type:"get",
			data:{"nmno":nmno},
			success:function(data){
				console.log(data);
				for(var i = 0; i < data.length; i++){
					console.log(data[i]);
					if(data[i].CON_LEVEL == 0 ){data[i].NICNAME = data[i].NICNAME + " (마루장)" };
					var profileName = 'profile_defalt.png';
					if(data[i].PROFILENAME != null ){profileName = data[i].PROFILENAME}; 
					$(".memberBody").append(
						'<div class="memberInfo">'+
						'<hr>'+
						'	<div class="writerPhoto">'+
						'<img style="width:100%; height:100%;" src="resources/memberprofile/' + profileName + '" id="profileImg">'+
						'	</div>'+
						'	<label>'+data[i].NICNAME+'</label>'+
						'	<div class="floatRight boardBtn"><img src="resources/images/menu.png" class="modifyMenu size100per"></div>'+
						'	<hr style="clear:both;">'+
						'<hr>'+
						'</div>'
					);
				}
				
			},
			error:function(data){
				console.log("실패");
			}			
		});
	});
	</script>
</body>
</html>