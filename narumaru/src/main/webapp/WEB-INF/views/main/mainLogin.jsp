<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Roboto:300,400' rel='stylesheet' type='text/css'>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/paper.js/0.11.5/paper-full.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<html>
<head>
<style>
$theme-signup: #03A9F4;
$theme-signup-darken: #0288D1;
$theme-signup-background: #2C3034;
$theme-login: #673AB7;
$theme-login-darken: #512DA8;
$theme-login-background: #f9f9f9;
$theme-dark: #212121;
$theme-light: #e3e3e3;
$font-default: 'Roboto', sans-serif;

	body {
	  margin: 0;
	  height: 100%;
	  overflow: hidden;
	  width: 100% !important;
	  box-sizing: border-box;
	  font-family: $font-default;
	}
	
	* {
            font-family: 'Nanum Gothic', sans-serif;
            font-weight: bold;
         }
         
    h2{
    	 font-family: 'Nanum Gothic', sans-serif;
            font-weight: bold;
    }
	
	.backRight {
	  position: absolute;
	  right: 0;
	  width: 50%;
	  height: 100%;
	  background: #8C8E8D;
	}
	
	.backLeft {
	  position: absolute;
	  left: 0;
	  width: 50%;
	  height: 100%;
	  background: #F7EEE7;
	}
	
	#back {
	  width: 100%;
	  height: 100%;
	  position: absolute;
	  z-index: -999;
	}
	
	.canvas-back {
	  position: absolute;
	  top: 0;
	  left: 0;
	  width: 100%;
	  height: 100%;
	  z-index: 10;
	}
	
	#slideBox {
	  width: 50%;
	  max-height: 100%;
	  height: 100%;
	  overflow: hidden;
	  margin-left: 50%;
	  position: absolute;
	  box-shadow: 0 14px 28px rgba(0,0,0,0.25), 0 10px 10px rgba(0,0,0,0.22);
	}
	
	.topLayer {
	  width: 200%;
	  height: 100%;
	  position: relative;
	  left: 0;
	  left: -100%;
	}
	
	label {
	  font-size: 0.8em;
	  text-transform: uppercase;
	}
	
	input {
	  background-color: white;
	  border: 0;
	  outline: 0;
	  font-size: 1em;
	  padding: 8px 1px;
	  margin-top: 0.1em;
	}
	
	.left {
	  width: 50%;
	  height: 100%;
	  overflow: scroll;
	  background: $theme-signup-background;
	  left: 0;
	  position: absolute;
	  label {
	    color: $theme-light;
	  }
	  input {
	  	
	    border-bottom: 1px solid $theme-light;
	    color: $theme-light;
	    &:focus, &:active {
	      border-color: $theme-signup;
	      color: $theme-signup;
	    }
	    &:-webkit-autofill {
	      -webkit-box-shadow: 0 0 0 30px $theme-signup-background inset;
	      -webkit-text-fill-color: $theme-light;
	    }
	  }
	  a {
	    color: $theme-signup;
	  }
	}
	
	.right {
	  width: 50%;
	  height: 100%;
	  overflow: scroll;
	  background: lightgray;
	  right: 0;
	  position: absolute;
	  label {
	    color: $theme-dark;
	  }
	  input {
	    border-bottom: 1px solid $theme-dark;
	    &:focus, &:active {
	      border-color: $theme-login;
	    }
	    &:-webkit-autofill {
	      -webkit-box-shadow: 0 0 0 30px $theme-login-background inset;
	      -webkit-text-fill-color: $theme-dark;
	    }
	  }
	}
	
	.content {
	  display: flex;
	  flex-direction: column;
	  justify-content: center;
	  min-height: 100%;
	  width: 80%;
	  margin: 0 auto;
	  position: relative;
	}
	
	.content h2 {
	  font-weight: 300;
	  font-size: 2.6em;
	  margin: 0.2em 0 0.1em;
	}
	
	.left .content h2 {
	  color: $theme-signup;
	}
	
	.right .content h2 {
	  color: $theme-login;
	}
	
	.form-element {
	  margin: 1.6em 0;
	  &.form-submit {
	    margin: 1.6em 0 0;
	  }
	}
	
	.form-stack {
	  display: flex;
	  flex-direction: column;
	}
	
	.checkbox {
	  -webkit-appearance: none;
	  outline: none;
		background-color: $theme-light;
		border: 1px solid $theme-light;
		box-shadow: 0 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05);
		padding: 12px;
		border-radius: 4px;
		display: inline-block;
		position: relative;
	}
	.checkbox:focus, .checkbox:checked:focus,
	.checkbox:active, .checkbox:checked:active {
	  border-color: $theme-signup;
		box-shadow: 0 1px 2px rgba(0,0,0,0.05), inset 0px 1px 3px rgba(0,0,0,0.1);
	}
	
	.checkbox:checked {
	  outline: none;
		box-shadow: 0 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05), inset 15px 10px -12px rgba(255,255,255,0.1);
	}
	
	.checkbox:checked:after {
	  outline: none;
		content: '\2713';
	  color: $theme-signup;
		font-size: 1.4em;
	  font-weight: 900;
		position: absolute;
		top: -4px;
		left: 4px;
	}
	
	.form-checkbox {
	  display: flex;
	  align-items: center;
	  
	  label {
	    margin: 0 6px 0;
	    font-size: 0.72em;
	  }
	}
	
	button {
	  background:pink;
	  padding: 0.8em 1.2em;
	  margin: 0 10px 0 0;
	  width: auto;
	  font-weight: 600;
	  text-transform:  uppercase;
	  font-size: 1em;
	  color: #fff;
	  line-height: 1em;
	  letter-spacing: 0.6px;
	  border-radius: 4px;
	  box-shadow: 0 2px 6px rgba(0,0,0,0.1), 0 3px 6px rgba(0,0,0,0.1);
	  border: 0;
	  outline: 0;
	  transition: all 0.25s;
	  &.signup {
	    background:pink;
	  }
	  &.login {
	    background:pink;
	  }
	  &.off {
	    background: none;
	    box-shadow: none;
	    margin: 0;
	    
	    &.signup {
	      color: $theme-signup;
	    }
	    &.login {
	      color: $theme-login;
	    }
	  }
	}
	
	button:focus, button:active, button:hover {
	  box-shadow: 0 4px 7px rgba(0,0,0,0.1), 0 3px 6px rgba(0,0,0,0.1);
	  &.signup {
	    background: $theme-signup-darken;
	  }
	  &.login {
	    background: $theme-login-darken;
	  }
	  &.off {
	    box-shadow: none;
	    &.signup {
	      color: $theme-signup;
	      background: $theme-dark;
	    }
	    &.login {
	      color: $theme-login-darken;
	      background: $theme-light;
	    }
	  }
	}
	
	@media only screen and (max-width: 768px) {
	  #slideBox {
	    width: 80%;
	    margin-left: 20%;
	  }
	  .signup-info, .login-info {
	    display: none;
	  }
	}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div id="back">
  <canvas id="canvas" class="canvas-back"></canvas>
  <div class="backRight">    
  </div>
  <div class="backLeft">
  </div>
</div>


	<div id="slideBox">
	  <div class="topLayer">
	    <div class="left">
	      <div class="content">
	        <h2>회원가입</h2>
	        <form action="insertMember.me" method="post"><!--  onsubmit="return false;" -->
	          <div class="form-element form-stack">
				  
				  <a id="kakao-login-btn"></a>
			    	<a href="http://developers.kakao.com/logout"></a>
				    <script type='text/javascript'>
						  //<![CDATA[
						    // 사용할 앱의 JavaScript 키를 설정해 주세요.
						    Kakao.init('8cdd2bce65bbe02b9ed32992538361cc');
						    // 카카오 로그인 버튼을 생성합니다.
						    Kakao.Auth.createLoginButton({
						      container: '#kakao-login-btn',
						      success: function(authObj) {
						        // 로그인 성공시, API를 호출합니다.
						        Kakao.API.request({
						          url: '/v1/user/me',
						          success: function(res) {
						            console.log(JSON.stringify(res));
						            
						            var email = res.kaccount_email;
						            var nickName = res.properties.nickname;
						            console.log(email);
						            console.log(nickName);
									
						            location.href='${contextPath}/kakaoLogin.me?email='+email+'&nickname='+nickName;
						            
						          },
						          fail: function(error) {
						            alert(JSON.stringify(error));
						          }
						        });
						      },
						      fail: function(err) {
						        alert(JSON.stringify(err));
						      }
						    });
						  //]]>
						</script>
				  
				  
				  
				  
				
				  
				  
	          </div>
	          <div class="form-element form-stack">
	           <%
				    String clientId = "X5Nvd2AMVmO6GqWemA5v";//애플리케이션 클라이언트 아이디값";
				    String redirectURI = URLEncoder.encode("http://127.0.0.1:8011/narumaru/naverCallback.me", "UTF-8");
				    SecureRandom random = new SecureRandom();
				    String state = new BigInteger(130, random).toString();
				    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
				    apiURL += "&client_id=" + clientId;
				    apiURL += "&redirect_uri=" + redirectURI;
				    apiURL += "&state=" + state;
				    session.setAttribute("state", state);
				 %>
			  <a href="<%=apiURL%>"><img height="50" src="http://static.nid.naver.com/oauth/small_g_in.PNG"/></a>
	            
	          </div>
	          <div class="form-element form-stack">
	            <label for="password-signup" class="form-label">비밀번호</label>
	            <input id="password-signup" type="password" name="password" value="asdf">
	          </div>
	          
	          <div class="form-element form-checkbox">
	            <input id="confirm-terms" type="checkbox" name="confirm" value="yes" class="checkbox">
	            <label for="confirm-terms"><a href="#">서비스 약관</a> 및 <a href="#">개인정보 정책</a></label>
	          </div>
	          <div class="form-element form-submit">
	            <button id="signUp" class="signup" type="submit" name="signup">회원가입</button>
	            <button id="goLeft" class="signup off" type="button">로그인</button> 
	          </div>
	        </form>
	      </div>
	    </div>
	    <div class="right">
	      <div class="content">
	        <h2>로그인</h2>
	        <form action="login.me" method="post">
	          <div class="form-element form-stack">
	            <label for="username-login" class="form-label">이메일</label>
	            <input id="username-login" type="text" name="email" value="pogonon@naver.com">
	          </div>
	          <div class="form-element form-stack">
	            <label for="password-login" class="form-label">비밀번호</label>
	            <input id="password-login" type="password" name="userPwd" value="asdf">
	          </div>
	          <div class="form-element form-submit">
	            <button id="logIn" class="login" type="submit" name="login">로그인</button>
	            <button id="goRight" class="login off" name="signup" type="button">회원가입</button>
	            <button id="goFind" class="login off" name="findId" type="button">아이디/비밀번호찾기</button>
	          </div>
	        </form>
	      </div>
	    </div>
	  </div>
	</div>
	
	
	<script>
	
		$(function(){
			$("#goFind").click(function(){
				location.href="${contextPath}/findMember.me";				
				
			});
		});
	
		$(document).ready(function(){
			  $('#goRight').on('click', function(){
			    $('#slideBox').animate({
			      'marginLeft' : '0'
			    });
			    $('.topLayer').animate({
			      'marginLeft' : '100%'
			    });
			  });
			  $('#goLeft').on('click', function(){
			    if (window.innerWidth > 769){
			      $('#slideBox').animate({
			        'marginLeft' : '50%'
			      });
			    }
			    else {
			      $('#slideBox').animate({
			        'marginLeft' : '20%'
			      });
			    }
			    $('.topLayer').animate({
			      'marginLeft': '0'
			    });
			  });
			});
	
			/* ====================== *
			 *  Initiate Canvas       *
			 * ====================== */
			paper.install(window);
			paper.setup(document.getElementById("canvas"));
	
			// Paper JS Variables
			var canvasWidth, 
			    canvasHeight,
			    canvasMiddleX,
			    canvasMiddleY;
	
			var shapeGroup = new Group();
	
			var positionArray = [];
	
			function getCanvasBounds() {
			  // Get current canvas size
			  canvasWidth = view.size.width;
			  canvasHeight = view.size.height;
			  canvasMiddleX = canvasWidth / 2;
			  canvasMiddleY = canvasHeight / 2;
			  // Set path position
			  var position1 = {
			    x: (canvasMiddleX / 2) + 100,
			    y: 100, 
			  };
	
			  var position2 = {
			    x: 200,
			    y: canvasMiddleY, 
			  };
	
			  var position3 = {
			    x: (canvasMiddleX - 50) + (canvasMiddleX / 2),
			    y: 150, 
			  };
	
			  var position4 = {
			    x: 0,
			    y: canvasMiddleY + 100, 
			  };
	
			  var position5 = {
			    x: canvasWidth - 130,
			    y: canvasHeight - 75, 
			  };
	
			  var position6 = {
			    x: canvasMiddleX + 80,
			    y: canvasHeight - 50, 
			  };
			  
			  var position7 = {
			    x: canvasWidth + 60,
			    y: canvasMiddleY - 50, 
			  };
			  
			  var position8 = {
			    x: canvasMiddleX + 100,
			    y: canvasMiddleY + 100, 
			  };
	
			  positionArray = [position3, position2, position5, position4, position1, position6, position7, position8];
			  };
	
	
			/* ====================== *
			 * Create Shapes          *
			 * ====================== */
			function initializeShapes() {
			  // Get Canvas Bounds
			  getCanvasBounds();
	
			  var shapePathData = [
			    'M231,352l445-156L600,0L452,54L331,3L0,48L231,352', 
			    'M0,0l64,219L29,343l535,30L478,37l-133,4L0,0z', 
			    'M0,65l16,138l96,107l270-2L470,0L337,4L0,65z',
			    'M333,0L0,94l64,219L29,437l570-151l-196-42L333,0',
			    'M331.9,3.6l-331,45l231,304l445-156l-76-196l-148,54L331.9,3.6z',
			    'M389,352l92-113l195-43l0,0l0,0L445,48l-80,1L122.7,0L0,275.2L162,297L389,352',
			    'M 50 100 L 300 150 L 550 50 L 750 300 L 500 250 L 300 450 L 50 100',
			    'M 700 350 L 500 350 L 700 500 L 400 400 L 200 450 L 250 350 L 100 300 L 150 50 L 350 100 L 250 150 L 450 150 L 400 50 L 550 150 L 350 250 L 650 150 L 650 50 L 700 150 L 600 250 L 750 250 L 650 300 L 700 350 '
			  ];
	
			  for (var i = 0; i <= shapePathData.length; i++) {
			    // Create shape
			    var headerShape = new Path({
			      strokeColor: 'rgba(255, 255, 255, 0.5)',
			      strokeWidth: 2,
			      parent: shapeGroup,
			    });
			    // Set path data
			    headerShape.pathData = shapePathData[i];
			    headerShape.scale(2);
			    // Set path position
			    headerShape.position = positionArray[i];
			  }
			};
	
			initializeShapes();
	
			/* ====================== *
			 * Animation              *
			 * ====================== */
			view.onFrame = function paperOnFrame(event) {
			  if (event.count % 4 === 0) {
			    // Slows down frame rate
			    for (var i = 0; i < shapeGroup.children.length; i++) {
			      if (i % 2 === 0) {
			        shapeGroup.children[i].rotate(-0.1);
			      } else {
			        shapeGroup.children[i].rotate(0.1);
			      }
			    }
			  }
			};
	
			view.onResize = function paperOnResize() {
			  getCanvasBounds();
	
			  for (var i = 0; i < shapeGroup.children.length; i++) {
			    shapeGroup.children[i].position = positionArray[i];
			  }
	
			  if (canvasWidth < 700) {
			    shapeGroup.children[3].opacity = 0;
			    shapeGroup.children[2].opacity = 0;
			    shapeGroup.children[5].opacity = 0;
			  } else {
			    shapeGroup.children[3].opacity = 1;
			    shapeGroup.children[2].opacity = 1;
			    shapeGroup.children[5].opacity = 1;
			  }
			};
	</script>

</body>
</html>