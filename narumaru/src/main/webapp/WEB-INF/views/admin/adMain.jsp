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
              <div class="count" id="totalMember1">${totalMember }</div>
            
            </div>
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-clock-o"></i> 금일 가입 회원 </span>
              <div class="count">${sysDateJoinMember }</div>
             
            </div>
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> 총 마루 </span>
              <div class="count green">${totalMaru }</div>
             
            </div>
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> 금일 결제 금액  </span>
              <div class="count">${payDaySysDate }</div>
             
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
              <div class="x_panel tile fixed_height_500 overflow_hidden">
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
                 <div class="x_content" id="marucount">
                  
                </div>
              </div>
            </div>
          </div>
          <div class="row">
              <div class="col-md-8 col-sm-8 col-xs-12">
              <div class="row">
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
                pointFormat: '회원수: <b>{point.y:.1f} 명</b>'
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
    	        text: ''
    	    },
    	    subtitle: {
    	        text: 'Source: <a href="https://en.wikipedia.org/wiki/World_population">Wikipedia.org</a>'
    	    },
    	    xAxis: {
    	        categories: ['나루신고', '마루신고', '회원신고'],
    	        title: {
    	            text: null
    	        }
    	    },
    	    yAxis: {
    	        min: 0,
    	        title: {
    	            text: 'Population (명)',
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
    	        name: '신고 수',
    	        data: [107, 31, 635]
    	    }]
    	});
    	//신고 막대그래프 끝
    	//마루 수 그래프 시작
    	var colors = Highcharts.getOptions().colors,
    categories = [
        "팬클럽",
        "방송/연예",
        "스포츠/레저",
        "음악",
        "어학/외국어",
        "취미/DIY",
        "Other"
    ],
    data = [
        {
            "y": 62.74,
            "color": colors[2],
            "drilldown": {
                "name": "팬클럽",
                "categories": [
                    "Chrome v65.0",
                    "Chrome v64.0",
                    "Chrome v63.0",
                    "Chrome v62.0",
                    "Chrome v61.0",
                    "Chrome v60.0",
                    "Chrome v59.0",
                    "Chrome v58.0",
                    "Chrome v57.0",
                    "Chrome v56.0",
                    "Chrome v55.0",
                    "Chrome v54.0",
                    "Chrome v51.0",
                    "Chrome v49.0",
                    "Chrome v48.0",
                    "Chrome v47.0",
                    "Chrome v43.0",
                    "Chrome v29.0"
                ],
                "data": [
                    0.1,
                    1.3,
                    53.02,
                    1.4,
                    0.88,
                    0.56,
                    0.45,
                    0.49,
                    0.32,
                    0.29,
                    0.79,
                    0.18,
                    0.13,
                    2.16,
                    0.13,
                    0.11,
                    0.17,
                    0.26
                ]
            }
        },
        {
            "y": 10.57,
            "color": colors[1],
            "drilldown": {
                "name": "방송/연예",
                "categories": [
                    "Firefox v58.0",
                    "Firefox v57.0",
                    "Firefox v56.0",
                    "Firefox v55.0",
                    "Firefox v54.0",
                    "Firefox v52.0",
                    "Firefox v51.0",
                    "Firefox v50.0",
                    "Firefox v48.0",
                    "Firefox v47.0"
                ],
                "data": [
                    1.02,
                    7.36,
                    0.35,
                    0.11,
                    0.1,
                    0.95,
                    0.15,
                    0.1,
                    0.31,
                    0.12
                ]
            }
        },
        {
            "y": 7.23,
            "color": colors[0],
            "drilldown": {
                "name": "스포츠/레저",
                "categories": [
                    "Internet Explorer v11.0",
                    "Internet Explorer v10.0",
                    "Internet Explorer v9.0",
                    "Internet Explorer v8.0"
                ],
                "data": [
                    6.2,
                    0.29,
                    0.27,
                    0.47
                ]
            }
        },
        {
            "y": 5.58,
            "color": colors[3],
            "drilldown": {
                "name": "음악",
                "categories": [
                    "Safari v11.0",
                    "Safari v10.1",
                    "Safari v10.0",
                    "Safari v9.1",
                    "Safari v9.0",
                    "Safari v5.1"
                ],
                "data": [
                    3.39,
                    0.96,
                    0.36,
                    0.54,
                    0.13,
                    0.2
                ]
            }
        },
        {
            "y": 4.02,
            "color": colors[5],
            "drilldown": {
                "name": "어학/외국어",
                "categories": [
                    "Edge v16",
                    "Edge v15",
                    "Edge v14",
                    "Edge v13"
                ],
                "data": [
                    2.6,
                    0.92,
                    0.4,
                    0.1
                ]
            }
        },
        {
            "y": 1.92,
            "color": colors[4],
            "drilldown": {
                "name": "취미/DIY",
                "categories": [
                    "Opera v50.0",
                    "Opera v49.0",
                    "Opera v12.1"
                ],
                "data": [
                    0.96,
                    0.82,
                    0.14
                ]
            }
        },
        {
            "y": 7.62,
            "color": colors[6],
            "drilldown": {
                "name": 'Other',
                "categories": [
                    'Other'
                ],
                "data": [
                    7.62
                ]
            }
        }
    ],
    browserData = [],
    versionsData = [],
    i,
    j,
    dataLen = data.length,
    drillDataLen,
    brightness;


// Build the data arrays
for (i = 0; i < dataLen; i += 1) {

    // add browser data
    browserData.push({
        name: categories[i],
        y: data[i].y,
        color: data[i].color
    });

    // add version data
    drillDataLen = data[i].drilldown.data.length;
    for (j = 0; j < drillDataLen; j += 1) {
        brightness = 0.2 - (j / drillDataLen) / 5;
        versionsData.push({
            name: data[i].drilldown.categories[j],
            y: data[i].drilldown.data[j],
            color: Highcharts.Color(data[i].color).brighten(brightness).get()
        });
    }
}

// Create the chart
Highcharts.chart('marucount', {
    chart: {
        type: 'pie'
    },
    title: {
        text: ''
    },
    subtitle: {
        text: 'Source: <a href="http://statcounter.com" target="_blank">statcounter.com</a>'
    },
    yAxis: {
        title: {
            text: 'Total percent market share'
        }
    },
    plotOptions: {
        pie: {
            shadow: false,
            center: ['50%', '50%']
        }
    },
    tooltip: {
        valueSuffix: '%'
    },
    series: [{
        name: 'Browsers',
        data: browserData,
        size: '60%',
        dataLabels: {
            formatter: function () {
                return this.y > 5 ? this.point.name : null;
            },
            color: '#ffffff',
            distance: -30
        }
    }, {
        name: 'Versions',
        data: versionsData,
        size: '80%',
        innerSize: '60%',
        dataLabels: {
            formatter: function () {
                // display only if larger than 1
                return this.y > 1 ? '<b>' + this.point.name + ':</b> ' +
                    this.y + '%' : null;
            }
        },
        id: 'versions'
    }],
    responsive: {
        rules: [{
            condition: {
                maxWidth: 400
            },
            chartOptions: {
                series: [{
                    id: 'versions',
                    dataLabels: {
                        enabled: false
                    }
                }]
            }
        }]
    }
});
//마루수 그래프 끝
    </script>
</body>
</html>