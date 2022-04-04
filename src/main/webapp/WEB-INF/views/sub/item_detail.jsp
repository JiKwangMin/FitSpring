<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:include page="../include/header.jsp" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
								<a href="#"><img src="../resources/upload${a.main_item_img}" style="width: 100%"></a>
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
										<td id="price" style="font-weigth:200px; font-size: 24px; line-height:24px;">
											<fmt:formatNumber value="${ii.item_price}" pattern="#,###" />원
										</td>
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
										<td><select name="SizeList" id="SizeList">
												<option value="">- [필수] 옵션선택 -</option>
												<option value="">-------------------</option>
												<c:forEach items="${optionlist}" var="c">
													<option value="${c.option_val1}" data_option_no="${c.option_item_no}">${c.option_val1}(${c.option_val2 - c.selcount}개)</option>
												</c:forEach>
										</select></td>
									</tr>
								</table>
							</div>
							<div style="padding: 10px;"></div>
							<div id="total_product">
								<table id="dynamicTable" class="p-detail" border="1">
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
									<tbody></tbody>
								</table>
							</div>
							<div id="total_price">
								<strong>TOTAL</strong> : <span class="total-value" id="cart-total">0</span>
							</div>
							<div class="base-button action-button">
								<div class="ac-buy wrap">
									<a class="df-btn buy"><span>바로구매</span></a>
								</div>
								<div class="ac-basket wrap">
									<a class="df-btn basket" id="cart_add"><span>장바구니</span></a>
								</div>
								<c:if test="${!empty id}">
									<div class="ac-wishlist wrap">
										<c:if test="${wish_check == 0}">
											<a class="df-btn wishlist" id="like_item_add"><span><i class="bi bi-suit-heart"></i>관심상품</span></a>
										</c:if>
										<c:if test="${wish_check == 1}">
											<a class="df-btn wishlist" id="like_item_del"><span><i class="bi bi-suit-heart-fill" style="color:red;"></i>관심상품</span></a>
										</c:if>
									</div>
								</c:if>
								<c:if test="${empty id}">
									<div class="ac-wishlist wrap">
										<a class="df-btn wishlist" id="like_item_add"><span><i class="bi bi-suit-heart"></i>관심상품</span></a>
									</div>
								</c:if>
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
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
	//세션 아이디를 받아온다
	var login_id = "<%= session.getAttribute("id") %>"
	//상품 아이디 저장
	var item_no = ${ii.item_no};
	//상품 이름 저장
	var item_name = "${ii.item_name}";
	//상품 금액
	var item_price = ${ii.item_price};
	$(document).ready(function(){
		
		$("#cart_add").on("click", function(e){ //장바구니 상품 등록
			e.preventDefault();
			fn_cart_add();
		});
		
		$("#like_item_add").on("click", function(e){ //찜 등록
			e.preventDefault();
			fn_like_add();
		});
		
		$("#like_item_del").on("click", function(e){ //찜 해제
			e.preventDefault();
			fn_like_del();
		});
		
	});
	
	function fn_cart_add(){
		
		if(login_id != "null"){
			if(cnt > 1){
				var arr = new Array();
				$("input:hidden[name='item_option_no']").each(function(){
					arr.push($(this).attr('value'));
				});
				var arr3 = new Array();
				$("input[name='item_quantity']").each(function(){
					var cnt = $('.item-quantity input').val();
					console.log("quantity",cnt);
					arr3.push($(this).val());
				});
				var arr2 = new Array();
				$("input:hidden[name='order_option']").each(function(){
					arr2.push($(this).val());
				});
				
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
				alert("상품 옵션을 선택해주세요.");
			}
		}else{
			if(confirm("로그인 후 이용 가능합니다.\n로그인페이지로 이동하시겠습니까?") == true){
				location.href="/member_login";
			}
		}
	}
	
	function fn_like_add(){
		
		if(login_id != "null"){
			$.ajax({
				url : "/wishlist_add",
				type : "POST",
				dataType : "json",
				data : {
					"wish_item_no" : item_no,
					"wish_mem_id" : login_id,
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
					if(data == 1){
						alert("찜 목록에 추가되었습니다");
						location.reload();
					}else if(data == 2){
						alert("이미 찜 하신 상품입니다");
					}
				}
			});
		}else{
			if(confirm("로그인 후 이용 가능합니다.\n로그인페이지로 이동하시겠습니까?") == true){
				location.href="/member_login";
			}
		}
	}
	
	function fn_like_del(){
		
		if(login_id != "null"){
			$.ajax({
				url : "/wishlist_del",
				type : "POST",
				dataType : "json",
				data : {
					"wish_item_no" : item_no,
					"wish_mem_id" : login_id
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
					if(data == 1){
						alert("찜 목록에서 삭제하였습니다.");
						location.reload();
					}else if(data == 2){
					}
				}
			});
		}else{
			if(confirm("로그인 후 이용 가능합니다.\n로그인페이지로 이동하시겠습니까?") == true){
				location.href="/member_login";
			}
		}
	}
	
	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	var cnt = $('#dynamicTable table').length+1;
	console.log("cnt",cnt);
	
	$('#SizeList').change(function(){
		var SizeList = $('#SizeList option:selected').val();
		
		if(SizeList == ''){
			alert("옵션을 선택하세요.");
			return false;
		}else{
			
			
			var html = "";
			var option = $('#SizeList option:selected').val();
			var option_no = $('#SizeList option:selected').attr('data_option_no');
			var price = $("#price").val();
			
			var Inum = ${ii.item_no};
			var totalCount = ${option_total};//3
			
			console.log("option"+cnt+"",option);
			console.log($("#opt"+cnt+"").text());
			console.log("option_no",option_no);
			console.log("SizeList",SizeList);
			var arr = new Array();
			$("input:hidden[name='item_option_no']").each(function(){
				arr.push($(this).attr('value'));
			});
			for(var i=0; i<totalCount;i++){
				var ck = arr[i];
				console.log("hiddenoptionno",ck);
				if(option_no == ck) {
				    $("#SizeList").val('');
				    alert("이미있는 상품입니다.");
				    return false;
			    }
			}
			
			
			
			html = 	  " <tr class='item-vva' id='field"+cnt+"'> "
					+ " <td>" 
					+ " <div class='field"+cnt+"' id='opt"+cnt+"'> "
					+ option +"</div>"+ "</td>"
					+ " <td>"
					+ " <div class='item-quantity'> "
					+ " <input type='number' value='1' min='1' name='item_quantity'class='item_quantity'> </div> "
					+ " </td> "
					+ " <td>"
					+ " <div class='item-line-price'>"+numberWithCommas(${ii.item_price})+"</div>"
					+ " <div class='item-removal"+cnt+"'> "
					+ " <button type='button' class='btn btn-danger remove-item'>"
					+ " x "
					+ " </button>"
					+ " </div>"
					+ " </td> "
					+ " </tr> "
						+ " <input type='hidden' name='order_option' value='"+option+"'>"
						+ " <input type='hidden' name='item_option_no' value='"+option_no+"'"
						+ " <input type='hidden' name='item_no' value='"+Inum+"'>";
					
			$("#dynamicTable > tbody:last").append(html);
			
			
			
			
			if($('#field'+cnt+'')){
				recalculateCart();
				var hap = ${ii.item_price} * cnt;
				console.log("hap",hap);
				var num = numberWithCommas(hap);
				$('.total-value').text(num);
			}
			
			$("#SizeList").val('');
			
			$('.item-removal'+cnt+' button').click(function() {
				$(this).parent().parent().parent().remove();
				recalculateCart();
			});
			
			cnt++;
			
		}
			
		

			
			var fadeTime = 300;
			
			$('.item-quantity input').change( function() {
				var cnt = $(this).val();
				console.log("quantity",cnt);
				$(this).val(cnt);
				updateQuantity(this);
			});
			
			function recalculateCart(){
				
				var subtotal = 0;
				$('.item-vva').each(function () {
					var pt = $(this).children();
				    subtotal += parseInt(pt.children('.item-line-price').text().replace(',',''));
				 });
				
				console.log(subtotal);
				/* Calculate totals */
				var total = subtotal;
				  
				/* Update totals display */
				$('.total-value').fadeOut(fadeTime, function() {
					$('#cart-total').html(numberWithCommas(total));
					if(total == 0){
						$('.checkout').fadeOut(fadeTime);
					}else{
						$('.checkout').fadeIn(fadeTime);
					}
					$('.total-value').fadeIn(fadeTime);
				});
			}
			
			/* Update quantity */
			function updateQuantity(quantityInput) {
			
			  /* Calculate line price */
			  var productRow = $(quantityInput).parent().parent().parent();
			  var pd = productRow.children();
			  var price = ${ii.item_price};
			  var quantity = $(quantityInput).val();
			  var itemPrice = price * quantity;
			  /* Update line price display and recalc cart totals */
			  pd.children('.item-line-price').each(function () {
			    $(this).fadeOut(fadeTime, function() {
			      $(this).text(numberWithCommas(itemPrice));
			      recalculateCart();
			      $(this).fadeIn(fadeTime);
			    });
			  });		
			  
			}
});
	
</script>
</html>
