<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/resources/css/header.css">
<link rel="stylesheet" href="/resources/css/Best.css">
<link rel="stylesheet" href="/resources/css/item.css">
<link rel="stylesheet" href="/resources/css/item_detail.css">
<link rel="stylesheet" href="/resources/css/review.css">
<link rel="stylesheet" href="/resources/css/qna_list.css">
<link rel="stylesheet" href="/resources/css/qna_write.css">

</head>
<body>
	<div class="container2">
		<div class="row">
			<div class="login col-sm-12 col-md-6 max-auto0">
				<ul>
				<c:if test="${empty login_id}">
					<li><a href="/member_login">LOGIN</a></li>
				</c:if>
				<c:if test="${not empty login_id}">
					<li><a href="/member_logout">LOGOUT</a></li>
					<li><a href="/cart">CART</a></li>
					<li><a href="/mypage">MYPAGE</a></li>
				</c:if>	
					<li><a href="#">JOIN</a></li>
				</ul>
			</div>
			<div class="board col-sm-12 col-md-6 max-auto0">
				<ul>
				<c:if test="${login_rank == 1}">
					<li><a href="/ad_index">관리자폼</a>
				</c:if>
				<c:if test="${empty login_rank}">
				</c:if>
					<li><a href="faq_0">FAQ</a></li>
					<li><a href="photo">REVIEW</a></li>
					<li><a href="total_qna_list">Q&A</a></li>
					<li><a href="#">COMPANY</a></li>
				</ul>
			</div>
		</div>


		<div class="row">
			<div class="col-sm-12 col-lg-12 max-auto0">
				<div class="box-0 img-box">
					<a href="/index"><img src="/resources/images/header/logo.png"></a>
				</div>
			</div>
		</div>


		<div class="row">
			<nav class="menu-1 col-sm-12 col-md-12 col-lg-12 max-auto0">
				<ul>
					<li><a href="item?bsortation=OUTER&sortation=coat">OUTER</a></li>
					<li><a href="item?bsortation=TOP&sortation=mentomen">TOP</a></li>
					<li><a href="item?bsortation=PANTS&sortation=pants">PANTS</a></li>
					<li><a href="item?bsortation=SHOES&sortation=slippers">SHOES</a></li>
					<li><a href="item?bsortation=ACC&sortation=bag">ACC</a></li>
				</ul>
			</nav>
			<nav class="menu-2">
				<ul>
					<li><a href="item?bsortation=OUTER&sortation=coat">OUTER</a></li>
					<li><a href="item?bsortation=TOP&sortation=mentomen">TOP</a></li>
					<li><a href="item?bsortation=PANTS&sortation=pants">PANTS</a></li>
					<li><a href="item?bsortation=SHOES&sortation=slippers">SHOES</a></li>
					<li><a href="item?bsortation=ACC&sortation=bag">ACC</a></li>
				</ul>
			</nav>
		</div>
	</div>
	<!--header 끝-->