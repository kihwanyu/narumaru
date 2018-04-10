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
				<div class="boardInsertcontent">
					<input type="text" class="textArea">
						
						
					</input>
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

			<div class="board">
				<div class="boardInfo">
					<div class="writerPhoto">사진</div>
					<label>이름</label> <label>날짜</label>
					<div class="showSub floatRight boardBtn" onclick="submenuOpen(this);">
						버튼
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
				<div class="boardContent">내용</div>
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
						<div class="writerPhoto">사진</div>
						<label>이름</label> <label>날짜</label>
						<div class="replyContent">내용</div>
					</div>
				</div>
			</div>		
			
			<div class="board">
				<div class="boardInfo">
					<div class="writerPhoto">사진</div>
					<label>이름</label> <label>날짜</label>
					<div class="showSub floatRight boardBtn" onclick="submenuOpen(this);">
						버튼
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
				<div class="boardContent">내용</div>
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
						<div class="writerPhoto">사진</div>
						<label>이름</label> <label>날짜</label>
						<div class="replyContent">내용</div>
					</div>
				</div>
			</div>
			<div class="board">
				<div class="boardInfo">
					<div class="writerPhoto">사진</div>
					<label>이름</label> <label>날짜</label>
					<div class="showSub floatRight boardBtn" onclick="submenuOpen(this);">
						버튼
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
				<div class="boardContent">내용</div>
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
						<div class="writerPhoto">사진</div>
						<label>이름</label> <label>날짜</label>
						<div class="replyContent">내용</div>
					</div>
				</div>
			</div>
			<div class="board">
				<div class="boardInfo">
					<div class="writerPhoto">사진</div>
					<label>이름</label> <label>날짜</label>
					<div class="showSub floatRight boardBtn" onclick="submenuOpen(this);">
						버튼
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
				<div class="boardContent">내용</div>
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
						<div class="writerPhoto">사진</div>
						<label>이름</label> <label>날짜</label>
						<div class="replyContent">내용</div>
					</div>
				</div>
			</div>
			
		</div>
			<div align="center" class="loadingArea" style="display: none;;">
				<img alt="" src="resources/images/lodingImg.gif">
			</div>
	</div>
	
	<script>
		$(document).scroll(function(){
			console.log("documentHeight : " + $(document).height());
			console.log("scrollHeight : " + $(window).height());
			$(".loadingArea").show();
			setTimeout(function() {
				$(".loadingArea").hide();
				//현재문서의 높이를 구함.
		        var documentHeight  = $(document).height();
		        console.log("documentHeight : " + documentHeight);
		        
		        //scrollTop() 메서드는 선택된 요소의 세로 스크롤 위치를 설정하거나 반환    
		        //스크롤바가 맨 위쪽에 있을때 , 위치는 0
		        //console.log("window의 scrollTop() : " + $(window).scrollTop()); 
		        //height() 메서드는 브라우저 창의 높이를 설정하거나 반환
		        //console.log("window의 height() : " + $(window).height());
		        
		        //세로 스크롤위치 max값과 창의 높이를 더하면 현재문서의 높이를 구할수있음.
		        //세로 스크롤위치 값이 max이면 문서의 끝에 도달했다는 의미
		        var scrollHeight = $(window).scrollTop()+$(window).height();         
		        console.log("scrollHeight : " + parseInt(scrollHeight));
		            
		        if(Math.ceil(scrollHeight) == parseInt(documentHeight)) { //문서의 맨끝에 도달했을때 내용 추가 올림처리 정확하게 표시
		            for(var i = 0; i < 5; i++) {
		            	$(".content").append('<div class="board">'
						+'<div class="boardInfo">'
						+'<div class="writerPhoto">사진</div>'
						+'<label>이름</label> <label>날짜</label>'
						+'<div class="showSub floatRight boardBtn" onclick="submenuOpen(this);">'
						+'	버튼'
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
						+'<div class="boardContent">내용</div>'
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
						+'		<div class="writerPhoto">사진</div>'
						+'		<label>이름</label> <label>날짜</label>'
						+'		<div class="replyContent">내용</div>'
						+'	</div>'
						+'	</div>'
						+'</div>');
		            }
		        }
			}, 5000);
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