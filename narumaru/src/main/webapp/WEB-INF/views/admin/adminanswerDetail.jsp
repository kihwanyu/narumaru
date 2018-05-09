<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%
	pageContext.setAttribute("nr", "\r\n");
	pageContext.setAttribute("br", "<br>");
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>:: naru! maru? :: adminAnswerDetail </title>
<style>
	.answerBtn{
		width:100px;
		height: 40px;
		background:#23527c;
		color:#fff;
		border: 1px solid #23527c;
	}
	.answerBtn:hover{
		font-weight:bold;
		color:white;
	
	}
	
</style>
</head>
<link href="${ contextPath }/resources/admin/build/css/custom.min.css" rel="stylesheet">

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
                    <!-- question에서 불러오는 값들  and DIV -->
                    <div id= "answerDiv" style="width: 1000px;height: 550px;margin: auto;margin-top: 20px; padding: 20px;
   									 font-size: 20px;">
                    	<ul style="list-style:none;">
                    		<li style="height: 55px;font-weight: bold;font-size: 30px;"> 
                    			${ hlist.B_TITLE }
                    		</li>
                    		
                    		<li style="float:left;font-size:15px">  │  <span style="font-weight:bold">문의자 :</span>  ${ hlist.NICNAME } &nbsp;&nbsp;</li> 
                    		
                    		<li style="float:left;font-size:15px">  │  <span style="font-weight:bold">문의 날자 :</span> ${ hlist.CREATE_DATE } &nbsp;&nbsp;</li>
                    		
                    		<li style="float:left;font-size:15px"> 
                    			 │ <span style="font-weight:bold">답변여부 : </span>
                    			<c:choose>
                    				<c:when test="${ hlist.STATUS eq 'Y' }">
                    					미 답변
                    				</c:when>
                    				<c:otherwise>
                    					답변 완료
                    				</c:otherwise>
                    			</c:choose>
                    			&nbsp;&nbsp;
                    			
                    		</li>
                    		
                    		<li style="float:left;font-size:15px">
                    			  │  <span style="font-weight:bold"> 첨부 파일 : </span>
                    			  
                    			  <c:choose>
									<c:when test="${ hlist.PHOTO_ORINAME eq 'NULL' }">
										N
									</c:when>
									<c:otherwise>
										Y
									</c:otherwise>
								</c:choose>
                    		</li>
                    		
                    		<br>
                    		<hr>
                    		<li>
                    			
                    			 │ <img alt="" style="width:750px; height:350px"src="${ contextPath }/resources/question/${ hlist.PHOTO_CHANAME }"> 
                    		</li>
                    		
                    		<li style="display:none"> ${ hlist.EMAIL }</li>
                    		<li style="display:none"> ${ hlist.PHOTO_ORINAME }</li>
                    		<li style="display:none"> ${ hlist.PHOTO_CHANAME }</li>
                    		<li style="width:920px;margin-top:35px">
<!-- textarea 벽에 붙혀놓을 것 -->
<textarea style="width: 1000px;height: 154px;background: white;border: 1px solid white;resize:none" disabled="disabled">
${ hlist.B_CONTENT }
</textarea>
	                    	
                    		</li>
                    		
                    		
                    		
                    	
                    	</ul>
                    	
                    	
                    </div>
                    
                    <div style="text-align:center">
                    		<button class ="answerBtn" onclick ="adAnswerList()" > 뒤로가기 </button> &nbsp;&nbsp;
                    		<button class ="answerBtn" type="submit" onclick ="adAnswerForm()" > 답변하기 </button>
                    </div>
                    <script>
                    $(function() {
                    	<c:choose>
							<c:when test="${ hlist.PHOTO_ORINAME ne 'NULL' }">
								$("#answerDiv").css("height","700px");
							
							</c:when>
						</c:choose>  
                    	});

                    	function adAnswerList(){
                    		location.href = "adminAnswer.ad";
                    	}
                    	function adAnswerForm(){
                    		location.href = "adAnswerForm.ad?bno=${hlist.BNO}";
                    		
                    	}
                    </script>
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