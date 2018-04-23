<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
		</style>
		
	</head>
	<body>
	<!--  -->
	<jsp:include page="../common/topmenu.jsp"/>	
		<br>
		<br>
		<br>
		<div id="container" style="margin-top: 50px;">
		<c:set var="pageValue" value="pointPaymentList" scope="request" />
		<jsp:include page="../common/myPage_LeftSideBar.jsp"/>	
			
			<div id="contents">
				<div style="margin-top: 5px; margin-bottom: 10px; color: black;" align="right">
				</div>
				<div style="width: 100%;">
				    <ul class="tabs">
				        <li class="active" rel="tab1" style="color: black;">결제 내역</li>
				        <li rel="tab2" style="color: black;">사용 내역</li>
				    </ul>
				    <div class="tab_container" >
				        <div id="tab1" class="tab_content" style="color: black;" align="center">
							<div>
								<table class="table">
									<thead>
										<tr>
											<th width="40%">결제일</th>
											<th width="20%">결제명</th>
											<th width="20%">결제수단</th>
											<th width="20%">결제금액</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${pList }" var="pList">
											<tr>
												<td>${pList.payDay }</td>
												<td><fmt:formatNumber value="${pList.point }" type="number"/> P</td>
												<td>${pList.payMethod }</td>
												<td><fmt:formatNumber value="${pList.amount }" type="number"/> 원</td>
											</tr>
										</c:forEach>
									</tbody>
									<tfoot>
										<tr>
											<td colspan="2"></td>
											<td>보유 포인트 : </td>
											<td><fmt:formatNumber value="${totalPoint }" type="number"/> P</td>
										</tr>
									</tfoot>
								</table>
							</div>  
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
								<li><a href="pointPaymentView.me?currentPage=1"><<</a></li>
								<c:choose>
									<c:when test="${currentPage <= 1 }">
										<li class="active"><a href="#"><</a></li>
									</c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${backNextpage < 1 }">
												<li><a href="pointPaymentView.me?currentPage=1"><</a></li>
											</c:when>
											<c:otherwise>
												<li><a href="pointPaymentView.me?currentPage=${backNextpage }"><</a></li>
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
											<li><a href="pointPaymentView.me?currentPage=${p }">${p }</a></li>
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
												<li><a href="pointPaymentView.me?currentPage=${maxPage }">></a></li>
											</c:when>
											<c:otherwise>
												<li><a href="pointPaymentView.me?currentPage=${forwardNextpage }">></a></li>
											</c:otherwise>
										</c:choose>
									</c:otherwise>
								</c:choose>
								<li><a href="pointPaymentView.me?currentPage=${maxPage }">>></a></li>
								</ul>
							</div>
								
							</div>
							<div align="right">
								<input type="button" id="payment-view-btn" value="결제하기" class="btn btn-default"> 
							</div>
				        </div>
				         <!-- #tab1 -->
				        <div id="tab2" class="tab_content" style="color: black;">
				        	<div>
								<table class="table">
									<thead>
										<tr>
											<th width="30%">사용일</th>
											<th width="20%">구분</th>
											<th width="30%">사용 내용</th>
											<th width="20%">사용 포인트</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>2017.04.10 AM 09:00</td>
											<td>포인트 사용</td>
											<td>결제선 - 고강호(300P)</td>
											<td>300P</td>
										</tr>
										<tr>
											<td>2017.04.10 AM 09:00</td>
											<td>포인트 사용</td>
											<td>결제선 - 고강호(300P)</td>
											<td>300P</td>
										</tr>
										<tr>
											<td>2017.04.10 AM 09:00</td>
											<td>포인트 사용</td>
											<td>결제선 - 고강호(300P)</td>
											<td>300P</td>
										</tr>
										<tr>
											<td>2017.04.10 AM 09:00</td>
											<td>포인트 사용</td>
											<td>결제선 - 고강호(300P)</td>
											<td>300P</td>
										</tr>
										<tr>
											<td>2017.04.10 AM 09:00</td>
											<td>포인트 사용</td>
											<td>결제선 - 고강호(300P)</td>
											<td>300P</td>
										</tr>
									</tbody>
									<tfoot>
										<tr>
											<td colspan="2"></td>
											<td>사용 포인트 : </td>
											<td>40,000</td>
										</tr>
									</tfoot>
								</table>
							</div>    
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
				
		<jsp:include page="../common/myPage_RightSideBar.jsp"/>
		
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
		    
		   /* 포인트 결제창 */
		   
		   $("#payment-view-btn").click(function(){
			   var cw = screen.availWidth;
			   var ch = screen.availHeight;
			   
			   var w = 900;
			   var h = 700;
			   
			   var ml = (cw-w)/2;
			   var mt = (ch-h)/2;
			   
			   window.open("paymentView.pa", "결제 창", "width="+w+", height="+h+", top="+mt+", left="+ml+",toolbar=no, menubar=no, scrollbars=no, resizable=no");  
		   });
		});
		
		</script>
	</body>
</html>