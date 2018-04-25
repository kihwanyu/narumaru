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
				<div style="width: 100%;">
				    <ul class="tabs">
				        <li class="active" rel="tab1" style="color: black;">출금 신청</li>
				        <li rel="tab2" style="color: black;">출금 내역</li>
				    </ul>
				    <div class="tab_container" align="center">
				        <div id="tab1" class="tab_content" style="color: black;">
				        	<form action="pointRefund.pa" method="post">
								<div class="rFund">
									<table class="table t3">
										<tr>
											<td style="width: 20%;">환전 포인트 : </td>
											<td>
												<input type="text" id="pointText" class="panel panel-default" name="point">
												<label style="color:gray;">숫자만 입력해주세요.</label>
												<input type="button" value="잔여 포인트 조회"> 
												<label style="color:gray;">잔여 포인트 : <fmt:formatNumber value="${pList.point }" type="number"/><fmt:formatNumber value="${userTotalPoint }" type="number"/> P</label>
											</td>
										</tr>
										<tr>
											<td>은행 : </td>
											<td>
												<select class="panel panel-default" name="bcode">
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
												<input type="text" name="account_number" placeholder="계좌번호" class="panel panel-default">
												<label style="color:gray;">(-)포함한 숫자를 입력해주세요.	</label>
											</td>
										</tr>
										<tr>
											<td>예금주명 : </td>
											<td>
												<input type="text" name="account_holder" placeholder="예금주명" class="panel panel-default">
												<label style="color:gray;">정확한 예금주명을 입력해주세요.</label>
											</td>
										</tr>
									</table>
									<input type="submit" class="btn btn-success" value="제출하기" disabled="disabled">
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
				        
				        
				        
				         <!-- #tab1 -->
				        <div id="tab2" class="tab_content">
				        	<table class="table" style="color:black;">
				        		<thead>
				        			<th>신청일</th>
				        			<th>출금액</th>
				        			<th>지급액</th>
				        			<th>상태</th>
				        			<th>입금일(또는 입금예정일)</th>
				        		</thead>	
				        		<tbody>
				        			<tr>
					        			<td>2018.04.12</td>
					        			<td>30,000 원</td>
					        			<td>30,000 원</td>
					        			<td>출금 완료</td>
					        			<td>2018.04.13</td>
					        		</tr>
				        		</tbody>
				        	</table>
				        	<div style="color: gray;">
								<ul class="pagination">
									<li><a href="#"><<</a></li>
									<li><a href="#"><</a></li>
									<li><a href="#">1</a></li>
									<li class="active"><a href="#">2</a></li>
									<li><a href="#">3</a></li>
									<li><a href="#">4</a></li>
									<li><a href="#">5</a></li>
									<li><a href="#">></a></li>
									<li><a href="#">>></a></li>
								</ul>
							</div>
				       	</div>
				        <!-- #tab2 -->
				    </div>
				</div>
			</div>
			<form action="">
				
			</form>
			<input type="button" id="accountCertifiedBtn" value="테스트 버튼">
		</div>
		
		<jsp:include page="../common/myPage_RightSideBar.jsp"/>
		
		<script type="text/javascript">
		$(function(){
			
			var pointPass = "";
			
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
		    
		    $("#accountCertifiedBtn").click(function(){
		    	location.href = "accountCertified.pa";
		    });
		    
		    $("#pointText").keydown(function(){
				var patten = /^[0-9]/g;
				var point = $("#pointText").val();
				var pointSub = point.substr(point.length-1);
				
				if(patten.test(pointSub) || point == ""){
					pointPass = point;
				} else {
					$("#pointText").val(pointPass);
				}
			});
		});
		</script>
</body>
</html>