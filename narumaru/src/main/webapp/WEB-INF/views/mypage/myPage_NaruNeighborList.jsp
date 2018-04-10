<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<title>myPage</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="resources/css/mypage.css"> <!-- mypageCss -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<style type="text/css">
		* {
			color: black;
		}
		
		</style>
	</head>
	<body>
	<!--  -->
	<jsp:include page="../common/topmenu.jsp"/>	
		<br>
		<br>
		<br>
		<div id="container" style="margin-top: 50px;">
		<c:set var="pageValue" value="NaruNeighborList" scope="request" />
		<jsp:include page="../common/myPage_LeftSideBar.jsp"/>	
			<div id="contents" style="background: white;">
				<div style="font-size: 15px; margin-bottom: 15px;">
					나루 이웃 목록
				</div>		
				<ul class="list-group">
					<li class="list-group-item">
						<div style="height: 40px; width: 40px; float: left; margin-right: 20px;">
							<img alt="profile_person" src="resources/images/profile_defalt.png" height="100%" width="100%">
						</div>
						<div style="float: right;">
							<input type="button" value="삭제" class="btn btn-default">
						</div>
						<div style="padding-top: 10px; padding-bottom: 10px;">
							회원 이름
						</div>
					</li>
					<li class="list-group-item">
						<div style="height: 40px; width: 40px; float: left; margin-right: 20px;">
							<img alt="profile_person" src="resources/images/profile_defalt.png" height="100%" width="100%">
						</div>
						<div style="float: right;">
							<input type="button" value="삭제" class="btn btn-default">
						</div>
						<div style="padding-top: 10px; padding-bottom: 10px;">
							회원 이름
						</div>
					</li>
					<li class="list-group-item">
						<div style="height: 40px; width: 40px; float: left; margin-right: 20px;">
							<img alt="profile_person" src="resources/images/profile_defalt.png" height="100%" width="100%">
						</div>
						<div style="float: right;">
							<input type="button" value="삭제" class="btn btn-default">
						</div>
						<div style="padding-top: 10px; padding-bottom: 10px;">
							회원 이름
						</div>
					</li>     
				</ul>
				<div align="center" style="color: gray;">
					<ul class="pagination">
						<li><a href="#"><<</a></li>
						<li><a href="#"><</a></li>
						<li><a href="#">1</a></li>
						<li class="active"><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
						<li><a href="#">></a></li>
						<li><a href="#">>></a></li>
					</ul>
				</div>
			</div>
		</div>
		
		<jsp:include page="../common/myPage_RightSideBar.jsp"/>
		<script type="text/javascript">
				$(function(){
					var formObj = $("form[role='order']");
					console.log(formObj);

					var total = parseInt($("#totalPrice").text());
					var deliveryFee = 2500;
					
					console.log("토탈 : " + total);
					console.log( "배송료 "+ deliveryFee);
					var payThisAmount = total+deliveryFee;
					
					$("#payThis").html(payThisAmount+"원");
					
					$('#paymentBtn').click(function(){
						var IMP = window.IMP; // 생략가능
						IMP.init('imp12391643'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
						var pg = 'inicis';
						var pay_pay_method = $(":radio[name='payments']:checked").val(); 
						var pay_amount = payThisAmount; // 만약 앞뒤로 공백이있다면 공백제거
						var pay_name = "test1";
						
						<%-- var pay_buyer_email = "<%=loginUser.getM_email()%>";
						var pay_buyer_name = "<%=loginUser.getM_name()%>";
						var pay_buyer_tel = "<%=loginUser.getM_phone()%>";
						var pay_buyer_address = "<%=address1+address2%>";
						var pay_buyer_postcode = "<%=postcode%>"; --%>
						
						IMP.request_pay({
						    pg : pg, 
						    pay_method : pay_pay_method,
						    merchant_uid : 'merchant_' + new Date().getTime(),
						    name : pay_name,
						    amount : pay_amount,
						    buyer_email : pay_buyer_email,
						    buyer_name : pay_buyer_name,
						    buyer_tel : pay_buyer_tel,
						    buyer_addr : pay_buyer_address,
						    buyer_postcode : pay_buyer_postcode,
						}, function(rsp) {
						    if ( rsp.success ) {
						        var msg = '결제가 완료되었습니다.';
						        msg += '고유ID : ' + rsp.imp_uid;
						        msg += '상점 거래ID : ' + rsp.merchant_uid;
						        msg += '결제 금액 : ' + rsp.paid_amount;
						        msg += '카드 승인번호 : ' + rsp.apply_num;
						        
						      	$('#pay_imp_uid').val(rsp.imp_uid); 
						      	$('#pay_merchant_uid').val(rsp.merchant_uid);
						      	$('#pay_amount').val(rsp.paid_amount);
						      	$('#pay_apply_num').val(rsp.apply_num);
						      	$('#pay_pg').val(pg);
						      	$('#pay_paymethod').val(pay_pay_method);
						      	$('#pay_name').val(pay_name);
						      	$('#pay_buyer_name').val(pay_buyer_name);
						      	$('#pay_buyer_tel').val(pay_buyer_tel);
						      	$('#pay_buyer_addr').val(pay_buyer_address);
						      	$('#pay_buyer_postcode').val(pay_buyer_postcode);
						      	$('#pay_buyer_email').val(pay_buyer_email);
								
						        formObj.submit();
						    } else {
						        var msg = '결제에 실패하였습니다.';
						        msg += '에러내용 : ' + rsp.error_msg;
						    }
						    alert(msg);
						});
					});
				});
				</script>
	</body>
</html>