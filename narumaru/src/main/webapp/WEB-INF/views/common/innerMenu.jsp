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
			<div class="maruName">
				<h2>${ nm.nmTitle }</h2>
			</div><br>
			<div class="maruMember">
				<div class="inlineBlock pointer maruMemberView">
					멤버(<span class="countMaruMember"></span>)
				</div>
				<div class="floatRight pointer maruMemberInvateView">
					초대
				</div>
				
				<div style="margin-top:10px; text-align:center; background:black; color:white;" class="pointer" id="insertMaruMember">
					가입하기
				</div>
			</div>
			<div class="pointer maruSetting">
			<hr>
				마루 설정				
			</div>
		</div>
		
		<div class="floatRight rightArea">
			<div class="rightMenu chat">
				<div class="rightTitle">
					채팅
					<div class="pointer floatRight newChat">새 채팅<div class="sub chatSub"><ul><li>비공개 채팅</li><li>공개 채팅</li></ul></div></div>
				</div>
				<div class="chatContent">
					<div class="chatPhoto"></div>
					<label>채팅방 이름</label>
				</div>
			</div>
			
			<div class="rightMenu album" style="top:200px;">
				<div class="rightTitle">
					앨범
					<div class="floatRight pointer moreAlbum"><a href="showMaruAlbum.ma">더보기</a></div>
				</div>
				<div class="albumMiniContent">
					<div class="photoThumb"></div>
				</div>
			</div>
		</div>
	</div>
	<script>
	$(".newChat").click(function(){
	    $(".chatSub").toggle();
	});
	$(".maruMemberView").click(function(){
	    location.href="showMaruMember.ma";
	});
	$(".maruMemberInvateView").click(function(){
	    location.href="showMaruMemberInvate.ma";
	});
	$(".maruSetting").click(function(){
	    location.href="showMaruSetting.ma";
	});
	$("#insertMaruMember").click(function(){
		var r = confirm("이 마루에 가입하시겠습니까?");
		if (r == true) {
		  console.log("${loginUser.mid} ${nm.nmno}");
		  location.href="insertMaruMember.ma?mno=${loginUser.mid}&nmno=${nm.nmno}";
		  
		}		
	});
	
	$(function(){
		var nmno = ${ nm.nmno};
		console.log(nmno);
		$.ajax({
			url:"countMaruMember.ma",
			type:"get",
			data:{"nmno":nmno},
			success:function(data){
				console.log(data);
				var $select = $(".countMaruMember");
				$select.html(data);
			},
			error:function(data){
				console.log("실패");
			}			
		});
	});
	</script>
</body>
</html>