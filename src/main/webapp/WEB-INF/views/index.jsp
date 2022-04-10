<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="./resources/css/index.css">
<link rel="stylesheet" href="./resources/css/header.css">
</head>
<body>
	<!-- header -->
	<jsp:include page="./include/header.jsp"/>
	<!--header 끝-->

	<!-- 이미지 슬라이드 -->
	<div class="container-fluid">
		<div class="row" id="main_slide">
			<div style="margin: 10px 0px;">
				<div id="carousel-example-generic" class="carousel slide">
					<ol class="carousel-indicators">
						<li data-target="#carousel-example-generic" data-slide-to="0"
							class="active"></li>
						<li data-target="#carousel-example-generic" data-slide-to="1"></li>
						<li data-target="#carousel-example-generic" data-slide-to="2"></li>

					</ol>
					<div class="carousel-inner" role="listbox">
					<c:if test="${!empty balist}">
					<c:forEach items="${balist}" var="a" begin="0" end="0">
						<div class="item active">
							<a href="/item_detail?item_no=${a.item_no}">
								<img src="../resources/upload${a.banner_item_img}" style="width: 80vw; height:60vh;">
							</a>
						</div>
					</c:forEach>
					<c:forEach items="${balist}" var="a" begin="1" end="2">
						<div class="item">
							<a href="/item_detail?item_no=${a.item_no}">
								<img src="../resources/upload${a.banner_item_img}" style="width: 80vw; height:60vh;">
							</a>
						</div>
					</c:forEach>
					</c:if>
					</div>
					<a class="left carousel-control" href="#carousel-example-generic"
						role="button" data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					</a> <a class="right carousel-control" href="#carousel-example-generic"
						role="button" data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					</a>
				</div>
			</div>
			<script>
				$(function() {
					$('#carousel-example-generic').carousel({
						interval : 2000,
						pause : "hover",
						wrap : true,
						keyboard : true
					});
				});
			</script>
		</div>
	</div>
	<!-- 이미지 슬라이드 끝 -->

	<div class="container-fluid">
		<!-- 베스트 아이템 -->
		<div class="container">
			<div class="row best_item">
				- BEST ITEM -
			</div>
			<div class="row">
			<c:if test="${!empty bestMainlist}">
			<c:forEach items="${bestMainlist}" var="d">
				<div class="col-md-3 col-sm-6 max-auto">
					<div class="box-1 img-box">
						<a href="/item_detail?item_no=${d.item_no}">
							<img src="../resources/upload${d.main_item_img}" style="height:330px; width:263px;">
						</a>
					</div>
				</div>
			</c:forEach>
			</c:if>
			</div>
		</div>
		<!-- 베스트 아이템 끝-->

		<!-- 뉴아이템 -->
		<div class="container1">
			<div class="row new_item">- NEW ITEM -</div>
			<div class="row">
				<!--ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ-->
			<c:if test="${!empty newMainlist}">
			<c:forEach items="${newMainlist}" var="e">
				<div class="col-md-3 col-sm-6 max-auto">
					<div class="box-2 img-box">
						<a href="/item_detail?item_no=${e.item_no}"><img src="../resources/upload${e.main_item_img}" style="height:330px; width:282px;"></a> 
						<a href="/item_detail?item_no=${e.item_no}"><div class="content_box">
								<div class="cont1">${e.item_name}</div>
								<div class=cont3>₩ ${e.item_price}</div>
							</div></a>
					</div>
				</div>
			</c:forEach>
			</c:if>
				<!--ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ-->
			</div>
		</div>
		<!-- 뉴 아이템 끝 -->
	</div>
</body>
</html>