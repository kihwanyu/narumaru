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
</style>
	<div id="wrap">
		<div id="band_top">
			<div id="binbt">
				<img src="${contextPath }/resources/images/logo.png" style="width:70px;height:26px;float:left;">
				<div style="float:left;width:290px;height:26px;border:1px solid #8e8e8e;background-color:rgba(0,0,0,.03);border-radius:15px;margin-left:20px;">
					<input style="border:none;width:240px;margin-left:20px;height:24px;margin-top:1px;background:none;" type="text" id="input_search_view83" class="_gnbInputSearch" role="search" title="밴드, 게시글 검색하기" placeholder="밴드, 게시글을 검색해 보세요" autocomplete="off">
					<img src="${contextPath }/resources/images/magnifying-glass-481818_640.png" style="float:Right;width:15px;height:15px;margin-top:5px;margin-right:7px;cursor:pointer;">
				</div>
				<div style="float:left;margin-left:300px;padding:5px 12px 5px 12px;cursor:pointer;width:65px;" class="top_news">
					<p style="color:#333;font-size:14px;text-align:center;" >새글 피드</p>
				</div>
			
				<div style="padding:5px 12px 5px 12px;cursor:pointer;width:65px;float:left;" class="top_news">
					<p style="color:#333;font-size:14px;text-align:center;">밴드 찾기</p>
				</div>
				<div id="alram">
					<div style="width:18px;height:18px;border-radius:20px;color:#ffffff;background-color:#ff2200;color:10px;font-size:12px;position:relative;right:-10px;top:-5px;text-align:center;">
						<p style="text-align:center;">8</p>
					</div>
				</div>
				<div id="talk">
					
				</div>
				<div id="profile">
					<button onclick="goNaru();">나루~호도</button>				
				</div>
			</div>
						

		</div>
	</div>
	
	
	<script>
		function goNaru(){
			location.href="${contextPath}/naruMain.na";
			
		}
	</script>
	
	
	
	
	
	
	
	
	
	