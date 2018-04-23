<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
	<head>
		<title>myPage</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
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
		#contents{
			width: 80%;
		}
		</style>
		
	</head>
	<body>
	<!--  -->
		<div id="container" align="center">
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
										<td>1,000P</td>
										<td>1,100원</td>
										<td><input type="radio" name="point" value="1000" id="point-1" checked></td>
									</tr>
									<tr>
										<td>3,000P</td>
										<td>3,300원</td>
										<td><input type="radio" name="point" value="3000" id="point-2"></td>
									</tr>
									<tr>
										<td>5,000P</td>
										<td>5,500원</td>
										<td><input type="radio" name="point" value="5000" id="point-3"></td>
									</tr>
									<tr>
										<td>10,000P</td>
										<td>11,000원</td>
										<td><input type="radio" name="point" value="10000" id="point-4"></td>
									</tr>
									<tr>
										<td>30,000P</td>
										<td>33,000원</td>
										<td><input type="radio" name="point" value="30000" id="point-5"></td>
									</tr>
									<tr>
										<td>50,000P</td>
										<td>55,000원</td>
										<td><input type="radio" name="point" value="50000" id="point-6"></td>
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
											<td width="70%">
												<input class="form-control" type="text" id="name" name="name" placeholder="이름을 입력해주세요." maxlength="5">
												<label class="name-label" style="display: none; color: red;">한글만 입력해주세요.</label>
											<td>
										</tr>
										<tr style="height: 50px;">
											<td width="30%">이메일 :<td>
											<td width="70%"><input class="form-control" type="text" id="email" name="email" value="${loginUser.email }" placeholder="이메일을 입력해주세요." maxlength="24" disabled="disabled"><td>
										</tr>
										<tr style="height: 50px;">
											<c:set var="phoneSize" value="${fn:length(loginUser.phone)}"/>
											<c:set var="phoneStr" value="0${fn:substring(loginUser.phone,3,phoneSize)}"/>
											<td width="30%">연락처 :<td>
											<td width="70%"><input class="form-control" type="text" id="phone" name="phone" value="${phoneStr }" placeholder="핸드폰 번호를 입력해주세요." maxlength="11" disabled="disabled"><td>
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
					<input type="button" id="paymentBtn" value="결제하기" class="btn btn-default" style="margin-top: 10px;">
				</div>
			</div>
		</div>
		<form role="payment" action="paymentInsert.pa" method="post">
			<input type="hidden" id='pay_pg' name="payPg">
			<input type="hidden" id="pay_paymethod" name="payMethod">
			<input type="hidden" id="pay_merchant_uid" name="merchantUid">
			<input type="hidden" id="pay_name" name="payName">
			<input type="hidden" id="pay_amount" name="amount">
			<input type="hidden" id="pay_buyer_name" name="buyerName">
			<input type="hidden" id="pay_buyer_tel" name="pay_buyer_tel">
			<input type="hidden" id="pay_imp_uid" name="impUid">
			<input type="hidden" id="pay_apply_num" name="applyNum">
			<input type="hidden" id="pay_buyer_email" name="buyerEmail">
			<input type="hidden" id="pay_point" name="point">
			
		</form>
		<form role="error" action="paymentError.pa" method="get">
			<input type="hidden" id="error_msg" name="error_msg">
		</form>		
		<script type="text/javascript">
				$(function(){
					var namePassValue = "";
					var namePass = false;
					/* 이름 정규표현식 start */
					$("#name").keydown(function(){
						
						var patten = /^[가-힣ㄱ-ㅎㅏ-ㅣ]/g;
						var name = $("#name").val();
						var nameSub = name.substr(name.length-1);
						
						if(patten.test(nameSub) || name == ""){
							$(".name-label").hide();
							namePassValue = name;
							namePass = true;
						} else {
							$("#name").val(namePassValue);
							$(".name-label").show();
							namePass = false;
						}
					});
					/* 이름 정규표현식 end */
					
						var formObj = $("form[role='payment']");
						var errorObj = $("form[role='error']");
						
						$('#paymentBtn').click(function(){
							var onclickPatten = /^[가-힣]/g;
							console.log(namePass);
							if(namePassValue.length > 1 && namePass == true){
								var IMP = window.IMP; // 생략가능
								IMP.init('imp46573984'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
								var pg = 'inicis';
								var point = $(":radio[name='point']:checked").val();
								var price = Number(Number(point) + (Number(point)*0.1)); // 부가세 10%
								var pay_pay_method = $(":radio[name='payments']:checked").val(); 
								
								/* var pay_amount = price;  */
								var pay_amount = 100;
								var pay_name = point + ' 포인트 결제';
								
								var pay_buyer_email = $("#email").val();
								var pay_buyer_name = $("#name").val();
								var pay_buyer_tel = $("#phone").val();
								var pay_buyer_address = "";
								var pay_buyer_postcode = "";
								
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
								      	$('#pay_imp_uid').val(rsp.imp_uid); 
								      	$('#pay_merchant_uid').val(rsp.merchant_uid);
								      	$('#pay_amount').val(rsp.paid_amount);
								      	$('#pay_apply_num').val(rsp.apply_num);
								      	$('#pay_pg').val(pg);
								      	$('#pay_paymethod').val(pay_pay_method);
								      	$('#pay_name').val(pay_name);
								      	$('#pay_buyer_name').val(pay_buyer_name);
								      	$('#pay_buyer_tel').val(pay_buyer_tel);
								      	$('#pay_buyer_email').val(pay_buyer_email);
										$('#pay_point').val(point);
										
								        formObj.submit();
								    } else {
								    	
								        $('#error_msg').val('에러 내용 : ' + rsp.error_msg);
								        errorObj.submit();
								    }
								});
							} else {
								alert("올바르지 못한 이름입니다.");
							}
						}); 
				});
				</script>
	</body>
</html>