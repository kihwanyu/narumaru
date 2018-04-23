<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../common/topmenu.jsp"/>
	<jsp:include page="../common/middleMenu.jsp"/>
	<jsp:include page="../common/innerMenu.jsp"/>
	<div class="wrap">	
		<div class="dumi"></div>
		<div class="marginAuto content">
			<div class="searchArea">
				<input type="text" name="search" style="background:none; width:440px; height:40px;">
				<button class="floatRight searchBtn"><img src="${contextPath }/resources/images/find.png" style="width:35px; height:35px;"></button>
			</div>
			<br>
			<div class="boardInsert">
				<form action="insertNarumaruBoard.nm" method="post">
					<div class="boardInsertcontent">
						<input type="hidden" name="boardTitle" value="asd"/>
						<input type="hidden" name="openLevel" value="all"/>
						<input type="hidden" name="mno" value="${ loginUser.mid }"/>
						<input type="hidden" name=nmno value="${ nm.nmno }"/>
						
						<input type="text" class="textArea" name="boardContent"/>
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
				</form>
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
					<div style="display:inline-block;"><label>${b.bWriter}</label><br><label>${b.createDate}</label></div>
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
			<div align="center" class="loadingArea" style="display: none;;">
				<img alt="" src="resources/images/lodingImg.gif">
			</div>
	</div>

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
				+'<form action="insertNarumaruBoard.nm" method="post">'
				+ '<div class="boardInsertcontent">'
				+'<input type="hidden" name="boardTitle" value="asd"/>'
				+'<input type="hidden" name="openLevel" value="all"/>'
				+'<input type="hidden" name="mno" value="${ loginUser.mid }"/>'
				+'<input type="hidden" name=nmno value="${ nm.nmno }"/>'
				+ '<input type="text" class="textArea"  name="boardContent">'
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
				+'</form>'
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
							+'<label>${b.bWriter}</label><br><label>${b.createDate}</label>'
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