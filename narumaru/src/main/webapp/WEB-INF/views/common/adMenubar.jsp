<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
<!-- Bootstrap -->
<link href="${ contextPath }/resources/admin/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Font Awesome -->
<link href="${ contextPath }/resources/admin/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<!-- NProgress -->
<link href="${ contextPath }/resources/admin/nprogress/nprogress.css" rel="stylesheet">
<!-- iCheck -->
<link href="${ contextPath }/resources/admin/iCheck/skins/flat/green.css" rel="stylesheet">
<!-- Datatables -->
<link href="${ contextPath }/resources/admin/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">
<link href="${ contextPath }/resources/admin/datatables.net-buttons-bs/css/buttons.bootstrap.min.css" rel="stylesheet">
<link href="${ contextPath }/resources/admin/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css" rel="stylesheet">
<link href="${ contextPath }/resources/admin/datatables.net-responsive-bs/css/responsive.bootstrap.min.css" rel="stylesheet">
<link href="${ contextPath }/resources/admin/datatables.net-scroller-bs/css/scroller.bootstrap.min.css" rel="stylesheet">

<!-- Custom Theme Style -->
<link href="${ contextPath }/resources/admin/build/css/custom.min.css" rel="stylesheet">
<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" scope="application" />
</head>
<body>
	<div class="col-md-3 left_col">
		<div class="left_col scroll-view">
			<div class="navbar nav_title" style="border: 0;">
				<a href="adMain.ad" class="site_title"><i class="fa fa-paw"></i>
					<span> :: Naru ? Maru ! </span></a>
			</div>

			<div class="clearfix"></div>

			<!-- menu profile quick info -->
			<div class="profile clearfix">
				<div class="profile_pic">
					<img src="${ contextPath }/resources/images/img.jpg" alt="..." class="img-circle profile_img">
				</div>
				<div class="profile_info">
					<span>Welcome,</span>
					<h2>Admin</h2>
					<!-- admin ID 값 받아오기 -->
				</div>
			</div>
			<!-- /menu profile quick info -->

			<br/>

			<!-- sidebar menu -->
			<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
				<div class="menu_section">
					<h3>Menu</h3>
					<ul class="nav side-menu">
						<li><a><i class="fa fa-home"></i> 나루마루 관리 <span class="fa fa-chevron-down"></span></a>
							<ul class="nav child_menu">
								<li><a href="adMemberView.ad"> 회원 관리 </a></li>
								<li><a href="adNaruView.ad"> 나루 관리</a></li>
								<li><a href="index3.html"> 마루 관리 </a></li>
							</ul></li>

						

						<li><a><i class="fa fa-desktop"></i> 공지사항 <span
								class="fa fa-chevron-down"></span></a>
							<ul class="nav child_menu">
								<li><a href="general_elements.html"> 공지사항 </a></li>
								<li><a href="media_gallery.html"> FAQ </a></li>
								<li><a href="typography.html"> 1:1 문의 </a></li>
							</ul></li>

					<li><a><i class="fa fa-bar-chart-o"></i> 포인트 관리 <span
						class="fa fa-chevron-down"></span></a>
							<ul class="nav child_menu">
								<li><a href="chartjs.html">환급 신청 내역</a></li>
								<li><a href="chartjs2.html">수익 분석</a></li>

							</ul>
						</li>
			<li><a><i class="fa fa-table"></i> 신고 게시판(자세히 보기)</a></li>		
			<li><a><i class="fa fa-edit"></i> 로그인 기록 관리</a></li>
					</ul>
				</div>
			</div>
			<!-- /sidebar menu -->
			
		</div>
	</div>

	<!-- top navigation -->
	<div class="top_nav">
		<div class="nav_menu">
			<nav>
				<div class="nav toggle">
					<a id="menu_toggle"><i class="fa fa-bars"></i></a>
				</div>
				<ul class="nav navbar-nav navbar-right">
					<li class="">
						<!-- 우측상단 관리자 정보 설정 --> 
						<a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="true"> 
						<img src="${ contextPath }/resources/images/img.jpg" alt="">JY Kim <span class="fa fa-angle-down"></span>pan>
					</a>
						<ul class="dropdown-menu dropdown-usermenu pull-right">
							<li><a href="javascript:;"> Profile</a></li>
							<li><a href="javascript:;"> <span
									class="badge bg-red pull-right">50%</span> <span>Settings</span>
							</a></li>
							<li><a href="javascript:;">Help</a></li>
							<li><a href="login.html"><i
									class="fa fa-sign-out pull-right"></i> Log Out</a></li>
						</ul>
					</li>

					<!-- 알람 -->
					<li role="presentation" class="dropdown"><a
						href="javascript:;" class="dropdown-toggle info-number"
						data-toggle="dropdown" aria-expanded="true"> <i
							class="fa fa-envelope-o"></i> <span class="badge bg-green">6</span>
					</a>
						<ul id="menu1" class="dropdown-menu list-unstyled msg_list"
							role="menu">
							<li><a> <span class="image"><img
										src="${ contextPath }/resources/images/img.png"
										alt="Profile Image" /></span> <span> <span>John Smith</span>
										<span class="time">3 mins ago</span>
								</span> <span class="message"> Film festivals used to be
										do-or-die moments for movie makers. They were where... </span>
							</a></li>
							<li><a> <span class="image"><img
										src="${ contextPath }/resources/images/img.png"
										alt="Profile Image" /></span> <span> <span>John Smith</span>
										<span class="time">3 mins ago</span>
								</span> <span class="message"> Film festivals used to be
										do-or-die moments for movie makers. They were where... </span>
							</a></li>
							<li><a> <span class="image"><img
										src="${ contextPath }/resources/images/img.png"
										alt="Profile Image" /></span> <span> <span>John Smith</span>
										<span class="time">3 mins ago</span>
								</span> <span class="message"> Film festivals used to be
										do-or-die moments for movie makers. They were where... </span>
							</a></li>
							<li><a> <span class="image"><img
										src="${ contextPath }/resources/images/img.png"
										alt="Profile Image" /></span> <span> <span>John Smith</span>
										<span class="time">3 mins ago</span>
								</span> <span class="message"> Film festivals used to be
										do-or-die moments for movie makers. They were where... </span>
							</a></li>
							<li>
								<div class="text-center">
									<a> <strong>See All Alerts</strong> <i
										class="fa fa-angle-right"></i>
									</a>
								</div>
							</li>
						</ul></li>
				</ul>
			</nav>
		</div>
	</div>
	<!-- /top navigation -->
	
	<!-- jQuery -->
    <script src="${ contextPath }/resources/admin/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="${ contextPath }/resources/admin/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="${ contextPath }/resources/admin/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="${ contextPath }/resources/admin/nprogress/nprogress.js"></script>
    <!-- Chart.js -->
    <script src="${contextPath }/resources/admin/nprogress/nprogress.js"></script>
    <!-- gauge.js -->
    <script src="${contextPath }/resources/admin/gauge.js/dist/gauge.min.js"></script>
     <!-- bootstrap-progressbar -->
    <script src="${contextPath }/resources/admin/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
    <!-- iCheck -->
    <script src="${ contextPath }/resources/admin/iCheck/icheck.min.js"></script>
    <!-- Skycons -->
    <script src="${contextPath }/resources/admin/skycons/skycons.js"></script>
    <!-- Flot -->
    <script src="${contextPath }/resources/admin/Flot/jquery.flot.js"></script>
    <script src="${contextPath }/resources/admin/Flot/jquery.flot.pie.js"></script>
    <script src="${contextPath }/resources/admin/Flot/jquery.flot.time.js"></script>
    <script src="${contextPath }/resources/admin/Flot/jquery.flot.stack.js"></script>
    <script src="${contextPath }/resources/admin/Flot/jquery.flot.resize.js"></script>
    <!-- Flot plugins -->
    <script src="${contextPath }/resources/admin/flot.orderbars/js/jquery.flot.orderBars.js"></script>
    <script src="${contextPath }/resources/admin/flot-spline/js/jquery.flot.spline.min.js"></script>
    <script src="${contextPath }/resources/admin/flot.curvedlines/curvedLines.js"></script>
     <!-- DateJS -->
    <script src="${contextPath }/resources/admin/DateJS/build/date.js"></script>
    <!-- JQVMap -->
    <script src="${contextPath }/resources/admin/jqvmap/dist/jquery.vmap.js"></script>
    <script src="${contextPath }/resources/admin/jqvmap/dist/maps/jquery.vmap.world.js"></script>
    <script src="${contextPath }/resources/admin/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
    <!-- bootstrap-daterangepicker -->
    <script src="${contextPath }/resources/admin/moment/min/moment.min.js"></script>
    <script src="${contextPath }/resources/admin/bootstrap-daterangepicker/daterangepicker.js"></script>
    <!-- Datatables -->
    <script src="${ contextPath }/resources/admin/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="${ contextPath }/resources/admin/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
    <script src="${ contextPath }/resources/admin/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
    <script src="${ contextPath }/resources/admin/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
    <script src="${ contextPath }/resources/admin/datatables.net-buttons/js/buttons.flash.min.js"></script>
    <script src="${ contextPath }/resources/admin/datatables.net-buttons/js/buttons.html5.min.js"></script>
    <script src="${ contextPath }/resources/admin/datatables.net-buttons/js/buttons.print.min.js"></script>
    <script src="${ contextPath }/resources/admin/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
    <script src="${ contextPath }/resources/admin/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
    <script src="${ contextPath }/resources/admin/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
    <script src="${ contextPath }/resources/admin/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
    <script src="${ contextPath }/resources/admin/datatables.net-scroller/js/dataTables.scroller.min.js"></script>
    <script src="${ contextPath }/resources/admin/jszip/dist/jszip.min.js"></script>
    <script src="${ contextPath }/resources/admin/pdfmake/build/pdfmake.min.js"></script>
    <script src="${ contextPath }/resources/admin/pdfmake/build/vfs_fonts.js"></script>

	
	
 	<!-- ECharts -->
    <script src="${ contextPath }/resources/admin/echarts/dist/echarts.min.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="${ contextPath }/resources/admin/build/js/custom.min.js"></script>
</body>
</html>
