<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<style>
	.adClarebtn{
		width:140px;
		height:30px;
		background:white;
		border:2px solid green;
		margin-bottom:20px;
		margin-left:20px;
		color:green;
		font-size: 13px;
	}
	.adClarebtn:hover{
		background:green;
		color:white;
		cursor:pointer;
	}
	.DeclareMenu{
		width: 200px;
   		height: 40px;
    	font-size: 14px;
	
	}
</style>
<meta charset="UTF-8">
<title>:: naru? maru! :: Admin</title>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" scope="application" />

</head>

 <body class="nav-md">
    <div class="container body">
      <div class="main_container">
      	<jsp:include page = "../common/adMenubar.jsp"/>

        <!-- page content -->
        <div class="right_col" role="main">
            <div class="page-title">
              <div class="title_left">
                <h3> 신고하기 <small> design</small></h3>
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
      
  	
			<select class = "DeclareMenu">
				<option>전체 신고 내역</option>
				<option>마루 신고 내역</option>
				<option>회원, 나루 신고 내역</option>	
			</select>
			
            <div class="row">
              <div class="col-md-12">
				<h4>최근 신고 접수내역</h4>

                <div class="x_panel">
                     <!-- end of user messages -->
                     <ul class="messages">
                        <li class ="AdMessages" style="overflow: hidden">
                        <div>
                          
                        <!-- 유저 프로필 -->
                        <img src="${ contextPath }/resources/images/img.png" class="avatar" alt="Avatar">
                            
                        <!-- 오른쪽 월, 일 -->
                        <div class="message_date">
                           <h3 class="date text-info">24</h3>
                           <p class="month">May</p>
                           </div>
                            
                           <div class="message_wrapper">
                              <h4 class="heading">신고 한 유저 아이디</h4> 
                              <blockquote class="message">
                              		<p> 피 신고 유저 : 송_재상  </p>   
                              		<p> 계정 신고 누적 횟수: 9435</p>
                              		<p> 계정 경고 횟수 : 0</p>
                              		<p> 신고 게시물 또는 댓글 번호 : </p>
                              		<p> 신고 종류 : 선정적인 언행</p>
                              </blockquote>
                              <br/>
                              
                              <input type = "button" class = "adClarebtn" value="해당 계정 정지 처리">
                              
                              <p class=""/>
                              <a href = "adDeclareDetail.ad">신고 내역 자세히 보기   </a>
							 	 
                            </div>
                          </div>

                          </li>
                       </ul>
              </div>
              <!-- 신고하기 끝 -->           

              
              <div class="x_panel">
                        <!-- end of user messages -->
                        <ul class="messages">
                          <li class ="AdMessages" style="overflow: hidden">
                          <div>
                          
                          	<!-- 유저 프로필 -->
                            <img src="${ contextPath }/resources/images/img.png" class="avatar" alt="Avatar">
                            
                            <!-- 오른쪽 월, 일 -->
                            <div class="message_date">
                              <h3 class="date text-info">24</h3>
                              <p class="month">May</p>
                            </div>
                            
                            <div class="message_wrapper">
                              <h4 class="heading">신고 한 유저 아이디</h4>
                              <blockquote class="message">신고 종류 ex) 선정적인 내용 </blockquote>
                              <br/>
                              <p class=""/>
                             	자세히 보기  <a class="collapse-link"><i class="fa fa-chevron-up" ></i></a>
							 	 <div class="x_content">
				                  <h4>상세 보기</h4>
				                  <ul>
				                  	<li>신고 제목 : 이새끼가 븅신이에요	</li >
				                  	<li>신고 일자 : sysdate	</li>
				                  	<li>신고 아이디 : user01</li>
				                  	<li>세부 내용 : 무반동 핵 쓰고 날라다녀요 슈발발발발발</li>
				                  </ul>
				
                                <!-- 토글 열리면서  -->
                              </div>
                            </div>
                          </div>

                          </li>
                       </ul>
                        <!-- end of user messages -->
                      
              </div>
              <!-- 신고하기 끝 -->
                         
            </div>
          </div>
        
        <!-- /page content -->

        
      </div>
    </div>
	<!-- 씨발 ................. 좆 됐따  -->
	</div>
	</body>
</html>