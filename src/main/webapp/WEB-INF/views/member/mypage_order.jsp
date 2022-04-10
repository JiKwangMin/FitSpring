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
						<h3><span style="font-weight:bold;">주문목록</span></h3>
					</div>
					<c:if test="${!empty orders}">
					<c:forEach items="${orders}" var="order">
					<div class="mb-4 border" style="padding:30px;width:840px;border-radius: 10px;">
						<div class="d-flex justify-content-between">
							<div class="fs-2" style="font-weight:bold;"><fmt:formatDate value="${order.order_date}" pattern="yyyy-MM-dd"/>&nbsp;주문</div>
							<div class="float-end"><a href="/mypage_order/${order.order_no}" style="text-decoration:none;">주문 상세보기</a></div>
						</div>
						<c:forEach var="ord" items="${list}" varStatus="status">
						<c:if test="${ord.order_date eq order.order_date }">	
						<div class="row border border-2 rounded-3 mt-4">
							<table>
								<colgroup>
									<col width="800">
									<col width="">
								</colgroup>
								<tbody>
									<tr>
										<td class="p-4 td_border">
											<div class="fs-3">
												<c:choose>
												<c:when test="${ord.order_state == 0}">
													<c:if test="${ord.order_delivery_state == 0}">
														<span style="font-weight:bold;">배송준비중</span>
													</c:if>
													<c:if test="${ord.order_delivery_state == 1}">
														<span style="font-weight:bold;">배송중</span>
													</c:if>
													<c:if test="${ord.order_delivery_state == 2}">
														<span style="font-weight:bold;">배송완료</span>
													</c:if>
												</c:when>
												<c:when test="${ord.order_state != 0}">
													<c:if test="${ord.order_state == 1}">
														<span style="font-weight:bold;">취소요청</span>
													</c:if>
													<c:if test="${ord.order_state == 2}">
														<span style="font-weight:bold;">취소완료</span>
													</c:if>
												</c:when>
												</c:choose>
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
																<div>
																<div class="d-flex justify-content-between" href="javascript:void(0);" style="width:500px;">
																	<div>
																		<div>
																			<span>${ord.order_item_price}원</span>
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
												<button type="button" class="btn o_btn" style="border-color:blue;">배송조회</button>
												<button type="button" class="btn o_btn" style="border-color:gray;" onclick="fn_cancel_req('${ord.order_no}','${ord.order_option_no}');">취소 신청</button>
												<button type="button" class="btn o_btn" style="border-color:gray;" >리뷰 작성하기</button>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						</c:if>
						</c:forEach>
					</div>
					</c:forEach>
					</c:if>
					<c:if test="${empty orders}">
					<div>
						<div class="text-center fw-bold fs-1">
						주문 내역이 없습니다.
						</div>
					</div>
					</c:if>
				</div>
				<div class="text-center">
					<nav aria-label="...">
						<ul class="pagination justify-content-center">
							<c:if test="${pageMaker.prev}">
								<li class="page-item"><a class="page-link"
									href="${pageMaker.startPage -1}">Prev</a></li>
							</c:if>
							<c:forEach begin="${pageMaker.startPage}"
								end="${pageMaker.endPage}" var="p">
								<c:choose>
									<c:when test="${pageMaker.page.pageNum == p}">
										<li class="page-item active" aria-current="page"><a
											class="page-link" href="${p}">${p}</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item" aria-current="page"><a
											class="page-link" href="${p}">${p}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:if test="${pageMaker.next}">
								<li class="page-item"><a class="page-link"
									href="${pageMaker.endPage +1}">Next</a></li>
							</c:if>
						</ul>
					</nav>
					<form id="actionForm" action="/mypage_order" method="get">
						<input type="hidden" name="pageNum"	value="${pageMaker.page.pageNum}"> 
						<input type="hidden" name="amount" value="${pageMaker.page.amount}"> 
					</form>
				</div>
			</div>
		</div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
    </body>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script>
  	//세션 아이디값 받아오기
	var login_id = "<%= session.getAttribute("id") %>"
		
		//취소요청
		function fn_cancel_req(x,y){	
			var order_no = parseInt(x);
			var order_option_no = parseInt(y);
			var order_mem_id = login_id;
			var pageNum = $('input:hidden[name="pageNum"]').val();
			var amount = $('input:hidden[name="amount"]').val();
			console.log(order_no);
			console.log(order_option_no);
			if(confirm("주문을 취소하시겠습니까?")==true){
				$.ajax({
					url : "/mypage_order/cancel",
					type : 'post',
					data : {
						"order_no" : order_no,
						"order_mem_id" : order_mem_id,
						"order_option_no" : order_option_no
					},
					dataType : 'json',
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
							alert("취소 요청을 하였습니다.");
							location.href="/mypage_order?pageNum="+pageNum+"&amount="+amount;
						}else if(data != 1){
							alert("취소 요청에 실패하였습니다.\n관리자에게 문의해주세요!");
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
		
		var actionForm = $("#actionForm");
	
		$(".page-item a").on("click", function(e) {
			e.preventDefault(); //전송을 막음
			console.log('click');
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		})
	
		$("#amount").on("change", function(e) {
			$("input[name='amount']").val($("option:selected").val());
			actionForm.submit();
		})
    </script>
</html>