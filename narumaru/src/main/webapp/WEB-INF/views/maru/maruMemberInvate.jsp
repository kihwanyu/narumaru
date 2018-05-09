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
<link rel="stylesheet" type="text/css" href="resources/css/naruInsertBoard.css">
</head>
<body class="maruBody">
	<jsp:include page="../common/topmenu.jsp"/>
	<jsp:include page="../common/middleMenu.jsp"/>
	<jsp:include page="../common/innerMenu.jsp"/>
	<div class="wrap">	
		<div class="dumi"></div>
		<div class="marginAuto content">
			<div class="invateContent">
				<div class="invateTitle">멤버 초대</div>
				<input type="email" id="invateMember" name="invateMember" placeholder="회원 아이디 입력" style="width:80%; display:inline-block; height:30px;"/>
				<div id="invateMemberBtn" style="display:inline-block; height:35px; float:right; width:18%; text-align:center; background:black; cursor:pointer; color:white; border:1px lightgray solid;">초대하기</div>
				<hr>
				<div class="invateBody">
					<table border="1" style="width:100%;" id="invateMemberList">
						<tr>
							<th>초대중인 멤버</th>
							<th>초대 승인</th>
						</tr>
					</table>
				</div>
				<hr>			
			</div>
		</div>
	</div>
	<script>
		$("#invateMemberBtn").click(function(){
			var nmno = ${ nm.nmno };
			$.ajax({
				url:"checkNarumaruOwner.nm",
				type:"get",
				data:{"nmno":nmno},
				success:function(data){
					if(data){
						location.href="insertInvatemember.ma?email="+$("#invateMember").val() + "&nmno=${nm.nmno}";
					}else{
						alert("초대는 마루장만 가능합니다.");
					}
				},
				error:function(data){
					console.log("실패");
				}			
			});
			
		});
		
		$(function(){
			var nmno = ${ nm.nmno };
			$.ajax({
				url:"selectInvateMemberList.ma",
				type:"get",
				data:{"nmno":nmno},
				success:function(data){
					var isAgree = '승낙안함'
					for(var i = 0; data.length > 0; i++){
						if(data[i].status == 'Y'){
							isAgree='승낙'
						}
						$("#invateMemberList").append("<tr><td>"+data[i].EMAIL+"</td><td>"+isAgree+"</td></tr>")		
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