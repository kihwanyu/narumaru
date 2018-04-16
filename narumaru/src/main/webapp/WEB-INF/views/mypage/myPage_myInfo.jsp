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
	<!--  -->
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
									<input type="button" value="변경" class="btn btn-default" id="profile-chage">
								</div>
							</td>
						</tr>
						<tr>
							<td width="30%" rowspan="3">개인 정보</td>
							<td width="30%" style="vertical-align: middle;">
								<div class="birthday-div-true">생일&nbsp;&nbsp;&nbsp;1994년 5월 26일</div>
								<div class="birthday-div-false" style="display: none;">
									생일&nbsp;<input type="date" style="color: black;">&nbsp;
											<input type="checkbox" value="음력">&nbsp;음력
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
						<!--  -->
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
									휴대폰번호&nbsp;&nbsp;&nbsp;010-4803-4471
								</div>
								<div class="phone-div-false" style="display: none;">
									<div style="float: left; width: 30%; padding-top: 5px; padding-bottom: 5px;">
										휴대폰번호&nbsp;
									</div>
									<div style="float: left; width: 67%;">
										<input type="tel" name="phone" value="" class="form-control">
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
								<input type="checkbox" id="100" value="100">
								<label for="100">문화/예술</label>
								<input type="checkbox" id="200" value="200">
								<label for="200">여행</label>
								<input type="checkbox" id="300" value="300">
								<label for="300">패션/뷰티</label>
								<br>
								<input type="checkbox" id="travel" value="400">
								<label for="400">팬클럽</label>
								<input type="checkbox" id="art" value="500">
								<label for="500">인문/과학</label>
								<input type="checkbox" id="travel" value="600">
								<label for="600">동물</label>
								<br>
								<input type="checkbox" id="art" value="700">
								<label for="700">나이</label>
								<input type="checkbox" id="travel" value="800">
								<label for="800">방송/연애</label>
								<input type="checkbox" id="art" value="900">
								<label for="900">친목/모임</label>
								<br>
								<input type="checkbox" id="travel" value="1000">
								<label for="1000">여행</label>
								<!-- 
									문화/예술(100) 여행(200) 패션/뷰티(300) 팬클럽(400) 인문/과학(500) 동물(600) 나이(700) 방송/연예(800) 친목/모임(900) 종교/봉사(1000)

									음악(1100) 경제(1200) IT/기술(1300) 게임(1400) 어학/외국어(1500) 만화(1600) 일상/이야기(1700) 스포츠/레저(1800) 건강(1900) 결혼/가정(2000)
									
									만화/애니메이션(2100) 정치/사회(2200) 교육/공부(2300) 취미/DIY(2400) 취업/자기개발(2500) 맛집/요리/생활(2600)
								 -->
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
						$("#birthdayChange").click(function(){
							$(".birthday-div-true").hide();
							$(".birthday-div-false").show();
						});
						$("#birthdaySubmit").click(function(){
							$(".birthday-div-true").show();
							$(".birthday-div-false").hide();
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
							현재 비밀번호&nbsp;<input type="password" style="margin-top: 10px;" class="form-control">
						</div>
						<div class="password-div">
							변경 비밀번호&nbsp;<input type="password" style="margin-top: 10px;" class="form-control">
						</div>				
						<div class="password-div">
							<input type="submit" value="비밀번호 변경" class="btn btn-default">
						</div>						
					</div>
				</form>
			</div>
		</div>
		<input type="file" id="profile-file" name="profile-file" onchange="LoadImg(this);">
		<jsp:include page="../common/myPage_RightSideBar.jsp"/>
		<!--  -->
		<script type="text/javascript">
		$(function(){
			$("#profile-file").hide();
			$("#profileImg").click(function(){
				$("#profile-file").click();
			});
			$("#profile-chage").click(function(){
				var profileName = $("#profile-file").val();
				console.log(fileName);
				
				$.ajax({
					url:"profileChage.me",
					type:"post",
					data:{profileName:profileName},
					success:function(data){
						console.log(data);
						//console.log(data.member.userId);
					}
				});
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