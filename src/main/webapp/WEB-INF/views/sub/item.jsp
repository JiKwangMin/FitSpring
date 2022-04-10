<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:include page="../include/header.jsp"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

		<!--navbar -->
		<div class="container">
			<div class="row">
				<div class="col-md-12 sub_menu1">TOP</div>
			</div>

			<div class="sub_nav">
				<nav class="navbar sub_nav1">
					<ul class="nav navbar-nav sub_nav2">
						<li><a href="item?sortation=mentomen">맨투맨/후드</a></li>
						<li><a href="item?sortation=knit">니트</a></li>
						<li><a href="item?sortation=shirts">셔츠</a></li>
						<li><a href="item?sortation=muji">무지티</a></li>
					</ul>
				</nav>
			</div>
		</div>
		<!-- navbar 끝-->

		
		
		<!-- 상품박스-->
		<div class="container">
			<div class="row new_item">${title}</div>
			
				<!--ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ-->
			<div class="row">
				<c:if test="${empty lilist}">
					<h2>상품 내역이 없습니다.</h2>
				</c:if>
				<c:if test="${!empty lilist}">
				<c:forEach items="${lilist}" var="a">
				<div class="col-md-3 col-sm-6 max-auto">
					<div class="box-2 img-box">
						<a href="/item_detail?item_no=${a.item_no}"><img src="../resources/upload${a.main_item_img}"></a>
						<a href="/item_detail?item_no=${a.item_no}">
							<div class="content_box">
								<div class="cont1">${a.item_name}
								<div class=cont3>₩ ${a.item_price}</div>
							</div>
						</a>
					</div>
				</div>
			</div>
				</c:forEach>
				</c:if>
				
				<!--ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ-->
			
		</div>
		<!-- 베스트 아이템 끝-->
</body>
</html>