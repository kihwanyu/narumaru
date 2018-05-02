<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<head>
<style>
		* {
            font-family: 'Nanum Gothic', sans-serif;
            font-weight: bold;
         }
         
    h1 {
    	 font-family: 'Nanum Gothic', sans-serif;
            font-weight: bold;
    }
    h2 {
    	 font-family: 'Nanum Gothic', sans-serif;
            font-weight: bold;
    }
	
	body{
		background:white;
		margin:0;
	}
	.mifh{
		margin-top:0;
		background:#F7EEE7;
		height:70px;
		width:100%;
	}
	
	.idArea{
		margin:0 auto;
		width:700px;
		align:center;
	}
	
	.idBtn{
		align:center;
	}
	.mbtn{
		width:50px;
		height:50px;
	}
	.passArea{
		margin:0 auto;
		width:700px;
		align:center;
	}
	.passBtn{
		align:center;
	}
	
	.modal-id {
	opacity: 0;
	visibility: hidden;
	position: fixed;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	text-align: left;
	background: rgba(0,0,0, .6);
	transition: opacity .25s ease;
	}
	.modal-id_bg {
		position: absolute;
		top: 0;
		right: 0;
		bottom: 0;
		left: 0;
		cursor: pointer;
	}
	.modal-id-state {
		display: none;
	}
	.modal-id-state:checked + .modal-id {
		opacity: 1;
		visibility: visible;
	}
	
	.modal-id-state:checked + .modal-id .modal-id__inner {
		top: 0;
	}
	
	.modal-id_inner {
		transition: top .25s ease;
		position: absolute;
		top: -20%;
		right: 0;
		bottom: 0;
		left: 0;
		width: 50%;
		margin: auto;
		overflow: auto;
		background: #fff;
		border-radius: 5px;
		padding: 1em 2em;
		height: 20%;
	}
	
	.modal-id_close {
		position: absolute;
		right: 1em;
		top: 1em;
		width: 1.1em;
		height: 1.1em;
		cursor: pointer;
	}
	
	.modal-id_close:after,
	.modal-id_close:before {
		content: '';
		position: absolute;
		width: 2px;
		height: 1.5em;
		background: #ccc;
		display: block;
		transform: rotate(45deg);
		left: 50%;
		margin: -3px 0 0 -1px;
		top: 0;
	}
	
	.modal-id_close:hover:after,
	.modal-id_close:hover:before {
		background: #aaa;
	}
	
	.modal-id_close:before {
		transform: rotate(-45deg);
	}
	
	@media screen and (max-width: 600px) {
		
	  .modal-id_inner {
	  	margin-top:40px;
		width: 50%;
		height: 30%;
		box-sizing: border-box;
		vertical-align: middle;
	  }
	}
	
	
	
	
	
	
	.modal-pass {
	opacity: 0;
	visibility: hidden;
	position: fixed;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	text-align: left;
	background: rgba(0,0,0, .6);
	transition: opacity .25s ease;
	}
	.modal-pass_bg {
		position: absolute;
		top: 0;
		right: 0;
		bottom: 0;
		left: 0;
		cursor: pointer;
	}
	.modal-pass-state {
		display: none;
	}
	.modal-pass-state:checked + .modal-pass {
		opacity: 1;
		visibility: visible;
	}
	
	.modal-pass-state:checked + .modal-pass .modal-pass__inner {
		top: 0;
	}
	
	.modal-pass_inner {
		transition: top .25s ease;
		position: absolute;
		top: -20%;
		right: 0;
		bottom: 0;
		left: 0;
		width: 50%;
		margin: auto;
		overflow: auto;
		background: #fff;
		border-radius: 5px;
		padding: 1em 2em;
		height: 20%;
	}
	
	.modal-pass_close {
		position: absolute;
		right: 1em;
		top: 1em;
		width: 1.1em;
		height: 1.1em;
		cursor: pointer;
	}
	
	.modal-pass_close:after,
	.modal-pass_close:before {
		content: '';
		position: absolute;
		width: 2px;
		height: 1.5em;
		background: #ccc;
		display: block;
		transform: rotate(45deg);
		left: 50%;
		margin: -3px 0 0 -1px;
		top: 0;
	}
	
	.modal-pass_close:hover:after,
	.modal-pass_close:hover:before {
		background: #aaa;
	}
	
	.modal-pass_close:before {
		transform: rotate(-45deg);
	}
	
	@media screen and (max-width: 600px) {
		
	  .modal-pass_inner {
	  	margin-top:40px;
		width: 50%;
		height: 30%;
		box-sizing: border-box;
		vertical-align: middle;
	  }
	}
	
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div align="center" class="mifh">
		<img src="${contextPath }/resources/images/logo.png" style="width:70px;height:26px; margin-top:20px;"/>
	</div>

	<h1 align="center">이메일 / 비밀번호 찾기</h1>
	<hr>
	
	
	
	
	<h2 align="center">이메일 찾기</h2><br><br>
	<div class="idArea">
		<label for="inputId" class="col-lg-2 control-label">이름</label>
         <div class="col-lg-10">
              <input type="text" class="form-control" name="name" id="name" data-rule-required="true" placeholder="가입시 사용한 이름을 입력하세요" maxlength="20">
         </div>
         <br><br>
         <label for="inputPhoneNumber" class="col-lg-2 control-label">휴대폰 번호</label>
           <div class="col-lg-10">
               <input type="tel" class="form-control onlyNumber" name="phone" id="phone" data-rule-required="true" placeholder="-를 제외하고 숫자만 입력하세요." maxlength="20">
           </div>
           <br><br><br>
       	  <div align="center">
	       	  <label class="btn_label idBtn btn btn-default" for="open-pop" onclick="searchEmail();">이메일 찾기</label>
    	   	  <label class="btn_label btn btn-default">메인으로 돌아기기</label>
       	  </div>
	</div>
	<br><br><br><br>
	<hr>	
	<h2 align="center">비밀번호 찾기</h2><br><br>
	<div class="passArea">
		<label for="inputId" class="col-lg-2 control-label">이메일</label>
         <div class="col-lg-10">
              <input type="text" class="form-control" name="email" id="email" data-rule-required="true" placeholder="30자이내의 알파벳, 언더스코어(_), 숫자만 입력 가능합니다." maxlength="30">
         </div>
         <br><br>
         <label for="inputPhoneNumber" class="col-lg-2 control-label">휴대폰 번호</label>
           <div class="col-lg-10">
               <input type="tel" class="form-control onlyNumber" name="phone2" id="phone2" data-rule-required="true" placeholder="-를 제외하고 숫자만 입력하세요." maxlength="11">
           </div>
           <br><br><br>
           <div align="center">
       	   <label class="btn_label passBtn btn btn-default" for="open-pop2" onclick="searchPwd();">비밀번호 찾기</label>
       	   <label class="btn_label btn btn-default">메인으로 돌아가기</label>
           
           </div>
	</div>
	
<br><br><hr>

	<script>
		function searchEmail(){
				var name = $("#name").val();
				var phone = $("#phone").val();
				var email = null;
				$.ajax({
					url:"findEmail.me",
					type:"post",
					data:{name:name, phone:phone},
					success:function(data){
						email = data.Member.email;
						
						if(!email){
							$("#findEmail").html("가입된 Email이 없습니다.");
						}else{
							$("#findEmail").html("가입하신 Email은"+"<a href='#'>"+ email +"</a>" + "입니다.");
							
						}
						
					}
				});
				return false;
		}
		
		function searchPwd(){
			
			var email = $("#email").val();
			var phone = $("#phone2").val();
			
			$.ajax({
				url:"searchPwd.me",
				type:"post",
				data:{email:email, phone:phone},
				success:function(data){
					
					console.log(data);
					
					$("#findPassword").text(data.Message);
					
					
				}
			});
			return false;
		}
		
		
	
	</script>


	<input class="modal-id-state" id="open-pop" type="checkbox" />
		<div class="modal-id">
			<label class="modal-id_bg" for="open-pop"></label>
			<div class="modal-id_inner" align="center">
				<label class="modal-id_close" for="open-pop"></label>
				<h2 style="padding-bottom: 40px;">아이디 확인</h2>
				
				<h3 id="findEmail" style="vertical-align: middle;"> </h3>
				
			</div>
		</div>
		
	
	<input class="modal-pass-state" id="open-pop2" type="checkbox" />
		<div class="modal-pass">
			<label class="modal-pass_bg" for="open-pop2"></label>
			<div class="modal-pass_inner" align="center">
				<label class="modal-pass_close" for="open-pop2"></label>
				<h2 style="padding-bottom: 40px;">비밀번호확 확인</h2>
				
				<h3 id="findPassword" style="vertical-align: middle;"></h3>
				
			</div>
		</div>






	
	
	


</body>
</html>






