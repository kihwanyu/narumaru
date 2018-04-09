<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<style>
	* {
		font-family: 'Nanum Gothic', sans-serif;
		font-weight: bold;
    }
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
	
	
	.modal {
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
  		z-index:100;
	}
	.modal_bg {
  		position: absolute;
  		top: 0;
  		right: 0;
  		bottom: 0;
  		left: 0;
  		cursor: pointer;
	}
	.modal-state {
	  	display: none;
	}
	.modal-state:checked + .modal {
  		opacity: 1;
  		visibility: visible;
	}

.modal-state:checked + .modal .modal__inner {
  top: 0;
}

.modal_inner {
  transition: top .25s ease;
  position: absolute;
  top: -10%;
  right: 0;
  bottom: 0;
  left: 0;
  width: 30%;
  margin: auto;
  overflow: auto;
  background: #fff;
  border-radius: 5px;
  padding: 1em 2em;
  height: 60%;
}

.modal_close {
  position: absolute;
  right: 1em;
  top: 1em;
  width: 1.1em;
  height: 1.1em;
  cursor: pointer;
}

.modal_close:after,
.modal_close:before {
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

.modal_close:hover:after,
.modal_close:hover:before {
  background: #aaa;
}

.modal_close:before {
  transform: rotate(-45deg);
}

@media screen and (max-width: 768px) {
	
.modal_inner {
    width: 90%;
    height: 90%;
    box-sizing: border-box;
  }
}

.btn_label {
  cursor: pointer;
  background: #27ae60;
  display: inline-block;
  padding: .5em 1em;
  color: #fff;
  border-radius: 3px;
}
.btn_label:hover,
.btn_label:focus {
  background: #2ecc71;
}
.row{
	height:60px;
}
.modal-leftlabel{
	float:left; 
	top:2.5px;
	position:relative;
	font-size:1em;
}
.row select{
	float:right; 
	width:80%; 
	height:30px;
}
#pointLabel{
	position:relative;
	width:15%; 
	height:26px;
	text-align:center;
	vertical-align:middle; 
	border:1px solid #a9a9a9;
	border-left:0px;
	float:right;
	background:lightgray;
}
</style>
</head>
<body style="background:white;">
	<jsp:include page="../common/topmenu.jsp"/>
	<div class="maru-content">
		<div class="board-option" align="center">
			<span>여기에 볼드랑 뭐랑 이것저것 들어갈걸</span>
			&nbsp;
			<label class="btn btn_label" for="open-pop" onclick="checkHidden()">123</label>
		</div>
		<br>
		<div class="board-div">
			<div class="board-inner">
				<b><input type="text" id="title-area" maxlength="50" placeholder="제목 없음"></b>
				<div id="content-area">
					<textarea onkeydown="resize(this)" id="content"></textarea>
				</div>
				<div id="payline">
				$ 결제선 ㅡ 아래쪽에 유료 컨텐츠를 작성하세요
				</div>
				<div id="hidden-content-area">
					<textarea onkeydown="resize(this)" id="hidden-content"></textarea>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 이하 모달창 (작성하기 버튼) -->
	<input class="modal-state" id="open-pop" type="checkbox" /> <!-- 안보이는 체크박스, 이게 체크되면 모달창이 나옴 -->
	<div class="modal">
		<label class="modal_bg" for="open-pop"></label>
		<div class="modal_inner">
			<div class="row">
				<label class="modal_close" for="open-pop"></label>
			</div>
			<div class="row">
				<label class="modal-leftlabel">카테고리</label>
				<select>
					<option>선택 안 함</option>
					<option>카테고리1</option>
					<option>카테고리2</option>
				</select>
			</div>
			<div class="row">
				<label class="modal-leftlabel">채널 선택</label>
				<select>
					<option>선택 안 함</option>
					<option>문화/예술</option>
					<option>여행</option>
					<option>패션/뷰티</option>
				</select>
			</div>
			<div class="row" id="payamount">
				<label class="modal-leftlabel">판매가격</label>
				
				<label id="pointLabel" style="padding-top:3px;">포인트</label>
				<input type="number" value="100" min="100" step="100" style="width:64.2%; float:right; height:25px;"/>
				<label style="color:gray; font-size:10px; float:right;">이 항목은 결제선 아래에 작성한 글이 있을 때만 표시됩니다.</label>
			</div>
			<div class="row">
				<label class="modal-leftlabel">공개설정</label>
				<ul style="margin-left:55px;">
					<li><input type="radio" name="openLevel" id="open1" value="open"><label for="open1">전체 공개</label></li>
					<li><input type="radio" name="openLevel" id="open2" value="noopen"><label for="open2">비공개</label></li>
				</ul>
			</div>
			<div class="row" style="border-bottom:1px solid lightgray;">
				<label class="modal-leftlabel">댓글 권한</label>
				<ul style="margin-left:55px;">
					<li><input type="radio" name="replyLevel" id="replylevel1" value="all"><label for="replylevel1">제한 없음</label></li>
					<li><input type="radio" name="replyLevel" id="replylevel2" value="buyer"><label for="replylevel2">구매자만</label></li>
				</ul>
			</div>
			<div class="row" style="padding-top:15px;">
				<label class="btn_label" style=" float:left;" style="background:lightgray;">취소</label>
				<label class="btn_label" style="float:right;">작성하기</label>
			</div>
	 	 </div>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script>
		/* $(function(){
			$("#payamount").css({'display':'none'});
		}) */
		//엔터키 누를때 텍스트에어리어 사이즈 자동 조절
		function resize(obj) {
		  obj.style.height = "1px";
		  obj.style.height = (12+obj.scrollHeight)+"px";
		}
		function checkHidden(){
			var comment = $.trim($('#hidden-content').val());
			
			console.log(comment);
			
			if(comment.length == 0){
				$("#payamount").css({'display':'none'});
			}else{
				$("#payamount").css({'display':''});
			}
		}
  </script>
	
</body>
</html>