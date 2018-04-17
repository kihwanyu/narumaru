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
		<link rel="stylesheet" type="text/css" href="resources/css/mypage_myInfo.css"> <!-- myInfoCss -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</head>
	<body>
	<jsp:include page="../common/topmenu.jsp"/>	
		<br>
		<br>
		<br>
		<div id="container" style="margin-top: 50px;">
		<c:set var="pageValue" value="myInfo" scope="request" />
		<jsp:include page="../common/myPage_LeftSideBar.jsp"/>	
			
			<div id="contents">
				<div class="myInfo">내정보</div>
				<table class="table" style="border: none;">
					<tbody>
						<tr height="100px;">
							<td width="20%">사용중인 프로필 </td>
							<td width="60%" style="vertical-align: middle;">
								<div id="profileArea">
									<img src="resources/images/profile_defalt.png" id="profileImg">
								</div>
							</td>
							<td width="15%">
								<div align="center" style="padding: 20px; padding-top: 40px; padding-bottom: 40px;">
									<input type="button" value="변경" class="btn btn-default" id="profile-change-btn">
								</div>
							</td>
						</tr>
						<tr>
							<td width="30%" rowspan="4">개인 정보</td>
							<td width="30%" style="vertical-align: middle;">
								<div class="name-div-true">
									이름&nbsp;&nbsp;&nbsp;유기환 
								</div>
								<div class="name-div-false" style="display: none;">
									<div style="float: left; width: 30%; padding-top: 5px; padding-bottom: 5px;">
										이름&nbsp;
									</div>
									<div style="float: left; width: 67%;">
										<input type="text" id="nicName" name="nicName" value="" class="form-control">
									</div>
								</div>							
							</td>
							<td width="15%">
								<div align="center">
									<div class="name-div-true">
										<input type="button" value="변경" class="btn btn-default" id="nameChange">
									</div>
									<div class="name-div-false" style="display: none;">
									<input type="button" value="확인" class="btn btn-default" id="nameSubmit" style="margin-bottom: 10px;">
									<input type="button" value="취소" class="btn btn-default" id="nameCancel">
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td width="30%" style="vertical-align: middle;">
								<div class="birthday-div-true">생일&nbsp;&nbsp;&nbsp;1994년 5월 26일</div>
								<div class="birthday-div-false" style="display: none;">
									<div style="float: left; width: 30%; padding-top: 5px; padding-bottom: 5px;">
										생일&nbsp;
									</div>
									<div style="float: left; width: 67%;">
										<input type="date" style="color: black;" value="" id="birthday" name="birthday" class="form-control">
									</div>
								</div>
							</td>
						
							<td width="15%">
								<div align="center" class="birthday-div-true">
									<input type="button" value="변경" class="btn btn-default" id="birthdayChange">
								</div>
								<div align="center" class="birthday-div-false" style="display: none;">
									<input type="button" value="확인" class="btn btn-default" id="birthdaySubmit" style="margin-bottom: 10px;">
									<input type="button" value="취소" class="btn btn-default" id="birthdayCancel">
								</div>
							</td>
						</tr>
						<tr>
							<td width="30%" style="vertical-align: middle;">
								<div class="gender-div-true">
									성별&nbsp;&nbsp;&nbsp;남성 
								</div>
								<div class="gender-div-false" style="display: none;">
									성별&nbsp;&nbsp;&nbsp;
									<input type="radio" name="gender" value="m">&nbsp;남성
									<input type="radio" name="gender" value="f">&nbsp;여성
								</div>							
							</td>
							<td width="15%">
								<div align="center">
									<div class="gender-div-true">
										<input type="button" value="변경" class="btn btn-default" id="genderChange">
									</div>
									<div class="gender-div-false" style="display: none;">
									<input type="button" value="확인" class="btn btn-default" id="genderSubmit" style="margin-bottom: 10px;">
									<input type="button" value="취소" class="btn btn-default" id="genderCancel">
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td width="30%" style="vertical-align: middle;">
								<div class="phone-div-true">
									휴대폰번호&nbsp;&nbsp;&nbsp;82+1048034471
								</div>
								<div class="phone-div-false" style="display: none;">
									<div style="float: left; width: 30%; padding-top: 5px; padding-bottom: 5px;">
										휴대폰번호&nbsp;
									</div>
									<div style="float: left; width: 67%;">
										<input type="tel" name="phone" id="phone" value="" class="form-control" placeholder="-없이 입력해주세요. 예)01012345678">
										<label class="tel-label" style="display: none; color: red;">숫자만 입력해주세요.</label>
									</div>
								</div>	
							</td>
							<td width="15%">
								<div class="phone-div-true" align="center">
									<input type="button" value="변경" class="btn btn-default" id="phoneChange">
								</div>
								<div class="phone-div-false" style="display: none;" align="center">
									<input type="button" value="확인" class="btn btn-default" id="phoneSubmit" style="margin-bottom: 10px;">
									<input type="button" value="취소" class="btn btn-default" id="phoneCancel">
								</div>	
							</td>
						</tr>
						<tr>
							<td width="30%">관심 채널</td>
							<td width="30%">
								<!-- count 변수를 선언 -->
								<c:set var="count" value="0"/>
								<c:forEach items="${cList }" var="cList">
								<label for="${cList.cno }">${cList.cname }</label>
								<input type="checkbox" id="${cList.cno }" name="cno" value="${cList.cno }">
								<!-- count 변수 1씩 증가시킴 -->
								<c:set var="count" value="${count+1 }"/>
								<!-- count가 5의 배수일 경우, <br> 태그 출력  -->
								<c:if test="${count%5 == 0 }">
								<br>
								</c:if>
								</c:forEach>
							</td>
							<td width="15%">
								<div align="center" style="margin-top: 40px;margin-bottom: 40px;">
									<input type="button" value="변경" class="btn btn-default">
								</div>
							</td>
						</tr>
						<tr>
							<td width="30%">비밀번호 변경</td>
							<td width="30%">
							</td>
							<td width="15%">
								<div align="center">
									<label class="btn_label" for="open-pop">변경</label>
								</div>
							</td>
						</tr>
						<tr>
							<td width="30%">회원 탈퇴</td>
							<td width="30%">
							</td>
							<td width="15%">
								<div align="center">
									<input type="button" value="탈퇴 " class="btn btn-default">
								</div>
							</td>
						</tr>
					</tbody>
				</table>
				<script type="text/javascript">
					$(function(){
						var telPass = "";
						/* 핸드폰 번호 정규표현식 start */
						$("#phone").keydown(function(){
							
							var patten = /^[0-9]/g;
							var tel = $("#phone").val();
							var telSub = tel.substr(tel.length-1);
							
							if(patten.test(telSub) || tel == ""){
								$(".tel-label").hide();
								telPass = tel;
							} else {
								$("#phone").val(telPass);
								$(".tel-label").show();
							}
						});
						/* 핸드폰 번호 정규표현식 end */
						$("#nameChange").click(function(){
							$(".name-div-true").hide();
							$(".name-div-false").show();
						});
						$("#nameSubmit").click(function(){
							$(".name-div-true").show();
							$(".name-div-false").hide();
							
							var nickName = $("#nicName").val();
							
							$.ajax({
								url:"nickChange.me",
								data:{nickName:nickName},
								type:"POST",
								success:function(data){
									console.log(data);
									if(data == "true"){
										alert("이름 변경을 성공하였습니다.");
									} else {
										alert("이름 변경을 실패하였습니다.");
									}
								}
							});
						});
						$("#nameCancel").click(function(){
							$(".name-div-true").show();
							$(".name-div-false").hide();
						});
						$("#birthdayChange").click(function(){
							$(".birthday-div-true").hide();
							$(".birthday-div-false").show();
						});
						$("#birthdaySubmit").click(function(){
							$(".birthday-div-true").show();
							$(".birthday-div-false").hide();
							
							var birthDay = $("#birthday").val();
							
							$.ajax({
								url:"birthdayChange.me",
								data:{birthDay:birthDay},
								type:"POST",
								success:function(data){
									console.log(data);
									if(data == "true"){
										alert("생년월일 변경을 성공하였습니다.");
									} else {
										alert("생년월일 변경을 실패하였습니다.");
									}
								}
							});
						});
						$("#birthdayCancel").click(function(){
							$(".birthday-div-true").show();
							$(".birthday-div-false").hide();
						});
						$("#genderChange").click(function(){
							$(".gender-div-true").hide();
							$(".gender-div-false").show();
						});
						$("#genderSubmit").click(function(){
							$(".gender-div-true").show();
							$(".gender-div-false").hide();
						});
						$("#genderCancel").click(function(){
							$(".gender-div-true").show();
							$(".gender-div-false").hide();
						});
						$("#phoneChange").click(function(){
							$(".phone-div-true").hide();
							$(".phone-div-false").show();
						});
						$("#phoneSubmit").click(function(){
							$(".phone-div-true").show();
							$(".phone-div-false").hide();
						});
						$("#phoneCancel").click(function(){
							$(".phone-div-true").show();
							$(".phone-div-false").hide();
						});
					});
				</script>
			</div>
		</div>
		
		<input class="modal-q-state" id="open-pop" type="checkbox" />
		<div class="modal-q">
			<label class="modal-q_bg" for="open-pop"></label>
			<div class="modal-q_inner">
				<label class="modal-q_close" for="open-pop"></label>
				<h2>비밀번호 변경</h2>
				<form action="" method="post">
					<div style="width: 50%" align="center">
						<div class="password-div">
							현재 비밀번호&nbsp;<input type="password" style="margin-top: 10px;" class="form-control" id="password1">
						</div>
						<div class="password-div">
							변경 비밀번호&nbsp;<input type="password" style="margin-top: 10px;" class="form-control" id="password2" name="password">
						</div>	
						<div class="password-div">
							변경 비밀번호 재입력&nbsp;<input type="password" style="margin-top: 10px;" class="form-control" id="password3">
						</div>			
						<div class="password-div">
							<input type="submit" value="비밀번호 변경" class="btn btn-default">
						</div>						
					</div>
				</form>
			</div>
		</div>
		<form id="profileChage-form" method="post" action="profileChange.me" enctype="multipart/form-data">
			<input type="file" id="profile-file" name="profile-file" onchange="LoadImg(this);">
		</form>
		<jsp:include page="../common/myPage_RightSideBar.jsp"/>
		<script type="text/javascript">
		$(function(){
			$("#profile-file").hide();
			$("#profileImg").click(function(){
				$("#profile-file").click();
			});
			$("#profile-change-btn").click(function(){
				var form = $('#profileChage-form')[0];
				
				var formData = new FormData(form);
				
				console.log(formData);
				if($("#profile-file").val() == ""){
					alert("프로필 사진을 선택해주세요.");
				} else {
					$.ajax({
						url:"profileChange.me",
						processData:false,
						contentType:false,
						data:formData,
						type:"POST",
						success:function(data){
							console.log(data);
							if(data == "true"){
								alert("프로필사진 변경을 성공하였습니다.");
							} else {
								alert("프로필사진 변경을 실패하였습니다.");
							}
						}
					});
				}
				
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