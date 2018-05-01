<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
									<c:if test="${empty loginUser.profileName }">
										<img src="resources/images/profile_defalt.png" id="profileImg">
									</c:if>
									<c:if test="${!empty loginUser.profileName }">
										<img src="resources/memberprofile/${loginUser.profileName }" id="profileImg">
									</c:if>
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
									닉네임&nbsp;&nbsp;&nbsp;${loginUser.nickName }
								</div>
								<div class="name-div-false" style="display: none;">
									<div style="float: left; width: 30%; padding-top: 5px; padding-bottom: 5px;">
										닉네임&nbsp;
									</div>
									<div style="float: left; width: 67%;">
										<input type="text" id="nicName" name="nicName" value="${loginUser.nickName }" class="form-control" maxlength="5">
										<label class="name-label" style="display: none; color: red;">특수문자는 입력할 수 없습니다.</label>
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
								<fmt:formatDate value="${loginUser.birthDay }" type="both" pattern="yyyy년 MM월 dd일" var="birthdayFormat"/>
								<div class="birthday-div-true">생일&nbsp;&nbsp;&nbsp;${birthdayFormat }</div>
								<div class="birthday-div-false" style="display: none;">
									<div style="float: left; width: 30%; padding-top: 5px; padding-bottom: 5px;">
										생일&nbsp;
									</div>
									<div style="float: left; width: 67%;">
										<input type="date" style="color: black;" value="${loginUser.birthDay }" id="birthday" name="birthday" class="form-control">
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


								<c:if test="${loginUser.gender eq '남' }">
									<div class="gender-div-true">
										성별&nbsp;&nbsp;&nbsp;남성 
									</div>
									<div class="gender-div-false" style="display: none;">
										성별&nbsp;&nbsp;&nbsp;
										<input type="radio" name="gender" value="남" checked="checked">&nbsp;남성
										<input type="radio" name="gender" value="여">&nbsp;여성
									</div>	
								</c:if>
								<c:if test="${loginUser.gender eq '여' }">
									<div class="gender-div-true">
										성별&nbsp;&nbsp;&nbsp;여성 
									</div>
									<div class="gender-div-false" style="display: none;">
									성별&nbsp;&nbsp;&nbsp;
									<input type="radio" name="gender" value="남">&nbsp;남성
									<input type="radio" name="gender" value="여" checked="checked">&nbsp;여성
								</div>	
								</c:if>
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
								<!-- 국제번호 -->
								<%-- <c:set var="phoneSize" value="${fn:length(loginUser.phone)}"/>
								<c:set var="phoneStr" value="0${fn:substring(loginUser.phone,3,phoneSize)}"/> --%>
								<div class="phone-div-true">
									휴대폰번호&nbsp;&nbsp;&nbsp;${loginUser.phone }
								</div>
								<div class="phone-div-false" style="display: none;">
									<div style="float: left; width: 30%; padding-top: 5px; padding-bottom: 5px;">
										휴대폰번호&nbsp;
									</div>
									<div style="float: left; width: 67%;">
										<input type="tel" name="phone" id="phone" value="${loginUser.phone }" maxlength="11" class="form-control" placeholder="-없이 입력해주세요. 예)01012345678">
										<!-- 국제번호 -->
										<%-- <input type="tel" name="phone" id="phone" value="${phoneStr }" maxlength="11" class="form-control" placeholder="-없이 입력해주세요. 예)01012345678"> --%>
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
								<c:set var="mchCount" value="0"/>
								<c:set var="mchListLength" value="${fn:length(mchList) }"/>
								<c:forEach items="${cList }" var="cList">
									<label for="${cList.cno }">${cList.cname }</label>
									<c:choose>
										<c:when test="${mchListLength > mchCount}">
											<c:choose>
												<c:when test="${cList.cno eq mchList[mchCount].cno }">
													<input type="checkbox" id="${cList.cno }" name="cno" value="${cList.cno }" checked="checked">
													<c:set var="mchCount" value="${mchCount+1 }"/>
												</c:when>
												<c:otherwise>
													<input type="checkbox" id="${cList.cno }" name="cno" value="${cList.cno }">
												</c:otherwise>
											</c:choose>
										</c:when>
										<c:otherwise>
											<input type="checkbox" id="${cList.cno }" name="cno" value="${cList.cno }">
										</c:otherwise>
									</c:choose>
									
									<!-- count 변수 1씩 증가시킴 -->
									<c:set var="count" value="${count+1 }"/>
									<!-- count가 5의 배수일 경우, <br> 태그 출력  -->
									<c:if test="${count%4 == 0 }">
									<br>
									</c:if>
								</c:forEach>
							</td>
							<td width="15%">
								<div align="center" style="margin-top: 40px;margin-bottom: 40px;">
									<input type="button" id="channelChangeBtn" value="변경" class="btn btn-default">
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
									<label class="btn_label" for="open-pop1">탈퇴</label>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
				<script type="text/javascript">
					$(function(){
						var namePass = "";
						var telPass = "";
						
						/* 닉네임 정규표현식 start */
						$("#nicName").keydown(function(){
							
							var patten = /^[a-zA-Z가-힣0-9]*$/g;
							var name = $("#nicName").val();
							var nameSub = name.substr(name.length-1);
							
							if(patten.test(nameSub) || name == ""){
								$(".name-label").hide();
								namePass = name;
							} else {
								$("#nicName").val(namePass);
								$(".name-label").show();
							}
						});
						/* 닉네임 번호 정규표현식 end */
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
							
							if(namePass.length > 1 && namePass.length <= 8){
								var nickName = $("#nicName").val().trim();
								
								$.ajax({
									url:"nickChange.me",
									data:{nickName:nickName},
									type:"POST",
									success:function(data){
										console.log(data);
										if(data == "true"){
											alert("닉네임 변경을 성공하였습니다.");
										} else {
											alert("닉네임 변경을 실패하였습니다.");
										}
									}
								});
							} else {
								alert("2자 이상 8자 이하로 입력해주세요.");
							}
							
							
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
							
							var gender = $(':radio[name="gender"]:checked').val();
							
							console.log(gender);
							
							$.ajax({
								url:"genderChange.me",
								data:{gender:gender},
								type:"POST",
								success:function(data){
									console.log(data);
									if(data == "true"){
										alert("성별 변경을 성공하였습니다.");
									} else {
										alert("성별 변경을 실패하였습니다.");
									}
								}
							}); 
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
							
							var phoneSize = $("#phone").val().trim().length;
							console.log(phoneSize);
							if(phoneSize > 9){
								var phone = $('#phone').val().trim();
								
								$.ajax({
									url:"phoneChange.me",
									data:{phone:phone},
									type:"POST",
									success:function(data){
										console.log(data);
										if(data == "true"){
											alert("핸드폰번호 변경을 성공하였습니다.");
										} else {
											alert("핸드폰번호 변경을 실패하였습니다.");
										}
									}
								}); 
							} else {
								alert("10자리 이상 입력해주세요.");
							}
						});
						$("#phoneCancel").click(function(){
							$(".phone-div-true").show();
							$(".phone-div-false").hide();
						});
						
						$("#channelChangeBtn").click(function(){
							var cnoArr = [];
							
							var cno = $("input[name=cno]:checked").each(function(){
								cnoArr.push($(this).val());
							});
							
							$.ajax({
								url:"channelChange.me",
								data:{cnoArr:cnoArr},
								type:"POST",
								success:function(data){
									console.log(data);
									if(data == "true"){
										alert("채널 변경을 성공하였습니다.");
									} else {
										alert("채널 변경을 실패하였습니다.");
									}
								}
							}); 
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
							<input type="button" id="passwordChangeBtn" value="비밀번호 변경" class="btn btn-default">
						</div>						
					</div>
				</form>
			</div>
			<script type="text/javascript">
			$(function(){
				$("#passwordChangeBtn").click(function(){
					
					console.log("click");
					var pwdArr = [$("#password1").val(), $("#password2").val(), $("#password3").val()];
					$.ajax({
						url:"userPwdChange.me",
						data:{pwdArr:pwdArr},
						type:"POST",
						success:function(data){
							console.log(data);
							if(data == "0"){
								alert("비밀번호 변경 성공하였습니다.");
							} else if(data == "1") {
								alert("비밀번호 변경 실패하였습니다. - 현재 비밀번호 불일치");
							} else {
								alert("비밀번호 변경 실패하였습니다. - 변경 비밀번호 불일치");
							}
						}
					}); 
				}); 
			});
			</script>
		</div>
		<input class="modal-q-state" id="open-pop1" type="checkbox" />
		<div class="modal-q">
			<label class="modal-q_bg" for="open-pop1"></label>
			<div class="modal-q_inner">
				<label class="modal-q_close" for="open-pop1"></label>
				<div style="width: 70%; margin-top: 100px; margin-bottom: 100px; border: 1px solid black; padding: 50px;" align="left">
					<div align="center" style="font-size: 20px;">회원 탈퇴 안내</div>
					<div align="center" style="font-size: 20px;">[회원탈퇴 약관]</div>
					<br>
					<p>환경권의 내용과 행사에 관하여는 법률로 정한다. 대통령의 임기가 만료되는 때에는 임기만료 70일 내지 40일전에 후임자를 선거한다. 모든 국민은 법 앞에 평등하다. 누구든지 성별·종교 또는 사회적 신분에 의하여 정치적·경제적·사회적·문화적 생활의 모든 영역에 있어서 차별을 받지 아니한다.</p>
					<p>사면·감형 및 복권에 관한 사항은 법률로 정한다. 법원은 최고법원인 대법원과 각급법원으로 조직된다. 이 헌법시행 당시의 대법원장과 대법원판사가 아닌 법관은 제1항 단서의 규정에 불구하고 이 헌법에 의하여 임명된 것으로 본다.</p>
					<p>국회에 제출된 법률안 기타의 의안은 회기중에 의결되지 못한 이유로 폐기되지 아니한다. 다만, 국회의원의 임기가 만료된 때에는 그러하지 아니하다. 행정권은 대통령을 수반으로 하는 정부에 속한다.</p>
					<p>국가원로자문회의의 조직·직무범위 기타 필요한 사항은 법률로 정한다. 대한민국의 경제질서는 개인과 기업의 경제상의 자유와 창의를 존중함을 기본으로 한다.</p>
					<p>대한민국의 영토는 한반도와 그 부속도서로 한다. 모든 국민은 헌법과 법률이 정한 법관에 의하여 법률에 의한 재판을 받을 권리를 가진다. 위원은 정당에 가입하거나 정치에 관여할 수 없다.<p>
					<p>탄핵소추의 의결을 받은 자는 탄핵심판이 있을 때까지 그 권한행사가 정지된다. 의무교육은 무상으로 한다. 모든 국민은 종교의 자유를 가진다. 법관은 탄핵 또는 금고 이상의 형의 선고에 의하지 아니하고는 파면되지 아니하며, 징계처분에 의하지 아니하고는 정직·감봉 기타 불리한 처분을 받지 아니한다.</p>
					<p>훈장등의 영전은 이를 받은 자에게만 효력이 있고, 어떠한 특권도 이에 따르지 아니한다. 재판의 심리와 판결은 공개한다. 다만, 심리는 국가의 안전보장 또는 안녕질서를 방해하거나 선량한 풍속을 해할 염려가 있을 때에는 법원의 결정으로 공개하지 아니할 수 있다.</p>
					<p>국가는 지역간의 균형있는 발전을 위하여 지역경제를 육성할 의무를 진다. 헌법개정안이 제2항의 찬성을 얻은 때에는 헌법개정은 확정되며, 대통령은 즉시 이를 공포하여야 한다.	</p>
					<br>
					<div align="center">
						<label for="agreement">약관에 동의 하시겠습니까?</label>&nbsp;
						<input type="checkbox" id="agreement">
					</div>
					<br>
					<div align="center">
						<input type="button" value="탈퇴하기" id="dropoutBtn">
					</div>
				</div>
			</div>
		</div>
		
		<form id="profileChage-form" method="post" action="profileChange.me" enctype="multipart/form-data">
			<input type="file" id="profile-file" name="profile-file" onchange="LoadImg(this);">
		</form>
		<jsp:include page="../common/myPage_RightSideBar.jsp"/>
		<script type="text/javascript">
		$(function(){
			/* 비밀번호 변경 */
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
			$('#dropoutBtn').click(function(){
				if($('#agreement').is(':checked')){
					if(confirm("정말로 탈퇴하시겠습니까?")){
						location.href="memberDropout.me?mid="+${loginUser.mid};					
					}
				} else {
					alert("약관에 동의해주세요.");
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