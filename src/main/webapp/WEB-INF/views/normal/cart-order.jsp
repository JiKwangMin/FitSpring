<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title></title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
</head>
<body>
<jsp:include page="../include/header.jsp" />
<form id="form" method="post">
<div class="container">
	<div class="d-flex justify-content-between align-items-center border-bottom border-4 border-dark mb-5">
		<div class="">
			<h3 class="fs-1 fw-bold">주문/결제</h3>
		</div>
		<div class="">
			<span class="fw-bold" style="color:#BDBDBD;">
	                장바구니 &gt;<em class="text-primary">주문결제 &gt;</em>주문완료
			</span>
		</div>
	</div>
	<!-- 회원 정보 -->
	<div>
		<div class="border-bottom border-3" style="border-color:#BDBDBD;">
			<h2 class="fs-3 fw-bold">구매자정보</h2>
		</div>
		<table class="table">
			<tbody>
				<tr>
					<th>이름</th>
					<td id="mem_name">${mm.mem_name}</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td id="mem_email">${mm.mem_email}</td>
				</tr>
				<tr>
					<th>휴대폰 번호</th>
					<td id="mem_phone">${mm.mem_phone}</td>
					<td id="mem_postcode" style="display:none;">${mm.mem_oaddress}</td>
					<td id="mem_addr1" style="display:none;">${mm.mem_address}</td>
					<td id="mem_addr2" style="display:none;">${mm.mem_detailaddress}</td>
				</tr>
			</tbody>
		</table>
	</div>
	<!-- 배송지 정보 -->
	<div>
		<div class="border-bottom border-3" style="border-color:#BDBDBD;">
			<h2 class="fs-3 fw-bold">받는사람정보</h2>
		</div>
		<div class="table-responsive">
			<table class="table align-middle">
				<tbody>
					<tr>
						<th>이름</th>
						<td><span id="order_name">${ad.to_name}</span> <span class="border rounded-pill border-primary px-2">기본배송지</span></td>
					</tr>
					<tr>
						<th>배송주소</th>
						<td><span id="order_postcode">${ad.to_post}</span><span id="order_addr">${ad.to_addr} ${ad.to_detailaddr}</span></td>
					</tr>
					<tr>
						<th>연락처</th>
						<td id="order_phone">${ad.to_phone}</td>
					</tr>
					<tr>
						<th style="vertical-align:middle;">배송 요청사항</th>
						<td><input id="order_message" type="text" value="${ad.to_message}" /></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<!-- item 정보 -->
	<div>
		<div class="border-bottom border-3" style="border-color:#BDBDBD;">
			<h2 class="fs-3 fw-bold">구매상품정보</h2>
		</div>
		<div class="table-responsive">
			<table class="table align-middle">
				<tbody>
					<c:forEach items="${orderitem}" var="cart" begin="0" varStatus="status">
						<tr>
							<td class="itemName">${cart[0].cart_item_name}</td>
							<td><span class="itemOptionVal">${cart[0].cart_option_val}</span>/ 수량 <span class="itemQty">${cart[0].cart_sc}</span>개</td>
							<td class="itemNo" style="display:none;">${cart[0].cart_item_no}</td>
							<td class="itemOptionNo" style="display:none;">${cart[0].cart_option_no}</td>
							<td class="itemPrice" style="display:none;">${cart[0].cart_item_price}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<!-- 결제정보 -->
	<div>
		<div class="border-bottom border-3" style="border-color:#BDBDBD;">
			<h2 class="fs-3 fw-bold">결제정보</h2>
		</div>
		<div class="table-responsive">
			<table class="table">
				<tbody>
					<tr>
						<th>총상품가격</th>
						<td id="subtotal">${subtotal}원</td>
					</tr>
					<tr class="align-middle">
						<th style="vertical-align:middle;">적립금 사용</th>
						<td class="p-0">
							<div class="py-3 px-3">
								<strong><span id="discount-point">0</span><span>원</span></strong>
								<span>
									<span>보유 : </span>
									<strong id="mem_point">${mm.mem_point}</strong>
									<span>원</span>
								</span>
								<button type="button" class="btn btn-light d-inline py-1 px-1 border" id="point-btn">적립금 입력</button>
							</div>
							<div id="point-insert" class="point-insert py-2" style="display:none; padding-left:128px; background-color:#F2F2F2;">
								<div class="pb-2">
									<input id="use-point" type="text" value placeholder="0" title="사용할 포인트" size="5">
									<span>원</span>
									<span>|</span>
									<input id="pointAll" type="checkbox" value>
									<label for="pointAll">모두사용</label>
								</div>
								<div>
									<button type="button" id="discount-active" class="btn btn-outline-primary d-inline py-1 px-1 border border-primary">적립금적용</button>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<th>총결제 금액</th>
						<td>
							<div class="d-flex flex-row">
								<div class="me-2">
									<strong>
										<span id="total">${subtotal}</span><span>원</span>
									</strong>
								</div>
								<div>
									<span>적립금 예정 <span id="save-point">${point}</span>원</span>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<th>결제방법</th>
						<td>
							<div class="payType">
								<div class="type-select">
									<ul class="d-flex" id="payTypeList">
										<li class="typeCard me-5">
											<input type="radio" name="payType" id="payType01" value="CARD" />
											<label for="payType01" >
												<span>신용/체크카드</span>
											</label>
										</li>
									</ul>
								</div>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<!-- 결제버튼 -->
	<div class="pb-5">
		<div class="mx-auto" style="width:240px;">
			<button class="p-0 border-0" type="button" id="paymentBtn">
				<img src="/resources/images/order/btn_payment.gif" width="240">
			</button>
		</div>
	</div>
</div>
<input type="hidden" id="order_no" name="order_no"/>
</form>
</body>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script>
	//세션 아이디값 받아오기
	var login_id = "<%= session.getAttribute("id") %>"
	
	var subtotal = ${subtotal};
	var mem_point = ${mm.mem_point};
	var mem_phone = ${mm.mem_phone};
	$(document).ready(function(){
		point();
		totalmoney();
		$("#subtotal").html(numberWithCommas(subtotal)+'원');
		$("#mem_point").html(numberWithCommas(mem_point));
		var a = $("#mem_phone").text();
		var b = $("#order_phone").text();
		$("#mem_phone").text(a.substring(0,3) + '-' + a.substring(3,7) + '-' + a.substring(7,11));
		$("#order_message").on("focusout", function(){
			var s=$(this).val();
			console.log(s);
		});
	});
	
	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	function point(){
		$("#point-btn").click(function(){
			if($("#point-insert").css("display") == "none"){
				$("#point-insert").show();
			}else{
				$("#point-insert").hide();
			}
		});
		var userpoint = ${mm.mem_point};
		console.log(userpoint);
		$("#use-point").on("focusout", function() {
			var a = 0;
			a = $("#use-point").val();
			console.log(a);
			if(userpoint < a){
				alert("보유한 포인트보다 높게 입력하실 수 없습니다.");
				$("#use-point").val('');
			}
		});
		$("#pointAll").click(function(){
			if($(this).is(":checked")== true){
				$("#use-point").val(userpoint);
			}else{
				var i = 0;
				$("#use-point").val('');
			}
		});
		$("#discount-active").click(function(){
			var point = $("#use-point").val();
			$("#discount-point").html(numberWithCommas(-point));
			$("#point-insert").hide();
			totalmoney();
		});
	}
	
	function totalmoney(){
		var point = -$("#discount-point").text().replace(',','');
		var total = subtotal - point;
		var save_point = (total*0.01);
		console.log("point",point);
		console.log("total",total);
		console.log("save",save_point);
		$("#total").html(numberWithCommas(total));
		$("#save-point").html(save_point);
	}
	
	$('input[name="payType"]').change(function(){
		$('input[name="payType"]').each(function(){
			var value = $(this).val();
			
		});
	});
	
	$("#paymentBtn").click(function(){
		var arr = new Array();
		$('.itemName').each(function(){
			arr.push($(this).text());
		});
		var itemName ="";
		for(var i=0;i<arr.length;i++){
			itemName += arr[i]+",";
		}
		if(arr.length > 1){
			var b1 = 0;
			for(var i=1;i<arr.length;i++){
				b1++;
			}
			itemName = arr[0]+" 외"+b1+"종"
		}
		var item_no = new Array();
		$(".itemNo").each(function(){
			item_no.push($(this).text());
		});
		var option_no = new Array();
		$(".itemOptionNo").each(function(){
			option_no.push($(this).text());
		});
		var option_val = new Array();
		$(".itemOptionVal").each(function(){
			option_val.push($(this).text());
		});
		var item_qty = new Array();
		$(".itemQty").each(function(){
			item_qty.push($(this).text());
		});
		var item_price = new Array();
		$(".itemPrice").each(function(){
			item_price.push($(this).text());
		});
		var total = $("#total").text().replace(",","");
		var m_email = $("#mem_email").text();
		var m_name = $("#mem_name").text();
		var m_phone = $("#mem_phone").text();
		var m_addr1 = $("#mem_addr1").text();
		var m_addr2 = $("#mem_addr2").text();
		var m_addr = m_addr1+m_addr2;
		var m_post = $("#mem_postcode").text();
		var order_addr = $("#order_addr").text();
		var order_post = $("#order_postcode").text();
		var order_name = $("#order_name").text();
		var order_phone = $("#order_phone").text();
		var order_message = $("#order_message").val();
		var order_use_point = -parseInt($("#discount-point").text().replace(",",""));
		var order_total_price = $("#total").text().replace(",","");
		console.log("상품 이름 : ",itemName, arr);
		console.log("결제금액 : ",total);
		console.log("회원 이메일 : ",m_email);
		console.log("회원 전화번호 : ",m_phone);
		console.log("회원 주소 : ",m_addr);
		console.log("우편번호 : ",m_post);
		console.log("상품번호 : ",item_no);
		console.log("상품옵션번호 : ",option_no);
		console.log("상품옵션 : ",option_val);
		console.log("상품수량 : ",item_qty);
		console.log("상품가격 : ",item_price);
		console.log("받는분 이름 : ",order_name)
		console.log("받는분 주소 : ",order_post,order_addr);
		console.log("받는분 전화번호 : ",order_phone);
		console.log("배송 요청사항 : ",order_message);
		console.log("사용 포인트 : ",order_use_point);
		console.log("총 금액 : ", subtotal);
		console.log("할인 총 금액 : ", order_total_price);
		var IMP = window.IMP; // 생략 가능
	    IMP.init("imp43299011"); // 예: imp00000000
		if($('input:radio[name="payType"]:checked').attr('value') == "CARD"){
			IMP.request_pay({ // param
		          pg: "html5_inicis",
		          pay_method: "card",
		          merchant_uid: new Date().getTime(),
		          name: itemName,
		          amount: total,
		          buyer_email: m_email,
		          buyer_name: m_name,
		          buyer_tel: m_phone,
		          buyer_addr: m_addr,
		          buyer_postcode: m_post
		      }, function (rsp) { // callback
		    	  console.log("rsp",rsp);
		          if (rsp.success) {
		        	  var msg = '결제가 완료되었습니다.';
						msg += '고유ID : ' + rsp.imp_uid;
						msg += '상점 거래ID : ' + rsp.merchant_uid;
						msg += '결제 금액 : ' + rsp.paid_amount;
						msg += '카드 승인번호 : ' + rsp.apply_num;
					let orderVO = {
						order_no : rsp.merchant_uid,
						order_mem_id : login_id,
						order_item_no : item_no,
						order_option_no : option_no,
						order_option_val : option_val,
						order_item_name : arr,
						order_item_qty : item_qty,
						order_item_price : item_price,
						order_name : order_name,
						order_addr : order_addr,
						order_post : order_post,
						order_phone : order_phone,
						order_message : order_message,
						order_use_point : order_use_point,
						order_paytype : rsp.pay_method,
						order_total_price : order_total_price,
						order_subtotal_price : subtotal
					}
					$.ajax({
						url : "/order/orderInsert",
						type : "POST",
						traditional : true,
						dataType : "json",
						data : orderVO,
						success : function(data){
							if(data == '1'){
								alert(msg);
								completed(orderVO.order_no);
							}else if(data == '2'){
								alert("실패");
								return false;
							}
						},
						error : function(request, status, error){}
					});
		          } else {
		              // 결제 실패 시 로직,
		              var msg = '결제에 실패하였습니다.';
		              msg += '에러내용 :' + rsp.error_msg;
		          }
		          alert(msg);
		      });
		}else{
			alert("결제방법을 선택해주세요!");
		}
	});
	
	function completed(x){
		alert(x);
		$("#order_no").val(x);
		$("#form").attr("action", "/order_completed");
		$("#form").submit();
	}
</script>
</html>