<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body{
		width:100%;
		height:100%;
	}
	.maru-content{
		margin-top:50px;
		width:100%;
		height:100%;
		background-color:#f7f8f9;
	}
	#middle-maruname, #middle-marutype, #middle-marucover{
		width: 1000px;
	    margin: 0 auto;
	    padding-left: 100px;
	    padding-top: 30px;
	}
	#middle-maruname{
		height:850px;
		
	}
	#middle-marucover{
		height:250px;
		
	}
	#middle-marutype{
		height:150px;
	}
	#marutype-inner{
		display:table;
		background:white;
		border:1px solid lightgray;
		width:76%;
		float:left;
		padding: 20px 20px;
	}
	#marutype-inner li{
		float:left;
		padding-right: 21px;
		width:30.5%;
	}
	#marutype-inner span{
		font-size:13px;
	}
	#maru-name{
		width:80%;
		line-height: 54px;
	    font-size: 30px;
	    font-weight: 400;
	    border: none;
	    border-bottom: 1px solid #ccc;
	    padding: 0;
	    background: 0 0;
	    color: #333;
	}
	#maru-name:focus{
		outline:none; 
	}
	#marucover-select img{
		float:left;
		padding:5px;
	}
</style>
</head>
<body>
	<jsp:include page="../common/topmenu.jsp"/>
	<div class="maru-content">
		<div id="middle-maruname">
			<br>
			<h4>마루 이름</h4><br>
			<input type="text" id="maru-name" maxlength="50" placeholder="마루 이름 입력">
			<br><br>
			<h4>마루 채널 설정</h4>
			<c:set var="channelArr">
				문화/예술(100), 여행(200), 패션/뷰티(300), 팬클럽(400), 인문/과학(500), 동물(600), 나이(700), 방송/연예(800), 친목/모임(900), 종교/봉사(1000),
				음악(1100) 경제(1200), IT/기술(1300), 게임(1400), 어학/외국어(1500), 만화(1600), 일상/이야기(1700), 스포츠/레저(1800), 건강(1900), 결혼/가정(2000),
                           만화/애니메이션(2100), 정치/사회(2200), 교육/공부(2300), 취미/DIY(2400), 취업/자기개발(2500), 맛집/요리/생활(2600)
			</c:set>
			<input type="hidden" id="maru-channel">
			<table id="channelList" style="float:left;">
				<tr>
					<c:forEach items="${ channelArr }" var="channel" varStatus="status">
						<td><div style="background:lightgray; text-align:center; display:inline-block; width:150px; height:130px; cursor:pointer;" onclick='selectChannel(${fn:substring(channel, fn:indexOf(channel, "(") + 1, fn:indexOf(channel, ")"))});' id='${fn:substring(channel, fn:indexOf(channel, "(")+1, fn:indexOf(channel, ")"))}'><img style="width:100%; height:80%" src="resources/channelfile/${fn:substring(channel, fn:indexOf(channel, '(')+1, fn:indexOf(channel, ')'))}.jpg"/>${ fn:substring(channel, 0, fn:indexOf(channel, "("))  }</div></td>
						<c:if test="${ status.count mod 6 == 0}">
							</tr><tr>
						</c:if>
					</c:forEach>
				</tr>
			</table>
		</div> <!-- 마루 이름 -->
		
		<div id="middle-marucover">
			<img src="${contextPath}/resources/images/cosmos.jpg" style="float:left; width:300px; height:225px;">
			
			<div id="marucover-select" style="padding-left:20px; float:left;">
				<h5 style="margin-bottom:12px">커버 선택</h5>
				<c:forEach var="i" begin="1" end="8" step="1">
					<img src="${contextPath}/resources/images/addpic.jpg"">
				<c:if test="${i == 4}">
					<br>
				</c:if>
				</c:forEach>
			</div>
		</div> <!-- 마루 대표사진 -->
		
		<div id="middle-marutype">
			<h4>마루 공개 설정</h4>
			<br>
			<ul id="marutype-inner">
				<li>
					<input type="radio" value="비공개" name="maruType" id="maruType1" checked>
					<label for="maruType1">
						<strong>비공개 마루</strong><br>
						<span>밴드와 게시글이 공개되지 않습니다. 초대를 통해서만 가입할 수 있습니다.</span>
					</label>
				</li>
				<li>
					<input type="radio" value="이름공개" name="maruType" id="maruType2">
					<label for="maruType2">
						<strong>마루명 공개 마루</strong><br>
						<span>누구나 마루를 검색해 찾을 수 있지만, 게시물은 멤버만 볼 수 있습니다.</span>
					</label>
				</li>
				<li>
					<input type="radio" value="공개" name="maruType" id="maruType3">
					<label for="maruType3">
						<strong>공개 마루</strong><br>
						<span>누구나 마루를 검색해 찾을 수 있고, 게시물을 볼 수 있습니다.</span>
					</label>
				</li>
			</ul>
		</div> <!-- 마루 공개설정 -->
		
		<br>
		<div id="btndiv" align="center">
			<button>취소</button>&nbsp;
			<button onclick="insertDetail();">완료</button>
			<script>
				function insertDetail(){
					location.href="${contextPath}/insertNarumaru.nm?nmCategory=1&nmTitle="+$("#maru-name").val() + "&isOpen=" + $(":checked").val() +"&nmIntro=${loginUser.nickName}님의 마루입니다&cno="+$("#maru-channel").val();					
				}
				
				function selectChannel(chanellNo){
					$("#channelList div").css("background", "lightgray");
					$("#"+chanellNo).css("background", "red");
					$("#maru-channel").val(chanellNo);
				}
			</script>
			
		</div>
	</div><!-- 컨텐츠 -->
</body>
</html>