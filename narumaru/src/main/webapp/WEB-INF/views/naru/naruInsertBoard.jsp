<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="resources/css/naruInsertBoard.css">
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet"/>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet"/>
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/lang/summernote-ko-KR.js"></script>
<style>
	.btn btn-info{
		height:40px;
	}

</style>
</head>
<body style="background:white;">
	<jsp:include page="../common/topmenu.jsp"/>
	<form action="insertNarumaruBoard.nm" method="post" id="insertForm">
		<input type="hidden" name="nmno" value="${nmno}">
		<div class="maru-content">
			<div class="board-option" align="center">
				<label class="btn btn-info" for="open-pop" onclick="checkHidden()">작성하기</label>
			</div>
			<br>
			<div class="board-div">
				<div class="board-inner">
					<b><input type="text" name="boardTitle" id="title-area" maxlength="50" placeholder="제목 없음" style="margin-bottom:10px;"></b>
					<div id="content-area">
						<textarea class="summernote" id="boardContent" name="boardContent"></textarea>
					</div>
					<div id="payline">
					$ 결제선 ㅡ 아래쪽에 유료 컨텐츠를 작성하세요
					</div>
					<div id="hidden-content-area">
						<textarea name="boardHidden" onkeydown="resize(this)" id="hidden-content"></textarea>
					</div>
				</div>
			</div>
		</div>
	
	
		<!-- 이하 모달창 (작성하기 버튼) -->
		<input class="modal-state" id="open-pop" type="checkbox" /> <!-- 안보이는 체크박스, 이게 체크되면 모달창이 나옴 -->
		<div class="modal1" style="font-size:0.9em;">
			<label class="modal_bg" for="open-pop"></label>
			<div class="modal_inner">
				<div class="row">
					<h2>게시글 작성</h2>
					<label class="modal_close" for="open-pop"></label>
				</div>
				<div class="row">
					<label class="modal-leftlabel">카테고리&nbsp;</label>
					<select name="category" id="category">
						<option value="0">미분류</option>
					</select>
				</div>
				<div class="row">
					<label class="modal-leftlabel">채널 선택</label>
					<select name="channel" id="channel">
						<option value="0">미분류</option>
					</select>
				</div>
				<div class="row" id="payamount">
					<label class="modal-leftlabel">판매 가격</label>
					
					<label id="pointLabel">포인트</label>
					<input name="needPoint" type="number" value="100" min="100" step="100" style="width:64.2%; float:right; height:25px;"/>
					<label style="color:gray; font-size:10px; float:right; margin-right:0;">이 항목은 결제선 아래에 작성한 글이 있을 때만 표시됩니다.</label>
				</div>
				<div class="row">
					<label class="modal-leftlabel">공개 설정</label>
					<ul>
						<li><input type="radio" name="openLevel" id="open1" value="open" checked><label for="open1">전체 공개</label>　<input type="radio" name="openLevel" id="open2" value="noopen"><label for="open2">비공개</label></li>
					</ul>
				</div>
				<div class="row" style="border-bottom:1px solid lightgray;">
					<label class="modal-leftlabel">댓글 권한</label>
					<ul>
						<li><input type="radio" name="replyCondition" id="replylevel1" value="all" checked><label for="replylevel1">제한 없음</label>　<input type="radio" name="replyCondition" id="replylevel2" value="buyer"><label for="replylevel2">구매자만</label></li>
					</ul>
				</div>
				<div class="row" style="padding-top:15px;">
					<label class="btn btn-info" for="open-pop" style="float:left; background:lightgray; margin-left:20px;">취소</label>
					<label onclick="submitBtn()" class="btn btn-info" style="float:right; margin-right:20px;">작성하기</label>
				</div>
		 	 </div>
		</div>
	</form>
	<link rel="stylesheet" type="text/css" href="resources/css/naruInsertBoard.css">
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet"/>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet"/>
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/lang/summernote-ko-KR.js"></script>
	<script>
		function submitBtn(){
			$("#insertForm").submit();
		}
	
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

  		function summernote() {
  		  $('.summernote').summernote({
  			  lang: 'ko-KR',
  			  toolbar: [
  				    ['style', ['bold', 'italic', 'underline', 'clear']],
  				    ['fontsize', ['fontsize']],
  				    ['color', ['color']],
  				    ['para', ['ul', 'ol', 'paragraph']],
  				    ['Insert',['picture'], ['video']],
  				    ['mybutton', ['submit']]
  				  ]
  		  });
  		}
  		
  </script>
  <script>
  	$(function(){
  		summernote();
  		
  		//카테고리랑 채널 불러오기
  		$.ajax({
			url:"selectChannelList.nm",
			type:"get",
			success:function(data){
				$("#channel option:not(option:eq(0))").remove();
				
				for(var i in data){
					$("#channel").append("<option value='" + data[i].cno +"'>" + data[i].cname + "</option>")
				}
			},
			error:function(data){
				console.log("채널 로딩 실패");
			}			
		});
  		
  		$.ajax({
			url:"selectCategoryList.na",
			type:"get",
			data:{"nmno":${nm.nmno}},
			success:function(data){
				$("#category option:not(option:eq(0))").remove();
				
				for(var i in data){
					$("#category").append("<option value='" + data[i].cano +"'>" + data[i].caName + "</option>")
				}
			},
			error:function(data){
				console.log("카테고리 불러오기 실패")
			}			
		});
  		
		// 수정 - 기본버튼
		$(".modify-basic").click(function(){
			$("#modal_default").css("display","");
			$("#modal_theme").css("display","none");
			$("#modal_category").css("display","none");
			$("#modal_neighbor").css("display","none");
		})
		
		// 수정 - 테마버튼
		$(".modify-theme").click(function(){
			$("#modal_default").css("display","none");
			$("#modal_theme").css("display","");
			$("#modal_category").css("display","none");
			$("#modal_neighbor").css("display","none");
		})
		
		// 수정 - 카테고리버튼
		$(".modify-category").click(function(){
			$("#modal_default").css("display","none");
			$("#modal_theme").css("display","none");
			$("#modal_category").css("display","");
			$("#modal_neighbor").css("display","none");
		})
		
		// 카테고리 - 카테고리 추가 버튼
		$("#addCateBtn").click(function(){
			$("#modal_category").append("<div class='row' style='height:50px;'><input type='text' value='' id='addedCategory'><span id='categoryDelete'></span></div>");
		})
		
		// 수정 - 이웃버튼
		$(".modify-neighbor").click(function(){
			$("#modal_default").css("display","none");
			$("#modal_theme").css("display","none");
			$("#modal_category").css("display","none");
			$("#modal_neighbor").css("display","");
		})
	})
  </script>
	
</body>
</html>