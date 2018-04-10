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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
<style>
	#searchTopMaru span{
		float:left; 
		top:16px; 
		position:relative;
	}
</style>
</head>
<body style="background:white;">
	<jsp:include page="../common/topmenu.jsp"/>
	<div class="maru-content">
		<div class="board-option" align="center">
			<span>여기에 볼드랑 뭐랑 이것저것 들어갈걸</span>
			&nbsp;
			<label class="btn_label" for="open-pop" onclick="checkHidden()">작성하기</label>
			<label class="btn_label" for="open-pop2">나루 관리</label>
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
	
	<!-- 이하 모달창(나루 관리) -->
	<input class="modal-state2" id="open-pop2" type="checkbox" /> <!-- 안보이는 체크박스, 이게 체크되면 모달창이 나옴 -->
	<div class="modal2" style="font-size:0.9em;">
		<label class="modal_bg" for="open-pop2"></label>
		<!-- 기본 -->
		<div class="modal_inner" id="modal_default">
			<div class="row">
				<label class="btn_label modify-basic"><b>기본</b></label>
				<label class="btn_label modify-theme">테마</label>
				<label class="btn_label modify-category">카테고리</label>
				<label class="btn_label modify-neighbor">이웃</label>
				<label class="modal_close" for="open-pop2"></label>
			</div>
			<div class="row">
				<label class="modal-leftlabel">나루 대표사진</label>
				<input type="file" style="width:70%; float:right;">
			</div>
			<div class="row">
				<label class="modal-leftlabel">나루 제목</label>
				<input type="text" style="width:79.1%; float:right; height:25px;">
			</div>
			<div class="row">
				<label class="modal-leftlabel">소개 문구</label>
				<textarea style="width:78.7%; float:right; height:40px; resize:none;"></textarea>
			</div>
	 	</div>
	 	<!-- 테마  -->
	 	<div class="modal_inner" id="modal_theme" style="display:none;">
			<div class="row">
				<label class="btn_label modify-basic">기본</label>
				<label class="btn_label modify-theme"><b>테마</b></label>
				<label class="btn_label modify-category">카테고리</label>
				<label class="btn_label modify-neighbor">이웃</label>
				<label class="modal_close" for="open-pop2"></label>
			</div>
			<div class="row">
				<label class="modal-leftlabel">테마 색상</label>
				<select>
					<option>기본</option>
					<option>구매한 색상1</option>
					<option>구매한 색상2</option>
				</select>
			</div>
			<div class="row">
				<label class="modal-leftlabel">폰트</label>
				<select style="margin-left:31px;">
					<option>기본</option>
					<option>구매한 폰트1</option>
					<option>구매한 폰트22</option>
				</select>
			</div>
			<div class="row">
				<label class="modal-leftlabel">소개 문구</label>
				<textarea style="width:78.7%; float:right; height:40px; resize:none;"></textarea>
			</div>
	 	 </div>
	 	 <!-- 카테고리 -->
	 	 <div class="modal_inner" id="modal_category" style="display:none;">
			<div class="row">
				<label class="btn_label modify-basic">기본</label>
				<label class="btn_label modify-theme">테마</label>
				<label class="btn_label modify-category">카테고리</label>
				<label class="btn_label modify-neighbor">이웃</label>
				<label class="modal_close" for="open-pop2"></label>
			</div>
			<label class="btn_label" id="addCateBtn" style="margin-bottom:15px;">카테고리 추가</label>
		 </div>
		 <!-- 이웃목록 -->
		 <div class="modal_inner" id="modal_neighbor" style="display:none;">
			<div class="row">
				<label class="btn_label modify-basic">기본</label>
				<label class="btn_label modify-theme">테마</label>
				<label class="btn_label modify-category">카테고리</label>
				<label class="btn_label modify-neighbor">이웃</label>
				<label class="modal_close" for="open-pop2"></label>
			</div>
			<c:forEach var="i" begin="1" end="4">
			<div style="margin-bottom:40px;">
				<img src="${contextPath}/resources/images/cosmos.jpg" style="width:35px;height:35px;float:left;margin-right:5px; border-radius: 5px;">
				<span style="top:5px; position:relative;"><a href="#">${i}번째 마루</a></span>
			</div>
			</c:forEach>
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
				<label class="modal-leftlabel">판매 가격</label>
				
				<input type="number" value="100" min="100" step="100" style="width:64.2%; float:right; height:25px;"/>
				<label id="pointLabel">포인트</label>
				<label style="color:gray; font-size:10px; float:right; margin-right:0;">이 항목은 결제선 아래에 작성한 글이 있을 때만 표시됩니다.</label>
			</div>
			<div class="row">
				<label class="modal-leftlabel">공개 설정</label>
				<ul>
					<li><input type="radio" name="openLevel" id="open1" value="open"><label for="open1">전체 공개</label></li>
					<li><input type="radio" name="openLevel" id="open2" value="noopen"><label for="open2">비공개</label></li>
				</ul>
			</div>
			<div class="row" style="border-bottom:1px solid lightgray;">
				<label class="modal-leftlabel">댓글 권한</label>
				<ul>
					<li><input type="radio" name="replyLevel" id="replylevel1" value="all"><label for="replylevel1">제한 없음</label></li>
					<li><input type="radio" name="replyLevel" id="replylevel2" value="buyer"><label for="replylevel2">구매자만</label></li>
				</ul>
			</div>
			<div class="row" style="padding-top:15px;">
				<label class="btn_label" for="open-pop" style="float:left; background:lightgray; margin-left:20px;">취소</label>
				<label class="btn_label" style="float:right; margin-right:20px;">작성하기</label>
			</div>
	 	 </div>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script>
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
  <script>
  	$(function(){
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
			$("#modal_category").append("<div class='row' style='height:50px;'><input type='text' value='앙 기모띠' id='addedCategory'><span id='categoryDelete'></span></div>");
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