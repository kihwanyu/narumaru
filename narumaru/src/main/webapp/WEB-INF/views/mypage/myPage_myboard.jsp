<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<title>myPage</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="resources/css/mypage.css"> <!-- mypageCss -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<style type="text/css">
		ul.tabs {
		    margin: 0;
		    padding: 0;
		    float: left;
		    list-style: none;
		    height: 32px;
		    border-bottom: 1px solid #eee;
		    border-left: 1px solid #eee;
		    width: 100%;
		    font-family:"dotum";
		    font-size:12px;
		}
		ul.tabs li {
		    float: left;
		    text-align:center;
		    cursor: pointer;
		    width:50%;
		    height: 31px;
		    line-height: 31px;
		    border: 1px solid #eee;
		    border-left: none;
		    font-weight: bold;
		    background: #fafafa;
		    overflow: hidden;
		    position: relative;
		}
		ul.tabs li.active {
		    background: #FFFFFF;
		    border-bottom: 1px solid #FFFFFF;
		}
		.tab_container {
		    border: 1px solid #eee;
		    border-top: none;
		    clear: both;
		    float: left;
		    width: 100%;
		    background: #FFFFFF;
		    margin-top: 20px;
		    padding-top: 20px;
		    padding-bottom: 10px;
		    padding-right: 10px;
			padding-left: 10px;
		}
		.tab_content {
		    padding: 5px;
		    font-size: 12px;
		    display: none;
		}
		.tab_container .tab_content ul {
		    width:100%;
		    margin:0px;
		    padding:0px;
		}
		.tab_container .tab_content ul li {
		    padding:5px;
		    list-style:none
		}
		;
		#container {
		    width: 100%;
		    margin: 0 auto;
		}
		.board-li {
			border: solid 1px white; 
			margin-bottom: 15px;
			-webkit-box-shadow: 1px 1px 5px gray;
			-moz-box-shadow: 1px 1px 5px gray;
			cursor: pointer;
		}
		.board-li-title {
			border-bottom: solid 1px lightgray; 
			padding-top: 10px; 
			padding-bottom: 10px; 
			font-size: 15px;
		}
		.board-menu-down {
		    display: none;
		    width:100px;
		    position: absolute;
		    background-color: white;
		    border:1px solid lightgray;
		    z-index: 1;
		    margin-left:0px;
		}
		.profile-dropdown ul{
			padding:15px;
		}
		</style>
		
	</head>
	<body>
	<!--  -->
	<jsp:include page="../common/topmenu.jsp"/>	
		<br>
		<br>
		<br>
	
		<div id="container" style="margin-top: 50px;">
		<c:set var="pageValue" value="myboard" scope="request" />
		<jsp:include page="../common/myPage_LeftSideBar.jsp"/>	
			
			<div id="contents">
			<div style="margin-top: 5px; margin-bottom: 10px; color: black;" align="right">
				<select>
					<option>나루</option>
					<option>마루</option>
				</select>
			</div>
			<div style="width: 100%;">
			    <ul class="tabs">
			        <li class="active" rel="tab1" style="color: black;">게시글</li>
			        <li rel="tab2" style="color: black;">댓글</li>
			    </ul>
			    <div class="tab_container">
				    <!-- #tab1 -->
			        <div id="tab1" class="tab_content">
			            <ul id="board-contants">
							<!-- 글 추가될곳 -->
			            </ul>
			            <div align="center" class="loadingArea" style="display: none;">
							<img alt="" src="resources/images/lodingImg.gif">
			            </div>
			        </div>
			        
			        <div id="tab2" class="tab_content">
			        	<ul id="comment-contants">
							<!-- 댓글 추가하는 부분 -->
			            </ul>
						<div align="center" class="loadingArea" style="display: none;">
							<img alt="" src="resources/images/lodingImg.gif">
			            </div>
			       	</div>
			        <!-- #tab2 -->
			    </div>
			    <!-- .tab_container -->
			</div>
				
			</div>
		</div>
		<script type="text/javascript">
        function commentViews(toggle, number){
       		if(toggle.getAttribute('src') === 'resources/images/comments_down.png'){
	        	console.log(toggle);
	        	toggle.setAttribute('src', 'resources/images/comments_up.png');
	        	$("#comments"+number).show();
       		} else {
       			console.log(toggle);
	        	toggle.setAttribute('src', 'resources/images/comments_down.png');
	        	$("#comments"+number).hide();
       		}
        }
        function clickMenu(number){
			if($("#board-menu-down"+number).css("display") == 'none'){
				$("#board-menu-down"+number).show();
			} else {
				$("#board-menu-down"+number).hide();
			}
		}
        function clickMenuComment(number){
			//
			if($("#board-comment-menu-down"+number).css("display") == 'none'){
				$("#board-comment-menu-down"+number).show();
			} else {
				$("#board-comment-menu-down"+number).hide();
			}
		}
        
        function modifyBoard(bno, nmno){
        	location.href="toUpdateBoardPage.nm?bno=" + bno + "&nmno=" + nmno;
        }
        
        function deleteBoard(bno, nmno){
			location.href="deleteBoardOne.nm?bno="+ bno + "&nmno=" + nmno + "&type=2";
		}

        </script>
		<jsp:include page="../common/myPage_RightSideBar.jsp"/>
		<script type="text/javascript">
		
		//글 리스트 불러오기
		$(function(){
			$.ajax({
				url:'selectBoardListAjax.bo',
				type:'post',
				success:function(data){
					var list = data["list"];
					var colist = data["colist"];
					
					var tempI = 0; // number 대용
					
					console.log(colist);
					
					for(var b in list){
						// 나루 글이 아니면 다음껄로
						if(list[b].bType != 100) continue;
						else if(tempI > 10) break;
						//ㄴ 최초 10개의 글만 불러오게 만듬.
						
						// 추가될 댓글 스트링
						var str = '';
						var tempJ = 0; // number 대용
						
						for(var co in colist){
							if(colist[co].targetBno == list[b].bno){
								var strTemp = '<div id="comments' + tempI + '" style="margin-top:20px; padding-top: 10px; border-top: solid 1px gray; display: none;" >'
								+			'<div style="margin-bottom: 20px; -webkit-box-shadow: 1px 1px 5px gray; -moz-box-shadow: 1px 1px 5px gray; padding-top: 20px; padding-bottom: 20px;">'
						        +    			'<div style="width: 40px; height: 40px; float: left; margin-right: 10px; " >'
						        +    				'<img src="resources/images/profile_defalt.png" style="width: 100%; height: 100%">'
						        +    			'</div>'
						        +    			'<div style="float: right; width: 40px; height: 40px; margin-right: 20px;" onclick="clickMenuComment(' + tempJ +');">'
								+					'<img alt="" src="resources/images/menu.png" style="width: 100%; height: 100%;">'			            			
						        +   				'<div id="board-comment-menu-down' + tempJ++ +'" class="board-menu-down">'
								+						'<ul>'
								+							'<li><a href="#">댓글 수정 </a></li>'
								+							'<li><a href="#">댓글 삭제 </a></li>'
								+						'</ul>'
								+					'</div>'
						        +    			'</div>'
						        +    			'<div style="margin-top: 10px; padding-bottom:10px; border: solid 1px white;">'
							    +    				'<span>' + colist[co].bWriter + '<br><br></span>'
						        +    				'<div style="padding-left: 10px; padding-right: 10px;">' + colist[co].bContent + '</div>'
						        +    				'<span style="float: right;">' + colist[co].createDate + '<br></span> '
						        +    			'</div>'
						        +    		'</div>'
						        +    	'</div>';
						        
						        str += strTemp;
						        
							}
							
							if(colist[co].mno == ${loginUser.mid}){
								$.ajax({
									url:'selectNarumaruName.bo',
									type:'post',
									data:{"nmno":colist[co].nmno,"bWriter":colist[co].bWriter,"bContent":colist[co].bContent,"createDate":colist[co].createDate},
									success:function(data){
										//여긴 작성한 댓글 리스트 추가하기
											$("#comment-contants").append('<li class="board-li" style="color: black;">'
								            	+	'<div style="margin-bottom: 20px;">'
							            		+	'<div style="margin-top: 20px; margin-left: 20px;">'
							            		+		'<span><font size="3px">' + data["bWriter"] + '</font>&nbsp;&nbsp;<font color="darkgray">댓글</font></span>'
							            		+	'</div>' 
								            	+	'</div>'
								            	+	'<br>'
								            	+	'<div style="margin-bottom: 20px; padding-left: 20px; padding-right: 20px;">'
								            	+		'<div style="padding-bottom: 10px;">' + data["bContent"] + '</div>'
								            	+		'<div style="padding-bottom: 10px; color: darkgray; text-align: right;">' + data["createDate"] + '</div>'
								            	+		'<div style="border-top: solid 1px darkgray; padding-top: 40px; font-size: 15px;">'
								            	+			data["nmName"]
								            	+		'</div>'
												+		'<br>'
								            	+	'</div>'
												+'</li>');
									},
									error:function(){
										}
								});
							}
						}
						
						$("#board-contants").append('<li class="board-li" style="color: black;">'
				            +	'<div class="board-li-title">' + list[b].bTitle + '</div>'
			            	+	'<div style="margin-bottom: 20px;">'
			            	+		'<div style="width: 40px; height: 40px; float: left; margin-right: 10px;">'
			            	+			'<img src="resources/images/profile_defalt.png" style="width: 100%; height: 100%">'
			            	+		'</div>'
			            	+		'<div style="float: right; width: 40px; height: 40px; margin-right: 20px;" onclick="clickMenu(' + tempI +');">'
							+			'<img alt="" src="resources/images/menu.png" style="width: 100%; height: 100%;">'		            			
			            	+			'<div id="board-menu-down' + tempI +'" class="board-menu-down">'
							+				'<ul>'
							+					'<li><a onclick="modifyBoard(' + list[b].bno +', ' + list[b].nmno +')">글 수정 </a></li>'
							+					'<li><a href="#">공지등록</a></li>'
							+					'<li><a onclick="deleteBoard(' + list[b].bno +', ' + list[b].nmno +')">삭제</a></li>'
							+				'</ul>'
							+			'</div>'
			            	+		'</div>'
			            	+		'<div style="margin-top: 20px;">'
			            	+			'<span>' + list[b].bWriter + '<br></span>'
			            	+			'<span>' + list[b].createDate + '</span>'
			            	+		'</div>'
			            	+	'</div>'
			            	+	'<div style="margin-bottom: 20px; padding-bottom: 10px; padding-left: 20px; padding-right: 20px;">'
			            	+		'<div style="padding-bottom: 10px;">' + list[b].bContent + '</div>'
			            	+		'<div style="padding-top: 10px; border-top: solid 1px gray;">'
							+			'<div style="float: left;">'
							+				'댓글<img src="resources/images/comments_down.png" id="commentToggle" height="20px;" width="20px;" onclick="commentViews(this,' + tempI++ + ');">'
							+			'</div>'
							+		'</div>'
							+		'<br>'
							+ str
							+	'</div>'
							+'</li>');
						
						
						
					}
				},
				error:function(data){
				}
			})
		});
		
		
		$(function(){
			var boardCheack = 1;
			$(".tab_content").hide();
		    $(".tab_content:first").show();

		    $("ul.tabs li").click(function () {
		    	boardCheack = boardCheack*-1;
		    	/* -1을 곱해서 1 과 -1를 번갈아가면서 바꿔준다. 게시글과 댓글 무한스크롤을 구분하기 위해서. 1일경우, 게시글 -1일경우 댓글 */
		        $("ul.tabs li").removeClass("active").css("color", "#333");
		        //$(this).addClass("active").css({"color": "darkred","font-weight": "bolder"});
		        $(this).addClass("active").css("color", "darkred");
		        $(".tab_content").hide()
		        var activeTab = $(this).attr("rel");
		        $("#" + activeTab).fadeIn()
		    });
		    
			$(document).scroll(function(){
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
			            	if(boardCheack == 1){
				                $("<li>"+i+" line scroll</li>").appendTo("#board-contants");
			            	} else {
			            		$("<li>"+i+" line scroll</li>").appendTo("#comment-contants");
			            	}
			            }
			        }
				}, 5000);
			});
		});
		</script>
	</body>
</html>