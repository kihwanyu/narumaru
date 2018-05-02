<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%
	pageContext.setAttribute("nr", "\r\n");
	pageContext.setAttribute("br", "<br>");
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/naruInsertBoard.css">
<script type="text/javascript" src="${contextPath}/resources/js/jscolor.js"></script>
<style>
	.replyArea{
		border-bottom:1px solid lightgray;
	}
</style>
</head>
<body id="thisisbody">
	<jsp:include page="../common/topmenu.jsp"/>
	<jsp:include page="middleMenu.jsp"/>
	<jsp:include page="innerMenu.jsp"/>
	<div class="wrap">	
		<div class="dumi"></div>
		<div class="marginAuto content">
			<!-- 게시글 불러오기, 시작은 1부터 -->
			<c:set var="beginPage" value="0"/>
			<!-- 먼저 불러온 갯수를 계산한다. -->
			<c:choose>
				<c:when test="${list.size() > 9}">
					<c:set var="newPage" value="9"/>
				</c:when>
				<c:otherwise>
					<c:set var="newPage" value="${list.size()}"/>
				</c:otherwise>
			</c:choose>
			
			<c:forEach var="b" begin="${beginPage}" end="${newPage}" items="${ list }" varStatus="i">
			<div class="board">
				<div class="boardInfo">
					<div class="writerPhoto"><img src="resources/images/profile_defalt.png" class="size100per"></div>
					<div style="display:inline-block;"><label>${b.bTitle}</label><br><label>${b.createDate}</label></div>
					<div class="showSub floatRight boardBtn" onclick="submenuOpen(this);">
						<img src="resources/images/menu.png" class="modifyMenu size100per">
						<div class="sub boardSub">
							<ul>
								<li onclick="modifyBoard(${b.bno})">수정하기</li>
								<li onclick="deleteBoard(${b.bno})">삭제하기</li>
								<li>공유하기</li>
								<li>신고하기</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="boardContent">${fn:replace(b.bContent,nr,br)}</div>
				<!-- 이하 히든 컨텐츠, 구매 여부를 체크함 -->
				<c:if test="${b.bHidden ne null}">
					<%-- 볼수 있는지 여부, break문이 불가능해서 forEach가 끝날때까지 false면 구매 안한걸로 간주함 --%>
					<c:set var="canView" value="false"/>
					<c:forEach var="h" items="${hpayList}">
						<%--첫번째when은 구매여부, 두번째when은 작성자일때 --%>
						<c:choose>
							<c:when test="${h.bno eq b.bno}">
								<div class="boardContent">${fn:replace(b.bHidden,nr,br)}</div>
								<c:set var="canView" value="true"/>
							</c:when>
							<c:when test="${b.mno eq loginUser.mid }">
								<div class="boardContent">${fn:replace(b.bHidden,nr,br)}</div>
								<c:set var="canView" value="true"/>
							</c:when>
						</c:choose>
					</c:forEach>
					<c:if test="${canView eq 'false'}">
						<div class="boardContent">이하는 구매 후 열람이 가능한 컨텐츠입니다.<label class="btn_label">구매 후 열람</label></div>
					</c:if>
				</c:if>
				<div class="boardfoot">
					<hr>
					<ul class="footUl">
						<li class="showSub emotionBtn" onclick="submenuOpen(this);"><span>이모티콘</span>
							<div class="sub emotionSub">이모티콘</div>
						</li>
						<li class="insertReplyShow" onclick="replyOpen(this);"><span>댓글보기(${b.comments})</span></li>
						<li class="showSub shereBtn" onclick="submenuOpen(this);"><span>공유하기</span>
							<div class="sub shereSub">개발중인 기능입니다</div>
						</li>
					</ul>
				</div>
				<div class="insertReply">
					<hr>
					<input type="text" name="insertReply" id="insertReply"
						style="background: none; width: 400px; height: 40px; background:white;">
					<button class="floatRight insertReplyBtn" onclick="addReply(this, ${b.bno})">
						<img src="${contextPath }/resources/images/find.png"
							style="width: 35px; height: 35px;">
					</button>
					<c:forEach var="j" items="${colist}">
						<c:if test="${j.targetBno eq b.bno}">
							<div class="replyArea">
								<div class="writerPhoto"><img src="resources/images/profile_defalt.png" class="size100per"></div>
								<label>${j.bWriter}</label><br><label>${j.createDate}</label>
								<div class="replyContent" style="clear:both;">${j.bContent}</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</div>	
			</c:forEach>
		
		</div>
			<div align="center" class="loadingArea" style="display: none;">
				<img alt="" src="resources/images/lodingImg.gif">
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
					<label class="btn_label modify-basic"><b>기본</b></label>
					<label class="btn_label modify-theme">테마</label>
					<label class="btn_label modify-category">카테고리</label>
					<label class="btn_label modify-neighbor">이웃</label>
					<label class="modal_close" for="open-pop2"></label>
				</div>
				<label class="btn_label" id="updateThemeBtn" onclick="defaultModifyBtn()" style="margin-bottom:15px;">수정완료</label>
				<div class="row">
					<label class="modal-leftlabel">나루 대표사진</label>
					<input type="file" style="width:70%; float:right;" name="">
				</div>
				<div class="row">
					<label class="modal-leftlabel">나루 제목</label>
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
					<label class="btn_label modify-basic">기본</label>
					<label class="btn_label modify-theme"><b>테마</b></label>
					<label class="btn_label modify-category">카테고리</label>
					<label class="btn_label modify-neighbor">이웃</label>
					<label class="modal_close" for="open-pop2"></label>
				</div>
				<label class="btn_label" id="updateThemeBtn" onclick="themeModifyBtn()" style="margin-bottom:15px;">수정완료</label>
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
					<label class="btn_label modify-basic">기본</label>
					<label class="btn_label modify-theme">테마</label>
					<label class="btn_label modify-category">카테고리</label>
					<label class="btn_label modify-neighbor">이웃</label>
					<label class="modal_close" for="open-pop2"></label>
				</div>
				<label class="btn_label" id="addCateBtn" style="margin-bottom:15px;">카테고리 추가</label>
				<label class="btn_label" id="updateCateBtn" style="margin-bottom:15px;">수정완료</label>
			 </div>
		 </form>
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
	
	<script>
		var added = 0;
	
	  	$(function(){
	  		//설정해둔 카테고리 리스트 불러오기
	  		$.ajax({
				url:"selectCategoryList.na",
				type:"get",
				data:{"nmno":${nm.nmno}},
				success:function(data){
					for(var i in data){
						$("#modal_category").append("<div class='row' style='height:50px;'><input type='text' value='" + data[i].caName + "' id='addedCategory"+ added +"' name='addedCategory"+ added++ +"'  style='float:left;'><div id='categoryDelete' style='float:left;' onclick='deleteCategory(this)'></div></div>");
					}
				},
				error:function(request,status,error){
					console.log("카테고리 리스트 ajax 실패")
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
			
			// 수정 - 이웃버튼
			$(".modify-neighbor").click(function(){
				$("#modal_default").css("display","none");
				$("#modal_theme").css("display","none");
				$("#modal_category").css("display","none");
				$("#modal_neighbor").css("display","");
			})
		})
		
		function themeModifyBtn(){
	  		$("#themeModify").submit();
	  	}
	  	
	  	function defaultModifyBtn(){
	  		$("#defaultModify").submit();
	  	}
		
		function deleteCategory(btn){
	  		console.log("버튼눌름");
	  		var categoryName = $(btn).parent().find(":text").val();
	  		console.log(categoryName);
	  		$(btn).parent().find(":text").val(":none:");
	  		console.log(categoryName);
	  		$(btn).parent().hide();
	  		
	  		console.log("3");
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
			console.log("4");
	  	}
	  </script>
	
	<script>
		var isEnd = false;
		var newPage = ${newPage};
		var listSize = ${list.size()};
		
		$(function(){
			console.log(listSize);
			if(listSize <=4){
				isEnd = true;
			}
			
			//배경색
			$("#thisisbody").css({"background":"${theme.color}"});
			
			//글배경색
			$(".board").css({"background":"${theme.board}"});
		})
	
		$(document).scroll(function(){
			//더이상 가져올 글이 없으면 그냥 종료한다
			if(isEnd) return;
			
			$(".loadingArea").show();
			
			var reload = setTimeout(function() {
				$(".loadingArea").hide();
				//현재문서의 높이를 구함.
		        var documentHeight  = $(document).height();
		        
		        //scrollTop() 메서드는 선택된 요소의 세로 스크롤 위치를 설정하거나 반환    
		        //스크롤바가 맨 위쪽에 있을때 , 위치는 0
		        //console.log("window의 scrollTop() : " + $(window).scrollTop()); 
		        //height() 메서드는 브라우저 창의 높이를 설정하거나 반환
		        //console.log("window의 height() : " + $(window).height());
		        
		        //세로 스크롤위치 max값과 창의 높이를 더하면 현재문서의 높이를 구할수있음.
		        //세로 스크롤위치 값이 max이면 문서의 끝에 도달했다는 의미
		        var scrollHeight = $(window).scrollTop()+$(window).height();         
		            
		        if(Math.ceil(scrollHeight) == parseInt(documentHeight)) { //문서의 맨끝에 도달했을때 내용 추가 올림처리 정확하게 표시
		        	//새로 불러올 id계산
		        	newPage = newPage + 10;
		        	<c:set var="newPage" value="${newPage + 10}"/>
		        	
		        	//새로 불러올게 페이지가 들고있는 글 갯수를 넘으면 안되니까 사이즈 재조정
		        	if(newPage >= listSize){
		        		<c:if test="${newPage >= list.size()}">
		        			<c:set var="newPage" value="${list.size()}"/>
		        		</c:if>
		        		newPage = listSize;
		        		isEnd = true;
		        		/* clearTimeout(reload); */
		        	}
		        	
		        	
		        	//페이지 한번 클리어
		        	$(".content").html("");
		        	
		        	//페이지 전부 다시불러옴
		        	<c:forEach var="b" begin="0" end="${list.size()}" items="${list}" varStatus="i">
		        		//새로 가져오려는게 적으면
			        	<c:if test="${newPage < i.count}">
			        		return;
			        	</c:if>
		        	/* for(var i = 0; i < newPage; i++){ */
		        		$(".content").append('<div class="board">'
								+'<div class="boardInfo">'
								+'<div class="writerPhoto"><img src="resources/images/profile_defalt.png" class="size100per"></div>'
								+'<label>${b.bTitle}</label><br><label>${b.createDate}</label>'
								+'	<div class="showSub floatRight boardBtn" onclick="submenuOpen(this);">'
								+'		<img src="resources/images/menu.png" class="modifyMenu size100per">'
								+'			<div class="sub boardSub">'
								+'				<ul>'
								+'					<li onclick="modifyBoard(${b.bno})">수정하기</li>'
								+'					<li onclick="deleteBoard(${b.bno})">삭제하기</li>'
								+'					<li>주소복사</li>'
								+'					<li>공유하기</li>'
								+'					<li>북마크</li>'
								+'					<li>신고하기</li>'
								+'				</ul>'
								+'			</div>'
								+'	</div>'
								+'</div>'
								+'<div class="boardContent">${fn:replace(b.bContent, nr, "<br>")}</div>'
								+'<div class="boardfoot">'
								+'	<hr>'
								+'	<ul class="footUl">'
								+'		<li class="showSub emotionBtn" onclick="submenuOpen(this);"><span>이모티콘</span>'
								+'			<div class="sub emotionSub">이모티콘</div>'
								+'		</li>'
								+'			<li class="insertReplyShow" onclick="replyOpen(this);"><span>댓글보기(${b.comments})</span></li>'
								+'		<li class="showSub shereBtn" onclick="submenuOpen(this);"><span>공유하기</span>'
								+'			<div class="sub shereSub">개발중인 기능입니다</div>'
								+'		</li>'
								+'	</ul>'
								+'</div>'
								+'<div class="insertReply">'
								+'	<hr>'
								+'	<input type="text" name="insertReply"'
								+'		style="background: none; width: 400px; height: 40px; background:white;">'
								+'	<button class="floatRight insertReplyBtn" onclick="addReply(this, ${b.bno})">'
								+'		<img src="${contextPath }/resources/images/find.png"'
								+'			style="width: 35px; height: 35px;">'
								+'	</button>'
								<c:forEach var="j" items="${colist}">
									<c:if test="${j.targetBno eq b.bno}">
								+	'<div class="replyArea">'
								+		'<div class="writerPhoto"><img src="resources/images/profile_defalt.png" class="size100per"></div>'
								+		'<label>${j.bWriter}</label><br><label>${j.createDate}</label>'
								+		'<div class="replyContent" style="clear:both;">${j.bContent}</div>'
								+	'</div>'
									</c:if>
								</c:forEach>
								+'	</div>'
								+'</div>'
								)
		        	/* } */
		        	</c:forEach>
		        	
		        }
			}, 2000);
		});
		
		function replyOpen(btn){
			$(btn).parent().parent().siblings(".insertReply").toggle();			
		}
		function submenuOpen(btn){
			$(btn).children(".sub").toggle();
		}
		
		function modifyBoard(bno){
			location.href="toUpdateBoardPage.nm?bno=" + bno + "&nmno=${nm.nmno}";
		}
		
		function deleteBoard(bno){
			if(confirm("정말로 삭제하시겠습니까?")){
				location.href="deleteBoardOne.nm?bno="+ bno + "&nmno=${nm.nmno}&type=1";
			}
		}
		
		function addReply(btn, bno){
			var replyArea = $(btn).parent();
			var comment = $(btn).parent().find("#insertReply").val();
			console.log(replyArea);
			console.log(comment);
			
			var d = new Date();
			var strDate = d.getFullYear() + "-" + (d.getMonth()+1) + "-" + d.getDate();
			
			$(replyArea).append('<div class="replyArea">'
					+ '<div class="writerPhoto"><img src="resources/images/profile_defalt.png" class="size100per"></div>'
					+ '<label>${loginUser.nickName}</label><br><label>' + strDate + '</label>'
					+ '<div class="replyContent" style="clear:both;">'+ comment +' </div>'
					+ '</div>');
			
			$.ajax({
				url:'insertComment.nm',
				type:'post',
				data: {"bContent":comment,"bno":bno, "nmno":${nm.nmno}},
				success:function(data){
					console.log("댓글 작성 완료");
				},
				error:function(data){
				}
			})
		}
		
	</script>
</body>
</html>