<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<title>myPage</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
		<style>
			#container {
				width:60%;
				height:700px;
				margin:0 auto;
				background: #F7EEE7;
				padding:20px;
			}
			#header {
				padding:20px;
				margin-bottom:20px;
			}
			#contents {
				width: 67%;
				float: left;
				margin-bottom: 20px;
				background: #8C8E8D;
				color: #FFFFFF;
				padding:20px;
			}
			#left-sidebar {
				width: 30%;
				float: left;
				margin-bottom: 20px;
				margin-right: 20px;
				background: #8C8E8D;
				color: #FFFFFF;
				padding:20px;
			}
			#footer {
				clear:both;			
			}
			#left-sidebar ul{
				list-style:none;
			    margin:0;
			    padding:0;
			}
			#left-sidebar li{
				padding: 10px;
				margin: 3px;
				background: #FCC3C0;
				text-align: center;
			}	
			#left-sidebar li:hover{
				padding: 10px;
				margin: 3px;
				background: #F7EEE7;
				text-align: center;
				color: #FCC3C0;
			}			
		</style>
		<!-- #FCC3C0 #F7EEE7 #8C8E8D -->
	</head>
	<body>
	<jsp:include page="../../common/topmenu.jsp"/>	
		<div id="container" style="margin-top: 50px;">
			<div id="left-sidebar">
				<ul>
					<li>항목1</li>
					<li>항목2</li>
					<li>항목3</li>
					<li>항목4</li>
					<li>항목3</li>
					<li>항목4</li>
					<li>항목3</li>
					<li>항목4</li>
					<li>항목3</li>
					<li>항목4</li>
				</ul>
			</div>
			<div id="contents">
				<h2>본문</h2>
				<p>예비비는 총액으로 국회의 의결을 얻어야 한다. 예비비의 지출은 차기국회의 승인을 얻어야 한다. 이 헌법시행 당시의 법령과 조약은 이 헌법에 위배되지 아니하는 한 그 효력을 지속한다.</p>

				<p>국가의 세입·세출의 결산, 국가 및 법률이 정한 단체의 회계검사와 행정기관 및 공무원의 직무에 관한 감찰을 하기 위하여 대통령 소속하에 감사원을 둔다.</p>

				<p>모든 국민의 재산권은 보장된다. 그 내용과 한계는 법률로 정한다. 대한민국의 국민이 되는 요건은 법률로 정한다. 법률이 헌법에 위반되는 여부가 재판의 전제가 된 경우에는 법원은 헌법재판소에 제청하여 그 심판에 의하여 재판한다.</p>
			</div>
			
			
		</div>
	</body>
</html>