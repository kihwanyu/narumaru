<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
                    <h2>수익테이블 <small>RevenueTable</small></h2>
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
                          <th>년도</th>
                          <th>1월</th>
                          <th>2월</th>
                          <th>3월</th>
                          <th>4월</th>
                          <th>5월</th>
                          <th>6월</th>
                          <th>7월</th>
                          <th>8월</th>
                          <th>9월</th>
                          <th>10월</th>
                          <th>11월</th>
                          <th>12월</th>
                        </tr>
                      </thead>


                      <tbody>
                        <tr>
                          <th>2016</th>
                          <td>Tiger Nixon</td>
                          <td>System Architect</td>
                          <td>Edinburgh</td>
                          <td>61</td>
                          <td>2011/04/25</td>
                          <td>$320,800</td>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                        </tr>
                        <tr>
                          <th>2017</th>
                          <td>Garrett Winters</td>
                          <td>Accountant</td>
                          <td>Tokyo</td>
                          <td>63</td>
                          <td>2011/07/25</td>
                          <td>$170,750</td>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                        </tr>
                        <tr>
                          <th>2018</th>
                          <td>Ashton Cox</td>
                          <td>Junior Technical Author</td>
                          <td>San Francisco</td>
                          <td>66</td>
                          <td>2009/01/12</td>
                          <td>$86,000</td>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                        </tr>
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
                          <th>년도</th>
                          <th>10대</th>
                          <th>20대</th>
                          <th>30대</th>
                          <th>40대</th>
                          <th>50대 이상</th>
                        </tr>
                      </thead>


                      <tbody>
                        <tr>
                          <th>2016</th>
                          <td>System Architect</td>
                          <td>Edinburgh</td>
                          <td>61</td>
                          <td>2011/04/25</td>
                          <td>$320,800</td>
                        </tr>
                        <tr>
                          <th>2017</th>
                          <td>Accountant</td>
                          <td>Tokyo</td>
                          <td>63</td>
                          <td>2011/07/25</td>
                          <td>$170,750</td>
                        </tr>
                        <tr>
                          <th>2018</th>
                          <td>Junior Technical Author</td>
                          <td>San Francisco</td>
                          <td>66</td>
                          <td>2009/01/12</td>
                          <td>$86,000</td>
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
			  labels: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
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
			  data: [70, 200, 300, 180, 100],
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