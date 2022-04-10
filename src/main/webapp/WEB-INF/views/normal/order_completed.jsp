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
<div class="container">
	<div class="d-flex justify-content-between align-items-center border-bottom border-4 border-dark mb-5">
		<div class="">
			<h3 class="fs-1 fw-bold">주문완료</h3>
		</div>
		<div class="">
			<span class="fw-bold" style="color:#BDBDBD;">
				장바구니&gt;주문결제 &gt;<em class="text-primary">주문완료</em>
			</span>
		</div>
	</div>
	<!-- 일반결제 성공 -->
	<div class="text-center lh-lg" style="padding:100px;">
		<div class="fs-1 fw-bold">
			<span>주문이 완료되었습니다.</span>
		</div>
	</div>
	<!-- 무통장입금 -->
	<c:if test="${vo.order_paytype == vbank}">
	<div class="text-center py-5 border-bottom">
		<div class="fs-1 fw-bold">
			<span class="text-danger">상품이 품절될 수 있습니다.</span>
		</div>
		<div class="fs-1 fw-bold pb-5">
			<span>입금을 서둘러 주세요!</span>
		</div>
		<!-- 무통장 계좌번호 출력 -->
		<div class="fs-3 mx-auto border py-5" style="width:450px;">
			<div class="">
				{xx은행}
				<span class="fw-bold">{계좌번호}</span>
			</div>
			<div class="py-4">
				<span>{order 총 결제금액}</span>원
			</div>
			<div class="fs-4">
				<span class="text-danger">내일(3/28) 00:00</span>분 까지 미입금 시 취소
			</div>
		</div>
	</div>
	</c:if>
	<!-- 주문완료 테이블 -->
	<div class="py-4 border border-end-0 border-start-0">
		<table style="width:100%;">
			<tbody>
				<tr>
					<td style="padding:20px; border-right:1px solid #dee2e6; width:50%;">
						<div class="fs-2 fw-bold">받는사람 정보</div>
						<table>
							<colgroup>
								<col width="50%">
								<col width="50%">
							</colgroup>
							<tbody>
								<tr class="lh-lg">
									<td>받는사람</td>
									<td>${vo.order_name} / ${vo.order_phone}</td>
									<td></td>
								</tr>
								<tr>
									<td>받는주소</td>
									<td>${vo.order_post} ${vo.order_addr}</td>
									<td></td>
								</tr>
								<tr class="lh-lg">
									<td>배송요청사항</td>
									<td>${vo.order_message}</td>
								</tr>
							</tbody>
						</table>
					</td>
					<td style="padding:20px;">
						<div class="fs-2 fw-bold mb-3">결제 정보</div>
						<table style="width:100%;">
							<colgroup>
									<col width="100"></col>
									<col></col>
							</colgroup>
							<tbody class="border-bottom">
								<tr>
									<td style="height:40px;">주문금액</td>
									<td class="text-end"><fmt:formatNumber value="${vo.order_subtotal_price}" type="number"/>&nbsp;원</td>
								</tr>
							</tbody>
							<tfoot>
								<tr>
									<th class="fs-4" style="height:80px;">총 결제금액</th>
									<td class="text-end">
										<span class="fw-bold">
											<c:if test="${vo.order_paytype == 'point'}">
												카카오페이 포인트
											</c:if>
											<c:if test="${vo.order_paytype == 'card'}">
												카드결제
											</c:if>
										</span>
										<span><fmt:formatNumber value="${vo.order_total_price}" type="number"/></span>
										<span>원</span>
									</td>
								</tr>
							</tfoot>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<!-- order_detail 이동버튼 -->
	<div class="my-4">
		<div class="mx-auto" style="width:240px;">
			<button class="btn btn-outline-primary border-primary" type="button" onclick="detail()">주문 상세보기</button>
			<button class="btn text-light" style="background-color: rgb(61, 130, 247);" type="button" onclick="location.href='/index'">쇼핑 계속하기</button>
		</div>
	</div>
</div>

</body>
<script>
	var order_no = ${vo.order_no};
	function detail(){
		location.href="/mypage_order/"+order_no;
	}
</script>
</html>