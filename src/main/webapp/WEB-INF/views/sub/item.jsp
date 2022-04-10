<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:include page="../include/header.jsp"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

		<!--navbar -->
		<div class="container">
			<div class="row">
				<div class="col-md-12 sub_menu1">${bsortation}</div>
			</div>

			<div class="sub_nav">
				<nav class="navbar sub_nav1">
				<c:if test="${bsortation eq 'TOP'}">
					<ul class="nav navbar-nav sub_nav2">
						<li><a href="item?bsortation=TOP&sortation=mentomen">맨투맨/후드</a></li>
						<li><a href="item?bsortation=TOP&sortation=knit">니트</a></li>
						<li><a href="item?bsortation=TOP&sortation=shirts">셔츠</a></li>
						<li><a href="item?bsortation=TOP&sortation=muji">무지티</a></li>
					</ul>
				</c:if>
				<c:if test="${bsortation eq 'OUTER'}">
					<ul class="nav navbar-nav sub_nav2">
						<li><a href="item?bsortation=OUTER&sortation=coat">코트</a></li>
						<li><a href="item?bsortation=OUTER&sortation=cardigan">가디건</a></li>
						<li><a href="item?bsortation=OUTER&sortation=jumper">점퍼</a></li>
						<li><a href="item?bsortation=OUTER&sortation=jacket">자켓</a></li>
					</ul>
				</c:if>
				<c:if test="${bsortation eq 'PANTS'}">
					<ul class="nav navbar-nav sub_nav2">
						<li><a href="item?bsortation=PANTS&sortation=pants">기본 바지</a></li>
						<li><a href="item?bsortation=PANTS&sortation=shorts">반바지</a></li>
						<li><a href="item?bsortation=PANTS&sortation=denim">데님</a></li>
					</ul>
				</c:if>
				<c:if test="${bsortation eq 'SHOES'}">
					<ul class="nav navbar-nav sub_nav2">
						<li><a href="item?bsortation=SHOES&sortation=slippers">슬리퍼</a></li>
						<li><a href="item?bsortation=SHOES&sortation=loafers">로퍼</a></li>
						<li><a href="item?bsortation=SHOES&sortation=sneakers">스니커즈</a></li>
					</ul>
				</c:if>
				<c:if test="${bsortation eq 'ACC'}">
					<ul class="nav navbar-nav sub_nav2">
						<li><a href="item?bsortation=ACC&sortation=bag">가방</a></li>
						<li><a href="item?bsortation=ACC&sortation=hat">모자</a></li>
					</ul>
				</c:if>
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
						<a href="/item_detail?item_no=${a.item_no}"><img src="../resources/upload${a.main_item_img}" style="height:330px; width:263px;"></a>
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