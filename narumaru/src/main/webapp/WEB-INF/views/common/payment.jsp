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
		<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
		<style type="text/css">
		ul.tabs {
		    margin: 0 auto;
		    padding: 0;
		    float: left;
		    list-style: none;
		    height: 32px;
		    border-bottom: 1px solid #eee;
		    border-left: 1px solid #eee;
		    width: 100%;
		    font-family:"dotum";
		    font-size:12px;
		}
		ul.tabs li {
		    float: left;
		    text-align:center;
		    cursor: pointer;
		    width:50%;
		    height: 31px;
		    line-height: 31px;
		    border: 1px solid #eee;
		    border-left: none;
		    font-weight: bold;
		    background: #fafafa;
		    overflow: hidden;
		    position: relative;
		}
		ul.tabs li.active {
		    background: #FFFFFF;
		    border-bottom: 1px solid #FFFFFF;
		}
		.tab_container {
		    border: 1px solid #eee;
		    border-top: none;
		    clear: both;
		    float: left;
		    width: 100%;
		    background: #FFFFFF;
		    margin-top: 20px;
		    padding-top: 20px;
		    padding-bottom: 10px;
		    padding-right: 10px;
			padding-left: 10px;
		}
		.tab_content {
		    padding: 5px;
		    font-size: 12px;
		    display: none;
		}
		.tab_container .tab_content ul {
		    width:100%;
		    margin:0px;
		    padding:0px;
		}
		.tab_container .tab_content ul li {
		    padding:5px;
		    list-style:none;
		}
		;
		#container {
		    width: 100%;
		    margin: 0 auto;
		}
		.board-li {
			border: solid 1px white; 
			margin-bottom: 15px;
			-webkit-box-shadow: 1px 1px 5px gray;
			-moz-box-shadow: 1px 1px 5px gray;
			cursor: pointer;
		}
		.board-li-title {
			border-bottom: solid 1px lightgray; 
			padding-top: 10px; 
			padding-bottom: 10px; 
			font-size: 15px;
		}
		.board-menu-down {
		    display: none;
		    width:100px;
		    position: absolute;
		    background-color: white;
		    border:1px solid lightgray;
		    z-index: 1;
		    margin-left:0px;
		}
		.profile-dropdown ul{
			padding:15px;
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
		<c:set var="pageValue" value="pointPaymentList" scope="request" />
		<jsp:include page="../common/myPage_LeftSideBar.jsp"/>	
			
			<div id="contents">
				<div style="margin-top: 5px; margin-bottom: 10px; color: black;" align="right">
				</div>
				<div style="width: 100%;">
				   
				    <div class="tab_container" align="center">
						<div style="color: black;">
							<div align="left" style="font-size: 18px; margin-bottom: 5px;">
								1. 충전할 포인트양을 선택해주세요.
							</div>
							<table class="table">
								<thead>
									<tr>
										<th width="45%">충전 금액</th>
										<th width="45%">결제하실 금액</th>
										<th width="10%"></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1000P</td>
										<td>1000원</td>
										<td><input type="radio" name="price" value="1000"></td>
									</tr>
									<tr>
										<td>3000P</td>
										<td>3000원</td>
										<td><input type="radio" name="price" value="3000"></td>
									</tr>
									<tr>
										<td>5000P</td>
										<td>5000원</td>
										<td><input type="radio" name="price" value="4000"></td>
									</tr>
									<tr>
										<td>10000P</td>
										<td>10000원</td>
										<td><input type="radio" name="price" value="4000"></td>
									</tr>
									<tr>
										<td>30000P</td>
										<td>30000원</td>
										<td><input type="radio" name="price" value="4000"></td>
									</tr>
									<tr>
										<td>50000P</td>
										<td>50000원</td>
										<td><input type="radio" name="price" value="4000"></td>
									</tr>						
							</table>
						</div>    
						<div style="color: black;">
							<div align="left" style="font-size: 18px; margin-bottom: 5px;">
								2.결제 정보를 입력해주세요.
							</div>
							<div>
								<table style="width: 70%;" align="left">
									<tbody>
										<tr style="height: 50px;">
											<td width="30%">이름 :<td>
											<td width="70%"><input class="form-control" type="text" name="name"><td>
										</tr>
										<tr style="height: 50px;">
											<td width="30%">이메일 :<td>
											<td width="70%"><input class="form-control" type="text" name="name"><td>
										</tr>
										<tr style="height: 50px;">
											<td width="30%">연락처 :<td>
											<td width="70%"><input class="form-control" type="text" name="name"><td>
										</tr>
										<tr style="height: 50px;">
											<td width="30%">결제방법 :<td>
											<td width="70%">
												<input type="radio" name="payments" value="trans" id="payments-1" checked>
												<label for="payments-1">온라인 계좌이체</label>
												<input type="radio" name="payments" value="samsung" id="payments-2">
												<label for="payments-2">삼성 페이</label><br>
												<input type="radio" name="payments" value="card" id="payments-3">
												<label for="payments-3">신용카드</label>
												<input type="radio" name="payments" value="vbank" id="payments-4">
												<label for="payments-4">가상계좌</label><br>
												<input type="radio" name="payments" value="phone" id="payments-5">
												<label for="payments-5">핸드폰 소액결제</label>
											<td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
				    </div>
				</div>
				<div align="center" style="color: black;">
					<input type="button" value="결제하기" class="btn btn-default" style="margin-top: 10px;">
				</div>
			</div>
		</div>
		
		<input type="hidden" id='pay_pg' name="pay_pg">
		<input type="hidden" id="pay_paymethod" name="pay_paymethod">
		<input type="hidden" id="pay_merchant_uid" name="pay_merchant_uid">
		<input type="hidden" id="pay_name" name="pay_name">
		<input type="hidden" id="pay_amount" name="pay_amount">
		<input type="hidden" id="pay_buyer_name" name="pay_buyer_name">
		<input type="hidden" id="pay_buyer_tel" name="pay_buyer_tel">
		<input type="hidden" id="pay_buyer_addr" name="pay_buyer_addr">
		<input type="hidden" id="pay_buyer_postcode" name="pay_buyer_postcode">
		<input type="hidden" id="pay_imp_uid" name="pay_imp_uid">
		<input type="hidden" id="pay_apply_num" name="pay_apply_num">
		<input type="hidden" id="pay_buyer_email" name="pay_buyer_email">
				
		<jsp:include page="../common/myPage_RightSideBar.jsp"/>
		
		<script type="text/javascript">
		$(function(){
			$(".tab_content").hide();
		    $(".tab_content:first").show();

		    $("ul.tabs li").click(function () {
		        $("ul.tabs li").removeClass("active").css("color", "#333");
		        //$(this).addClass("active").css({"color": "darkred","font-weight": "bolder"});
		        $(this).addClass("active").css("color", "darkred");
		        $(".tab_content").hide()
		        var activeTab = $(this).attr("rel");
		        $("#" + activeTab).fadeIn()
		    });
		});
		</script>
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
						IMP.init('imp46573984'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
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