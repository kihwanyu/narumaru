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
    	var categories = [];
    	<c:forEach var="i" items="${channel}">
    		categories.push("${i.CNAME}");
    	</c:forEach>
    	var colors = Highcharts.getOptions().colors,
    	categories,
    	data = [
        	{
            	"y": 3.8,
            	"color": colors[2],
            	"drilldown": {
                	"name": "미분류",
                	"categories": ["미분류"],
                	"data": [
                    	${chCount.get(0).CHCOUNT}
                	]
            	}
        	},
        	{
            	"y": 3.8,
            	"color": colors[1],
            	"drilldown": {
                	"name": "문화/예술",
                	"categories": ["문화/예술"],
                	"data": [
                		${chCount.get(1).CHCOUNT}
                	]
            	}	
        	},
        	{
        	    "y": 3.8,
        	    "color": colors[0],
            	"drilldown": {
            	    "name": "여행",
            	    "categories": [
            	        "여행"
            	    ],
            	    "data": [
            	    	${chCount.get(2).CHCOUNT}
            	    ]
            	}
        	},
        	{
            	"y": 3.8,
            "color": colors[3],
            "drilldown": {
                "name": "패션/뷰티",
                "categories": [
                    "패션/뷰티"
                ],
                "data": [
                	${chCount.get(3).CHCOUNT}
                ]
            }
        },
        {
            "y": 3.8,
            "color": colors[5],
            "drilldown": {
                "name": "팬클럽",
                "categories": [
                    "팬클럽"
                ],
                "data": [
                	${chCount.get(4).CHCOUNT}
                ]
            }
        },
        {
            "y": 3.8,
            "color": colors[4],
            "drilldown": {
                "name": "인문/과학",
                "categories": [
                    "인문/과학"
                ],
                "data": [
                	${chCount.get(5).CHCOUNT}
                ]
            }
        },
        {
            "y": 3.8,
            "color": colors[6],
            "drilldown": {
                "name": '동물',
                "categories": [
                    '동물'
                ],
                "data": [
                	${chCount.get(6).CHCOUNT}
                ]
            }
        },
        {
            "y": 3.8,
            "color": colors[7],
            "drilldown": {
                "name": '나이',
                "categories": [
                    '나이'
                ],
                "data": [
                	${chCount.get(7).CHCOUNT}
                ]
            }
        },
        {
            "y": 3.8,
            "color": colors[8],
            "drilldown": {
                "name": '방송/연애',
                "categories": [
                    '방송/연애'
                ],
                "data": [
                	${chCount.get(8).CHCOUNT}
                ]
            }
        },
        {
            "y": 3.8,
            "color": colors[9],
            "drilldown": {
                "name": '친목/모임',
                "categories": [
                    '친목/모임'
                ],
                "data": [
                	${chCount.get(9).CHCOUNT}
                ]
            }
        },
        {
            "y": 3.8,
            "color": colors[10],
            "drilldown": {
                "name": '종교/봉사',
                "categories": [
                    '종교/봉사'
                ],
                "data": [
                	${chCount.get(10).CHCOUNT}
                ]
            }
        },
        {
            "y": 3.8,
            "color": colors[11],
            "drilldown": {
                "name": '음악',
                "categories": [
                    '음악'
                ],
                "data": [
                	${chCount.get(11).CHCOUNT}
                ]
            }
        },
        {
            "y": 3.8,
            "color": colors[12],
            "drilldown": {
                "name": '경제',
                "categories": [
                    '경제'
                ],
                "data": [
                	${chCount.get(12).CHCOUNT}
                ]
            }
        },
        {
            "y": 3.8,
            "color": colors[13],
            "drilldown": {
                "name": 'IT/기술',
                "categories": [
                    'IT/기술'
                ],
                "data": [
                	${chCount.get(13).CHCOUNT}
                ]
            }
        },
        {
            "y": 3.8,
            "color": colors[14],
            "drilldown": {
                "name": '게임',
                "categories": [
                    '게임'
                ],
                "data": [
                	${chCount.get(14).CHCOUNT}
                ]
            }
        },
        {
            "y": 3.8,
            "color": colors[15],
            "drilldown": {
                "name": '어학/외국어',
                "categories": [
                    '어학/외국어'
                ],
                "data": [
                	${chCount.get(15).CHCOUNT}
                ]
            }
        },
        {
            "y": 3.8,
            "color": colors[16],
            "drilldown": {
                "name": '만화/애니메이션',
                "categories": [
                    '만화/애니메이션'
                ],
                "data": [
                	${chCount.get(16).CHCOUNT}
                ]
            }
        },
        {
            "y": 3.8,
            "color": colors[17],
            "drilldown": {
                "name": '일상/이야기',
                "categories": [
                    '일상/이야기'
                ],
                "data": [
                	${chCount.get(17).CHCOUNT}
                ]
            }
        },
        {
            "y": 3.8,
            "color": colors[18],
            "drilldown": {
                "name": '스포츠/레저',
                "categories": [
                    '스포츠/레저'
                ],
                "data": [
                	${chCount.get(18).CHCOUNT}
                ]
            }
        },
        {
            "y": 3.8,
            "color": colors[19],
            "drilldown": {
                "name": '건강',
                "categories": [
                    '건강'
                ],
                "data": [
                	${chCount.get(19).CHCOUNT}
                ]
            }
        },
        {
            "y": 3.8,
            "color": colors[20],
            "drilldown": {
                "name": '결혼/가정',
                "categories": [
                    '결혼/가정'
                ],
                "data": [
                	${chCount.get(20).CHCOUNT}
                ]
            }
        },
        {
            "y": 3.8,
            "color": colors[21],
            "drilldown": {
                "name": '정치/사회',
                "categories": [
                    '정치/사회'
                ],
                "data": [
                	${chCount.get(21).CHCOUNT}
                ]
            }
        },
        {
            "y": 3.8,
            "color": colors[22],
            "drilldown": {
                "name": '교육/공부',
                "categories": [
                    '교육/공부'
                ],
                "data": [
                	${chCount.get(22).CHCOUNT}
                ]
            }
        },
        {
            "y": 3.8,
            "color": colors[23],
            "drilldown": {
                "name": '취미/DIY',
                "categories": [
                    '취미/DIY'
                ],
                "data": [
                	${chCount.get(23).CHCOUNT}
                ]
            }
        },
        {
            "y": 3.8,
            "color": colors[24],
            "drilldown": {
                "name": '취업/자기개발',
                "categories": [
                    '취업/자기개발'
                ],
                "data": [
                	${chCount.get(24).CHCOUNT}
                ]
            }
        },
        {
            "y": 3.8,
            "color": colors[25],
            "drilldown": {
                "name": '맛집/요리/생활',
                "categories": [
                    '맛집/요리/생활'
                ],
                "data": [
                	${chCount.get(25).CHCOUNT}
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

  /*   // add browser data
    browserData.push({
        name: categories[i],
        y: data[i].y,
        color: data[i].color
    }); */

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
        text: ''
    },
    yAxis: {
        title: {
            text: ''
        }
    },
    plotOptions: {
        pie: {
            shadow: false,
            center: ['50%', '50%']
        }
    },
    tooltip: {
        valueSuffix: '개'
    },
    series: [{
        name: '마루채널',
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
        name: '채널수',
        data: versionsData,
        size: '80%',
        innerSize: '60%',
        dataLabels: {
            formatter: function () {
                // display only if larger than 1
                return this.y > 1 ? '<b>' + this.point.name + ':</b> ' +
                    this.y + '개' : null;
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