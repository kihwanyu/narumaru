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
<style>
	.FAQsubMenu{
		display:none;
		width:200px;
		height:100px;
		background:yellow;
	}

</style>
<title>:: naru ? maru ! :: 공지 글쓰기 </title>
<link href="${ contextPath }/resources/admin/build/css/custom.min.css" rel="stylesheet">
</head>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" scope="application" />

<body class="nav-md">
    <div class="container body">
      <div class="main_container">
 		<jsp:include page = "../common/adMenubar.jsp"/>
        
        <!-- page content -->
        <div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3> </h3>
              </div>

         
            </div>
            <div class="clearfix"></div>
            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>등록 완료  <small>Naru? Maru! :: Admin</small></h2>
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
                    <br />
                  	<p style = "font-size:20px;text-align:center;margin-top:20px;"> 글 등록이 완료 되었습니다. </p>
                  	
                  	<br><br><br><br>
                  	
                  	 <div class="form-group">
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                          
						  <button class="btn btn-primary" onclick="goHome()" style="margin-left:40%;margin-bottom:20px;width:120px;height:40px;">메인으로</button>
                        
                        </div>
                      </div>
                     <script>
						function goHome(){
							location.href ="adMain.ad";
						}
					</script>
                  </div>
                </div>
              </div>
            </div>   
          </div>
        </div>
        <!-- /page content -->
      </div>
    </div>

  </body>
</html>