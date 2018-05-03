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
<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" scope="application" />
</head>
<body class="nav-md">
	<div class="container body">
      <div class="main_container">
		<jsp:include page="../common/adMenubar.jsp" />
		<!-- page content -->
        <div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>회원관리 <small>User</small></h3>
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
                    <h2>회원목록 <small>Users</small></h2>
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
                      	회원검색
                    </p>
                    <table id="datatable" class="table table-striped table-bordered">
                      <thead>
                        <tr>
                          <th>회원 아이디</th>
                          <th>닉네임</th>
                          <th>생일</th>
                          <th>휴대폰 번호</th>
                          <th>결제금액</th>
                          <th>회원상태</th>
                        </tr>
                      </thead>
						

                      <tbody>
                        <c:forEach items="${memberView}" var="memberView">
                        	<tr>
                        		<td>${memberView.email}</td>
                        		<td>${memberView.nickName}</td>
                        		<td>${memberView.birthDay}</td>
                        		<td>${memberView.phone}</td>
                        		<td>${memberView.total_amount}</td>
                        		<td><input type="button" value="Y" onclick="memberStatus"></td>
                        	</tr>
                        </c:forEach>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>불량회원<small>bullyUser</small></h2>
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
                      DataTables has most features enabled by default, so all you need to do to use it with your own tables is to call the construction function: <code>$().DataTable();</code>
                    </p>
                    <table id="datatable-checkbox" class="table table-striped table-bordered bulk_action">
                      <thead>
                        <tr>
                          <th>
							 <th><input type="checkbox" id="check-all" class="flat"></th>
						  </th>
                          <th>회원 아이디</th>
                          <th>닉네임</th>
                          <th>생일</th>
                          <th>주소</th>
                          <th>휴대폰 번호</th>
                          <th>신고횟수</th>
                        </tr>
                      </thead>
						

                      <tbody>
                        <tr>
                          <td>
							 <th><input type="checkbox" id="check-all" class="flat"></th>
						  </td>
                          <td>Tiger Nixon</td>
                          <td>System Architect</td>
                          <td>Edinburgh</td>
                          <td>2011/04/25</td>
                          <td>$320,800</td>
                          <td>10</td>
                        </tr>
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
	
	<script type="text/javascript">
		function memberStatus(){
			
		}
	</script>
	
</body>
</html>