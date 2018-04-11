<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
							<div class="rFund">
								<table class="table">
									<tr>
										<td><label style="color:blue;">최초 출금 신청 시 먼저 신분증 정보 또는 사업자 정보를 등록해야 합니다.</label>
										<br><label>작가님의 소득에 대한 세금 신고를 위해, 주민등록번호 또는 사업자등록번호를 등록한 작가님만 출금을 신청하실 수 있습니다.</label>
										<label style="font-size: 1.1em;"> 수집한 주민등록번호 및 사업자등록증은 부가가치세법에 따라 세금계산서 발급 및 국세청 매출자료 제출을 목적으로 사용됩니다.</label></td>										
									</tr>
								</table>
								<table class="table t3">
									<tr>
										<td>주민등록번호 : </td>
										<td><input type="text" class="panel panel-default"><label style="color:gray;">&nbsp;&nbsp;&nbsp;&nbsp;'-' 없이 숫자만 입력해주세요</label></td>
									</tr>
									<tr>
										<td>실명 : </td>
										<td><input type="text" class="panel panel-default"></td>
									</tr>
									<tr>
										<td>은행 : </td>
										<td><select class="panel panel-default">
												<option>은행을 선택해주세요.</option>
												<option>우리은행</option>
												<option>기업은행</option>
												<option>국민은행</option>
												<option>농협은행</option>
												<option>대구은행</option>
												<option>부산은행</option>
												<option>산업은행</option>
												<option>새마을금고</option>
												<option>신한은행</option>
												<option>씨티은행</option>
												<option>우체국</option>
												<option>하나은행</option>
												<option>우체국</option>
												<option>K뱅크</option>
												<option>카카오뱅크</option>										
											</select></td>
									</tr>
									<tr>
										<td>계좌번호 : </td>
										<td><input type="text" placeholder="계좌번호" class="panel panel-default"></td>
									</tr>
									<tr>
										<td>예금주명 : </td>
										<td><input type="text" placeholder="예금주명" class="panel panel-default"></td>
									</tr>
								</table>
								<button class="btn btn-success">제출하기</button>
								<!-- <ul class="u3" align="left">
									<li>주민등록번호 : </li>
									<li>실명 : <input type="text" class="panel panel-default"></li>
									<li>은행 : <select class="panel panel-default">
												<option>은행을 선택해주세요.</option>
												<option>우리은행</option>
												<option>기업은행</option>
												<option>국민은행</option>
												<option>농협은행</option>
												<option>대구은행</option>
												<option>부산은행</option>
												<option>산업은행</option>
												<option>새마을금고</option>
												<option>신한은행</option>
												<option>씨티은행</option>
												<option>우체국</option>
												<option>하나은행</option>
												<option>우체국</option>
												<option>K뱅크</option>
												<option>카카오뱅크</option>										
											</select></li>
									<li>계좌번호 : <input type="text" placeholder="계좌번호" class="panel panel-default"></li>
									<li>예금주명 : <input type="text" placeholder="예금주명" class="panel panel-default"></li>		
									<li><button class="btn btn-success">제출하기</button></li>				
								</ul> -->
								
							</div>    
							
							<br><br>
							<div style="border:1px solid black; text-align: left;">
								<label style="font-size: 1.2em;">수익 출금은 다음과 같이 진행됩니다.</label>
								<ol style="list-style: square;">
									<li>* 출금은 1원 단위로 하실 수 있으며, 출금 가능한 최소 금액은 50,000원(2회차 부터는 10,000원)입니다.</li>
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
				        	<div style="color: gray; margin-left: 120px;">
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
		
		</div>
		
		<%-- <jsp:include page="../common/myPage_RightSideBar.jsp"/> --%>
		
		<script type="text/javascript">
		$(function(){
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