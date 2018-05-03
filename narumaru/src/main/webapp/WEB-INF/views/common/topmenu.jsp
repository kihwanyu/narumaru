<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	*{
		margin:0 auto;
		list-style:none;
		text-decoration:none;
	}
	a{
		color:#000000;
	}
	#band_top{
		width:100%;
		height:50px;
		background-color:#ffffff;
		position:fixed;
		top:0px;
		z-index:99;
	}
	#wrap{
			width:100%;
	}
	#binbt{
		width:1000px;
		margin:0 auto;
		padding-top:10px;
	}
	#alram{
		width:25px;
		height:25px;
		margin-top:3px;
		background-image:url(${contextPath }/resources/images/appointment-reminders.png);
		background-repeat:no-repeat;
		float:left;
		background-size:100%;
		cursor:pointer;
	}
	#talk{
		margin-left:20px;
		width:25px;
		height:25px;
		margin-top:3px;
		background-image:url(${contextPath }/resources/images/talk.png);
		background-repeat:no-repeat;
		float:left;
		background-size:100%;
		cursor:pointer;
		
	}
	#profile{
		margin-left:20px;
		width:25px;
		height:25px;
		margin-top:3px;
		background-color:#000;
		background-repeat:no-repeat;
		float:left;
		border-radius:20px;
		cursor:pointer;
		overflow:hidden;
	}
	.top_news:hover{
		border:1px solid #e4e4e4;
		background-color:#eef0f3;
	}
	.top_news{
		border:1px solid transparent;
	}
	.profile-dropdown {
		top:51px;
	    display: none;
	    position: absolute;
	    background-color: white;
	    border:1px solid lightgray;
	    z-index: 1;
	    margin-left:0px;
	}
	.alram-dropdown {
		top:20px;
		left:-200px;
		width:300px;
		overflow-y: scroll; 
		height:400px;
	    display: none;
	    position: relative;
	    background-color: white;
	    border:1px solid lightgray;
	    z-index: 1;
	    margin-left:0px;
	    vertical-align:center;
	}
	.profile-dropdown ul{
		padding:15px;
	}
	.new-innerdiv:hover{
		background:#68a2ff;
	}
	.new-innerdiv{
		vertical-align:middle;
		border-bottom:1px solid lightgray; 
		padding: 20px;
	}
	.alarmTitle{
		font-size: 15px;
	}
	.alarmComment{
		margin-top: 10px;
		color: gray;
	}
	.alarmDate{
		margin-top: 10px;
	}
	.alarmInfo{
		margin-bottom: 10px;
		color: yellowgreen;
	}
	.alarmBackground{
		background: pink;
	}
</style>
	<div id="wrap">
		<div id="band_top">
			<div id="binbt">
				<img src="${contextPath }/resources/images/logo.png" style="width:70px;height:26px;float:left; cursor:pointer;" id="logo">
				<div style="float:left;width:290px;height:26px;border:1px solid #8e8e8e;background-color:rgba(0,0,0,.03);border-radius:15px;margin-left:20px;">
					<input style="border:none;width:240px;margin-left:20px;height:24px;margin-top:1px;background:none;" type="text" id="input_search_view83" class="_gnbInputSearch" role="search" title="밴드, 게시글 검색하기" placeholder="밴드, 게시글을 검색해 보세요" autocomplete="off">
					<img src="${contextPath }/resources/images/find.png" style="float:Right;width:15px;height:15px;margin-top:5px;margin-right:7px;cursor:pointer;">
				</div>
				<div style="float:left;width:50px;height:26px;margin-left:10px;">
					<a href="maruChannelView.ma">채널</a>
				</div>
				<div style="float:left;margin-left:150px;padding:5px 12px 5px 12px;cursor:pointer;width:100px;" class="top_news">
					<p style="color:#333;font-size:14px;text-align:center;" >새글 피드</p>
				</div>
			
				<div style="padding:5px 12px 5px 12px;cursor:pointer;width:100px;float:left;" class="top_news">
					<p style="color:#333;font-size:14px;text-align:center;">밴드 찾기</p>
				</div>
				<div id="alram" onclick="clickAlram(this)">
					<div style="width:18px;height:18px;border-radius:20px;color:#ffffff;background-color:#ff2200;color:10px;font-size:12px;position:relative;right:-10px;top:-5px;text-align:center;">
						<p style="text-align:center;" id="alarmCount"></p>
					</div>
					
					<div id="aArea" class="alram-dropdown" style="display:none; z-index:5;">
		            </div>
				</div>
				
				<div id="talk">
					
				</div>
				<div id="profile"  onclick="clickProfile(this)">
					<div id="pArea" class="profile-dropdown" style="display:none;">
		                <ul>
		                    <li><a href="myInfoView.me">마이 페이지 </a></li>
		                    <li><a href="#">초대코드 입력</a></li>
		                    <li><a href="#">공지사항</a></li>
		                    <li><a href="#">이메일 알림 설정</a></li>
		                    <li><a href="#">설정</a></li>
		                    <li><a href="#" class="_btnLogout">로그아웃</a></li>
		               	</ul>
	               </div>
				</div>
			</div>
		</div>		

	</div>
	<script src="http://code.jquery.com/jquery-1.7.2.min.js" type="text/javascript"></script>
	<script>
		$(function(){
			<c:if test="${empty loginUser}">
				alert("세션 종료. 다시 로그인하세요");
				location.href="/narumaru";
			</c:if>
			/* 알람 개수 ajax */
			$.ajax({
				url:"alarmStatusCount.al",
				type:"get",
				success:function(data){
					console.log("서버 전송 성공!");
					console.log(data);
					
					$("#alarmCount").text(data);
					
				},
				error:function(data){
					console.log("서버 전송 실패..");
				},
			});
			/* 알람 리스트 ajax */
			$.ajax({
				url:"alarmList.al",
				type:"get",
				success:function(data){
					console.log("서버 전송 성공!");
					console.log(data);
					
					var $aArea = $("#aArea");
					
					$aArea.html('');
					
					$.each(data, function(index, value){
						switch (value.atno) {
						case 100: /* 관리자-공지사항 */
							var infoStr = "공지사항이 등록 되었습니다.";
							var $innerDiv;
							if(value.status == 1){
								$innerDiv =  $("<div class='new-innerdiv alarmBackground' onclick='clickNoticeAlarm("+value.ano+","+value.send_bno+");'>");
							} else {
								$innerDiv =  $("<div class='new-innerdiv' onclick='clickNoticeAlarm("+value.ano+","+value.send_bno+");'>");
							}
							
							var $alarmInfo = $("<div class='alarmInfo'>").text(infoStr);
							var $alarmTitle = $("<div class='alarmTitle'>").text(value.b_title);
							var $alarmComment = $("<div class='alarmComment'>").text(value.b_content);
							var $alarmDate = $("<div class='alarmDate' align='right'>").text(value.alarm_date);
							
							$innerDiv.append($innerDiv);
							$innerDiv.append($alarmInfo);
							$innerDiv.append($alarmTitle);
							$innerDiv.append($alarmComment);
							$innerDiv.append($alarmDate);
							
							$aArea.append($innerDiv);
							$aArea.append("</div>");
							break;
						case 101: /* 관리자-QA 답변 */
							var infoStr = "Q&A 답변이 등록되었습니다.";
							
							if(value.status == 1){
								$innerDiv =  $("<div class='new-innerdiv alarmBackground' onclick='clickQAAlarm("+value.ano+","+value.send_bno+");'>");
							} else {
								$innerDiv =  $("<div class='new-innerdiv' onclick='clickQAAlarm("+value.ano+","+value.send_bno+");'>");
							}
						
							var $alarmInfo = $("<div class='alarmInfo'>").text(infoStr);
							var $alarmTitle = $("<div class='alarmTitle'>").text(value.b_title);
							var $alarmComment = $("<div class='alarmComment'>").text(value.b_content);
							var $alarmDate = $("<div class='alarmDate' align='right'>").text(value.alarm_date);
							
							$innerDiv.append($innerDiv);
							$innerDiv.append($alarmInfo);
							$innerDiv.append($alarmTitle);
							$innerDiv.append($alarmComment);
							$innerDiv.append($alarmDate);
							
							$aArea.append($innerDiv);
							$aArea.append("</div>");
							break;
						case 200: /* 나루-게시글 댓글 */
							var infoStr = value.send_nicname+"님이 " + value.b_title + " 게시글에 댓글을 작성했습니다.";
							
							if(value.status == 1){
								$innerDiv =  $("<div class='new-innerdiv alarmBackground' onclick='clickNaruMaruFoward("+value.ano+","+value.send_nmno+");'>");
							} else {
								$innerDiv =  $("<div class='new-innerdiv' onclick='clickNaruMaruFoward("+value.ano+","+value.send_nmno+");'>");
							}
							var $alarmInfo = $("<div class='alarmInfo'>").text(infoStr);
							var $alarmTitle = $("<div class='alarmTitle'>").text(value.b_title);
							var $alarmComment = $("<div class='alarmComment'>").text(value.b_content);
							var $alarmDate = $("<div class='alarmDate' align='right'>").text(value.alarm_date);
							
							$innerDiv.append($innerDiv);
							$innerDiv.append($alarmInfo);
							$innerDiv.append($alarmTitle);
							$innerDiv.append($alarmComment);
							$innerDiv.append($alarmDate);
							
							$aArea.append($innerDiv);
							$aArea.append("</div>");
							break;
						case 201: /* 나루-게시글 등록(이웃) */
							var infoStr = value.send_nicname+"님이 게시글을 작성했습니다.";
							
							if(value.status == 1){
								$innerDiv =  $("<div class='new-innerdiv alarmBackground' onclick='clickNaruMaruFoward("+value.ano+","+value.send_nmno+");'>");
							} else {
								$innerDiv =  $("<div class='new-innerdiv' onclick='clickNaruMaruFoward("+value.ano+","+value.send_nmno+");'>");
							}
							var $alarmInfo = $("<div class='alarmInfo'>").text(infoStr);
							var $alarmTitle = $("<div class='alarmTitle'>").text(value.b_title);
							var $alarmComment = $("<div class='alarmComment'>").text(value.b_content);
							var $alarmDate = $("<div class='alarmDate' align='right'>").text(value.alarm_date);
							
							$innerDiv.append($innerDiv);
							$innerDiv.append($alarmInfo);
							$innerDiv.append($alarmTitle);
							$innerDiv.append($alarmComment);
							$innerDiv.append($alarmDate);
							
							$aArea.append($innerDiv);
							$aArea.append("</div>");
							break;
						case 202: /* 나루-이웃 신청 */
							var infoStr = value.send_nicname+"님이  이웃을 신청했습니다.";
							
							if(value.status == 1){
								$innerDiv =  $("<div class='new-innerdiv alarmBackground' onclick='clickMyPageNeighborListFoward("+value.ano+");'>");
							} else {
								$innerDiv =  $("<div class='new-innerdiv' onclick='clickMyPageNeighborListFoward("+value.ano+");'>");
							}
							var $alarmInfo = $("<div class='alarmInfo'>").text(infoStr);
							var $alarmComment = $("<div class='alarmComment'>").text("환영해주세요!");
							var $alarmDate = $("<div class='alarmDate' align='right'>").text(value.alarm_date);
							
							$innerDiv.append($innerDiv);
							$innerDiv.append($alarmInfo);
							$innerDiv.append($alarmComment);
							$innerDiv.append($alarmDate);
							
							$aArea.append($innerDiv);
							$aArea.append("</div>");
							break;					
						break;
						case 204: /* 나루-결제선 구매 - 구현해야됨. */
							var infoStr = value.send_nicname+"님이  " + value.b_title + " 게시글의 결제선을 이용하셨습니다.";
							
							if(value.status == 1){
								$innerDiv =  $("<div class='new-innerdiv alarmBackground' onclick='clickMyPageNaruRevenueFoward("+value.ano+");'>");
							} else {
								$innerDiv =  $("<div class='new-innerdiv' onclick='clickMyPageNaruRevenueFoward("+value.ano+");'>");
							}
							var $alarmInfo = $("<div class='alarmInfo'>").text(infoStr);
							var $alarmComment = $("<div class='alarmComment'>").text("100P를 받으셨습니다.");
							var $alarmDate = $("<div class='alarmDate' align='right'>").text(value.alarm_date);
							
							$innerDiv.append($innerDiv);
							$innerDiv.append($alarmInfo);
							$innerDiv.append($alarmComment);
							$innerDiv.append($alarmDate);
							
							$aArea.append($innerDiv);
							$aArea.append("</div>");
							break;
							break;
						case 300: /* 마루-게시글 댓글 */
							var infoStr = value.send_nicname+"님이 \"" + value.nm_title + "\" 마루의 " + value.b_title + " 게시글에 댓글을 작성했습니다.";
							
							var $innerDiv = $("<div class='new-innerdiv'>");
							var $alarmInfo = $("<div class='alarmInfo'>").text(infoStr);
							var $alarmTitle = $("<div class='alarmTitle'>").text(value.b_title);
							var $alarmComment = $("<div class='alarmComment'>").text(value.b_content);
							var $alarmDate = $("<div class='alarmDate' align='right'>").text(value.alarm_date);
							
							$innerDiv.append($innerDiv);
							$innerDiv.append($alarmInfo);
							$innerDiv.append($alarmTitle);
							$innerDiv.append($alarmComment);
							$innerDiv.append($alarmDate);
							
							$aArea.append($innerDiv);
							$aArea.append("</div>");
							break;
						case 301: /* 마루-게시글 등록(회원) */
							var infoStr = value.send_nicname+"님이 \"" + value.nm_title + "\" 마루의 게시글을 작성했습니다.";
							
							if(value.status == 1){
								$innerDiv =  $("<div class='new-innerdiv alarmBackground' onclick='clickNaruMaruFoward("+value.ano+","+value.send_nmno+");'>");
							} else {
								$innerDiv =  $("<div class='new-innerdiv' onclick='clickNaruMaruFoward("+value.ano+","+value.send_nmno+");'>");
							}
							
							var $alarmInfo = $("<div class='alarmInfo'>").text(infoStr);
							var $alarmTitle = $("<div class='alarmTitle'>").text(value.b_title);
							var $alarmComment = $("<div class='alarmComment'>").text(value.b_content);
							var $alarmDate = $("<div class='alarmDate' align='right'>").text(value.alarm_date);
							
							$innerDiv.append($innerDiv);
							$innerDiv.append($alarmInfo);
							$innerDiv.append($alarmTitle);
							$innerDiv.append($alarmComment);
							$innerDiv.append($alarmDate);
							
							$aArea.append($innerDiv);
							$aArea.append("</div>");
							break;
						case 302: /* 마루-회원 초대 */
							var infoStr = value.send_nicname+"님이 \"" + value.nm_title + "\" 마루에 초대하셨습니다.";
							
							if(value.status == 1){
								$innerDiv =  $("<div class='new-innerdiv alarmBackground' onclick='clickMyPageInvitationFoward("+value.ano+");'>");
							} else {
								$innerDiv =  $("<div class='new-innerdiv' onclick='clickMyPageInvitationFoward("+value.ano+");'>");
							}
							var $alarmInfo = $("<div class='alarmInfo'>").text(infoStr);
							var $alarmComment = $("<div class='alarmComment'>").text("함께해주세요!");
							var $alarmDate = $("<div class='alarmDate' align='right'>").text(value.alarm_date);
							
							$innerDiv.append($alarmInfo);
							$innerDiv.append($alarmComment);
							$innerDiv.append($alarmDate);
							
							$aArea.append($innerDiv);
							$aArea.append("</div>");
							break;
						case 303: /* 마루-회원 가입신청 */
							var infoStr = value.send_nicname+"님이 \"" + value.nm_title + "\" 마루의 가입신청을 했습니다.";
							
						if(value.status == 1){
								$innerDiv =  $("<div class='new-innerdiv alarmBackground' onclick='clickMaruInitiationFoward("+value.ano+","+value.send_nmno+");'>");
							} else {
								$innerDiv =  $("<div class='new-innerdiv' onclick='clickMaruInitiationFoward("+value.ano+","+value.send_nmno+");'>");
							}
							
							var $alarmInfo = $("<div class='alarmInfo'>").text(infoStr);
							var $alarmComment = $("<div class='alarmComment'>").text("환영해주세요!");
							var $alarmDate = $("<div class='alarmDate' align='right'>").text(value.alarm_date);
							
							$innerDiv.append($innerDiv);
							$innerDiv.append($alarmInfo);
							$innerDiv.append($alarmComment);
							$innerDiv.append($alarmDate);
							
							$aArea.append($innerDiv);
							$aArea.append("</div>");
							break;
						case 304: /* 마루-회원 가입승인 */
							var infoStr = value.send_nicname+"님이 \"" + value.nm_title + "\" 마루에 가입승인이 됬습니다.";
							
							if(value.status == 1){
								$innerDiv =  $("<div class='new-innerdiv alarmBackground' onclick='clickNaruMaruFoward("+value.ano+","+value.send_nmno+");'>");
							} else {
								$innerDiv =  $("<div class='new-innerdiv' onclick='clickNaruMaruFoward("+value.ano+","+value.send_nmno+");'>");
							}
							
							var $alarmInfo = $("<div class='alarmInfo'>").text(infoStr);
							var $alarmComment = $("<div class='alarmComment'>").text("마루에 가입되었습니다. 놀러오세요!");
							var $alarmDate = $("<div class='alarmDate' align='right'>").text(value.alarm_date);
							
							$innerDiv.append($innerDiv);
							$innerDiv.append($alarmInfo);
							$innerDiv.append($alarmComment);
							$innerDiv.append($alarmDate);
							
							$aArea.append($innerDiv);
							$aArea.append("</div>");
							break;
						default: /* 305 - 마루-회원 가입소개 */
							var infoStr = value.send_nicname+"님이 \"" + value.nm_title + "\" 마루에 가입했습니다.";
						
							if(value.status == 1){
								$innerDiv =  $("<div class='new-innerdiv alarmBackground' onclick='clickNaruMaruFoward("+value.ano+","+value.send_nmno+");'>");
							} else {
								$innerDiv =  $("<div class='new-innerdiv' onclick='clickNaruMaruFoward("+value.ano+","+value.send_nmno+");'>");
							}
							
							var $alarmInfo = $("<div class='alarmInfo'>").text(infoStr);
							var $alarmComment = $("<div class='alarmComment'>").text("환영해주세요!");
							var $alarmDate = $("<div class='alarmDate' align='right'>").text(value.alarm_date);
							
							$innerDiv.append($innerDiv);
							$innerDiv.append($alarmInfo);
							$innerDiv.append($alarmComment);
							$innerDiv.append($alarmDate);
							
							$aArea.append($innerDiv);
							$aArea.append("</div>");
							break;
						}
					});
				},
				error:function(data){
					console.log("서버 전송 실패..");
				},
			});
		});
		function clickProfile(div){
			var con = document.getElementById("pArea");
			
			document.getElementById("aArea").style.display = 'none';
			
		    if(con.style.display=='none'){
		        con.style.display = 'block';
		    }else{
		        con.style.display = 'none';
		    }
		}
		
		/* 공지사항 알람 클릭 이벤트 */
		function clickNoticeAlarm(ano, bno){
			
			$.ajax({
				url:"alarmStatusUpdate.al",
				data:{ano,ano},
				type:"get",
				success:function(data){
					console.log("서버 전송 성공!");
				},
				error:function(data){
					console.log("서버 전송 실패..");
				},
			});
			
			location.href = "noticeDetail.no?bno="+bno;
		}
		/* Q&A 알람 클릭 이벤트 */
		function clickQAAlarm(ano, bno){
			$.ajax({
				url:"alarmStatusUpdate.al",
				data:{ano,ano},
				type:"get",
				success:function(data){
					console.log("서버 전송 성공!");
				},
				error:function(data){
					console.log("서버 전송 실패..");
				},
			});
		}
		/* 나루 이동 클릭 이벤트 */
		function clickNaruMaruFoward(ano, nmno){
			$.ajax({
				url:"alarmStatusUpdate.al",
				data:{ano,ano},
				type:"get",
				success:function(data){
					console.log("서버 전송 성공!");
				},
				error:function(data){
					console.log("서버 전송 실패..");
				},
			});
			
			location.href = "boardListAll.bo?nmno="+nmno;
		}
		/* 마이페이지 - 이웃 추가 이동 클릭 이벤트 */
		function clickMyPageNeighborListFoward(ano){
			$.ajax({
				url:"alarmStatusUpdate.al",
				data:{ano,ano},
				type:"get",
				success:function(data){
					console.log("서버 전송 성공!");
				},
				error:function(data){
					console.log("서버 전송 실패..");
				},
			});
			
			location.href = "naruNeighborListView.me";
		}
		/* 마이페이지 - 나루 수익 페이지 이동 클릭 이벤트 */
		function clickMyPageNaruRevenueFoward(ano){
			$.ajax({
				url:"alarmStatusUpdate.al",
				data:{ano,ano},
				type:"get",
				success:function(data){
					console.log("서버 전송 성공!");
				},
				error:function(data){
					console.log("서버 전송 실패..");
				},
			});
			
			location.href = "";
		}
		/* 나루 가입 목록 페이지 */
		function clickMaruInitiationFoward(ano, nmno){
			$.ajax({
				url:"alarmStatusUpdate.al",
				data:{ano,ano},
				type:"get",
				success:function(data){
					console.log("서버 전송 성공!");
				},
				error:function(data){
					console.log("서버 전송 실패..");
				},
			});
			
			location.href = "";
		}
		/* 마이페이지 마루 초대받은 목록 페이지 */
		function clickMyPageInvitationFoward(ano){
			$.ajax({
				url:"alarmStatusUpdate.al",
				data:{ano,ano},
				type:"get",
				success:function(data){
					console.log("서버 전송 성공!");
				},
				error:function(data){
					console.log("서버 전송 실패..");
				},
			});
			
			location.href = "";
		}
		
		function clickAlram(div){
			var con = document.getElementById("aArea");
			
			document.getElementById("pArea").style.display = 'none';
			
		    if(con.style.display=='none'){
		        con.style.display = 'block';
		    }else{
		        con.style.display = 'none';
		    }
		}
		
		$("#logo").click(function(){
			location.href="goHome.nm";
		});
		
	</script>