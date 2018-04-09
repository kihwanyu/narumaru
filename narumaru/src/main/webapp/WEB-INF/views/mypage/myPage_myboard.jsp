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
			        <div id="tab1" class="tab_content">
			            <ul>
			            	<li class="board-li" style="color: black;">
			            		<div class="board-li-title">
			            			나루/마루 이름
			            		</div>
			            		<div style="margin-bottom: 20px;">
			            			<div style="width: 40px; height: 40px; float: left; margin-right: 10px;">
			            				<img src="resources/images/profile_defalt.png" style="width: 100%; height: 100%">
			            			</div>
			            			<c:set var="number" value="1"/>
			            				<!-- div id에 게시판의 번호를 달아준다.  -->
			            			<div style="float: right; width: 40px; height: 40px; margin-right: 20px;" onclick="clickMenu(${number});">
										<img alt="" src="resources/images/menu.png" style="width: 100%; height: 100%;">			            			
			            				<div id="board-menu-down${number }" class="board-menu-down">
											<ul>
												<li><a href="#">글 수정 </a></li>
												<li><a href="#">공지등록</a></li>
												<li><a href="#">삭제</a></li>
											</ul>
										</div>
			            			</div>
									
			            			<div style="margin-top: 20px;">
			            				<span>유기환<br></span>
			            				<span>2018.04.09</span>
			            			</div>
			            		</div>
			            		<div style="margin-bottom: 20px; padding-bottom: 10px; padding-left: 20px; padding-right: 20px;">
			            			<div style="padding-bottom: 10px;">
			            				생명을 너의 천고에 길을 대한 노래하며 것이다. 생명을 거선의 있는 뭇 풍부하게 두기 이상의 청춘이 운다. 
										광야에서 품에 인생에 구하지 소금이라 피고, 스며들어 얼마나 있는가? 희망의 충분히 사랑의 대중을 그들을 구하기 목숨을 힘있다. 
										이상의 따뜻한 그들은 같이, 청춘의 인간에 품으며, 충분히 그리하였는가? 그들의 같으며, 있는 인간은 하는 뿐이다. 
										청춘의 원질이 더운지라 듣기만 것이다. 곧 밥을 인생의 이것을 어디 소리다.이것은 피가 이상의 운다. 그들은 있는 그러므로 크고 청춘의 있다.
										생명을 너의 천고에 길을 대한 노래하며 것이다. 생명을 거선의 있는 뭇 풍부하게 두기 이상의 청춘이 운다. 
										광야에서 품에 인생에 구하지 소금이라 피고, 스며들어 얼마나 있는가? 희망의 충분히 사랑의 대중을 그들을 구하기 목숨을 힘있다. 
										이상의 따뜻한 그들은 같이, 청춘의 인간에 품으며, 충분히 그리하였는가? 그들의 같으며, 있는 인간은 하는 뿐이다. 
										청춘의 원질이 더운지라 듣기만 것이다. 곧 밥을 인생의 이것을 어디 소리다.이것은 피가 이상의 운다. 그들은 있는 그러므로 크고 청춘의 있다.	
			            			</div>
			            			<div style="padding-top: 10px; border-top: solid 1px gray;">
										<div style="float: left;">
											댓글<img src="resources/images/comments_down.png" id="commentToggle" height="20px;" width="20px;" onclick="commentViews(this,1);">
											<!-- 번호 전달할때 게시글의 번호 값 전달. -->
										</div>
										<div style="float: right;">
									 		조회수 : 5
										</div>									
									</div>
									<br>
									<!-- div의 id를 comments(게시글 번호로 줄 것.) id="comments"+ -->
									<%-- <c:set var="number" value="1"/> --%>
									<div id="comments${number}" style="margin-top:20px; padding-top: 10px; border-top: solid 1px gray; display: none;" >
										<div style="margin-bottom: 20px; -webkit-box-shadow: 1px 1px 5px gray;
											-moz-box-shadow: 1px 1px 5px gray; padding-top: 20px; padding-bottom: 20px;">
					            			<div style="width: 40px; height: 40px; float: left; margin-right: 10px; " >
					            				<img src="resources/images/profile_defalt.png" style="width: 100%; height: 100%">
					            			</div>
					            			<c:set var="number" value="1"/>
					            				<!-- div id에 게시판의 번호를 달아준다.  -->
					            			<div style="float: right; width: 40px; height: 40px; margin-right: 20px;" onclick="clickMenuComment(${number});">
												<img alt="" src="resources/images/menu.png" style="width: 100%; height: 100%;">			            			
					            				<div id="board-comment-menu-down${number }" class="board-menu-down">
													<ul>
														<li><a href="#">댓글 수정 </a></li>
														<li><a href="#">댓글 삭제 </a></li>
													</ul>
												</div>
					            			</div>
					            			<div style="margin-top: 10px; padding-bottom:10px; border: solid 1px white;">
					            				<span>유기환<br><br></span>
					            				
					            				<div style="padding-left: 10px; padding-right: 10px;">
					            				생명을 너의 천고에 길을 대한 노래하며 것이다. 생명을 거선의 있는 뭇 풍부하게 두기 이상의 청춘이 운다. 
												광야에서 품에 인생에 구하지 소금이라 피고, 스며들어 얼마나 있는가? 희망의 충분히 사랑의 대중을 그들을 구하기 목숨을 힘있다. 
												이상의 따뜻한 그들은 같이, 청춘의 인간에 품으며, 충분히 그리하였는가? 그들의 같으며, 있는 인간은 하는 뿐이다. 
												청춘의 원질이 더운지라 듣기만 것이다. 곧 밥을 인생의 이것을 어디 소리다.이것은 피가 이상의 운다. 그들은 있는 그러므로 크고 청춘의 있다.<br>
					            				</div>
					            				<span style="float: right;">2018.04.09&nbsp;오후 3:40&nbsp;&nbsp;<br></span>
					            			</div>
					            		</div>
					            		<div align="center" style=" border-top: 1px solid gray; padding-top: 10px;" >
											<div style="float: left;">
						            			<textarea rows="2" cols="60" style="resize: none;"></textarea>
						            		</div>
						            		<div style="padding-top: 3px; padding-bottom: 3px;"> 
						            			&nbsp;&nbsp;<input type="button" value="보내기" class="btn btn-default">
						            		</div>					            		
					            		</div>
									</div>
			            		</div>
							</li>
			            	<!--  -->
			            	<li class="board-li" style="color: black;">
								생명을 너의 천고에 길을 대한 노래하며 것이다. 생명을 거선의 있는 뭇 풍부하게 두기 이상의 청춘이 운다. 
								광야에서 품에 인생에 구하지 소금이라 피고, 스며들어 얼마나 있는가? 희망의 충분히 사랑의 대중을 그들을 구하기 목숨을 힘있다. 
								이상의 따뜻한 그들은 같이, 청춘의 인간에 품으며, 충분히 그리하였는가? 그들의 같으며, 있는 인간은 하는 뿐이다. 
								청춘의 원질이 더운지라 듣기만 것이다. 곧 밥을 인생의 이것을 어디 소리다.이것은 피가 이상의 운다. 그들은 있는 그러므로 크고 청춘의 있다.			            	
			            	</li>
			            	<li class="board-li" style="color: black;">
								생명을 너의 천고에 길을 대한 노래하며 것이다. 생명을 거선의 있는 뭇 풍부하게 두기 이상의 청춘이 운다. 
								광야에서 품에 인생에 구하지 소금이라 피고, 스며들어 얼마나 있는가? 희망의 충분히 사랑의 대중을 그들을 구하기 목숨을 힘있다. 
								이상의 따뜻한 그들은 같이, 청춘의 인간에 품으며, 충분히 그리하였는가? 그들의 같으며, 있는 인간은 하는 뿐이다. 
								청춘의 원질이 더운지라 듣기만 것이다. 곧 밥을 인생의 이것을 어디 소리다.이것은 피가 이상의 운다. 그들은 있는 그러므로 크고 청춘의 있다.			            	
			            	</li>
			            	<li class="board-li" style="color: black;">
								생명을 너의 천고에 길을 대한 노래하며 것이다. 생명을 거선의 있는 뭇 풍부하게 두기 이상의 청춘이 운다. 
								광야에서 품에 인생에 구하지 소금이라 피고, 스며들어 얼마나 있는가? 희망의 충분히 사랑의 대중을 그들을 구하기 목숨을 힘있다. 
								이상의 따뜻한 그들은 같이, 청춘의 인간에 품으며, 충분히 그리하였는가? 그들의 같으며, 있는 인간은 하는 뿐이다. 
								청춘의 원질이 더운지라 듣기만 것이다. 곧 밥을 인생의 이것을 어디 소리다.이것은 피가 이상의 운다. 그들은 있는 그러므로 크고 청춘의 있다.			            	
			            	</li>
			            </ul>
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
			        </script>
			        <!-- #tab1 -->
			        <div id="tab2" class="tab_content">2222Mortal Kombat returns after a lengthy hiatus and puts players back into the Tournament for 2D fighting with gruesome combat.</div>
			        <!-- #tab2 -->
			        <div id="tab3" class="tab_content">3333Halo: Reach is the culmination of the superlative combat, sensational multiplayer, and seamless online integration that are the hallmarks of this superb series.</div>
			        <!-- #tab3 -->
			    </div>
			    <!-- .tab_container -->
			</div>
				
			</div>
		</div>
		
		<jsp:include page="../common/myPage_RightSideBar.jsp"/>
		<script type="text/javascript">
		$(function () {

		    $(".tab_content").hide();
		    $(".tab_content:first").show();

		    $("ul.tabs li").click(function () {
		        $("ul.tabs li").removeClass("active").css("color", "#333");
		        //$(this).addClass("active").css({"color": "darkred","font-weight": "bolder"});
		        $(this).addClass("active").css("color", "darkred");
		        $(".tab_content").hide()
		        var activeTab = $(this).attr("rel");
		        $("#" + activeTab).fadeIn()
		    });
		});
		</script>
	</body>
</html>