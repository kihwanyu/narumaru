<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title> :: naru ? maru ! :: Admin 1:1 게시판</title>
</head>
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
                <h3>1:1 문의 게시판 <small>Notice</small></h3>
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
                    <h2> 문의 게시판 <small> Question</small></h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                        <ul class="dropdown-menu" role="menu">
                          <li><a href="#">Settings 1</a>
                          </li><!--  -->
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
                    
                    <table id="datatable" class="table table-striped table-bordered">
                      <thead>
                        <tr>
                          
                          <th>문의 날짜</th>
                          <th>문의 제목</th>
                          <th>문의 내용</th>
                          <th>문의자 </th>
                          <th>첨부 이미지 </th>
                          <th>답변 여부</th>
                          <th>상세보기</th>
                        </tr>
                      </thead>


                      <tbody>
	                  	<c:forEach items ="${ nlist }" var="Notice">
  	                    	<tr>
								
								<td>${ Notice.CREATE_DATE }</td>
								<td>${ Notice.B_TITLE }</td>
								<td>
									<%-- <c:if test="${ Notice.noContent.length >=10 }"> --%>
										<%-- ${ --%> 
											${ Notice.B_CONTENT }
										
										<!-- } -->
									<%-- </c:if> --%>
								
								</td>
								<td>${ Notice.NICNAME }</td>
								<td>
								<c:choose>
									<c:when test="${ Notice.PHOTO_ORINAME eq 'NULL' }">
										N
									</c:when>
									<c:otherwise>
										Y
									</c:otherwise>
								</c:choose>
								</td>
								<td>
									<c:choose>
									<c:when test="${ Notice.STATUS eq 'Y' }">
										N
									</c:when>
									<c:otherwise>
										Y
									</c:otherwise>
								</c:choose>
								</td>
								<td><a href = "adminanswerDetail.ad?bno=${Notice.BNO}">자세히보기</a></td>	
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
	</div>
	</div>
	
</body>
</html>