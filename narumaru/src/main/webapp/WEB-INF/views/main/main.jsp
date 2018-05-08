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
			font-family: 'Nanum Gothic', sans-serif;
      		font-weight: bold;
		}
		a{
			color:#000000;
		}
		.band_middle{
			margin-top:50px;
			width:100%;
			height:450px;
			background-color:#FCC3C0;
		}
		.band_bottom{
			width:100%;
			height:420px;
		}
		.binb{
			width:1000px;
			margin:0 auto;
			padding-top:30px;
		}
		.binbb{
			width:1000px;
			margin:0 auto;
			padding:20px;
			padding-top:40px;
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
			border: 1px solid black; 
			border-radius: 12px; 
			box-shadow: 5px 5px 2.5px grey;
			width:20%;
			height:230px;
			background-color:#ffffff;
			float:left;
			margin: 40px;
			margin-top: 20px;
			padding: 10px;
		}
		.bottom_box{
			border:1px solid #e1e1e1;
		}
		.bottom_box:hover{
			border:1px solid black;
		}
		.myNaruMaruAttr {
			padding: 20px;
			font-size: 30px;
			width: 100%;
		}
		.narumaruselect-div{
			border: 4px solid black; 
			border-radius: 12px; 
			box-shadow: 5px 5px 2.5px grey;
			cursor: pointer;
		}
	</style>
</head>
<body>
 	<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" scope="application"/>
	<jsp:include page="../common/topmenu.jsp"/>
	<jsp:include page="../common/myPage_RightSideBar.jsp"/>	
		
	<div class="band_middle">
		<div class="binb">
			<div class="myNaruMaruAttr">내가 가입한 마루 (<span id="maruCount"></span>)</div>
			<ul id="middle_box">
			</ul>
			<div class="narumaruselect-div" style="background:white; margin-top:20px; height:265px; width:900px; overflow: auto; padding-left: 40px; padding-bottom: 20px;" id="maruList" align="center">
				<div id="narumaru-create-div" class="narumaruselect-div" style="width:180px;height:180px;background:#ffffff;float:left;margin-top:20px;margin-right:30px;">
					<div style="width:60px;height:60px;border-radius:30px;background-color:gray;margin-top:50px;">
					<p style="font-size:65px;text-align:center;color:#ffffff;position:Relative;top:-20px;">+</p>
					</div>
					<div align="center" style="margin-top: 20px;">
						마루 만들기
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="band_bottom" >
		<div class="binbb">
			<div class="myNaruMaruAttr">BEST 나루</div>
			<!-- BEST 나루 -->
			<div id="object_list">
				<div class="bottom_object" style='margin-left:90px;margin-bottom:20px;'>
					<div style="width: 50px; height: 50px;">
						<img src="${contextPath }/resources/images/gold.png" style="width:100%;height:100%;">
					</div>
					<div align="center" style="width: 130px; height: 130px; padding: 10px;">
						<img id="bestNaruImg1" src="${contextPath }/resources/images/defalt_group.png" style="width:100%;height:100%;">
					</div>
					<div align="center" id="bestNaru1">
						나루/마루 이름
					</div>
				</div>
				<div class="bottom_object">
					<div style="width: 50px; height: 50px;">
						<img src="${contextPath }/resources/images/silver.png" style="width:100%;height:100%;">
					</div>
					<div align="center" style="width: 130px; height: 130px; padding: 10px;">
						<img id="bestNaruImg2" src="${contextPath }/resources/images/defalt_group.png" style="width:100%;height:100%;">
					</div>
					<div align="center" id="bestNaru2">
						나루/마루 이름
					</div>
				</div>
				<div class="bottom_object">
					<div style="width: 50px; height: 50px;">
						<img src="${contextPath }/resources/images/bronz.png" style="width:100%;height:100%;">
					</div>
					<div align="center" style="width: 130px; height: 130px; padding: 10px;">
						<img id="bestNaruImg3" src="${contextPath }/resources/images/defalt_group.png" style="width:100%;height:100%;">
					</div>
					<div align="center" id="bestNaru3">
						나루/마루 이름
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="band_bottom">
		<div class="binbb">
			<div class="myNaruMaruAttr">BEST 마루</div>
			<!-- BEST 나루 -->
			<div id="object_list">
				<div class="bottom_object" style='margin-left:90px;margin-bottom:20px;'>
					<div style="width: 50px; height: 50px;">
						<img src="${contextPath }/resources/images/gold.png" style="width:100%;height:100%;">
					</div>
					<div align="center" style="width: 130px; height: 130px; padding: 10px;">
						<img id="bestMaruImg1" src="${contextPath }/resources/images/defalt_group.png" style="width:100%;height:100%;">
					</div>
					<div align="center" id="bestMaru1">
						나루/마루 이름
					</div>
				</div>
				<div class="bottom_object">
					<div style="width: 50px; height: 50px;">
						<img src="${contextPath }/resources/images/silver.png" style="width:100%;height:100%;">
					</div>
					<div align="center" style="width: 130px; height: 130px; padding: 10px;">
						<img id="bestMaruImg2" src="${contextPath }/resources/images/defalt_group.png" style="width:100%;height:100%;">
					</div>
					<div align="center" id="bestMaru2">
						나루/마루 이름
					</div>
				</div>
				<div class="bottom_object">
					<div style="width: 50px; height: 50px;">
						<img src="${contextPath }/resources/images/bronz.png" style="width:100%;height:100%;">
					</div>
					<div align="center" style="width: 130px; height: 130px; padding: 10px;">
						<img id="bestMaruImg3" src="${contextPath }/resources/images/defalt_group.png" style="width:100%;height:100%;">
					</div>
					<div align="center" id="bestMaru3">
						나루/마루 이름
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="band_middle" style="margin-top: 0px;">
		<div class="binb">
			<div class="myNaruMaruAttr">내 이웃 나루</div>
			<ul id="middle_box">
			</ul>
			<div class="narumaruselect-div" style="background:white; margin-top:20px; height:265px; width:900px; overflow: auto; padding-left: 40px; padding-bottom: 20px;" id="neighborList" align="center">
			</div>
		</div>
	</div>
	<jsp:include page="../common/footer.jsp"/>
	
	<script>
	$(function(){
		var mno = ${ loginUser.mid };
		$.ajax({
			url:"selectMaruList.ma",
			type:"get",
			data:{"mno":mno},
			success:function(data){
				console.log(data);
				
				console.log(data.length + "가 랭스");
				$("#maruCount").html(data.length);
				for(var i = 0; i < data.length; i++){
					console.log(data[i]);
					$("#maruList").append(
						'<div class="narumaruselect-div" style="cursor:pointer; width:180px;height:180px;background:#ffffff;float:left;margin-top:20px;margin-right:30px;" class="pointer" onclick="selectMaru('+data[i].NMNO+');">'+
						'<div align="center" style="width: 130px; height: 130px; padding: 10px;">'+
						'<img src="${contextPath }/resources/images/defalt_group.png" style="width:100%;height:100%;">'+
						'</div>'+
						'<p style="text-align:center; padding: 5px; font-size: 15px;">'+data[i].NM_TITLE+'</p>'+
						'</div>'
					);
					
				}
				
				
			},
			error:function(data){
				console.log("실패");
			}			
		});
		$("#narumaru-create-div").click(function(){
			location.href="maruInsertView.ma";
		});
		
		//베스트 나루
		$.ajax({
			url:"selectBestNaru.nm",
			type:"get",
			success:function(data){
				$("#bestNaruImg1").attr("src","resources/memberprofile/"+ data[0].profileName)
				$("#bestNaru1").html(data[0].nmTitle);
				$("#bestNaru1").parent().bind("click", function(){
					location.href="boardListAll.bo?nmno="+data[0].nmno;
				})
				
				$("#bestNaruImg2").attr("src","resources/memberprofile/"+ data[1].profileName)
				$("#bestNaru2").html(data[1].nmTitle);
				$("#bestNaru2").parent().bind("click", function(){
					location.href="boardListAll.bo?nmno="+data[1].nmno;
				})
				
				$("#bestNaruImg3").attr("src","resources/memberprofile/"+ data[2].profileName)
				$("#bestNaru3").html(data[2].nmTitle);
				$("#bestNaru3").parent().bind("click", function(){
					location.href="boardListAll.bo?nmno="+data[2].nmno;
				})
			},
			error:function(data){
				console.log("베스트나루 읽기 실패");
			}			
		});
		
		//베스트 마루
		$.ajax({
			url:"selectBestMaru.nm",
			type:"get",
			success:function(data){
				$("#bestMaruImg1").attr("src","resources/memberprofile/"+ data[0].profileName)
				$("#bestMaru1").html(data[0].nmTitle);
				$("#bestMaru1").parent().bind("click", function(){
					location.href="boardListAll.bo?nmno="+data[0].nmno;
				})
				
				$("#bestMaruImg2").attr("src","resources/memberprofile/"+ data[1].profileName)
				$("#bestMaru2").html(data[1].nmTitle);
				$("#bestMaru2").parent().bind("click", function(){
					location.href="boardListAll.bo?nmno="+data[1].nmno;
				})
				
				$("#bestMaruImg3").attr("src","resources/memberprofile/"+ data[2].profileName)
				$("#bestMaru3").html(data[2].nmTitle);
				$("#bestMaru3").parent().bind("click", function(){
					location.href="boardListAll.bo?nmno="+data[2].nmno;
				})
			},
			error:function(data){
				console.log("베스트나루 읽기 실패");
			}			
		});
		
		//이웃목록 불러오기
		$.ajax({
			url:"selectNeighborListAjax.nc",
			type:"get",
			data:{"mno":mno},
			success:function(data){
				console.log(data);
				for(var i = 0; i < data.length; i++){
					console.log(data[i]);
					$("#neighborList").append(
						'<div class="narumaruselect-div" style="cursor:pointer; width:180px;height:180px;background:#ffffff;float:left;margin-top:20px;margin-right:30px;" class="pointer" onclick="selectMaru('+data[i].nmno+');">'+
						'<div align="center" style="width: 130px; height: 130px; padding: 10px;">'+
						'<img src="${contextPath }/resources/images/defalt_group.png" style="width:100%;height:100%;">'+
						'</div>'+
						'<p style="text-align:center; padding: 5px; font-size: 15px;">'+data[i].nmTitle+'</p>'+
						'</div>'
					);
				}
				
			},
			error:function(data){
				console.log("실패");
			}			
		});
	});
	
	function selectMaru(nmno){
		location.href="boardListAll.bo?nmno="+nmno;
	}
	</script>
</body>
</html>  