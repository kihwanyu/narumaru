<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body class="nav-md">
<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" scope="application" />
<div class="container body">
      <div class="main_container">
      	<jsp:include page="../common/adMenubar.jsp" />

        <!-- page content -->
        <div class="right_col" role="main" style="min-height: 1248px;">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>수익분석<small>나루 마루의 수익</small></h3>
              </div>

              <div class="title_right">
                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                  <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search for...">
                    <span class="input-group-btn">
                      <button class="btn btn-default" type="button">Go!</button>
                    </span>
                  </div>
                </div>
              </div>
            </div>

            <div class="clearfix"></div>

            <div class="row">
               <div class="col-md-6 col-sm-6 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>수익 <small>Sessions</small></h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                        <ul class="dropdown-menu" role="menu">
                        </ul>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content"><iframe class="chartjs-hidden-iframe" style="width: 100%; display: block; border: 0px; height: 0px; margin: 0px; position: absolute; left: 0px; right: 0px; top: 0px; bottom: 0px;"></iframe>
                    <canvas id="mybarChart2" height="355" width="710" style="width: 568px; height: 284px;"></canvas>
                  </div>
                </div>
              </div>
              
               <div class="col-md-6 col-sm-6 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>연령대 <small>Sessions</small></h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                        <ul class="dropdown-menu" role="menu">
                        </ul>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content"><iframe class="chartjs-hidden-iframe" style="width: 100%; display: block; border: 0px; height: 0px; margin: 0px; position: absolute; left: 0px; right: 0px; top: 0px; bottom: 0px;"></iframe>
                    <canvas id="canvasDoughnut2" height="355" width="710" style="width: 568px; height: 284px;"></canvas>
                  </div>
                </div>
              </div>
            </div>
            
            <div class="row">
              <!-- <div class="col-md-12 col-sm-12 col-xs-12"> -->
                <div class="x_panel">
                  <div class="x_title">
                    <h2>회원 결제 <small>RevenueTable</small></h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                        <ul class="dropdown-menu" role="menu">
                        </ul>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <table id="datatable" class="table table-striped table-bordered">
                      <thead>
                        <tr>
                          <th>회원아이디</th>
                          <th>닉네임</th>
                          <th>결제일</th>
                          <th>결제금액</th>
                          <th>포인트</th>
                        </tr>
                      </thead>
                      <tbody>
                      	  <c:forEach items="${RevenueMember}" var="RevenueMember">
                        	<tr>
                        		<td>${RevenueMember.EMAIL }</td>
                        		<td>${RevenueMember.NICNAME }</td>
                        		<td>${RevenueMember.PAYDAY }</td>
                        		<td>${RevenueMember.AMOUNT }</td>
                        		<td>${RevenueMember.POINT }</td>
                        	</tr>
                        </c:forEach>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
            
            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>연령대별  수익 테이블<small>AgeRevenueTable</small></h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                        <ul class="dropdown-menu" role="menu">
                        </ul>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <table id="datatable" class="table table-striped table-bordered">
                      <thead>
                        <tr>
                          <th>10대</th>
                          <th>20대</th>
                          <th>30대</th>
                          <th>40대</th>
                          <th>50대 이상</th>
                        </tr>
                      </thead>
					

                      <tbody>
                       	
                        	<tr>
                        		<c:forEach items="${totalAge}" var="totalAge" >
                        		<td><c:out value="${totalAge}"/></td>
                        		</c:forEach>
                        	</tr>
                        
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
           
        <!-- page content -->

      </div>
    </div>
        <!-- footer content -->
        <footer>
          <div class="pull-right">
            Gentelella - Bootstrap Admin Template by <a href="https://colorlib.com">Colorlib</a>
          </div>
          <div class="clearfix"></div>
        </footer>
        <!-- footer content -->
    <script type="text/javascript">
   	 if ($('#mybarChart2').length ){ 
		  
		  var ctx = document.getElementById("mybarChart2");
		  var mybarChart = new Chart(ctx, {
			type: 'bar',
			data: {
			  labels: [
					<c:forEach begin="0" end="${fn:length(Chart)-1}" varStatus="chart">
						"${Chart[chart.index].ASD}",
					</c:forEach>
				  ],
			  datasets: [{
				label: '2018년 수익그래프',
				backgroundColor: "#26B99A",
				data: [51, 30, 40, 28, 92, 50, 45]
					
			  }]/*, {
				label: '# of Votes',
				backgroundColor: "#03586A",
				data: [41, 56, 25, 48, 72, 34, 12]
			  }]*/
			},

			options: {
			  scales: {
				yAxes: [{
				  ticks: {
					beginAtZero: true
				  }
				}]
			  }
			}
		  });
		  
		} 
   	 
   	 
   	if ($('#canvasDoughnut2').length ){ 
		  
		  var ctx = document.getElementById("canvasDoughnut2");
		  var data = {
			labels: [
			  "10대",
			  "20대",
			  "30대",
			  "40대",
			  "50대 이상"
			],
			datasets: [{
			  data: [
				<c:forEach items="${totalAge}" var="totalAge" >
      				<c:out value="${totalAge}"/>,
    			</c:forEach>
    		],
			  backgroundColor: [
				"#455C73",
				"#9B59B6",
				"#BDC3C7",
				"#26B99A",
				"#3498DB"
			  ],
			  hoverBackgroundColor: [
				"#34495E",
				"#B370CF",
				"#CFD4D8",
				"#36CAAB",
				"#49A9EA"
			  ]

			}]
		  };

		  var canvasDoughnut = new Chart(ctx, {
			type: 'doughnut',
			tooltipFillColor: "rgba(51, 51, 51, 0.55)",
			data: data
		  });
		 
		} 
    </script>
</body>
</html>