<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>메인페이지</title>
	<style>
		*{
			margin:0 auto;
			list-style:none;
			text-decoration:none;
		}
		a{
			color:#000000;
		}
		#band_middle{
			margin-top:50px;
			width:100%;
			height:320px;
			background-color:#eef0f3;
		}
		#band_bottom{
			width:100%;
			height:850px;
			background-color:#f7f8f9;
		}
		#binb{
			width:1000px;
			margin:0 auto;
			padding-top:30px;
		}
		#binbb{
			width:1000px;
			margin:0 auto;
			padding-top:20px;
		}
		
		#middle_box li{
			float:left;
			font-size:15px;
			margin-right:20px;
		}
		#middle_box li a{
		color:#000000;
		}
		#middle_box li:hover{
			border-bottom:1px solid black;
		}
		#middle_box{
			float:right;

		}
		
		.bottom_object{
			box-shadow:0 1px 2px 0 rgba(0,0,0,.12);
			width:488px;
			height:203px;
			background-color:#ffffff;
			float:left;
			margin-left:10px;
			margin-top:20px;
		}
		.bottom_box{
			border:1px solid #e1e1e1;
		}
		.bottom_box:hover{
			border:1px solid black;
		}
	</style>
</head>
<body>
	<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" scope="application" />
	<jsp:include page="../common/topmenu.jsp"/>
		
	<div id="band_middle">
		<div id="binb">
			<h2>내 밴드 <span>2</span></h2>
			<ul id="middle_box">
				<li><a href="#"><img src="${contextPath }/resources/images/image/톱니"> 목록 편집</a></li>
				<li><a href="#"><img src="${contextPath }/resources/images/image/책"> 밴드 가이드</a></li>
				<li><a href="#"><img src="${contextPath }/resources/images/image/다운로드"> 데스크탑버전 다운로드</a></li>
			</ul>
		<div style="margin-top:20px;">
			<div style="width:180px;height:200px;background:#ffffff;float:left;margin-top:20px;margin-right:30px;">
				<a href="maruInsertView.ma">
					<div style="width:60px;height:60px;border-radius:30px;background-color:gray;margin-top:50px;\">
					<p style="font-size:65px;text-align:center;color:#ffffff;position:Relative;top:-20px;">+</p>
					</div>
					<p style="width:100px;text-align:Center;margin-top:12.5px;">밴드 만들기</p>
				</a>
			</div>
			<div style="width:180px;height:200px;background:#ffffff;float:left;margin-top:20px;margin-right:30px;">
				<img src="${contextPath }/resources/images/dummy.png" style="width:180px;height:125px;">
				<p style="text-align:left;margin-top:5px;margin-left:15px;">밴드이름</p>
				<p style="color:#969696;font-size:13px;margin-left:15px;">밴드설명</p>
			</div>
			<div style="width:180px;height:200px;background:#ffffff;float:left;margin-top:20px;margin-right:30px;">
				<img src="${contextPath }/resources/images/dummy.png" style="width:180px;height:125px;">
				<p style="text-align:left;margin-top:5px;margin-left:15px;">밴드이름2</p>
				<p style="color:#2ecc71;font-size:13px;margin-left:15px;">밴드설명2</p>
			</div>
			</div>
		</div>
	</div>
		<div id="band_bottom">
		<div id="binbb">
			<h2>공개밴드 인기글</h2>
			<h6 style="float:right;margin-top:-20px;">더보기 ></h6>
			<div id="object_list">
			<div class="bottom_object" style='margin-bottom:20px;'>
				<div style="width:468px;height:30px;border-bottom:1px solid #f5f5f5;padding-left:20px;font-size:15px;padding-top:10px;">
					<span>제목</span>
				</div>
				<div>
					<p style="width:330px;height:100px;float:left;margin-left:20px;margin-top:15px;font-size:14px;">인기글1</p>
					<img src="${contextPath }/resources/images/dummy.png" style="width:93px;height:93px;float:right;margin-top:15px;margin-right:20px;">
				</div>
				<div style="height:30px;width:468px;padding-left:20px;float:left; font-size:15px;">
					<img src="${contextPath }/resources/images/smile.png" style="width:20px;height:20px;float:left;margin-top:5px;">
					<img src="${contextPath }/resources/images/smile.png" style="width:20px;height:20px;position:relative;left:-10px;top:5px;">
					<span style="margin-left:-10px;;margin-top:-5px;">86</span>
					<span style="">댓글</span> <span id="reply">65</span>
				</div>
			</div>
			<div class="bottom_object">
				<div style="width:468px;height:30px;border-bottom:1px solid #f5f5f5;padding-left:20px;font-size:15px;padding-top:10px;">
					<span>제목</span>
				</div>
				<div>
					<p style="width:330px;height:100px;float:left;margin-left:20px;margin-top:15px;font-size:14px;">인기글2</p>
					<img src="${contextPath }/resources/images/dummy.png" style="width:93px;height:93px;float:right;margin-top:15px;margin-right:20px;">
				</div>
				<div style="height:30px;width:468px;padding-left:20px;float:left; font-size:15px;">
					<img src="${contextPath }/resources/images/smile.png" style="width:20px;height:20px;float:left;margin-top:5px;">
					<img src="${contextPath }/resources/images/smile.png" style="width:20px;height:20px;position:relative;left:-10px;top:5px;">
					<span style="margin-left:-10px;;margin-top:-5px;">60</span>
					<span style="">댓글</span> <span id="reply">75</span>
				</div>
			</div>
			</div>
			<div style='clear:both;margin-top:20px;'>
				<h2>이런 밴드는 어때요</h2>
				<h6 style="float:right;margin-top:-20px;"><a href=#>더보기 ></a></h6>
					<div style="width:500px;height:80px;float:left;font-size:13px;margin-top:10px;">
					<img src="${contextPath }/resources/images/dummy.png" style="width:80;height:80px;float:left;margin-right:10px;">
					<p style="margin-top:5px;"><strong>밴드이름</strong></p>
					<p style="color:#666;margin-top:5px;margin-bottom:5px;">밴드설명</p>
						<a href="#"><div class="bottom_box" style="float:left;height:23px;border-radius:12px;padding:3px 5px 3px 5px;background-color:#ffffff;">더보기 ></div></a>
				</div>
				<div style="width:500px;height:80px;float:left;font-size:13px;margin-top:10px;">
					<img src="${contextPath }/resources/images/dummy.png" style="width:80;height:80px;float:left;margin-right:10px;">
					<p style="margin-top:5px;"><strong>밴드이름</strong></p>
					<p style="color:#666;margin-top:5px;margin-bottom:5px;">밴드설명</p>
						<a href="#"><div class="bottom_box" style="float:left;height:23px;border-radius:12px;padding:3px 5px 3px 5px;background-color:#ffffff;">더보기 ></div></a>
				</div>
				<div style="width:500px;height:80px;float:left;font-size:13px;margin-top:10px;">
					<img src="${contextPath }/resources/images/dummy.png" style="width:80;height:80px;float:left;margin-right:10px;">
					<p style="margin-top:5px;"><strong>밴드이름</strong></p>
					<p style="color:#666;margin-top:5px;margin-bottom:5px;">밴드설명</p>
						<a href="#"><div class="bottom_box" style="float:left;height:23px;border-radius:12px;padding:3px 5px 3px 5px;background-color:#ffffff;">더보기 ></div></a>
				</div>
				<div style="width:500px;height:80px;float:left;font-size:13px;margin-top:10px;">
					<img src="${contextPath }/resources/images/dummy.png" style="width:80;height:80px;float:left;margin-right:10px;">
					<p style="margin-top:5px;"><strong>밴드이름</strong></p>
					<p style="color:#666;margin-top:5px;margin-bottom:5px;">밴드설명</p>
						<a href="#"><div class="bottom_box" style="float:left;height:23px;border-radius:12px;padding:3px 5px 3px 5px;background-color:#ffffff;">더보기 ></div></a>
				</div>
				<div style="width:500px;height:80px;float:left;font-size:13px;margin-top:10px;">
					<img src="${contextPath }/resources/images/dummy.png" style="width:80;height:80px;float:left;margin-right:10px;">
					<p style="margin-top:5px;"><strong>밴드이름</strong></p>
					<p style="color:#666;margin-top:5px;margin-bottom:5px;">밴드설명</p>
						<a href="#"><div class="bottom_box" style="float:left;height:23px;border-radius:12px;padding:3px 5px 3px 5px;background-color:#ffffff;">더보기 ></div></a>
				</div>
				<div style="width:500px;height:80px;float:left;font-size:13px;margin-top:10px;">
					<img src="${contextPath }/resources/images/dummy.png" style="width:80;height:80px;float:left;margin-right:10px;">
					<p style="margin-top:5px;"><strong>밴드이름</strong></p>
					<p style="color:#666;margin-top:5px;margin-bottom:5px;">밴드설명</p>
						<a href="#"><div class="bottom_box" style="float:left;height:23px;border-radius:12px;padding:3px 5px 3px 5px;background-color:#ffffff;">더보기 ></div></a>
				</div>
				<div style="width:500px;height:80px;float:left;font-size:13px;margin-top:10px;">
					<img src="${contextPath }/resources/images/dummy.png" style="width:80;height:80px;float:left;margin-right:10px;">
					<p style="margin-top:5px;"><strong>밴드이름</strong></p>
					<p style="color:#666;margin-top:5px;margin-bottom:5px;">밴드설명</p>
						<a href="#"><div class="bottom_box" style="float:left;height:23px;border-radius:12px;padding:3px 5px 3px 5px;background-color:#ffffff;">더보기 ></div></a>
				</div>
				<div style="width:500px;height:80px;float:left;font-size:13px;margin-top:10px;">
					<img src="${contextPath }/resources/images/dummy.png" style="width:80;height:80px;float:left;margin-right:10px;">
					<p style="margin-top:5px;"><strong>밴드이름</strong></p>
					<p style="color:#666;margin-top:5px;margin-bottom:5px;">밴드설명</p>
						<a href="#"><div class="bottom_box" style="float:left;height:23px;border-radius:12px;padding:3px 5px 3px 5px;background-color:#ffffff;">더보기 ></div></a>
				</div>
				<div style="width:500px;height:80px;float:left;font-size:13px;margin-top:10px;">
					<img src="${contextPath }/resources/images/dummy.png" style="width:80;height:80px;float:left;margin-right:10px;">
					<p style="margin-top:5px;"><strong>밴드이름</strong></p>
					<p style="color:#666;margin-top:5px;margin-bottom:5px;">밴드설명</p>
						<a href="#"><div class="bottom_box" style="float:left;height:23px;border-radius:12px;padding:3px 5px 3px 5px;background-color:#ffffff;">더보기 ></div></a>
				</div>
				<div style="width:500px;height:80px;float:left;font-size:13px;margin-top:10px;">
					<img src="${contextPath }/resources/images/dummy.png" style="width:80;height:80px;float:left;margin-right:10px;">
					<p style="margin-top:5px;"><strong>밴드이름</strong></p>
					<p style="color:#666;margin-top:5px;margin-bottom:5px;">밴드설명</p>
						<a href="#"><div class="bottom_box" style="float:left;height:23px;border-radius:12px;padding:3px 5px 3px 5px;background-color:#ffffff;">더보기 ></div></a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>  