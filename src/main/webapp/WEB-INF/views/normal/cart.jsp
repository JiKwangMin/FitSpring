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
<style>
		a:hover {
  			text-decoration: none;
		}
		.o_btn{
			padding:0px;
			width:150px;
			margin-top:5px;
			margin-botton:5px;
		}
		
		.m-0{
			margin:0px;
		}
		
		.td_border{
			border-right:2px solid #dee2e6;
		}
		.captionhide{
			display:none;
		}
		.st-select-text .st-selected-delete {
		    border: 1px solid #ccc;
		    border-radius: 2px;
		    color: #0073e9;
		    text-align: center;
		    background: #fff;
		    cursor: pointer;
		    display: inline-block;
		    margin-left: 10px;
		    padding: 5px 8px 4px;
		    letter-spacing: -0.5px;
		    vertical-align: middle;
		}
		.table .head th{
			text-align:center;
		}
		
		.cart-deal-item td:first-child{
			width:50px;
		}
		.cart-deal-item td:nth-child(2){
			width:80px;
		}
		.cart-deal-item td:nth-child(3){
			width:100%;
		}
		.cart-deal-item td:nth-child(4){
			width:80px;
		}
		.all-select-event span{
			position:absolute;
		}
		
	</style>
<body>
<jsp:include page="../include/header.jsp" />
	<form id="form" method="post">
	<div class="container">
		<div class="d-flex justify-content-between align-items-center border-bottom border-4 border-dark mb-5">
			<div class="">
				<h3 class="fs-1 fw-bold"><i class="bi bi-cart4"></i>&nbsp;장바구니</h3>
			</div>
			<div class="">
				<span class="fw-bold" style="color:#BDBDBD;">
					<em class="text-primary">장바구니</em>&gt;주문결제 &gt;주문완료
				</span>
			</div>
		</div>
		<div class="wish-area">
			<div class="table-responsive text-nowrap">
				<table class="table" style="width: 100%;">
					<caption class="captionhide">내가 장바구니에 담은 상품 목록을 확인하실 수 있습니다.</caption>
					<colgroup>
						<col width="50">
						<col width="80">
						<col width="*">
						<col width="90">
						<col width="90">
					</colgroup>
					<c:if test="${!empty cartlist}">
					<thead class="">
						<tr class="head align-middle" > 
							<th scope="col" class="all-select-event" style="vertical-align:middle;">
								<label>
									<input type="checkbox" checked="checked" name="item"
										class="all-select-chk" onclick="selectAll(this)"> 
										<span class="">&nbsp;&nbsp;전체선택 </span>
								</label>
							</th>
							<th scope="colgroup" colspan="2" style="vertical-align:middle;">
								상품정보
							</th>
							<th scope="col" style="vertical-align:middle;">
								상품금액
							</th>
							<th scope="col" style="vertical-align:middle;">
								배송비
							</th>
						</tr>
					</thead>
					</c:if>
					<c:if test="${!empty cartlist}">
						<tbody class="">
							<c:forEach items="${cartlist}" var="cart">

								<tr class="cart-deal-item align-middle">
									<td class="" style="vertical-align: middle; width: 1%;">
										<input type="checkbox" checked="checked" name="item" class="select-chk" value="${cart.cart_option_no}" chknum="${cart.cart_no}">
									</td>
									<td class="" style="width: 15%;"><a
										href="/item_detail?item_no=${cart.cart_item_no}"
										class="item-link text-decoration-none"> <img
											src="../resources/upload${cart.itemInfoVO.main_item_img}"
											width="100" height="100" class="img" alt="#">
									</a></td>
									<td class="" style="vertical-align: middle;">
										<div class="border-bottom pb-3">
											<a href="/item_detail?item_no=${cart.cart_item_no}"	class="text-decoration-none text-body fs-4 fw-bold">${cart.cart_item_name}</a>
											<span class="fs-4 fw-bold">&nbsp;${cart.cart_option_val}</span>
										</div>
										<div class="option-price-part pt-3 text-end" data-sale-price="${cart.cart_item_price}">
											<span class="unit-cost" data-sale-price="${cart.cart_item_price}">
												<span class="sr-only">제품가격</span>
												<fmt:formatNumber value="${cart.cart_item_price}" pattern="#,###" />원
											</span>
												${cart.cart_sc}
											<span class="select-select">
												<select class="quantity-select" id="qty_${cart.cart_option_no}" item_no="${cart.cart_item_no}" option_no="${cart.cart_option_no}" data-price="${cart.cart_item_price}" data-quantity="${cart.cart_sc}" data-all="true" title="${cart.cart_item_name}" style="width:10%;">
													<option value="1" <c:if test="${cart.cart_sc eq 1}">selected</c:if>>1</option>
													<option value="2" <c:if test="${cart.cart_sc eq 2}">selected</c:if>>2</option>
													<option value="3" <c:if test="${cart.cart_sc eq 3}">selected</c:if>>3</option>
													<option value="4" <c:if test="${cart.cart_sc eq 4}">selected</c:if>>4</option>
													<option value="5" <c:if test="${cart.cart_sc eq 5}">selected</c:if>>5</option>
													<option value="6" <c:if test="${cart.cart_sc eq 6}">selected</c:if>>6</option>
													<option value="7" <c:if test="${cart.cart_sc eq 7}">selected</c:if>>7</option>
													<option value="8" <c:if test="${cart.cart_sc eq 8}">selected</c:if>>8</option>
													<option value="9" <c:if test="${cart.cart_sc eq 9}">selected</c:if>>9</option>
													<option value="10"<c:if test="${cart.cart_sc eq 10}">selected</c:if>>10</option>
												</select>
											</span>
											<span class="select-text" style="display:none;">
												<input type="text" class="quantity-text" title="${cart.cart_item_name}" maxlength="4" value="" data-url="#" data-all="true">
												<input type="button" class="quantity-chg none" value="수량변경">
											</span>
											<span class="unit-price-area">
												<span class="unit-price" id="unit${cart.cart_option_no}">
													<fmt:formatNumber value="${cart.cart_item_price * cart.cart_sc}" pattern="#,###" />
												</span>
											원
											</span>
				                            <button type="button" class="btn p-0" onclick="cartItemDel(${cart.cart_option_no})"><i class="bi bi-x-square"></i></button>
				                        </div>
									</td>
									<td class="border sub_total" style="vertical-align: middle;">
										<span id="unit111${cart.cart_option_no}" class="subTotal">
											<fmt:formatNumber value="${cart.cart_item_price * cart.cart_sc}" pattern="#,###" />
										</span>
											원
									</td>
									<td class="edit st-edit text-end"
										style="vertical-align: middle;">
										무료배송
									</td>
								</tr>
								<input type="hidden" name="cart_no" class="cart_no" />
							</c:forEach>
						</tbody>
					</c:if>
					<c:if test="${empty cartlist}">
						<tbody>
							<tr class="text-center">
								<td style="width: 100%; padding: 100px 0px;">
									<div class="fs-3 py-5">
										<strong>장바구니에 담은 상품이 없습니다.</strong>
									</div>
									<div class="fs-4 py-5">
										각 상품에서 구매할 옵션을 선택하시고,<em style="color:rgb(61, 130, 247);">구매하기</em> 버튼을 눌러 보세요!<br/>
										선택한 옵션을 모두 장바구니에 담을 수 있습니다.
									</div>
								</td>
							</tr>
						</tbody>
					</c:if>
				</table>
				<div class="d-flex justify-content-between" style="margin-bottom:20px;">
					<div class="">
						<input type="checkbox" checked="checked" id="all_ck"
							class="all-select-chk" name="item" onclick="selectAll(this)">
						<span class="select-txt st-select-text st-bottom-select-text">
							전체선택 <a href="#" class="selected-delete st-selected-delete text-decoration-none"
							onclick="ckdDelete()">선택삭제</a>
						</span>
					</div>
				</div>
				<div class="border border-4">
					<div class="">
						<div class="price-area text-center py-4">
	                        <h2 class="sr-only" id="cart-total-price">장바구니 총 주문금액 정보</h2>
	                        	총 상품가격
	                        <em class="final-product-price fs-4 fw-bold">0</em>원
	                        <span class="final-sale-area">
	                        </span>
	                        <span class="symbol-plus1"><i class="bi bi-plus-circle"></i></span>
					                        총 배송비
	                        <em class="final-delivery-charge fs-4 fw-bold">0</em>원
	                        <span class="symbol-equal1"><span class="sr-only">결과는</span></span>
	                        	총 주문금액
	                        <em class="final-order-price fs-3 fw-bold" style="color:red;">0원</em>
                    	</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- order 이동버튼 -->
	<div class="my-4">
		<div class="d-flex mx-auto fs-1" style="width:316px;">
			<button class="btn btn-outline-primary border-primary o_btn me-4 fs-3" type="button" onclick="location.href='/index'">계속 쇼핑하기</button>
			<button class="btn text-light o_btn fs-3" style="background-color: rgb(61, 130, 247);" type="button" onclick="orderpage();" >구매하기</button>
		</div>
	</div>
	</form>
</body>
<script>
//세션 아이디값 받아오기
var login_id = "<%= session.getAttribute("id") %>"
	
	$(document).ready(function(){
		abc();
	});
	
	function orderpage(){
		if($('input:checkbox[class="select-chk"]').is(":checked")==true){
			
			var arry = new Array();
			$('input:checkbox[class="select-chk"]:checked').each(function(){
				arry.push($(this).attr('chknum'));
			});
			console.log(arry);
			$('.cart_no').val(arry);
			$('#form').attr("action", "cart/order");
			$('#form').submit();
		}
	}
	
	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	function selectAll(selectAll){
		const checkboxes = document.getElementsByName('item');
		checkboxes.forEach((checkbox) => {
			checkbox.checked = selectAll.checked;
	    })
	    abc();
	}
	//1개 상품 선택해제시 전체 선택 체크 해제
	$(".select-chk").click(function(){
		$(".select-chk").each(function(){
			$(".all-select-chk").prop("checked", false);
			abc();
		});
	});
	
	$(".quantity-select").on("change", function(){
		var option = $(this).attr('option_no');
		var qty = $('#qty_'+option+' option:selected').val();
		console.log("qty",qty);
		console.log("option_no",option);
		var price = $(this).attr('data-price');
		console.log("price",price);
		var item_price = qty * price;
		console.log("count",item_price);
		var aaa = numberWithCommas(item_price);
		$('#unit'+option).text(aaa);
		$('#unit111'+option).text(aaa);
		console.log("aaa",aaa);
		$("option:selected", this);
		$.ajax({
			type : "POST",
			url : "/cart/update",
			dateType : "json",
			data : {
				"cart_option_no" : option,
				"cart_sc" : qty,
				"cart_mem_id" : login_id
			},
			error : function(request, status, error) {
				alert("code:"
						+ request.status
						+ "\n"
						+ "message:"
						+ request.responseText
						+ "\n"
						+ "error:"
						+ error);
			},
			success : function(data){
				if(data == 1){
					console.log("선택 수량이 변경되었습니다.");
				}else if(data == 2){
					alert("error");
				}
			}
		});
	});
	
	function cartItemDel(option_no){
		console.log(option_no);
		$.ajax({
			type : "POST",
			url : "/cart/del",
			dataType : "json",
			data : {
				"cart_option_no" : option_no,
				"cart_mem_id" : login_id
			},
			error : function(request, status, error) {
				alert("code:"
						+ request.status
						+ "\n"
						+ "message:"
						+ request.responseText
						+ "\n"
						+ "error:"
						+ error);
			},
			success : function(data){
				if(data == 1){
					console.log("장바구니 목록에서 삭제하였습니다.");
					location.reload();
				}else if(data == 2){
					alert("error");
				}
			}
		});
	}
	
	function ckdDelete(){
		
		if($('input:checkbox[class="select-chk"]').is(":checked")==true){
			
			var arr = new Array();
			$('input:checkbox[class="select-chk"]:checked').each(function(){
				arr.push($(this).attr('value'));
			});
			console.log("선택된 상품",arr);
			
			$.ajax({
				type : "POST",
				url : "/cart/chkDel",
				dataType : "json",
				data : {
					"option_no" : arr
				},
				error : function(request, status, error) {
					alert("code:"
							+ request.status
							+ "\n"
							+ "message:"
							+ request.responseText
							+ "\n"
							+ "error:"
							+ error);
				},
				success : function(data){
					console.log(data);
					if(data == '1'){
						alert("선택하신 상품을 삭제하셨습니다.");
						location.reload();
					}else if(data != 1){
						alert("삭제에 실패하셨습니다.");
					}
				}
			});
		}else{
			alert("선택된 상품이 없습니다.");
		}
	}
	
	function abc() {
		var abc = 0;
		if($('input:checkbox[class="select-chk"]').is(":checked")== true){
			
			$('input:checkbox[class="select-chk"]:checked').each(function(){
				var sc_total = $(this).parent().parent().children();
				
				sc_total.children('.subTotal').each(function(){
					abc += parseInt($(this).text().replace(',',''));
				});
			});
				
			var subtotal = abc;
			
			$('.final-product-price').html(numberWithCommas(subtotal));
			
			console.log(subtotal);
			
		}else{
			
			$('input:checkbox[class="select-chk"]').each(function(){
				sc_total = $(this).parent().parent().children();
				sc_total.children('.subTotal').each(function(){
					abc += parseInt($(this).text().replace(',',''));
					abc = 0;
				});
				subtotal = abc;
				console.log("subtotal",subtotal);
				$('.final-product-price').html(numberWithCommas(subtotal));
			});
		}
		totalprice(subtotal);
	}
		
	function totalprice(subtotal){
		$('.final-order-price').html(numberWithCommas(subtotal)+'원');
		
		$.ajax({
			type : "POST",
			url : "/cart/final-orderOK",
			dateType : "text",
			data : {
				"subtotal" : subtotal
		}
	});
}
		
</script>
</html>