<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<!-- Custom Theme Style -->
<link href="${ contextPath }/resources/admin/build/css/custom.min.css" rel="stylesheet">
</head>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" scope="application" />
<body class="nav-md">
	<div class="container body">
      <div class="main_container">
		<jsp:include page="../common/adMenubar.jsp" />
		<!-- page content -->
        <div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>환급 신청 내역 <small>Money</small></h3>
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
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>환급내역 <small>Users</small></h2>
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
                    <p class="text-muted font-13 m-b-30">
                      	유저 검색
                    </p>
                    <table id="datatable" class="table table-striped table-bordered">
                      <thead>
                        <tr>
                          <th>신청일</th>
                          <th>출금포인트</th>
                          <th>지급액</th>
                          <th>입금일</th>
                          <th>신청은행</th>
                          <th>신청자</th>
                          <th>환급 상태</th>
                          <th>환급여부</th>
                        </tr>
                      </thead>
                      <tbody>
                        <c:forEach items="${moneyView}" var="moneyView">
                        	<tr>
                        		<td>${moneyView.RESISTER_DATE}</td>
                        		<td>${moneyView.POINT}</td>
                        		<td>${moneyView.POINT-moneyView.AMOUNT}원</td>
                        		<td>${moneyView.WITHDRAW_DATE}</td>
                        		<td>${moneyView.BANK_NAME}</td>
                        		<td>${moneyView.ACCOUNT_HOLDER}</td>
                        		<td>
                        			<c:choose>
                        				<c:when test="환급 거부">
                        					<font color="red">${moneyView.STATUS }</font>
                        				</c:when>
                        				<c:when test="임금 완료">
                        					<font color="blue">${moneyView.STATUS }</font>
                        				</c:when>
                        				<c:otherwise>
                        					<font color="green">${moneyView.STATUS }</font>
                        				</c:otherwise>
                        			</c:choose>
                        		</td>
                        		<td>
									<c:if test="${moneyView.STATUS eq '입금 대기' }">
										<input type="button" id="moneyStatus${moneyView.WNO}" value="${moneyView.STATUS }" onclick="moneyStatus(this, ${moneyView.WNO});">
	                        			<input type="button" id="moneyStop${moneyView.WNO}" value="환급거부" onclick="moneyStop(this, ${moneyView.WNO});">
									</c:if>
                        		</td>
                        	</tr>
                        </c:forEach>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
        <!-- /page content -->
		</div>
	</div>
	<!-- footer content -->
        <footer>
          <div class="pull-right">
            Gentelella - Bootstrap Admin Template by <a href="https://colorlib.com">Colorlib</a>
          </div>
          <div class="clearfix"></div>
        </footer>
    <!-- /footer content -->
	<!-- 이럴수가!!  -->
	<script type="text/javascript">
		function moneyStatus(btn, WNO){
			console.log(btn.value);
			var status = btn.value;
			console.log(status);
			
			if(btn.value == "입금 대기"){
				status = '입금 완료';
				$("#moneyStop"+WNO).hide();
				$("#moneyStatus"+WNO).hide();
			}else{
				status = '입금 대기';
			}			
			 $.ajax({
				url: "moneyStatusCh.ad",
				type:"get",
				data:{"WNO":WNO},
				success:function(data){
					btn.value = status;
				},
				error:function(){
					
				}
			}); 
			
		}
		
		function moneyStop(btn, WNO){
			console.log(btn.value);
			var stop = btn.value;
			console.log(stop);
			
			if(btn.value == "환급 거부"){
				status = '환급 거부';
			}else{
				status = '입금 대기';
			}
			
			 $.ajax({
				url: "moneyStop.ad",
				type:"get",
				data:{"WNO":WNO},
				success:function(data){
					btn.value = stop;
				},
				error:function(){
					
				}
			}); 
			
		}
	</script>
	
</body>
</html>