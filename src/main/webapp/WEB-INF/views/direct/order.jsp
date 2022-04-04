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
			<h3 class="fs-1 fw-bold">주문/결제</h3>
		</div>
		<div class="">
			<span class="fw-bold" style="color:#BDBDBD;">
	                <em class="text-primary">주문결제 &gt;</em>주문완료
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
					<td>{member_name}</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>{member_email}</td>
				</tr>
				<tr>
					<th>휴대폰 번호</th>
					<td>{member_phone}</td>
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
						<td>{받는사람이름} <span class="border rounded-pill border-primary px-2">기본배송지</span></td>
					</tr>
					<tr>
						<th>배송주소</th>
						<td>{배송지주소}</td>
					</tr>
					<tr>
						<th>연락처</th>
						<td>{받는사람번호}</td>
					</tr>
					<tr>
						<th style="vertical-align:middle;">배송 요청사항</th>
						<td><input type="text" value="{요청사항}" /></td>
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
					<tr>
						<td>{상품이름}</td>
						<td>{item_option}/ 수량 {?}개</td>
					</tr>
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
						<td>{total}</td>
					</tr>
					<tr class="align-middle">
						<th style="vertical-align:middle;">적립금 사용</th>
						<td class="p-0">
							<div class="py-3 px-3">
								<strong><span>{할인적용포인트}</span><span>원</span></strong>
								<span>
									<span>보유 : </span>
									<strong>{member_point}</strong>
									<span>원</span>
								</span>
								<button type="button" class="btn btn-light d-inline py-1 px-1 border">적립금 입력</button>
							</div>
							<div class="point-insert py-2" style="display:block; padding-left:128px; background-color:#F2F2F2;">
								<div class="pb-2">
									<input type="text" value placeholder="0" title="사용할 포인트" size="8">
									<span>원</span>
									<span>|</span>
									<input id="pointAll" type="checkbox" value>
									<label for="pointAll">모두사용</label>
								</div>
								<div>
									<button type="button" class="btn btn-outline-primary d-inline py-1 px-1 border border-primary">적립금적용</button>
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
										<span>{총금액 - 할인적용적립금}</span>
										<span>원</span>
									</strong>
								</div>
								<div>
									<span>적립금 예정 <span>{총결제금액/100}</span>원</span>
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
										<li class="payVbank">
											<input type="radio" name="payType" id="payType02" value="Vbank" />
											<label for="payType02" >
												<span>무통장입금(가상계좌)</span>
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

</body>
</html>