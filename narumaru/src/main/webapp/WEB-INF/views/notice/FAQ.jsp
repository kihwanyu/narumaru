<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	.FAQcontent li, .noTitle{
		border:1px solid gray;
		background:white;
		width:792px;
		font-size: 15px;
		
		
		
	}
	
	.noTitle{
		width:792px;
		margin-left: 40px;
		font-weight: bold;
		
		padding-top: 17px;
	    padding-left: 20px;
	    padding-bottom: 7px;
	}
	
	 
	 .FAQcontent li{
	 	cursor:pointer;
	 	padding: 20px;	 	
	 }
	 
	 .FAQcontent li:hover{
	 	background:#FCC3C0;
	 	font-weight: bold;	
	 }
	 ul{
		list-style:none;
		margin-bottom:20px;
		
	 } 
	 .keyWordSearch{
	 	 width: 730px;
	 
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
					<input type = "text" class ="keyWordSearch" placeholder="검색어를 입력해주세요"/>
				</div>
				<div class="tab">
					  <button class="tablinks" onclick="openCity(event, 'commonQuestion')">자주 묻는 질문</button>
					  <button class="tablinks" onclick="openCity(event, 'JoinLogin')">회원가입, 로그인 질문</button>
					  <button class="tablinks" onclick="openCity(event, 'newAlram')">알림, 새소식</button>
				</div>
				<div class="tab">
					  <button class="tablinks" onclick="openCity(event, 'London')">나루마루 설정</button>
					  <button class="tablinks" onclick="openCity(event, 'Paris')">마루 멤버</button>
					  <button class="tablinks" onclick="openCity(event, 'Tokyo')">기타</button>
				</div>
				
				
				<div id="commonQuestion" class="tabcontent" style="display:block;">
					  <div>
						<div  class ="noTitle">
							<label> 자주 묻는 질문</label>
						</div>
						 
						<ul class = "FAQcontent">
							<li><a href = "noticeDetail.no">
								<p>다국어 서비스 관련해 안내해드립니다.</p>
								<p>2018년 4월 4일 오후 2:00</p>
								</a>	
							</li>
								
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
							<li><a href = "noticeDetail.no">
								<p>다국어 서비스 관련해 안내해드립니다.</p>
								<p>2018년 4월 4일 오후 2:00</p>
								</a>	
							</li>
								
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
							<li><a href = "noticeDetail.no">
								<p>다국어 서비스 관련해 안내해드립니다.</p>
								<p>2018년 4월 4일 오후 2:00</p>
								</a>	
							</li>
								
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