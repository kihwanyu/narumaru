<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/naruInsertBoard.css">
</head>
<body>
	<jsp:include page="../common/topmenu.jsp"/>
	<jsp:include page="middleMenu.jsp"/>
	<jsp:include page="innerMenu.jsp"/>
	<div class="wrap">	
		<div class="dumi"></div>
		<div class="marginAuto content">
			<div class="searchArea">
				<input type="text" name="search" style="background:none; width:440px; height:40px;">
				<button class="floatRight searchBtn"><img src="${contextPath }/resources/images/find.png" style="width:35px; height:35px;"></button>
			</div>
			<br>
			<div class="boardInsert">
				<div class="boardInsertcontent">
					<input type="text" class="textArea">
				</div>
				<div class="boardInsertTab">					
					<ul class="ul boardInsertUl">
						<li>탭1</li>
						<li>탭2</li>
						<li>탭3</li>
						<li>탭4</li>
						<li>탭5</li>
						<li>탭6</li>
					</ul>			
					<button class="floatRight inertBoardBtn">작성</button>
				</div>
			</div>
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
					<div style="display:inline-block;"><label>${b.bno}</label><br><label>${b.createDate}</label></div>
					<div class="showSub floatRight boardBtn" onclick="submenuOpen(this);">
						<img src="resources/images/menu.png" class="modifyMenu size100per">
						<div class="sub boardSub">
							<ul>
								<li>주소복사</li>
								<li>공유하기</li>
								<li>북마크</li>
								<li>신고하기</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="boardContent">${b.bContent}</div>
				<div class="boardfoot">
					<hr>
					<ul class="footUl">
						<li class="showSub emotionBtn" onclick="submenuOpen(this);"><span>이모티콘</span>
							<div class="sub emotionSub">이모티콘</div>
						</li>
						<li class="insertReplyShow" onclick="replyOpen(this);"><span>댓글보기()</span></li>
						<li class="showSub shereBtn" onclick="submenuOpen(this);"><span>공유하기</span>
							<div class="sub shereSub">개발중인 기능입니다</div>
						</li>
					</ul>
				</div>
				<div class="insertReply">
					<hr>
					<button class="showSub attachBtn" onclick="submenuOpen(this);">
						+
						<div class="sub attachSub">
							<ul>
								<li>사진</li>
								<li>파일</li>
							</ul>
						</div>
					</button>
					<input type="text" name="insertReply"
						style="background: none; width: 400px; height: 40px;">
					<button class="floatRight insertReplyBtn">
						<img src="${contextPath }/resources/images/find.png"
							style="width: 35px; height: 35px;">
					</button>
					<div class="replyArea">
						<hr>
						<div class="writerPhoto"><img src="resources/images/profile_defalt.png" class="size100per"></div>
						<label>이름</label> <label>날짜</label>
						<div class="replyContent" style="clear:both;">내용</div>
					</div>
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
	
	<script>
		var isEnd = false;
		var newPage = ${newPage};
		var listSize = ${list.size()};
		
		$(function(){
			console.log(listSize);
			if(listSize <=4){
				isEnd = true;
			}
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
		        	console.log("1 : " + newPage);
		        	<c:set var="newPage" value="${newPage + 10}"/>
		        	console.log("1re : " + newPage);
		        	console.log("2 : ${newPage}");
		        	
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
		        	
		        	$(".content").append('<div class="searchArea">'
					+ '<input type="text" name="search" style="background:none; width:440px; height:40px;">'
					+ '<button class="floatRight searchBtn"><img src="${contextPath }/resources/images/find.png" style="width:35px; height:35px;"></button>'
				    + '</div>'
					+ '<br>'
					+ '<div class="boardInsert">'
					+ '<div class="boardInsertcontent">'
					+ '<input type="text" class="textArea">'
					+ '</div>'
					+ '<div class="boardInsertTab">'	
					+ '<ul class="ul boardInsertUl">'
					+		'<li>탭1</li>'
					+		'<li>탭2</li>'
					+		'<li>탭3</li>'
					+		'<li>탭4</li>'
					+		'<li>탭5</li>'
					+		'<li>탭6</li>'
					+	'</ul>	'		
					+	'<button class="floatRight inertBoardBtn">작성</button>'
					+	'</div>'
					+	'</div>')
					
		        	
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
								+'<label>${b.bno}</label><br><label>${b.createDate}</label>'
								+'<div class="showSub floatRight boardBtn" onclick="submenuOpen(this);">'
								+'	<img src="resources/images/menu.png" class="modifyMenu size100per">'
								+'		<div class="sub boardSub">'
								+'			<ul>'
								+'				<li>주소복사</li>'
								+'				<li>공유하기</li>'
								+'				<li>북마크</li>'
								+'				<li>신고하기</li>'
								+'			</ul>'
								+'		</div>'
								+'	</div>'
								+'</div>'
								+'<div class="boardContent">${b.bContent}</div>'
								+'<div class="boardfoot">'
								+'	<hr>'
								+'	<ul class="footUl">'
								+'		<li class="showSub emotionBtn" onclick="submenuOpen(this);"><span>이모티콘</span>'
								+'			<div class="sub emotionSub">이모티콘</div>'
								+'		</li>'
								+'			<li class="insertReplyShow" onclick="replyOpen(this);"><span>댓글보기()</span></li>'
								+'		<li class="showSub shereBtn" onclick="submenuOpen(this);"><span>공유하기</span>'
								+'			<div class="sub shereSub">개발중인 기능입니다</div>'
								+'		</li>'
								+'	</ul>'
								+'</div>'
								+'<div class="insertReply">'
								+'	<hr>'
								+'	<button class="showSub attachBtn" onclick="submenuOpen(this);">'
								+'		+'
								+'		<div class="sub attachSub">'
								+'			<ul>'
								+'				<li>사진</li>'
								+'				<li>파일</li>'
								+'			</ul>'
								+'		</div>'
								+'	</button>'
								+'	<input type="text" name="insertReply"'
								+'		style="background: none; width: 400px; height: 40px;">'
								+'	<button class="floatRight insertReplyBtn">'
								+'		<img src="${contextPath }/resources/images/find.png"'
								+'			style="width: 35px; height: 35px;">'
								+'	</button>'
								+'	<div class="replyArea">'
								+'		<hr>'
								+'		<div class="writerPhoto"><img src="resources/images/profile_defalt.png" class="size100per"></div>'
								+'		<label>이름</label> <label>날짜</label>'
								+'		<div class="replyContent" style="clear:both;">내용</div>'
								+'	</div>'
								+'	</div>'
								+'</div>');
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
		
	</script>
</body>
</html>