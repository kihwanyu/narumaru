<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>:: naru? maru! :: Admin index</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

  <c:set var="contextPath" value="${pageContext.servletContext.contextPath }" scope="application" />
</head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <jsp:include page = "../common/adMenubar.jsp"/> 
		<button id="Btn">aaaaaaaaaaaaaaaaaaaaaaaa</button>
       

        <!-- page content -->
        <div class="right_col" role="main">
          <!-- top tiles -->
          <div class="row tile_count">
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> 총 회원</span>
              <div class="count">2500</div>
            
            </div>
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-clock-o"></i> 금일 가입 회원 </span>
              <div class="count">123.50</div>
             
            </div>
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> 총 마루 </span>
              <div class="count green">2,500</div>
             
            </div>
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> 금일 결제 금액  </span>
              <div class="count">4,567</div>
             
            </div>
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> 금일 신고 횟수 </span>
              <div class="count">2,315</div>
             
            </div>
           
          </div>
          <!-- /top tiles -->
		  
		 <script>
		  	$(function(){
		  		$("#Btn").click(function(){	
					$.ajax({
			  			url:"totalSelect.ad",
			  			type:"get",
			  			success:function(data){
			  				console.log("성공");
			  				console.log(data);
			  			},
						error:function(data){
							console.log("실패!");
							console.log(data);
						}
			  		});
		  		});
		  		
		  		
		  	});
		  
		  </script>
          <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
              <div class="dashboard_graph">
            <!-- 회원수 막대 그래프 -->
                <div class="col-md-9 col-sm-9 col-xs-12">
                  <div id="chart_plot_1" class="demo-placeholder"></div>
                </div>
                <div class="clearfix"></div>
              </div>
            </div>

          </div>
          <br />

          <div class="row">


            <div class="col-md-4 col-sm-4 col-xs-12">
              <div class="x_panel tile fixed_height_500">
                 <h2>신고하기 </h2>
                 <div id="Declaration"></div>
              </div>
            </div>

            <div class="col-md-4 col-sm-4 col-xs-12">
              <div class="x_panel tile fixed_height_320 overflow_hidden">
                <div class="x_title">
                  <h2>마루 종류</h2>
                  <ul class="nav navbar-right panel_toolbox">
                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                    </li>
                    <li class="dropdown">
                      <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                      <ul class="dropdown-menu" role="menu">
                        <li><a href="#">Settings 1</a>
                        </li>
                        <li><a href="#">Settings 2</a>
                        </li>
                      </ul>
                    </li>
                    <li><a class="close-link"><i class="fa fa-close"></i></a>
                    </li>
                  </ul>
                  <div class="clearfix"></div>
                </div>
                 <div class="x_content">
                  <table class="" style="width:100%">
                    <tr>
                      <th style="width:37%;">
                        <p>Top 5</p>
                      </th>
                      <th>
                        <div class="col-lg-7 col-md-7 col-sm-7 col-xs-7">
                          <p class="">Device</p>
                        </div>
                        <div class="col-lg-5 col-md-5 col-sm-5 col-xs-5">
                          <p class="">Progress</p>
                        </div>
                      </th>
                    </tr>
                    <tr>
                      <td>
                        <canvas class="canvasDoughnut" height="140" width="140" style="margin: 15px 10px 10px 0"></canvas>
                      </td>
                      <td>
                        <table class="tile_info">
                          <tr>
                            <td>
                              <p><i class="fa fa-square blue"></i>IOS </p>
                            </td>
                            <td>30%</td>
                          </tr>
                          <tr>
                            <td>
                              <p><i class="fa fa-square green"></i>Android </p>
                            </td>
                            <td>10%</td>
                          </tr>
                          <tr>
                            <td>
                              <p><i class="fa fa-square purple"></i>Blackberry </p>
                            </td>
                            <td>20%</td>
                          </tr>
                          <tr>
                            <td>
                              <p><i class="fa fa-square aero"></i>Symbian </p>
                            </td>
                            <td>15%</td>
                          </tr>
                          <tr>
                            <td>
                              <p><i class="fa fa-square red"></i>Others </p>
                            </td>
                            <td>30%</td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                  </table>
                </div>
              </div>
            </div>
          </div>


          <div class="row">
              <div class="col-md-8 col-sm-8 col-xs-12">
              <div class="row">


                <!-- Start to do list -->
                <div class="col-md-6 col-sm-6 col-xs-12">
                  <div class="x_panel">
                    <div class="x_title">
                      <h2>To Do List <small>Sample tasks</small></h2>
                      <ul class="nav navbar-right panel_toolbox">
                        <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                        </li>
                        <li class="dropdown">
                          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                          <ul class="dropdown-menu" role="menu">
                            <li><a href="#">Settings 1</a>
                            </li>
                            <li><a href="#">Settings 2</a>
                            </li>
                          </ul>
                        </li>
                        <li><a class="close-link"><i class="fa fa-close"></i></a>
                        </li>
                      </ul>
                      <div class="clearfix"></div>
                    </div>
                    <div class="x_content">

                      <div class="">
                        <ul class="to_do">
                          <li>
                            <p>
                              <input type="checkbox" class="flat"> Schedule meeting with new client </p>
                          </li>
                          <li>
                            <p>
                              <input type="checkbox" class="flat"> Create email address for new intern</p>
                          </li>
                          <li>
                            <p>
                              <input type="checkbox" class="flat"> Have IT fix the network printer</p>
                          </li>
                          <li>
                            <p>
                              <input type="checkbox" class="flat"> Copy backups to offsite location</p>
                          </li>
                          <li>
                            <p>
                              <input type="checkbox" class="flat"> Food truck fixie locavors mcsweeney</p>
                          </li>
                          <li>
                            <p>
                              <input type="checkbox" class="flat"> Food truck fixie locavors mcsweeney</p>
                          </li>
                          <li>
                            <p>
                              <input type="checkbox" class="flat"> Create email address for new intern</p>
                          </li>
                          <li>
                            <p>
                              <input type="checkbox" class="flat"> Have IT fix the network printer</p>
                          </li>
                          <li>
                            <p>
                              <input type="checkbox" class="flat"> Copy backups to offsite location</p>
                          </li>
                        </ul>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- End to do list -->
                
            
              </div>
            </div>
          </div>
        </div>
        <!-- /page content -->

        <!-- footer content -->
        <footer>
          <div class="pull-right">
            Gentelella - Bootstrap Admin Template by <a href="https://colorlib.com">Colorlib</a>
          </div>
          <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->
        
        <!-- 이럴수가!!  -->
      </div>
    </div>
    <script src="https://code.highcharts.com/highcharts.src.js"></script>
    <script type="text/javascript">
    	
    	console.log('${Date}' + "1");
    	console.log('${Count}' + "1");
    	//회원수 그래프 시작
    	$("#chart_plot_1").highcharts(
            {chart: {
                type: 'column'
            },
            title: {
                text: '회원가입 현황'
            },
            subtitle: {
                text: '2018년 회원가입 현황'
            },
            xAxis: {
                type: 'category',
                labels: {
                    rotation: -45,
                    style: {
                        fontSize: '13px',
                        fontFamily: 'Verdana, sans-serif'
                    }
                }
            },
            yAxis: {
                min: 0,
                title: {
                    text: '회원수'
                }
            },
            legend: {
                enabled: false
            },
            tooltip: {
                pointFormat: 'Population in 2017: <b>{point.y:.1f} millions</b>'
            },
            series: [{
                name: 'Population',
                data: [
                	<c:forEach begin="0" end="${fn:length(Count)-1}" varStatus="status">
						["${Date[status.index]}", ${Count[status.index]}],
					</c:forEach> 
                ],
                dataLabels: {
                    enabled: true,
                    rotation: -90,
                    color: '#FFFFFF',
                    align: 'right',
                    format: '{point.y:.1f}', // one decimal
                    y: 10, // 10 pixels down from the top
                    style: {
                        fontSize: '13px',
                        fontFamily: 'Verdana, sans-serif'
                    }
                }
            }]
        });
    	//회원 막대그래프 끝
    	//신고 그래프 시작
    	Highcharts.chart('Declaration', {
    	    chart: {
    	        type: 'bar'
    	    },
    	    title: {
    	        text: 'Historic World Population by Region'
    	    },
    	    subtitle: {
    	        text: 'Source: <a href="https://en.wikipedia.org/wiki/World_population">Wikipedia.org</a>'
    	    },
    	    xAxis: {
    	        categories: ['Africa', 'America', 'Asia', 'Europe', 'Oceania'],
    	        title: {
    	            text: null
    	        }
    	    },
    	    yAxis: {
    	        min: 0,
    	        title: {
    	            text: 'Population (millions)',
    	            align: 'high'
    	        },
    	        labels: {
    	            overflow: 'justify'
    	        }
    	    },
    	    tooltip: {
    	        valueSuffix: ' millions'
    	    },
    	    plotOptions: {
    	        bar: {
    	            dataLabels: {
    	                enabled: true
    	            }
    	        }
    	    },
    	    legend: {
    	        layout: 'vertical',
    	        align: 'right',
    	        verticalAlign: 'top',
    	        x: -40,
    	        y: 80,
    	        floating: true,
    	        borderWidth: 1,
    	        backgroundColor: ((Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'),
    	        shadow: true
    	    },
    	    credits: {
    	        enabled: false
    	    },
    	    series: [{
    	        name: 'Year 1800',
    	        data: [107, 31, 635, 203, 2]
    	    }, {
    	        name: 'Year 1900',
    	        data: [133, 156, 947, 408, 6]
    	    }, {
    	        name: 'Year 2000',
    	        data: [814, 841, 3714, 727, 31]
    	    }, {
    	        name: 'Year 2016',
    	        data: [1216, 1001, 4436, 738, 40]
    	    }]
    	});
    </script>
</body>
</html>