<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Shop Homepage - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    </head>
	<style>
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
	</style>
    <body>
    	<!-- header -->
		<jsp:include page="../include/header.jsp"/>
		<!--header 끝-->
		<div class="container">
			<div class="row">
				<div class="col-2">
					<ul class="nav flex-column">
					  <li class="nav-item">
					    <a class="nav-link px-0 active" aria-current="page" href="/mypage_order">주문목록</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link px-0" href="/mypage_wish">관심상품</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link px-0" href="/mypage_info">개인정보확인/수정</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link px-0" href="/mypage_address">배송지 관리</a>
					  </li>
					</ul>
				</div>
				<div class="col-8">
					<div class="pb-5">
						<h3><span style="font-weight:bold;">주문상세</span></h3>
					</div>
					<div class="mb-4">
						<div class="d-flex flex-row">
						<c:forEach items="${list}" var="order" begin="0" end="0">
							<div style="font-weight:bold;"><fmt:formatDate value="${order.order_date}" pattern="yyyy.MM.dd"/>&nbsp;주문</div>
							<span class="px-1">•</span>
							<span>주문번호&nbsp;${order.order_no}</span>
						</c:forEach>
						</div>
						<c:forEach var="ord" items="${list}" varStatus="status">
						<div class="row border border-2 rounded-3 mt-4">
							<table>
								<colgroup>
									<col width="800">
									<col width="">
								</colgroup>
								<tbody>
									<tr>
										<td class="p-4 td_border">
											<div>
												<c:if test="${ord.order_delivery_state == 0}">
													<span style="font-weight:bold;">배송준비중</span>
												</c:if>
												<c:if test="${ord.order_delivery_state == 1}">
													<span style="font-weight:bold;">배송중</span>
												</c:if>
												<c:if test="${ord.order_delivery_state == 2}">
													<span style="font-weight:bold;">배송완료</span>
												</c:if>
												<span class="px-1">•</span>
												<span><fmt:formatDate value="${list2[status.index].order_date}" pattern="MM/dd (E)"/>&nbsp;도착</span>
											</div>
											<div>
												<div class="mt-3">
													<div class="d-flex">
														<div>
															<a target="_blank">
																<img src="../resources/upload${ord.itemInfoVO.main_item_img}" class="me-2" width="64" height="64" src="#" alt="상품 이름"/>
															</a>
														</div>
														<div class="">
															<div class="">
																<div>
																	<a class="mb-2" href="/item_detail?item_no=${ord.order_item_no}" target="_blank">
																		<span>${ord.order_item_name}</span>
																	</a>
																</div>
																<div class="d-flex justify-content-between" href="javascript:void(0);" style="width:500px;">
																	<div>
																		<div>
																			<span><fmt:formatNumber value="${ord.order_item_price}" type="number" />원</span>
																			<span class="px-1">•</span>
																			<span>${ord.order_item_qty} 개</span>
																		</div>
																	</div>
																	<div>
																		<a type="button" class="btn btn-light cart" id="cart${ord.order_item_no}" onclick="fn_cart_add(${ord.order_item_no});">장바구니 담기</a>
																		<input type="hidden" name="item_name" value="${ord.order_item_name}" />
																		<input type="hidden" name="item_price" value="${ord.order_item_price}" />
																		<input type="hidden" name="option_no" value="${ord.order_option_no}" />
																		<input type="hidden" name="option_val" value="${ord.order_option_val}" />
																		<input type="hidden" name="item_qty" value="${ord.order_item_qty}" />
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</td>
										<td>
											<div class="d-flex flex-column m-0 col-6 p-4">
												<button type="button" class="btn o_btn" style="border-color:blue; color:blue;">배송조회</button>
												<button type="button" class="btn o_btn" style="border-color:gray;" >교환,반품 신청</button>
												<button type="button" class="btn o_btn" style="border-color:gray;" >리뷰 작성하기</button>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
		<c:forEach items="${list}" var="order" begin="0" end="0">
		<div class="container mt-3">
			<div class="row justify-content-start">
				<div class="col-2">
				</div>
				
				<div class="col-8">
					<h4 class="pb-2"><span style="font-weight:bold;">받는사람 정보</span></h4>
					<table class="table">
						<caption class="captionhide">받는사람 정보</caption>
						<colgroup><col width="105"><col><col width="100"></colgroup>
						<tbody class="">
							<tr class="">
								<th class="" style="color: rgb(85, 85, 85);">받는사람</th>
								<td class="">${order.order_name}</td>
								<td class=""></td>
							</tr>
							<tr class="">
								<th class="" style="color: rgb(85, 85, 85);">연락처</th>
								<td class="">${order.order_phone}</td>
								<td class=""></td>
							</tr>
							<tr class="">
								<th class="" style="color: rgb(85, 85, 85);">받는주소</th>
								<td class="">${order.order_post}&nbsp;${order.order_addr}</td>
								<td class=""></td></tr><tr class="">
								<th class="" style="color: rgb(85, 85, 85);">배송요청사항</th>
								<td class=""><div class=""><span>${order.order_message}</span></div></td>
								<td class=""></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="row justify-content-start">
				<div class="col-2">
				</div>
				<div class="col-8">
					<h4 class="pb-2"><span style="font-weight:bold;">결제정보</span></h4>
					<table class="table">
						<caption class="captionhide">결제 정보</caption>
						<colgroup><col><col width="340"></colgroup>
						<tbody class="">
							<tr class="">
								<th class="">결제수단</th>
								<th rowspan="2" class="info">
									<div class="d-flex justify-content-between">
										<div class="">총 상품가격</div>
										<div class="sc-1w2sdij-5 kTDTkp">
											<strong><fmt:formatNumber type="number">${order.order_subtotal_price}</fmt:formatNumber> 원</strong>
										</div>
									</div>
									<div class="d-flex justify-content-between">
										<div class="sc-1w2sdij-4 jLknds">배송비</div>
										<div class="">
											<span>0 원</span>
										</div>
									</div>
									<div class="d-flex justify-content-between">
										<div class="sc-1w2sdij-4 jLknds">포인트</div>
											<div class="">
												<span><fmt:formatNumber type="number">${order.order_use_point}</fmt:formatNumber> 원</span>
											</div>
									</div>
									<c:if test="${empty order.order_use_cpn}" >
									<div class="d-flex justify-content-between">
										<div class="">할인 쿠폰</div>
										<div class="">
											<span>(<fmt:formatNumber value="${order.order_use_cpn}" type="percent"/>),${order.order_subtotal_price*(order.order_use_cpn*0.01)} 원</span>
										</div>
									</div>
									</c:if>
								</th>
							</tr>
							<tr class="">
								<th class="">
									<c:if test="${order.order_paytype == 'point'}">
										<div class="" style="color: rgb(17, 17, 17);">카카오페이 Point 결제</div>
									</c:if>
									<c:if test="${order.order_paytype == 'card'}">
										<div class="" style="color: rgb(17, 17, 17);">CARD 결제</div>
									</c:if>
								</th>
							</tr>
						</tbody>
						<tbody class="">
							<tr class="">
								<td class="">
									<div>
										<span class=" ">포인트 적립예정  : </span>
										<strong class=""><fmt:parseNumber var="test" value="${order.order_total_price*0.01}" integerOnly="true"/>${test}원</strong>
									</div>
								</td>
								<td class="info">
									<div class="d-flex justify-content-between">
										<div class="" style="color: rgb(17, 17, 17);"><strong>총 결제금액 </strong></div>
										<div class="">
											<strong><fmt:formatNumber value="${order.order_total_price}" type="number"/> 원</strong>
										</div>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="row justify-content-start">
				<div class="col-2"></div>
				<div class="col-8 mt-2 mb-5 d-flex justify-content-between">
					<div>
						<button type="button" class="btn" style="border-color:blue; color:blue;" onclick="history.back();"><i class="bi bi-chevron-left"></i>주문목록 돌아가기</button>
					</div>
					<div>
						<button type="button" class="btn" style="border-color:blue; color:blue;" onclick="order_del(${order.order_no})">주문내역 삭제</button>
					</div>
				</div>
			</div>
		</div>
		</c:forEach>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="../../js/scripts.js"></script>
    </body>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script>
	//세션 아이디값 받아오기
	var login_id = "<%= session.getAttribute("id") %>"
		//주문내역 삭제
		function order_del(x){
			var order_no = x;
			console.log("주문번호",order_no);
			if(confirm("정말 삭제하시겠습니까? 삭제하면 복구할 수 없습니다.") == true){
				$.ajax({
					url : "/mypage_order/delete",
					type : "POST",
					data : {
						"order_no" : order_no
					},
					dataType : "json",
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
						if(data == 1){
							alert("삭제되었습니다.");
							location.href="/mypage_order";
						}else{
							alert("error");
						}
					}
				});
			}
		}
		//장바구니 담기
		function fn_cart_add(x){
			var item_no = x;
			var a = $("#cart"+item_no).parent();
			var item_name = a.children('input[name="item_name"]').val();
			var item_price = a.children('input[name="item_price"]').val();
			var option_no = a.children('input[name="option_no"]').val();
			var option_val = a.children('input[name="option_val"]').val();
			var item_qty = a.children('input[name="item_qty"]').val();
			if(login_id != "null"){
				var arr = new Array();
				arr.push(option_no);
				var arr2 = new Array();
				arr2.push(option_val);
				var arr3 = new Array();
				arr3.push(item_qty);
				console.log("arr",arr);
				console.log("arr2",arr2);
				$.ajax({
					type : "POST",
					url : "/cart/add",
					traditional : true,
					dataType : "json",
					data : {
						'cart_item_no' : item_no,
						'cart_item_name' : item_name,
						'cart_item_price' : item_price,
						'cart_option_no' : arr, 
						'cart_option_val' : arr2,
						'cart_sc' : arr3
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
						if(data == 1){
							alert("장바구니에 상품을 담으셨습니다.");
						}else if(data != 1){
							alert("이미 추가 된 상품입니다.");
						}
					}
				});
			}else{
				if(confirm("로그인 후 이용 가능합니다.\n로그인페이지로 이동하시겠습니까?") == true){
					location.href="/member_login";
				}
			}
		}
    </script>
</html>