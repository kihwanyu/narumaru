<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="resources/css/mypage.css"> <!-- mypageCss -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style type="text/css">
		ul.tabs {
		    margin: 0 auto;
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
		    list-style:none;
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
		.t3 input {
			width:400px; 
		
		}
		</style>


<title>Insert title here</title>
</head>
<body>
	
	<jsp:include page="../common/topmenu.jsp"/>	
	<br>
		<br>
		<br>
		<div id="container" style="margin-top: 50px;">
		<c:set var="pageValue" value="refund" scope="request" />
		<jsp:include page="../common/myPage_LeftSideBar.jsp"/>
			
			<div id="contents">
				<div style="margin-top: 5px; margin-bottom: 10px; color: black;" align="right">
				</div>
				<div id="contents_tabView" style="width: 100%;">
				    <ul class="tabs">
				        <li class="active" rel="tab1" style="color: black;">출금 신청</li>
				        <li rel="tab2" style="color: black;">출금 내역</li>
				    </ul>
				    <div class="tab_container" align="center">
				        <div id="tab1" class="tab_content" style="color: black;">
				        	<form role="refund" action="pointRefund.pa" method="post">
				        	<input type="hidden" name="currentPoint" id="currentPoint" value="${userTotalPoint }">
								<div class="rFund">
									<table class="table t3">
										<tr>
											<td style="width: 20%;">환전 포인트 : </td>
											<td>
												<input type="text" id="pointText" class="panel panel-default" name="point">
												<label style="color:gray;">숫자만 입력해주세요.</label>
												<input type="button" id="pointInquiryBtn" value="잔여 포인트 조회"> 
												<label style="color:gray;">
													현재 포인트 : <fmt:formatNumber value="${userTotalPoint }" type="number"/> P
												</label>
											</td>
										</tr>
										<tr>
											<td>은행 : </td>
											<td>
												<select class="panel panel-default" id="bcodeText" name="bcode">
													<option value="0">은행을 선택해주세요.</option>
													<c:forEach items="${bankList }" var="bank">
														<option value="${bank.bcode }">${bank.bank_name }</option>
													</c:forEach>
												</select>
											</td>
										</tr>
										<tr>
											<td>계좌번호 : </td>
											<td>
												<input type="text" id="account_numberText" name="account_number" placeholder="계좌번호" class="panel panel-default">
												<label style="color:gray;">(-)없이 숫자만 입력해주세요.</label>
											</td>
										</tr>
										<tr>
											<td>예금주명 : </td>
											<td>
												<input type="text" id="account_holderText" name="account_holder" placeholder="예금주명" class="panel panel-default">
												<label style="color:gray;">정확한 예금주명을 입력해주세요.</label>
											</td>
										</tr>
									</table>
									<input type="button" id="refundBtn" class="btn btn-success" value="제출하기">
								</div>    
							</form>
							<br><br>
							<div style="border:1px solid black; text-align: left;">
								<label style="font-size: 1.2em;">수익 출금은 다음과 같이 진행됩니다.</label>
								<ol style="list-style: square;">
									<li>* 부정확한 정보를 입력하실 경우, 출금 신청이 취소될 수도 있습니다.</li>
									<li>* 출금은 1원 단위로 하실 수 있으며, 출금 가능한 최소 금액은 50,000원부터 입니다.</li>
									<li>* 출금 신청 금액에서 정산 수수료 15% + 1,000원을 제외한 금액이 입금됩니다.</li>
									<li>* 출금을 신청하시면 다음달 10일(휴일일 경우 이전 영업일)에 일괄적으로 처리해 드립니다.</li>
								</ol>
							</div>
							
				        </div>
				        
				         <!-- #tab2 -->
				        <div id="tab2" class="tab_content">
				        	<table class="table" style="color:black;">
				        		<thead>
				        			<th width="27%">신청일</th>
				        			<th width="15%">출금 포인트(P)</th>
				        			<th width="15%">지급액(원)</th>
				        			<th width="10%">상태</th>
				        			<th width="27%">입금일</th>
				        			<th width="6%">취소</th>
				        		</thead>	
				        		<tbody>
				        			<c:forEach items="${wList }" var="w">
				        				<tr>
						        			<td>${w.resister_dateStr }</td>
						        			<td>${w.point } P</td>
						        			<td>${w.point-w.amount } 원</td>
						        			<td>${w.status }</td>
						        			<td>${w.withdraw_dateStr }</td>
						        			<td><input type="button" value="취소" onclick="withdrawCancle(${w.wno});"></td>
						        		</tr>
				        			</c:forEach>
				        		</tbody>
				        	</table>
				        	<!-- 페이지 처리 -->
							<c:set var="currentPage" value="${pi.currentPage }"/>
							<c:set var="limit" value="${pi.limit }"/>
							<c:set var="startPage" value="${pi.startPage }"/>
							<c:set var="endPage" value="${pi.endPage }"/>
							<c:set var="maxPage" value="${pi.maxPage }"/>
							
							<c:set var="backNextPageVal" value="${currentPage/limit }" />
							<c:set var="backNextTemp" value="${backNextPageVal-0.9 }"/>
							<fmt:parseNumber var="backNextTemp" integerOnly="true" value="${backNextTemp }"/> 
							<!-- int 형변환 -->
							<c:set var="backNextpage" value="${backNextTemp*limit+1 }"/>
							<!-- int 형변환 -->
							<fmt:parseNumber var="backNextpage" integerOnly="true" value="${backNextpage }"/> 
							<c:set var="forwardNextPageVal" value="${currentPage/limit }"/>
							<c:set var="forwardNextTemp" value="${forwardNextPageVal+0.9 }"/>
							<!-- int 형변환 -->
							<fmt:parseNumber var="forwardNextTemp" integerOnly="true" value="${forwardNextTemp }"/> 							
							<c:set var="forwardNextpage"  value="${forwardNextTemp*limit+1 }"/>
							<!-- int 형변환 -->
							<fmt:parseNumber var="forwardNextpage" integerOnly="true" value="${forwardNextpage }"/>  
							<div class="pagingArea">
								<ul class="pagination">
								<li><a href="refundView.me?currentPage=1"><<</a></li>
								<c:choose>
									<c:when test="${currentPage <= 1 }">
										<li class="active"><a href="#"><</a></li>
									</c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${backNextpage < 1 }">
												<li><a href="refundView.me?currentPage=1"><</a></li>
											</c:when>
											<c:otherwise>
												<li><a href="refundView.me?currentPage=${backNextpage }"><</a></li>
											</c:otherwise>
										</c:choose>
									</c:otherwise>
								</c:choose>
								<c:forEach var="p" begin="${startPage }" end="${endPage }" step="1">
									<c:choose>
										<c:when test="${p == currentPage }">
											<li class="active"><a href="#">${p }</a></li>
										</c:when>
										<c:otherwise>
											<li><a href="refundView.me?currentPage=${p }">${p }</a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:choose>
									<c:when test="${currentPage >= maxPage }">
										<li class="active"><a href="#">></a></li>	
									</c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${forwardNextpage > maxPage }">
												<li><a href="refundView.me?currentPage=${maxPage }">></a></li>
											</c:when>
											<c:otherwise>
												<li><a href="refundView.me?currentPage=${forwardNextpage }">></a></li>
											</c:otherwise>
										</c:choose>
									</c:otherwise>
								</c:choose>
								<li><a href="refundView.me?currentPage=${maxPage }">>></a></li>
								</ul>
							</div>
				       	</div>
				        <!-- #tab2 -->
				    </div>
				</div>
				<!-- 로딩 화면 -->
				<div id="loadingArea" align="center" style="display: none;">
					<img alt="" src="resources/images/cat_loading_Img.gif" height="100%" style="margin-top: 200px; margin-bottom: 200px;">
				</div>
			</div>
		</div>
		
		<jsp:include page="../common/myPage_RightSideBar.jsp"/>
		
		<script type="text/javascript">
		function withdrawCancle(wno){
			
			var result = confirm("정말로 취소하시겠습니까? 복구할 수 없습니다.");
			
			if(result){
				location.href = "withDrawDelete.pa";				
			}
		}
		
		$(function(){
			
			var resultPointPass = false;
			
			var pointPass = "";
			var account_numberPass = "";
			var account_holderPass = "";
			$(".tab_content").show();
		    $(".tab_content:first").hide();

		    $("ul.tabs li").click(function () {
		        $("ul.tabs li").removeClass("active").css("color", "#333");
		        $(this).addClass("active").css("color", "darkred");
		        $(".tab_content").hide()
		        var activeTab = $(this).attr("rel");
		        $("#" + activeTab).fadeIn()
		    });
		    
		    $("#accountCertifiedBtn").click(function(){
		    	location.href = "accountCertified.pa";
		    });
		   
		    $("#pointText").keydown(function(){
				var patten = /^[0-9]/g;
				var point = $("#pointText").val();
				var pointSub = point.substr(point.length-1);
				
				resultPointPass = false;
				
				if(patten.test(pointSub) || point == ""){
					pointPass = point;
				} else {
					$("#pointText").val(pointPass);
				}
			});
		    
		    $("#account_numberText").keydown(function(){
				var patten = /^[0-9]/g;
				var account_number = $("#account_numberText").val();
				var account_numberSub = account_number.substr(account_number.length-1);
				
				if(patten.test(account_numberSub) || account_number == ""){
					account_numberPass = account_number;
				} else {
					$("#account_numberText").val(account_numberPass);
				}
			});
		    
		    $("#account_holderText").keydown(function(){
		    	var patten = /^[가-힣]*$/g;
				var account_holder = $("#account_holderText").val();
				var account_holderSub = account_holder.substr(account_holder.length-1);
				
				if(patten.test(account_holderSub) || account_holder == ""){
					account_holderPass = account_holder;
				} else {
					$("#account_holderText").val(account_holderPass);
				}
			});
		    
		    $("#pointInquiryBtn").click(function(){
		    	var point = $("#pointText").val();
		    	var currentPoint = $("#currentPoint").val();
		    	
		    	var resultPoint = currentPoint - point;
		    	
		    	if(point >= 50000){
		    		if(resultPoint >= 0){
		    			alert("출금이 가능합니다. 잔여 포인트 : " + resultPoint);
		    			resultPointPass = true;
		    		} else {
		    			alert("포인트가 부족합니다.");
		    			resultPointPass = false;
		    		}
		    	} else {
		    		alert("5만원 이상 입력해주세요.");
		    	}
		    });
		    $("#refundBtn").click(function(){
		    	$("#contents_tabView").toggle();
				$("#loadingArea").toggle();
		    	setTimeout(function() {
					var formObj = $("form[role='refund']");
			    	
			    	var resultBankVal = $("#bcodeText").val();
			    	
			    	if(!resultPointPass){
			    		alert("잔여포인트 조회를 해주세요.");
			    	} else {
			    		if(resultBankVal == '0'){
			    			alert("은행을 선택해주세요.");
			    		} else {
			    			if(account_numberPass.length < 11){
			    				alert("계좌번호의 자릿수를 확인해주세요.");
			    			} else {
			    				if(account_holderPass.length < 2){
			    					alert("이름을 확인해주세요.");
			    				} else {
			    					formObj.submit();
			    				}
			    			}
			    		}
			    	}
			    	$("#contents_tabView").toggle();
			    	$("#loadingArea").toggle();
				}, 3000);
		    });
		});
		</script>
</body>
</html>