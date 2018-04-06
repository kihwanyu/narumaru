<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.maru-content{
		height:56px;
		background-color:white;
		align:center;
		margin-top:50px;
	}
	.maru-content span{
		font-size: 16px;
		line-height: 50px;
		padding:15px 15px;
		color:#757575;
	}
	.maru-content span:hover{
		color:#6666ff;
		border-bottom:2px solid;
	}
	.board-div{
		width:100%;
		height:100%;
		margin-top:50px;
	}
	.board-inner{
		width:700px;
		height:100%;
		margin:0 auto;
		padding-top:10px;
	}
	#title-area{
		width:100%;
		line-height: 54px;
	    font-size: 30px;
	    font-weight: 400;
	    border: none;
	    border-bottom: 1px solid #ccc;
	    padding: 0;
	    background: 0 0;
	    color: #333;
	}
	#title-area::placeholder{
		color:black;
		font-weight:bold;
	}
	textarea.autosize { min-height: 50px; }
	#content-area textarea{
		width:100%;
		resize:none;
		font-size:1.3em;
		border:0px;
		padding:10px;
		padding-left:0px;
		overflow-y: hidden;
	}
	#hidden-content-area textarea{
		width:100%;
		resize:none;
		font-size:1.3em;
		border:0px;
		padding:10px;
		padding-left:0px;
		overflow-y: hidden;
	}
	*:focus{
		outline:none;
	}
	#payline{
		width:100%;
		height:30px;
		background:#808088;
		border-radius:5px;
		color:white;
		text-align:center;
		vertical-align:middle;
		padding-top:5px;
	}
	.board-option{
		border-top:1px solid lightgray;
		border-bottom:1px solid lightgray;
		position:fixed;
		background:white;
		z-index:1;
		width:100%;
	}
</style>
</head>
<body style="background:white;">
	<jsp:include page="../common/topmenu.jsp"/>
	<div class="maru-content">
		<div class="board-option" align="center">
			<span>여기에 볼드랑 뭐랑 이것저것 들어갈걸</span>
		</div>
		<br>
		<div class="board-div">
			<div class="board-inner">
				<b><input type="text" id="title-area" maxlength="50" placeholder="제목 없음"></b>
				<div id="content-area">
					<textarea onkeydown="resize(this)"></textarea>
				</div>
				<div id="payline">
				$ 결제선 ㅡ 아래쪽에 유료 컨텐츠를 작성하세요
				</div>
				<div id="hidden-content-area">
					<textarea onkeydown="resize(this)"></textarea>
				</div>
			</div>
		</div>
	</div><!-- 채널 종류 -->
	
	
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script>
		function resize(obj) {
		  obj.style.height = "1px";
		  obj.style.height = (12+obj.scrollHeight)+"px";
		}
  </script>
	
</body>
</html>