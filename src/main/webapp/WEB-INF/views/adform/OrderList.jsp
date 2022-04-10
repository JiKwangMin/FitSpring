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
				<h3><span style="font-weight:bold;">주문목록</span></h3>
				<span class="ms-3"> 총<span> ${cnt}</span>개</span>
			</div>
			<div class="mb-4">
				<c:if test="${!empty list}" >
				<table class="bluetop">
					<thead>
						<tr>
							<th>주문번호</th>
							<th>결제타입</th>
							<th>주문날짜</th>
							<th>받는분 이름</th>
							<th>받는분 연락처</th>
							<th>사용 포인트</th>
							<th>주문금액</th>
							<th>주문상태</th>
							<th>배송상태</th>
							<th>상세조회</th>
						</tr>
					</thead>
					<c:forEach items="${list}" var="order">
					<tbody>
							<td>${order.order_no}</td>
							<td>${order.order_paytype}</td>
							<td>
								<fmt:formatDate value="${order.order_date}" pattern="yyyy-MM-dd" />
							</td>
							<td>${order.order_name}</td>
							<td>${order.order_phone}</td>
							<td>${order.order_use_point}</td>
							<td>
								<fmt:formatNumber type="number">
									${order.order_subtotal_price}
								</fmt:formatNumber>원
							</td>
							<td>
								${order.order_state}
							</td>
							<td>
								<select name="delivery" id="delivery" onchange="deliveryEdit('${order.order_no}', this.value)">
									<option value="0"<c:if test="${order.order_delivery_state eq 0}">selected</c:if>>배송준비중</option>
									<option value="1"<c:if test="${order.order_delivery_state eq 1}">selected</c:if>>배송중</option>
									<option value="2"<c:if test="${order.order_delivery_state eq 2}">selected</c:if>>배송완료</option>
								</select>
							</td>
							<td><button class="btn btn-light border-dark" type="button" onclick="detail(${order.order_no})">조회</button></td>
					</tbody>
					</c:forEach>
				</table>
				</c:if>
				<c:if test="${empty list}" >
					<h1>주문목록이 없습니다.</h1>
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
				<form id="actionForm" action="/OrderList" method="get">
					<input type="hidden" name="pageNum"	value="${pageMaker.page.pageNum}"> 
					<input type="hidden" name="amount" value="${pageMaker.page.amount}"> 
				</form>
			</div>
		</div>
	</section>
</div>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	function detail(x){
		var order_no = x;
		location.href="/OrderList/"+order_no;
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