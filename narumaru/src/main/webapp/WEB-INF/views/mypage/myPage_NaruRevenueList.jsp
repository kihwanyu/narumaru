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
		<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.js" type="text/javascript"></script>
	</head>
	<body>
	<!--  -->
	<jsp:include page="../common/topmenu.jsp"/>	
		<br>
		<br>
		<br>
		<div id="container" style="margin-top: 50px;">
		<c:set var="pageValue" value="NaruRevenueList" scope="request" />
		<jsp:include page="../common/myPage_LeftSideBar.jsp"/>	
			<div id="contents" style="background: white; color: black;">
				<div style="font-size: 15px; margin-bottom: 15px;">
					나루 수익 내역 
				</div>		
				<table class="table">
					<thead>
						<tr>
							<th width="40%">수익일</th>
							<th width="20%">구매자</th>
							<th width="20%">수익내용</th>
							<th width="20%">수익 포인트</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${uList }" var="userPoint">
						<tr>
							<td>${userPoint.pDate }</td>
							<td>${userPoint.buyer_name }</td>
							<td>${userPoint.pContent }</td>
							<td><fmt:formatNumber value="${userPoint.amount }" type="number"/> P</td>
						</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="2"></td>
							<td>수익 포인트 : </td>
							<td><fmt:formatNumber value="${revenuePoint }" type="number"/> P </td>
						</tr>
					</tfoot>
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
				<div class="pagingArea" align="center">
					<ul class="pagination">
					<li><a href="naruRevenue.me?currentPage=1&year=${year}"><<</a></li>
					<c:choose>
						<c:when test="${currentPage <= 1 }">
							<li class="active"><a href="#"><</a></li>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${backNextpage < 1 }">
									<li><a href="naruRevenue.me?currentPage=1&year=${year}"><</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="naruRevenue.me?currentPage=${backNextpage }&year=${year}"><</a></li>
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
								<li><a href="naruRevenue.me?currentPage=${p }&year=${year}">${p }</a></li>
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
									<li><a href="naruRevenue.me?currentPage=${maxPage }&year=${year}">></a></li>
								</c:when>
								<c:otherwise>
									<li><a href="naruRevenue.me?currentPage=${forwardNextpage }&year=${year}">></a></li>
								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>
					<li><a href="naruRevenue.me?currentPage=${maxPage }&year=${year}">>></a></li>
					</ul>
				</div>
				<div>
					<div align="right" style="margin: 10px;">
						<select id="selectedYear">
							<c:forEach items="${beingYearList }" var="beingYear">
								<c:choose>
									<c:when test="${year eq beingYear }">
										<option value="${beingYear }" selected="selected">${beingYear }</option>
									</c:when>
									<c:otherwise>
										<option value="${beingYear }">${beingYear }</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</select>
					</div>
				<div id="container" style="border: solid 1px black; width: 100%; 
				height: 300px; margin-bottom: 10px;">
				
				<canvas id="canvas" style="margin-left: 5px;"></canvas>
				</div>
				
				    <script type="text/javascript">
				    	$("#selectedYear").change(function(){
				    		var year = $("#selectedYear").val();
				    		var currentPage = ${currentPage };
				    		
				    		location.href = "naruRevenue.me?currentPage="+currentPage+"&year="+year;
				    	});
				        var ChartHelper = {
				            chartColors: {
				                red: 'rgb(255, 99, 132)'
				                , orange: 'rgb(255, 159, 64)'
				                , yellow: 'rgb(255, 205, 86)'
				                , green: 'rgb(75, 192, 192)'
				                , blue: 'rgb(54, 162, 235)'
				                , purple: 'rgb(153, 102, 255)'
				                , grey: 'rgb(201, 203, 207)'
				            }
				        };
				
				        var color = Chart.helpers.color;
						
				        var data1 = new Array();
				       
						
						data1[0] = ${statsArr[0] };
						data1[1] = ${statsArr[1] };
						data1[2] = ${statsArr[2] };
						data1[3] = ${statsArr[3] };
						data1[4] = ${statsArr[4] };
						data1[5] = ${statsArr[5] };
						data1[6] = ${statsArr[6] };
						data1[7] = ${statsArr[7] };
						data1[8] = ${statsArr[8] };
						data1[9] = ${statsArr[9] };
						data1[10] = ${statsArr[10] };
						data1[11] = ${statsArr[11] };
						
				        //var data2 = null;
				        var barChartData = null;
				
				        // todo: data setting
				        /* data1 = ['10', '20', '30', '40', '50', '60', '70', '80'
						, '90', '100', '110', '1000']; */
				       /*  data2 = ['120', '110', '100', '90', '80', '70', '60', '50'
						, '40', '30', '20', '10'];
				 */
				        barChartData = {
				            labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월'
							, '9월', '10월', '11월', '12월']
				            , datasets: [
				                {
				                    label: '포인트(P)'
				                    , backgroundColor: 
				color(ChartHelper.chartColors.blue).alpha(0.5).rgbString()
				                    , borderColor: ChartHelper.chartColors.blue
				                    , borderWidth: 1
				                    , data: data1
				                }
				                /* , {
				                    label: 'DataSet2'
				                    , backgroundColor: 
				color(ChartHelper.chartColors.red).alpha(0.5).rgbString()
				                    , borderColor: ChartHelper.chartColors.red
				                    , borderWidth: 1
				                    , data: data2
				                } */
				            ]
				        };
				
				        var ctx = document.getElementById('canvas').getContext('2d');
				
				        window.BarChart = new Chart(ctx, {
				            type: 'bar'
				// 옆으로 누운 bar 차트를 쓰실 경우 바꾸시면 됩니다.
				            //type: 'horizontalBar'
				            , data: barChartData
				            , options: {
				// responsive, maintainAspectRatio의 설정이 아래와 같이 해야
				// 브라우저의 크기를 변경해도 canvas를 감싸고 있는
				// div의 크기에 따라 차트가 깨지지 않고 이쁘게 출력 됩니다. 
				                responsive: true   //auto size : true
				                , maintainAspectRatio: false
				                , legend: {
				                    position: 'top'
				                }
				                , title: {
				                    display: true
				                    , text: '월별 총 수익 포인트량'
				                }
				// Bar 하나에 데이터 모두 보여줄 경우 사용
				// 주석 처리 할 경우 이 예제에서는 data1, data2 각각 bar가 2개씩 나옵니다.
				                //, scales: {
				                //    xAxes: [
				                //        { stacked: true }
				                //    ]
				                //    , yAxes: [
				                //        { stacked: true }
				                //    ]
				                //}
				
				// or bar chart 하나씩 보여줄 경우
				                  , scales: {
				                        yAxes: [{
				                            ticks: {
				// Y 축 0부터 시작
				                                beginAtZero:true
				// Y 축 정수로 보여주기 
				// 숫자가 작거나 또는 0인 경우 등 자동으로 보여주므로 소숫점으로 나타난다
				                                , callback: function (value) {
				                                    if (0 === value % 1) {
				                                        return value;
				                                    }
				                                }
				                            }
				                        }]
				                    }
				// 아래 주석 처리하여도 포인터를 바에 가져가면 수치가 나옵니다.
				// 그러나 min 버젼을 link할 경우 영역에다 가져가면 나오질 않아요
				// 또한 툴팁에 해당 데이터의 색도 나오지 않습니다.
				// 직접 코딩 후 min 버젼으로 교체하여 테스트 해보시면 차이를 알 수 있습니다.
				                // Tooltip 
				                //, tooltips: {
				                //    mode: 'index',
				                //    intersect: false,
				                //},
				                //hover: {
				                //    mode: 'nearest',
				                //    intersect: true
				                //}
				            }
				        });
				
				        var colorNames = Object.keys(ChartHelper.chartColors);
				    </script>
				</div>
			</div>
		</div>
		<jsp:include page="../common/myPage_RightSideBar.jsp"/>
	</body>
</html>