<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/naruInsertBoard.css">
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
				<c:set var="channelArr">
					문화/예술(100), 여행(200), 패션/뷰티(300), 팬클럽(400), 인문/과학(500), 동물(600), 나이(700), 방송/연예(800), 친목/모임(900), 종교/봉사(1000),
					음악(1100) 경제(1200), IT/기술(1300), 게임(1400), 어학/외국어(1500), 만화(1600), 일상/이야기(1700), 스포츠/레저(1800), 건강(1900), 결혼/가정(2000),
	                           만화/애니메이션(2100), 정치/사회(2200), 교육/공부(2300), 취미/DIY(2400), 취업/자기개발(2500), 맛집/요리/생활(2600)
				</c:set>
				<c:forEach items="${ channelArr }" var="channel" varStatus="status">					
						<c:if test="${ nm.cno eq fn:substring(channel, fn:indexOf(channel, '(')+1, fn:indexOf(channel, ')'))}">
							<h4>${ fn:substring(channel, 0, fn:indexOf(channel, "("))  }</h4>
						</c:if>
				</c:forEach>
				
			</div><br>
			<div class="maruMember">
				<div class="inlineBlock pointer maruMemberView">
					멤버(<span class="countMaruMember"></span>)
				</div>
				<div class="floatRight pointer maruMemberInvateView">
					초대
				</div>
				<c:if test='${ nm.isOpen ne "비공개" }'>
					<div style="margin-top:10px; text-align:center; background:black; color:white;" class="pointer" id="insertMaruMember">
						가입하기
					</div> 
				</c:if>
			</div>
			<div class="pointer maruSetting">
			<hr>
				<label for="open-pop2">마루 설정</label>	
			</div>
		</div>
	
		<!-- 이하 모달창(나루 관리) -->
	<input class="modal-state2" id="open-pop2" type="checkbox" /> <!-- 안보이는 체크박스, 이게 체크되면 모달창이 나옴 -->
	<div class="modal2" style="font-size:0.9em;">
		<label class="modal_bg" for="open-pop2"></label>
		<!-- 기본 -->
		<form id="defaultModify" action="updateDefault.nm" method="post">
			<div class="modal_inner" id="modal_default">
				<input type="hidden" name="nmno" value="${nm.nmno}">
				<div class="row">
					<label class="btn btn-info modify-basic"><b>기본</b></label>
					<!-- <label class="btn btn-info modify-theme">테마</label> -->
					<!-- <label class="btn btn-info modify-category">카테고리</label> -->
					<!-- <label class="btn btn-info modify-neighbor">이웃</label> -->
					<label class="modal_close" for="open-pop2"></label>
				</div>
				<label class="btn btn-info" id="updateThemeBtn" onclick="defaultModifyBtn()" style="margin-bottom:15px;">수정완료</label>
<!-- 				<div class="row">
					<label class="modal-leftlabel">나루 대표사진</label>
					<input type="file" style="width:70%; float:right;" name="">
				</div> -->
				<div class="row">
					<label class="modal-leftlabel">마루 제목</label>
					<input type="text" style="width:79.1%; float:right; height:25px;" name="nmTitle" value="${nm.nmTitle}">
				</div>
				<div class="row">
					<label class="modal-leftlabel">소개 문구</label>
					<textarea style="width:78.7%; float:right; height:40px; resize:none;" name="nmIntro">${nm.nmIntro}</textarea>
				</div>
		 	</div>
		 </form>
	 	<!-- 테마  -->
	 	<form id="themeModify" action="updateTheme.na" method="post">
	 		<input type="hidden" name="nmno" value="${nm.nmno}">
			<div class="modal_inner" id="modal_theme" style="display:none;">
				<div class="row">
					<label class="btn btn-info modify-basic">기본</label>
					<!-- <label class="btn btn-info modify-theme"><b>테마</b></label> -->
					<!-- <label class="btn btn-info modify-category">카테고리</label> -->
					<!-- <label class="btn btn-info modify-neighbor">이웃</label> -->
					<label class="modal_close" for="open-pop2"></label>
				</div>
				<label class="btn btn-info" id="updateThemeBtn" onclick="themeModifyBtn()" style="margin-bottom:15px;">수정완료</label>
				<div class="row">
					<label class="modal-leftlabel">테마 색상</label>
					<input name="themeValue" class="jscolor {valueElement:'chosen-value', onFineChange:'setTextColor(this)'}" style="width:79.1%; float:right; height:25px;" id="chosen-value" value="${theme.color}}">
				</div>
				<div class="row">
					<label class="modal-leftlabel">글 배경색</label>
					<input name="boardValue" class="jscolor {valueElement:'chosen-value2', onFineChange:'setTextColor(this)'}" style="width:79.1%; float:right; height:25px;" id="chosen-value2" value="${theme.board}}">
				</div>
				<div class="row">
					<label class="modal-leftlabel">폰트</label>
					<select name="fontValue" style="margin-left:31px;">
						<option>기본</option>
						<option>구매한 폰트1</option>
						<option>구매한 폰트22</option>
					</select>
				</div>
		 	 </div>
		</form>
	 	 <form id="categoryModify" action="updateCategory.na" method="post">
	 	 	<input type="hidden" name="nmno" value="${nm.nmno}">
		 	 <!-- 카테고리 -->
		 	 <div class="modal_inner" id="modal_category" style="display:none;">
				<div class="row">
					<label class="btn btn-info modify-basic">기본</label>
					<!-- <label class="btn btn-info modify-theme">테마</label> -->
					<!-- <label class="btn btn-info modify-category">카테고리</label> -->
					<!-- <label class="btn btn-info modify-neighbor">이웃</label> -->
					<label class="modal_close" for="open-pop2"></label>
				</div>
				<label class="btn btn-info" id="addCateBtn" style="margin-bottom:15px;">카테고리 추가</label>
				<label class="btn btn-info" id="updateCateBtn" style="margin-bottom:15px;">수정완료</label>
			 </div>
		 </form>
		 <!-- 이웃목록 -->
		 <%-- <div class="modal_inner" id="modal_neighbor" style="display:none;">
			<div class="row">
				<label class="btn btn-info modify-basic">기본</label>
				<label class="btn btn-info modify-theme">테마</label>
				<label class="btn btn-info modify-category">카테고리</label>
				<label class="btn btn-info modify-neighbor">이웃</label>
				<label class="modal_close" for="open-pop2"></label>
			</div>
			<c:forEach var="i" begin="1" end="4">
			<div style="margin-bottom:40px;">
				<img src="${contextPath}/resources/images/cosmos.jpg" style="width:35px;height:35px;float:left;margin-right:5px; border-radius: 5px;">
				<span style="top:5px; position:relative;"><a href="#">${i}번째 마루</a></span>
			</div>
			</c:forEach>
		 </div> --%>
	</div>	
	 
		<!-- <div class="floatRight rightArea">
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
			
			<div class="rightMenu album" style="top:50px;">
				<div class="rightTitle">
					앨범
					<div class="floatRight pointer moreAlbum"><a href="showMaruAlbum.ma">더보기</a></div>
				</div>
				<div class="albumMiniContent">
					<div class="photoThumb"></div>
				</div>
			</div>
		</div> -->
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
	  /*  location.href="showMaruSetting.ma"; */
	});
	$("#insertMaruMember").click(function(){
		var r = confirm("이 마루에 가입하시겠습니까?");
		if (r == true) {
		  console.log("${loginUser.mid} ${nm.nmno}");

		  var nmno=${nm.nmno};
		  var mno=${loginUser.mid};
		  $.ajax({
				url:"insertMaruMember.ma",
				type:"get",
				data:{"nmno":nmno, "mno":mno},
				success:function(data){
					alert(data);
				},
				error:function(data){
					alert(data);
				}			
			});
		  
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
	
	$(function(){
		var nmno = ${ nm.nmno };
		$.ajax({
			url:"selectMaruMemberList.ma",
			type:"get",
			data:{"nmno":nmno},
			success:function(data){
				console.log(data);
				var isMember = false;
				for(var i = 0; i < data.length; i++){
					console.log(data[i]);
					if(data[i].MNO == ${loginUser.mid}){
						isMember =true;
					}			
				}
				console.log(isMember);
				if(!isMember){
						$(".wrap").empty();
						$(".wrap").append("<div style='width:500px; padding-top:50px;'><h1>회원만 내용을 볼 수 있습니다.<h1><img style='width:100%;' src='resources/images/smile.png'></div>");
					if('${ nm.isOpen }'=='비공개'){
						alert("마루의 회원이 아닙니다");
						location.href="goHome.nm";	
					}				
				}
				
			},
			error:function(data){
				console.log("실패");
			}			
		});
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
				$("#modal_category").append("<div class='row' style='height:50px;'><input type='text' value='' id='addedCategory"+ added +"' name='addedCategory"+ added++ +"'  style='float:left;'><div id='categoryDelete' style='float:left;' onclick='deleteCategory(this)'></div></div>");
			})
			
			$("#updateCateBtn").click(function(){
				
				for(var i=0; i<20; i++){
					var checkVal = $("#addedCategory" + i).val();
					var blank_pattern = /^\s+|\s+$/g;

					if(checkVal == null){
						var size = i+1;
						break;
					}else if(checkVal.replace(blank_pattern, '') == ""){
						alert("카테고리 명을 입력해주세요.");
						return false;
					}
				}
				
				$("#categoryModify").submit();
			})
			
			//테마 수정
		function themeModifyBtn(){
	  		$("#themeModify").submit();
	  	}
	  	
	  	//일반 수정
	  	function defaultModifyBtn(){
	  		$("#defaultModify").submit();
	  	}
		
	  	//카테고리 삭제
		function deleteCategory(btn){
	  		var categoryName = $(btn).parent().find(":text").val();
	  		console.log(categoryName);
	  		$(btn).parent().find(":text").val(":none:");
	  		console.log(categoryName);
	  		$(btn).parent().hide();
	  		
	  		$.ajax({
				url:'disableCategory.na',
				type:'get',
				data: {"caName":categoryName, "nmno":${nm.nmno}},
				success:function(){
					console.log(categoryName + "카테고리 비활성화");
				},
				error:function(data){
					console.log(data);
				}
			})
	  	}
	</script>
</body>
</html>