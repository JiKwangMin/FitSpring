<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:include page="../include/header.jsp" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="container">
	<div class="row">
		<!-- 이미지 슬라이드 -->
		<div class="col-sm-6 box col-md-5" id="main_slide"
			style="margin-top: 65px">
			<div class="box-4 img-box">
				<div style="margin: 10px 0px;">
					<div id="carousel-example-generic" class="carousel slide">
						<ol class="carousel-indicators">
							<li data-target="#carousel-example-generic" data-slide-to="0"
								class="active"></li>
							<li data-target="#carousel-example-generic" data-slide-to="1"></li>
						</ol>
						<div class="carousel-inner" role="listbox">
						<c:forEach items="${mainlist}" var="a" begin="0" end="0">
							<div class="item active">
								<a href="#"><img src="../resources/upload${a.main_item_img}"
									style="width: 100%"></a>
							</div>
						</c:forEach>
						<c:forEach items="${mainlist}" var="a" begin="1">
							<div class="item">
								<a href="#"><img src="../resources/upload${a.main_item_img}"
									style="width: 100%"></a>
							</div>
						</c:forEach>	
						</div>
						<a class="left carousel-control" href="#carousel-example-generic"
							role="button" data-slide="prev"> <span
							class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						</a> <a class="right carousel-control"
							href="#carousel-example-generic" role="button" data-slide="next">
							<span class="glyphicon glyphicon-chevron-right"
							aria-hidden="true"></span>
						</a>
					</div>
				</div>
			</div>
		</div>
		<!-- 이미지 슬라이드 끝 -->
		
		<!-- 주문정보 -->
		<div class="col-sm-6 col-md-7 box" style="margin-top: 65px">
			<div class="box">
				<form>
				<div class="product_detail">
					<div class="sales_info">
						<div class="info_area">
							<div class="info_title">
								<h2>${ii.item_name}</h2>
							</div>
							<div class="info_detail">
								<table class="p-detail">
									<tr>
										<th>판매가</th>
										<td>${ii.item_price}원</td>
									</tr>
									<tr>
										<th>적립금</th>
										<td>${point}원 (1%)</td>
									</tr>
								</table>
							</div>
							<div class="info_select">
								<table class="p-detail">
									<tr>
										<th>색상/사이즈</th>
										<td><select>
												<option value="*">- [필수] 옵션선택 -</option>
												<option value="**">-------------------</option>
												<c:forEach items="${optionlist}" var="c">
												<option value="${c.option_val1}">${c.option_val1}(${c.option_val2 - c.selcount}개)</option>
												</c:forEach>
										</select></td>
									</tr>
								</table>
							</div>
							<div style="padding: 10px;"></div>
							<div id="total_product">
								<table class="p-detail" border="1">
									<colgroup>
										<col style="width: 40%">
										<col style="width: 25%">
										<col style="width: 35%">
									</colgroup>
									<thead>
										<tr>
											<th>색상/사이즈</th>
											<th>상품수</th>
											<th>가격</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th>차콜M</th>
											<th><input type="number" name="number" value="1" min="1"step="1" style="text-align: center;width: 50px;" ></th>
											<th>106,000원</th>
										</tr>
									</tbody>
								</table>
							</div>
							<div id="total_price">
								<strong>TOTAL</strong> : <span class="total"><strong><em>106,000원</em></strong>
									(2개)</span>
							</div>
							<div class="base-button action-button">
								<div class="ac-buy wrap">
									<a class="df-btn buy"><span>바로구매</span></a>
								</div>
								<div class="ac-basket wrap">
									<a class="df-btn basket"><span>장바구니</span></a>
								</div>
								<div class="ac-wishlist wrap">
									<a class="df-btn wishlist"><span>관심상품</span></a>
								</div>
							</div>
						</div>
					</div>
				</div>
				</form>
			</div>
		</div>
		<!-- 주문정보 끝 -->	
	</div>
	<c:forEach items="${sublist}" var="b">
	<div class="row d-max-auto">
		<img src="../resources/upload${b.sub_item_img}"
			class="img-responsive center-block">
	</div>
	</c:forEach>
</div>

<!-- review -->
<br>
<div class="container">

	<div class="d-max-auto">
		<div class="review-box r-img-box">
			<img src="./resources/images/review/reviewevent.png">
		</div>
	</div>

	<div class="row">
		<div class="col-md-2 col-sm-12 d-max-auto"
			style="background: #f3f3f3; font-weight: bold;">
			<div style="text-align: center;">
				적립금<br>지급조건
			</div>
		</div>
		<div class="col-md-4 col-sm-12">
			<div>
				ㆍ제품수령 후 <strong>60일 안에 리뷰를 등록</strong><br> ㆍ착용사진은 포토리뷰 게시판에 기재<br>
				ㆍ리뷰작성시 <strong>10자이상</strong> 포토리뷰시 <strong>30자이상</strong> 기재<br>
				ㆍ포토후기의 경우, 착용사진이 아닌 <strong>제품사진만 등록하는 경우 500원</strong> 지급<br>
				ㆍ적립금은 구매후기, 포토후기 중 한번의 적립금만 지급 <strong>[중복지급불가]</strong><br>
				ㆍ상품구매/포토후기 적립금은 <strong>매주 금요일에 적립</strong> <br> <br>
			</div>
		</div>
		<div class="col-md-2 col-sm-12 d-max-auto"
			style="background: #f3f3f3; font-weight: bold;">
			<div style="text-align: center;">
				적립금<br>미지급
			</div>
		</div>
		<div class="col-md-4 col-sm-12">
			<div>
				ㆍ양식대로 작성하지 않은 경우<br> ㆍ후기가 너무 짧고 성의가 없는 경우<br>
				&nbsp;&nbsp;&nbsp;(제품소감이 10자이하로 짧은 경우)<br> ㆍ상품을 구매하고 60일 이상이 지난
				경우<br> ㆍ타사이트에서 구매하신 경우나, 비회원으로 구매하신 경우<br> ㆍ구매후기를 올리신 후
				반품을 하신 경우<br> ㆍ세일 상품을 구매하신 경우
			</div>
		</div>
	</div>

	<br><br>
	
	
		
																<!-- 루프 -->
</div>

<br><br><br><br><br><br>

</body>
</html>
