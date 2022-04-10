<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<title>Admin</title>
<style>
	body { font-family:'맑은 고딕', verdana; padding:0; margin:0; }
	ul { padding:0; margin:0; list-style:none;  }
 
	div#root { width:90%; margin:0 auto; }
	
	header#header { font-size:60px; padding:20px 0; }
	header#header h1 a { color:#000; font-weight:bold; }
	
	nav#nav { padding:10px; text-align:right; }
	nav#nav ul li { display:inline-block; margin-left:10px; }
 
 		section#container { padding:20px 0; border-top:2px solid #eee; border-bottom:2px solid #eee; }
	section#container::after { content:""; display:block; clear:both; }
	aside { float:left; width:200px; }
	div#container_box { float:right; width:calc(100% - 200px - 20px); }
	
	aside ul li { text-align:center; margin-bottom:10px; }
	aside ul li a { display:block; width:100%; padding:10px 0;}
	aside ul li a:hover { background:#eee; }
	
	footer#footer { background:#f9f9f9; padding:20px; }
	footer#footer ul li { display:inline-block; margin-right:10px; } 
	.bluetop {
	  border-collapse: collapse;
	  border-top: 3px solid #168;
	}  
	.bluetop th {
	  color: #168;
	  background: #f0f6f9;
	}
	.bluetop th, .bluetop td {
	  padding: 10px;
	  border: 1px solid #ddd;
	}
	.bluetop th:first-child, .bluetop td:first-child {
	  border-left: 0;
	}
	.bluetop th:last-child, .bluetop td:last-child {
	  border-right: 0;
	}
	th, td {
	  text-align: center;
	}
</style>
		 
</head>
<body>
<div id="root">
	<header id="header">
		<div id="header_box">
			<h1 class="title">
				<a href="/ad_index">FipSpring Admin</a>
			</h1>
		</div>
	</header>
	
	<nav id="nav">
		<div id="nav_box">
			<ul>
				<li>
					<a href="/index">일반 화면</a>	
				</li>
				<li>
					<a href="member_logout">로그아웃</a>
				</li>
			</ul>
		</div>
	</nav>

	
	<section id="container">
		<aside>
			<ul>
				<li><a href="/ItemCreate">상품 등록</a></li>
				<li><a href="/ItemList">상품 목록</a></li>
				<li><a href="/OrderList">주문 목록</a></li>
			</ul>
		</aside>
		<div id="container_box">
			<div class="pb-5 d-flex align-items-end">
				<h3><span style="font-weight:bold;">주문상세</span></h3>
			</div>
			<c:forEach items="${list}" var="order" begin="0" end="0">
			<div class="fs-5">
				<span class="fw-bold">주문번호&nbsp;${order.order_no}&nbsp;|</span>
				<span class="fw-bold">주문날짜&nbsp;<fmt:formatDate value="${order.order_date}" pattern="yyyy.MM.dd"/><br/><br/></span>
			</div>
			</c:forEach>
			<div>
				<c:if test="${!empty list}" >
				<table class="bluetop" style="width:100%">
					<thead>
						<tr>
							<th>상품이미지</th>
							<th>상품이름</th>
							<th>상품옵션</th>
							<th>상품가격</th>
							<th>상품수량</th>
							<th>total</th>
							<th>배송비</th>
							<th>사용포인트</th>
							<th>쿠폰</th>
							<th>주문금액</th>
							<th>결제타입</th>
							<th>주문상태</th>
						</tr>
					</thead>
					<c:forEach items="${list}" var="order">
					<tbody>
							<td>
								<img src="../resources/upload${order.itemInfoVO.main_item_img}" class="me-2" width="64" height="64" src="#" alt="상품 이름"/>
							</td>
							<td>${order.order_item_name}</td>
							<td>${order.order_option_val}</td>
							<td>${order.order_item_price}</td>
							<td>${order.order_item_qty}</td>
							<td>
								<fmt:formatNumber type="number">
									${order.order_item_price * order.order_item_qty}
								</fmt:formatNumber>원
							</td>
							<td>${order.order_delivery_charge}원</td>
							<td>${order.order_use_point}P</td>
							<td>${order.order_use_cpn}</td>
							<td>
								<fmt:formatNumber type="number">
									${order.order_total_price}
								</fmt:formatNumber>원
							</td>
							<td>
								<c:if test="${order.order_paytype == 'point'}">
									카카오페이 포인트
								</c:if>
								<c:if test="${order.order_paytype == 'card'}">
									카드결제
								</c:if>
							</td>
							<td>
								<select name="ordstate" id="ordstate" onchange="stateEdit('${order.order_no}','${order.order_option_no}', this.value)">
									<option value="0"<c:if test="${order.order_state eq 0}">selected</c:if>>결제완료</option>
									<option value="1"<c:if test="${order.order_state eq 1}">selected</c:if>>취소요청</option>
									<option value="2"<c:if test="${order.order_state eq 2}">selected</c:if>>취소완료</option>
								</select>
							</td>
					</tbody>
					</c:forEach>
				</table>
				<br/>
				<div>
					<div><span class="fs-4 fw-bold">구매자 정보</span></div>
					<div>
						<table class="bluetop" style="width:100%">
							<thead>
								<th>회원아이디</th>
								<th>받는분 이름</th>
								<th>받는분 연락처</th>
								<th>받는분 주소</th>
								<th>받는분 요청사항</th>
							</thead>
							<c:forEach items="${list}" var="order" begin="0" end="0">
							<tbody>
								<td>${order.order_mem_id}</td>
								<td>${order.order_name}</td>
								<td>${order.order_phone}</td>
								<td>${order.order_post}&nbsp;${order.order_addr}</td>
								<td>${order.order_message}</td>
							</tbody>
							</c:forEach>
						</table>
					</div>
				</div>
				</c:if>
				<c:if test="${empty list}" >
					<h1>주문목록이 없습니다.</h1>
				</c:if>
			</div>
		</div>
	</section>
</div>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	function stateEdit(no, x, val){
		var order_no = no;
		var order_option_no = x;
		var order_state = val;
		$.ajax({
			type : 'post',
			url : '/OrderList/stateUpdate',
			data : {
				"order_no" : order_no,
				"order_option_no" : order_option_no,
				"order_state" : order_state
			},
			dataType : 'json',
			success : function(data) {
				console.log(data);
				if (data == 'success') {
					alert("배송상태가 변경되었습니다.");
				}else {
					alert("배송상태 변경이 실패했습니다.");
				}
			}
		});
	}
	function deliveryEdit(no, val) {//배송 상태 변경
		var order_no = no;
		var state = val;
		//ajax로 처리
		$.ajax({
			type : 'post',
			url : '/OrderList/DeliveryEdit',
			data : {
				"order_no" : order_no,
				"order_delivery_state" : state
			},
			dataType : 'json',
			success : function(data) {
				console.log(data);
				if (data == 'success') {
					alert("배송상태가 변경되었습니다.");
				}else {
					alert("배송상태 변경이 실패했습니다.");
				}
			}
		});
	}
</script>
</html>