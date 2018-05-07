<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet"/>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet"/>
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/lang/summernote-ko-KR.js"></script>
<!-- moment.js CDN -->
   <script type="text/javascript" src="https://momentjs.com/downloads/moment-with-locales.js"></script>
</head>
<body class="maruBody">
	<jsp:include page="../common/topmenu.jsp"/>
	<jsp:include page="../common/middleMenu.jsp"/>
	<jsp:include page="../common/innerMenu.jsp"/>
	<div class="wrap">	
		<div class="dumi"></div>
		<div class="marginAuto content">
			<div class="searchArea">
				<input type="text" name="search" id="search" style="background:none; width:440px; height:40px;">
				<button class="floatRight searchBtn"><img src="${contextPath }/resources/images/find.png" style="width:35px; height:35px;"></button>
			</div>
			<br>
			<div class="boardInsert" style="z-index:0;">
				<form action="insertNarumaruBoard.nm" method="post" id="boardInsert">
					<textarea class="summernote" name="boardContent"></textarea>
					<input type="hidden" name="bType" value="200"/>
					<input type="hidden" name="bLevel" value="0"/>
					<input type="hidden" name="boardTitle" value="asd"/>
					<input type="hidden" name="openLevel" value="all"/>
					<input type="hidden" name="mno" value="${ loginUser.mid }"/>
					<input type="hidden" name="nmno" value="${ nm.nmno }"/>
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
			<c:if test="${ b.bLevel == 0 }">
			<div class="board">
				<div class="boardInfo">
					<div class="writerPhoto"><c:if test="${empty b.profileName }">
							<img style="width:100%; height:100%;" src="resources/images/profile_defalt.png" id="profileImg">
						</c:if>
						<c:if test="${!empty b.profileName }">
							<img style="width:100%; height:100%;" src="resources/memberprofile/${b.profileName }" id="profileImg">
						</c:if></div>
					<div style="display:inline-block;"><label>${b.bWriter}</label><br><label class="writeDate">${b.createDate }</label></div>
					<div class="showSub floatRight boardBtn" onclick="submenuOpen(this);">
						<img src="resources/images/menu.png" class="modifyMenu size100per">
						<div class="sub boardSub">
							<ul>
								<li class="pointer" onclick="modifyBoard(this);">수정하기</li>
								<li class="pointer" onclick="deleteBoard(${b.bno});">삭제하기</li>
							</ul>
						</div>
								<div class="modal fade" id="myModal" role="dialog">
									<div class="modal-dialog">

										<!-- Modal content-->
										<div class="modal-content">
											<div class="modal-body">
												<form action="updateBoardOne.nm" method="post"
													id="boardInsert">
													<textarea class="summernote" name="boardContent" value="${b.bContent}"></textarea>
													<input type="hidden" name="bno" value="${b.bno}"/>
													<input type="hidden" name="bType" value="200" /> <input
														type="hidden" name="bLevel" value="0" />
													<input type="hidden" name="boardTitle" value="asd" /> <input
														type="hidden" name="openLevel" value="all" /> <input
														type="hidden" name="mno" value="${ loginUser.mid }" /> <input
														type="hidden" name="nmno" value="${ nm.nmno }" />
												</form>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-default"
													data-dismiss="modal">Close</button>
											</div>
										</div>

									</div>
								</div>
							</div>
				</div>
				<br>
				<div class="boardContent">${b.bContent}</div>
				<div class="boardfoot">
					<hr>
					<ul class="footUl">
						<li class="showSub emotionBtn" onclick="submenuOpen(this);"><span>이모티콘</span>
							<div class="sub emotionSub">이모티콘</div>
						</li>
						<li class="insertReplyShow" onclick="replyOpen(this, ${ b.bno });"><span>댓글보기</span></li>
						<li class="reportBtn" onclick="reportBoard(${ b.bno });"><span>신고하기</span></li>
					</ul>
				</div>
				<div class="insertReply">
					<div class="replyArea">
						 <c:forEach var="b2" begin="${beginPage}" end="${newPage}" items="${ colist }" varStatus="i2">
							<c:if test = "${ b.bno eq b2.targetBno}">
							<div style="height:100px;">
								
								<div class="writerPhoto"><c:if test="${empty b2.profileName }">
							<img style="width:100%; height:100%;" src="resources/images/profile_defalt.png" id="profileImg">
						</c:if>
						<c:if test="${!empty b2.profileName }">
							<img style="width:100%; height:100%;" src="resources/memberprofile/${b2.profileName }" id="profileImg">
						</c:if></div>
								<label>${ b2.bWriter }</label> <label class="floatRight">${b2.createDate}</label>
								<div class="replyContent" style="clear:both;">${b2.bContent}</div>
							</div>
							<hr>
							</c:if>
						</c:forEach>
						
						<form action="insertNarumaruBoard.nm" method="post" id="replyInsert" style="height:170px;">
							<textarea class="summernote2" name="boardContent"></textarea>
							<input type="hidden" name="bType" value="201"/>
							<input type="hidden" name="bLevel" value="1"/>
							<input type="hidden" name="targetBno" value="${ b.bno }"/>
							<input type="hidden" name="boardTitle" value="asd"/>
							<input type="hidden" name="openLevel" value="all"/>
							<input type="hidden" name="mno" value="${ loginUser.mid }"/>
							<input type="hidden" name="nmno" value="${ nm.nmno }"/>
						</form>
					</div>
				</div>
			</div>	
			</c:if>
			</c:forEach>	
		
		</div>
		<div align="center" class="loadingArea" style="display: none;">
			<img alt="" src="resources/images/lodingImg.gif">
		</div>
	</div>
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet"/>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet"/>
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/lang/summernote-ko-KR.js"></script>
	<script>
	var submitButton = function (context) {
		  var ui = $.summernote.ui;

		  // create button
		  var button = ui.button({
		    contents: '<i class="fa fa-child"/> 등록하기',
		    tooltip: '등록하기',
		    click: function () {
		    	console.log($("#summernote").val());
		    	$(this).parents("form").submit();
		    }
		  });

		  return button.render();   // return button as jquery object
		}
	
	var submitButton2 = function (context) {
		  var ui = $.summernote.ui;

		  // create button
		  var button = ui.button({
		    contents: '<i class="fa fa-child"/> 등록하기',
		    tooltip: '등록하기',
		    click: function () {
		      $(this).parents("form").submit();
		    }
		  });

		  return button.render();   // return button as jquery object
		}
	
	function summernote1() {
		  $('.summernote').summernote({
			  height: 150, 
			  lang: 'ko-KR',
			  toolbar: [
				    ['style', ['bold', 'italic', 'underline', 'clear']],
				    ['fontsize', ['fontsize']],
				    ['color', ['color']],
				    ['para', ['ul', 'ol', 'paragraph']],
				    ['Insert',['picture'], ['video']],
				    ['mybutton', ['submit']]
				  ],
			buttons: {
				submit: submitButton
			}
		  });
	}

	
	function summernote2() {
		console.log($('.summernote2'));
		  $('.summernote2').summernote({
			  height: 80, 
			  lang: 'ko-KR',
			  toolbar: [
				    ['style', ['bold', 'italic', 'underline', 'clear']],
				    ['fontsize', ['fontsize']],
				    ['color', ['color']],
				    ['para', ['ul', 'ol', 'paragraph']],
				    ['Insert',['picture'], ['video']],
				    ['mybutton', ['submit']]
				  ],
			buttons: {
				submit: submitButton2
			}
		  });			  
	}
	$(document).ready(function(){
		console.log('리스트 ${ list.size() }')
		summernote1();
		summernote2();
	});
	
	
	var isEnd = false;
	var newPage = ${newPage};
	var listSize = ${list.size()};
	
	$(function(){
		console.log(listSize);
		if(listSize <=4){
			isEnd = true;
		}
	});

	$(document).scroll(function(){
		summernote1();
		summernote2();
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
	    				+'<input type="text" name="search" id="search" style="background:none; width:440px; height:40px;">'
	    				+'<button class="floatRight searchBtn"><img src="${contextPath }/resources/images/find.png" style="width:35px; height:35px;"></button>'
	    				+'</div>'
	    				+'<br>'
	    				+'<div class="boardInsert">'
	    				+'<form action="insertNarumaruBoard.nm" method="post" id="boardInsert">'
	    				+'	<textarea class="summernote" name="boardContent"></textarea>'
	    				+'	<input type="hidden" name="bType" value="200"/>'
	    				+'	<input type="hidden" name="bLevel" value="0"/>'
	    				+'	<input type="hidden" name="boardTitle" value="asd"/>'
	    				+'	<input type="hidden" name="openLevel" value="all"/>'
	    				+'	<input type="hidden" name="mno" value="${ loginUser.mid }"/>'
	    				+'	<input type="hidden" name="nmno" value="${ nm.nmno }"/>'
	    				+'</form>'
	    				+'</div>');
				
	        	
	        	//페이지 전부 다시불러옴
	        	<c:forEach var="b" begin="0" end="${list.size()}" items="${list}" varStatus="i">
	        	<c:if test="${ b.bLevel == 0 }">
	        		//새로 가져오려는게 적으면
		        	<c:if test="${newPage < i.count}">
		        		return;
		        	</c:if>
	        	/* for(var i = 0; i < newPage; i++){ */
	        		$(".content").append('<div class="board">'
				+'<div class="boardInfo">'
				+'	<div class="writerPhoto"><c:if test="${empty b.profileName }">'
				+'<img style="width:100%; height:100%;" src="resources/images/profile_defalt.png" id="profileImg">'
				+'</c:if>'
				+'<c:if test="${!empty b.profileName }">'
				+'	<img style="width:100%; height:100%;" src="resources/memberprofile/${b.profileName }" id="profileImg">'
				+'</c:if></div>'
				+'	<div style="display:inline-block;"><label>${b.bWriter}</label><br><label>${b.createDate}</label></div>'
				+'	<div class="showSub floatRight boardBtn" onclick="submenuOpen(this);">'
				+'		<img src="resources/images/menu.png" class="modifyMenu size100per">'
				+'		<div class="sub boardSub">'
				+'			<ul>'
				+'				<li class="pointer" onclick="modifyBoard(this);">수정하기</li>'
				+'				<li class="pointer" onclick="deleteBoard(${b.bno});">삭제하기</li>'
				+'			</ul>'
				+'		</div>'
				+'<div class="modal fade" id="myModal" role="dialog">'
				+'<div class="modal-dialog">'

				+'	<!-- Modal content-->'
				+'	<div class="modal-content">'
				+'		<div class="modal-body">'
				+'			<form action="updateBoardOne.nm" method="post"'
				+'				id="boardInsert">'
				+'				<textarea class="summernote" name="boardContent"></textarea>'
				+'				<input type="hidden" name="bType" value="200" /> <input'
				+'					type="hidden" name="bLevel" value="0" />'
				+'				<input type="hidden" name="boardTitle" value="asd" /> <input'
				+'					type="hidden" name="openLevel" value="all" /> <input'
				+'					type="hidden" name="mno" value="${ loginUser.mid }" /> <input'
				+'					type="hidden" name="nmno" value="${ nm.nmno }" />'
				+'			</form>'
				+'		</div>'
				+'		<div class="modal-footer">'
				+'			<button type="button" class="btn btn-default"'
				+'				data-dismiss="modal">Close</button>'
				+'		</div>'
				+'	</div>'

				+'</div>'
				+'</div>'
				+'	</div>'
				+'</div>'
				+'<br>'
				+'<div class="boardContent">${b.bContent}</div>'
				+'<div class="boardfoot">'
				+'	<hr>'
				+'	<ul class="footUl">'
				+'		<li class="showSub emotionBtn" onclick="submenuOpen(this);"><span>이모티콘</span>'
				+'			<div class="sub emotionSub">이모티콘</div>'
				+'		</li>'
				+'		<li class="insertReplyShow" onclick="replyOpen(this, ${ b.bno });"><span>댓글보기</span></li>'
				+'		<li class="reportBtn"  onclick="reportBoard(${ b.bno });"><span>신고하기</span></li>'
				+'	</ul>'
				+'</div>'
				+'<div class="insertReply">'
				+'	<div class="replyArea">'
						 <c:forEach var="b2" begin="${beginPage}" end="${newPage}" items="${ colist }" varStatus="i2">
							<c:if test = "${ b.bno eq b2.targetBno}">
							+'			<div style="height:100px;">'
							
							+'	<div class="writerPhoto"><c:if test="${empty b2.profileName }">'
							+'<img style="width:100%; height:100%;" src="resources/images/profile_defalt.png" id="profileImg">'
							+'</c:if>'
							+'<c:if test="${!empty b2.profileName }">'
							+'	<img style="width:100%; height:100%;" src="resources/memberprofile/${b2.profileName }" id="profileImg">'
							+'</c:if></div>'
							+'	<label>${ b2.bWriter }</label> <label class="floatRight">${b2.createDate}</label>'
							+'	<div class="replyContent" style="clear:both;">${b2.bContent}</div>'
							+'</div>' 
							+'	<hr>'
							</c:if>
						</c:forEach>
				+'	<form action="insertNarumaruBoard.nm" method="post" id="replyInsert">'
				+'	<textarea class="summernote2" name="boardContent"></textarea>'
				+'	<input type="hidden" name="bType" value="201"/>'
				+'	<input type="hidden" name="bLevel" value="1"/>'
				+'	<input type="hidden" name="targetBno" value="${ b.bno }"/>'
				+'	<input type="hidden" name="boardTitle" value="asd"/>'
				+'	<input type="hidden" name="openLevel" value="all"/>'
				+'	<input type="hidden" name="mno" value="${ loginUser.mid }"/>'
				+'	<input type="hidden" name="nmno" value="${ nm.nmno }"/>'
				+'	</form>'
						+'	</div>'
						+'</div>'
						+'</div>');
	        	</c:if>
	        	</c:forEach>
	        }
		}, 2000);
	        	summernote1();
	        	summernote2();
	});
		function replyOpen(btn, bno){
			$(btn).parent().parent().siblings(".insertReply").toggle();			
		}
		function submenuOpen(btn){
			$(btn).children(".sub").toggle();
		}
		$("#photoUpload").click(function(){
				$("#photo").click();
		});
		function modifyBoard(btn){ 
			$(btn).parents(".boardBtn").find("#myModal").modal();	
			/* location.href="updateBoardOne.nm?bno="+bno + "&nmno=${nm.nmno}"; */
		}
		function deleteBoard(bno){
			location.href="deleteBoardOne.nm?bno="+bno + "&nmno=${nm.nmno}";
		}
		function reportBoard(bno){
			var r = confirm("이 글을 신고하시겠습니까?");
			if (r == true) {
				
			}
		}
		$(".searchBtn").click(function(){
			var search = $("#search").val();
			location.href="searchBoard.nm?nmno=${ nm.nmno}&bContent="+search;
		});
	
		$(function(){
			var writDateArr = $(".writeDate");
			for(var i = 0; writDateArr.length > i; i++){
				var date = writDateArr[i].innerHTML;
				var beforetime = moment(date, "YYYY-MM-DD h:mm:ss").fromNow();
				writDateArr[i].innerHTML = beforetime;
			}
		});

	</script>
</body>
</html>