<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

<style>
	.FaqServiceView{
		display:inline-block;
	}
	
	.FAQcontent li, .noTitle, #searchLi{
		border:1px solid gray;
		background:white;
		width:792px;
		font-size: 15px;
		
		
		
	}
	#searchLi{
		/* margin-left:40px; */
		list-style:none;
		
		
	}
	#searchDiv{
		border: 1px solid gray;
    	background: white;
    	width: 792px;
    	height: 80px;
	    font-size: 20px;
	    text-align: center;
	    padding-top: 20px;
	}
	.noTitle{
		width:792px;
		margin-left: 40px;
		font-weight: bold;
		
		padding-top: 17px;
	    padding-left: 20px;
	    padding-bottom: 7px;
	}
	
	 
	 .FAQcontent li, #searchLi{
	 	cursor:pointer;
	 	padding: 20px;	 	
	 }
	 
	 .FAQcontent li:hover, #searchLi:hover{
	 	background:#FCC3C0;
	 	font-weight: bold;	
	 }
	 ul{
		list-style:none;
		margin-bottom:20px;
		
	 } 
	 .keyWordSearchText{
	 	 width: 640px;
	 
	 }
	 #keyWordSearchBtn{
	 	height: 35px;
	    background: #8C8E8D;
	    color: white;
	    width: 90px;
	    border: 1px solid #8c8e8d;
	 	
	 }
	 
	 #keyWordSearchBtn:hover{
	 	width:92px;
	 	height:37px;
	 	background:#007bff;
	 	border:1px solid #007bff; 	
	 	cursor:pointer;
	 }
	 
	 .Qsearch{
	 	font-size:15px;
	 	margin-left:50px;
	 	width:792px;
	 	height:52px;
	 	padding-left:20px;
	 	background:white;
	 	border: 1px solid lightgray;
	 }
	 .Qsearch input{
	 	border:1px solid white;
	 	margin-top:13px;
	 	
	 }
	 .Qsearch img{
	 	width: 15px;
	 }
	 .subMenu{
	 	height:100px;
	 	cursor:pointer;
	 }
	 .subMenu li{
	 	float:left;
	 	width:33.3%;
	 	height:50px;
	 	background:white;
	 	border:1px solid lightgray;
	 	text-align:center;
	 	vertical-align:middle;
	 	line-height: 45px;
	 	
	 }

	
	 .subMenu li:active{
		background:red;
	  }
	
	body {font-family: Arial;}

	/* Style the tab */
	.tab {
	    overflow: hidden;
	    border: 1px solid #ccc;
	    background-color: #f1f1f1;
	    margin-left:50px;
	    width:791px;
	    background:white;
	}
	
	/* Style the buttons inside the tab */
	.tab button {
	    background-color: inherit;
	    float: left;
	    border: none;
	    outline: none;
	    cursor: pointer;
	    padding: 14px 16px;
	    transition: 0.3s;
	    font-size: 17px;
	    width:33%;
	}

	/* Change background color of buttons on hover */
	.tab button:hover {
	    background-color: #ddd;
	}
	
	/* Create an active/current tablink class */
	.tab button.active {
	    background-color: #ccc;
	
	}
	
	/* Style the tab content */
	.tabcontent {
	    display: none;
	    padding: 6px 12px;
	    border: 1px solid #ccc;
	    border-top: none;
	    margin-top:20px;
	}
</style>
<title>:: Naru ? Maru ! :: FAQ </title>
</head>
<body>
	<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" scope="application" />
	<jsp:include page = "noMenubar.jsp"/>
	
	<div class = "FaqServiceView">
			<div class = "FAQCategory">
				<div class = "Qsearch">
					<img class ="QsearchImg" src="${ contextPath }/resources/images/Magnifier.png"/>
					<input type = "text" class ="keyWordSearchText" placeholder="키워드를 입력해주세요"/>
					<button id ="keyWordSearchBtn" onclick ="searchKeyword();"> 검색하기 </button>
				</div>
				<script type="text/javascript">
				
				function searchKeyword(){
					$.ajax({
						url:"searchFaqList.no",
						type:"post",
						data:{"keyWord":$(".keyWordSearchText").val()},
						
						success:function(data){
							console.log("성공 ");
							console.log(data);
							
							$(".searchContent").empty();
							$(".tabcontent").css('display','none');
							$("#searchContent").css('display','block');
							if(data ==0){
								$(".searchContent").append(
										'<div id = "searchDiv">'+	
										'<p>"'+ $(".keyWordSearchText").val() +'" 에 대한 검색 결과가 없습니다! </p>'+
										
										'</div>'
								);
							} else{
								for(var i = 0; i < data.length; i++){
									$(".searchContent").append(	
										
										'<li id= "searchLi">'+
											'<a href = "faqDetail.no?bno='+data[i].BNO+'">'+
											'<p>' +data[i].B_TITLE +'</p>'+
											'<p>' +  data[i].CREATE_DATE +'</p>'+
											'</a>'+
										'</li>'
									);
								};
							}
						},
						error:function(data){
							console.log("실패");
							console.log(data);
							
						}
					});
				};
			
				
					
				
				</script>
				<div class="tab">
					  <button class="tablinks faq801" onclick="openCity(event, 'commonQuestion')">자주 묻는 질문</button>
					  <button class="tablinks faq802" onclick="openCity(event, 'JoinLogin')">회원가입, 로그인 질문</button>
					  <button class="tablinks faq803" onclick="openCity(event, 'newAlram')">알림, 새소식</button>
				</div>
				<div class="tab">
					  <button class="tablinks faq804" onclick="openCity(event, 'narumaruSetting')">나루마루 설정</button>
					  <button class="tablinks faq805" onclick="openCity(event, 'maruMember')">마루 멤버</button>
					  <button class="tablinks faq806" onclick="openCity(event, 'etc')">기타</button>
					 <!--  <button class="tablinks faq804" onclick="openCity(event, 'searchContent')">검색</button> -->
					 
				</div>
				
				<div id="searchContent" class="tabcontent">
					  <div>
						<div class ="noTitle">
							<label> 검색 내용 </label>
						</div>
						 
						<ul class="FAQcontent searchContent">
	
						</ul>
					</div>
				</div>
				
				<div id="commonQuestion" class="tabcontent" ><!-- style="display:block;" -->
					  <div>
						<div  class ="noTitle">
							<label> 자주 묻는 질문</label>
						</div>
						 
						<ul class = "FAQcontent">
							<c:forEach items ="${ nlist }" var="Notice">
								<c:if test="${ Notice.noType == 801}" >
								<li>
									<a href = "faqDetail.no?bno=${Notice.nid}">
									<p>${ Notice.noTitle }</p>
									<p>${ Notice.createDate }</p>
									</a>
								</li>
								</c:if>
							</c:forEach>
							<!--  -->
							<li>
								<p>Naru Maru 6.3 업데이트 소식.</p>
								<p>2018년 3월 23일 오후 2:00</p>
							</li>
							
							<li>
								<p>Naru Maru 4.3 업데이트 소식.</p>
								<p>2018년 3월 23일 오후 2:00</p>
							</li>
							
							<li>
								<p>Naru Maru 3.3 업데이트 소식.</p>
								<p>2018년 3월 23일 오후 2:00</p>
							</li>
							
							<li>
								<p>Naru Maru 1.1 업데이트 소식.</p>
								<p>2018년 3월 23일 오후 2:00</p>
							</li>
						</ul>
					</div>
				</div>
				
				<div id="JoinLogin" class="tabcontent">
					  <div>
						<div  class ="noTitle">
							<label> 회원가입, 로그인 질문 </label>
						</div>
						 
						<ul class = "FAQcontent">
							<c:forEach items ="${ nlist }" var="Notice">
								<c:if test="${ Notice.noType == 802}" >
								<li>
									<a href = "faqDetail.no?bno=${Notice.nid}">
									<p>${ Notice.noTitle }</p>
									<p>${ Notice.createDate }</p>
									</a>
								</li>
								</c:if>
							</c:forEach>
								
							<li>
								<p>Naru Maru 6.3 업데이트 소식.</p>
								<p>2018년 3월 23일 오후 2:00</p>
							</li>
							
							<li>
								<p>Naru Maru 4.3 업데이트 소식.</p>
								<p>2018년 3월 23일 오후 2:00</p>
							</li>
							
							<li>
								<p>Naru Maru 3.3 업데이트 소식.</p>
								<p>2018년 3월 23일 오후 2:00</p>
							</li>
							
							<li>
								<p>Naru Maru 1.1 업데이트 소식.</p>
								<p>2018년 3월 23일 오후 2:00</p>
							</li>
						</ul>
					</div>
				</div>
				
				<div id="newAlram" class="tabcontent">
					 <div  class ="noTitle">
							<label> 알림, 새소식 </label>
						</div>
						 
						<ul class = "FAQcontent">
							<c:forEach items ="${ nlist }" var="Notice">
								<c:if test="${ Notice.noType == 803}" >
								<li>
									<a href = "faqDetail.no?bno=${Notice.nid}">
									<p>${ Notice.noTitle }</p>
									<p>${ Notice.createDate }</p>
									</a>
								</li>
								</c:if>
							</c:forEach>
								
							<li>
								<p>Naru Maru 6.3 업데이트 소식.</p>
								<p>2018년 3월 23일 오후 2:00</p>
							</li>
							
							<li>
								<p>Naru Maru 4.3 업데이트 소식.</p>
								<p>2018년 3월 23일 오후 2:00</p>
							</li>
							
							<li>
								<p>Naru Maru 3.3 업데이트 소식.</p>
								<p>2018년 3월 23일 오후 2:00</p>
							</li>
							
							<li>
								<p>Naru Maru 1.1 업데이트 소식.</p>
								<p>2018년 3월 23일 오후 2:00</p>
							</li>
						</ul>
					</div>
				</div>
				
				<div id="narumaruSetting" class="tabcontent">
					  <div>
						<div  class ="noTitle">
							<label> 나루마루 설정 </label>
						</div>
						 
						<ul class = "FAQcontent">
							<c:forEach items ="${ nlist }" var="Notice">
								<c:if test="${ Notice.noType == 804}" >
								<li>
									<a href = "faqDetail.no?bno=${Notice.nid}">
									<p>${ Notice.noTitle }</p>
									<p>${ Notice.createDate }</p>
									</a>
								</li>
								</c:if>
							</c:forEach>
								
							<li>
								<p>Naru Maru 6.3 업데이트 소식.</p>
								<p>2018년 3월 23일 오후 2:00</p>
							</li>
							
							<li>
								<p>Naru Maru 4.3 업데이트 소식.</p>
								<p>2018년 3월 23일 오후 2:00</p>
							</li>
							
							<li>
								<p>Naru Maru 3.3 업데이트 소식.</p>
								<p>2018년 3월 23일 오후 2:00</p>
							</li>
							
							<li>
								<p>Naru Maru 1.1 업데이트 소식.</p>
								<p>2018년 3월 23일 오후 2:00</p>
							</li>
						</ul>
					</div>
				</div>
				
				<div id="maruMember" class="tabcontent">
					  <div>
						<div  class ="noTitle">
							<label> 마루 멤버 </label>
						</div>
						 
						<ul class = "FAQcontent">
							<c:forEach items ="${ nlist }" var="Notice">
								<c:if test="${ Notice.noType == 805}" >
								<li>
									<a href = "faqDetail.no?bno=${Notice.nid}">
									<p>${ Notice.noTitle }</p>
									<p>${ Notice.createDate }</p>
									</a>
								</li>
								</c:if>
							</c:forEach>
								
							<li>
								<p>Naru Maru 6.3 업데이트 소식.</p>
								<p>2018년 3월 23일 오후 2:00</p>
							</li>
							
							<li>
								<p>Naru Maru 4.3 업데이트 소식.</p>
								<p>2018년 3월 23일 오후 2:00</p>
							</li>
							
							<li>
								<p>Naru Maru 3.3 업데이트 소식.</p>
								<p>2018년 3월 23일 오후 2:00</p>
							</li>
							
							<li>
								<p>Naru Maru 1.1 업데이트 소식.</p>
								<p>2018년 3월 23일 오후 2:00</p>
							</li>
						</ul>
					</div>
				</div>
				
				<div id="etc" class="tabcontent">
					  <div>
						<div  class ="noTitle">
							<label> 기타 </label>
						</div>
						 
						<ul class = "FAQcontent">
							<c:forEach items ="${ nlist }" var="Notice">
								<c:if test="${ Notice.noType == 806}" >
								<li>
									<a href = "faqDetail.no?bno=${Notice.nid}">
									<p>${ Notice.noTitle }</p>
									<p>${ Notice.createDate }</p>
									</a>
								</li>
								</c:if>
							</c:forEach>
								
							<li>
								<p>Naru Maru 6.3 업데이트 소식.</p>
								<p>2018년 3월 23일 오후 2:00</p>
							</li>
							
							<li>
								<p>Naru Maru 4.3 업데이트 소식.</p>
								<p>2018년 3월 23일 오후 2:00</p>
							</li>
							
							<li>
								<p>Naru Maru 3.3 업데이트 소식.</p>
								<p>2018년 3월 23일 오후 2:00</p>
							</li>
							
							<li>
								<p>Naru Maru 1.1 업데이트 소식.</p>
								<p>2018년 3월 23일 오후 2:00</p>
							</li>
						</ul>
					</div>
				</div>
			</div>
			
			
			
			<script>
				function openCity(evt, cityName) {
				    var i, tabcontent, tablinks;
				    tabcontent = document.getElementsByClassName("tabcontent");
				    for (i = 0; i < tabcontent.length; i++) {
				        tabcontent[i].style.display = "none";
				    }
				    tablinks = document.getElementsByClassName("tablinks");
				    for (i = 0; i < tablinks.length; i++) {
				        tablinks[i].className = tablinks[i].className.replace(" active", "");
				    }
				    document.getElementById(cityName).style.display = "block";
				    evt.currentTarget.className += " active";
				}
			</script>
		</div>	
	
</body>
</html>