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
	#new-innerdiv:hover{
		background:#68a2ff;
	}
</style>
	<div id="wrap">
		<div id="band_top">
			<div id="binbt">
				<img src="${contextPath }/resources/images/logo.png" style="width:70px;height:26px;float:left;">
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
						<p style="text-align:center;">8</p>
					</div>
					
					<div id="aArea" class="alram-dropdown" style="display:none;">
		               <h4 style="margin:15px;">새 소식</h4>
		               <hr style="margin-bottom:0;">
		               <c:forEach var="i" begin="1" end="5">
		               <div id="new-innerdiv" style="vertical-align:middle;border-bottom:1px solid lightgray; line-height:60px; height:60px;">
		               		<img src="${contextPath}/resources/images/cosmos.jpg" style="margin:5px; width:50px; height:50px; border-radius: 150px;"/>&nbsp;<label style="position:absolute;">맞짱 신청을 받았습니다</label>
		               </div>
		               </c:forEach>
		            </div>
				</div>
				
				<div id="talk">
					
				</div>
				<div id="profile"  onclick="clickProfile(this)">
					<div id="pArea" class="profile-dropdown" style="display:none;">
		                <ul>
		                    <li><a href="#">마이 페이지 </a></li>
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
		function clickProfile(div){
			var con = document.getElementById("pArea");
			
			document.getElementById("aArea").style.display = 'none';
			
		    if(con.style.display=='none'){
		        con.style.display = 'block';
		    }else{
		        con.style.display = 'none';
		    }
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
	</script>