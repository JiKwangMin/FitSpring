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
				<form id="form" method="post">
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
									<a class="df-btn buy" id="direct_order"><span>바로구매</span></a>
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
				<input type="hidden" name="cart_no" class="cart_no" />
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

<!------------------------------------------------ 리뷰------------------------------------------------------------------- -->	
	<h1>REVIEW</h1>
							
	<table id="review">
		<colgroup>			
			<col style="width: 10%">
			<col style="width: 7%">
			<col style="width: 63%">
			<col style="width: 10%">
			<col style="width: 20%">
		</colgroup>
		<tr>
			<th class="rno">번 호</th>
			<th class="rphoto">사 진</th>
			<th class="rcont">내 용</th>
			<th class="rwrite">작성자</th>
			<th class="ratings">평 점</th>
		</tr>
	
																<!-- 루프 -->
		<c:if test="${!empty limare }">
			<c:forEach var="r" items="${limare }">
			
		<tr>
			<td style="text-align: center">${r.r_no}</td>
			<td>
				<div class="photo-box p-img-box">
					<img src="./resources/images/review/picture.png">
				</div>
			</td>
			<td style="padding: 5px;"><input type="checkbox" id="answer+${r.r_no}">
				<label for="answer+${r.r_no}">
					<div class="r_cont">
						<c:if test="${fn:length(r.r_cont)>20}"> 
        					${fn:substring(r.r_cont,0,20)}...
      					</c:if>
      					<c:if test="${fn:length(r.r_cont) <= 20}"> 
        					${r.r_cont}
      					</c:if>
					<br>
					</div>
				</label>
				<div>
					<p>
					<div style="padding: 20px;">
						<!-- 상품 이름 -->
						${ii.item_name }
						<table style="width: 270px; border: 1px solid gray;">
							<colgroup>
								<col style="width: 2%;">
								<col style="width: 3%;">
								<col style="width: 5%;">
							</colgroup>
							<tr>
								<th>키</th>
								<th>몸무게</th>
								<th>구매 사이즈</th>
							</tr>
							<tr>
								<th>${r.r_height}cm</th>
								<th>${r.r_weight}kg</th>
								<th>${r.r_size}</th>
							</tr>
						</table>
						<br>${r.r_cont }
					</div>
					<div class="photo-review pr-img-box">
						<img src="../resources/upload${r.review_img}" style="width: 170px; height: 190pxl;" alt="이미지없음"/>
					</div>&nbsp;&nbsp;&nbsp;&nbsp;
			
   				<div style="float: right;margin: 0 5% 10px 0">
   				<input type="submit" value="수정" onclick="location='ReviewEdit?r_no=${r.r_no}&page=${page}&state=edit&item_no=${ii.item_no}';" />
   				<input type="submit" value="삭제" onclick="location='ReviewDel?r_no=${r.r_no}&page=${page}&state=del&item_no=${ii.item_no}';" /></div>
					</p>
				</div>
			</td>
			<td class="r_writer">${r.r_writer}</td>
			<td class="r_rate" style="color: red;">${r.r_rate }★</td>
		</tr>
		
			</c:forEach>	
		</c:if>
																<!-- 루프 끝 -->
		<c:if test="${empty limare}">
         	<tr>
         		<th colspan="5">목록이 없습니다.</th>
         	</tr>
        </c:if>
	</table>
	
	<br>
		<div class="text-right" style="margin-bottom: 10px;">
			<a href="/review_write?item_no=${ii.item_no}">
        		<input type="submit" value="리뷰 등록">
        	</a>
    	</div>
  	
	<div id="page_control" class="text-center">
        <%--페이징 즉 쪽나누기 추가 --%>
			<div>
				<c:if test="${(!empty page)}">
					<c:if test="${page<=1}">[이전]&nbsp;</c:if>
					<c:if test="${page>1}">
						<a href="item_detail?item_no=${ii.item_no}&page=${page-1}">[이전]</a>&nbsp;
    				</c:if>

					<%--현재 쪽번호 출력--%>
					<c:forEach var="a" begin="${startpage}" end="${endpage}">
						<c:if test="${a == page}"><${a}></c:if>	<%--현재 페이지가 선택되었다면--%>
						<c:if test="${a != page}">				
							<a href="item_detail?item_no=${ii.item_no}&page=${a}">[${a}]</a>&nbsp;
     					</c:if><%--현재 페이지가 선택되지 않았다면 --%>
					</c:forEach>

					<c:if test="${page >= maxpage}">[다음]</c:if>
					<c:if test="${page<maxpage}">
						<a href="item_detail?item_no=${ii.item_no}&page=${page+1}">[다음]</a>
					</c:if>
				</c:if>
			</div>			
    </div>
</div>

<!-- --------------------------------------------------------------- 리뷰 끝 --------------------------------------- -->

<div class="container">

    <div class="row">
        <div class="col-md-12 text-right">
            <p class="root"><a href="index">홈</a> > Q & A</p>
        </div>
    </div>
        
<h1>Q & A</h1>  
<br>
<div class="qna"><p>FitSpring 상품문의 및 교환&반품문의입니다.</p></div>

	
    <table id="notice"> 
        <colgroup>
            <col style="width: 7%">
            <col style="width: 13%">
            <col style="width: 55%">
            <col style="width: 15%">
            <col style="width: 10%">
        </colgroup>
        <tr>
            <th class="tno">번호</th>
            <th class="p_info">상품정보</th>
            <th class="ttitle">제목</th>
            <th class="twrite">작성자</th>
            <th class="tdate">작성일</th>
        </tr>
        
																			<!-- 루프 -->
 		 <c:if test="${!empty limaqna }">
 		 	<c:forEach var="q" items="${limaqna }">
		 <tr>
           <!--  <td class="tno"><c:if test="${q.q_step == 0 }">${q.q_ref }</c:if></td> -->
            <td class="tno">${q.no}</td>
            <td>
            <div class="q-max-auto">
                <div class="photo-box p-img-box">
                    <img src="./resources/images/review/picture.png">
                </div>
            </div>
            </td>
            <td style="padding: 5px;">
                <span class="product-name">제목</a><br></span>
                
                <input type="checkbox" id="q_answer+${q.q_no }">
					<label for="q_answer+${q.q_no }">
						<div>
							<p>${q.q_title }</p>
						</div>
				</label>
					<div>
						<p>
						<div>&nbsp;							
							<p>${q.q_cont }</p>
						</div>
						<div class="photo-review pr-img-box" style="width: 150px;height: 170px;">
							<img src="../resources/upload${q.qna_img}" alt="이미지없음"/>
							<br>
						</div>&nbsp;&nbsp;
					<div style="float: right;margin: 0 5% 10px 0">	
				
		
   					<input type="submit" value="답변" onclick="location='QnaReply?q_no=${q.q_no}&page1=${page1}&state=reply&item_no=${ii.item_no}';" />
   					<input type="submit" value="수정" onclick="location='QnaEdit?q_no=${q.q_no}&page1=${page1}&state=edit&item_no=${ii.item_no}';" />
   					<input type="submit" value="삭제" onclick="location='QnaDel?q_no=${q.q_no}&page1=${page1}&state=del&item_no=${ii.item_no}';" /></div> 				
						</p>
					</div>
					
            </td>
            <td class="twrite">${q.q_writer }</td>
            <td class="tdate">${q.q_date }</td>
       	 </tr>

       	 	</c:forEach>
		 </c:if>
																		<!-- 루프 끝  -->
         <c:if test="${empty limaqna }">
         	<tr>
         		<th colspan="5">목록이 없습니다.</th>
         	</tr>
         </c:if>
    </table>
	<br>
    	<div class="text-right" style="margin-bottom: 10px;">
			<a href="/qna_write?item_no=${ii.item_no}">
        		<input type="submit" value="QNA 등록">
        	</a>
    	</div>
    
			
	<div id="page_control" class="text-center">
        <%--페이징 즉 쪽나누기 추가 --%>
			<div>
				<c:if test="${(!empty page1)}">
					<c:if test="${page1<=1}">[이전]&nbsp;</c:if>
					<c:if test="${page1>1}">
						<a href="item_detail?item_no=${ii.item_no}&page1=${page1-1}">[이전]</a>&nbsp;
    				</c:if>

					<%--현재 쪽번호 출력--%>
					<c:forEach var="a" begin="${startpage1}" end="${endpage1}">
						<c:if test="${a == page1}"><${a}></c:if>	<%--현재 페이지가 선택되었다면--%>
						<c:if test="${a != page1}">				
							<a href="item_detail?item_no=${ii.item_no}&page1=${a}">[${a}]</a>&nbsp;
     					</c:if><%--현재 페이지가 선택되지 않았다면 --%>
					</c:forEach>

					<c:if test="${page1 >= maxpage1}">[다음]</c:if>
					<c:if test="${page1 < maxpage1}">
						<a href="item_detail?item_no=${ii.item_no}&page1=${page1+1}">[다음]</a>	
					</c:if>
				</c:if>
			</div>			
    </div>
    
</div>

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
		
		$("#direct_order").on("click", function(e){//바로구매 상품1개++ 옵션 여러개 
			e.preventDefault();
			fn_order();
		});
	});
	
	function orderpage(x){
		
		console.log(x);
		$('.cart_no').val(x);
		$('#form').attr("action", "cart/order");
		$('#form').submit();
	}
	
	function fn_order(){//다이렉트 주문 장바구니에 선택된 옵션들 바로 추가하고 페이지 이동
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
				console.log("arr2",arr3);
				$.ajax({
					type : "POST",
					url : "/cart/addmove",
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
						orderpage(data);
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
