<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<title>FitSpring Admin</title>
	
<script src="/resources/jquery/jquery-3.3.1.min.js"></script>

<link rel="stylesheet" href="/resources/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="/resources/bootstrap/bootstrap-theme.min.css">
<script src="/resources/bootstrap/bootstrap.min.js"></script>

<script src="/resources/ckeditor/ckeditor.js"></script>
<script src="./resources/js/jquery.js"></script>
<script src="./resources/js/product.js"></script>
	
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
	
	
</style>


<style>
.inputArea { margin:10px 0; }
select { width:100px; }
label { display:inline-block; width:70px; padding:5px; }
label[for='gdsDes'] { display:block; }
input { width:150px; }
textarea#gdsDes { width:400px; height:180px; }
.select_img img { margin:20px 0; }
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
				<li><a href="">주문 목록</a></li>
				<li><a href="">상품 소감</a></li>
				<li><a href="">유저 목록</a></li>
			</ul>
		</aside>
		<div id="container_box">
			<h2>상품 등록</h2>
			
			<form action="/ItemCreate_OK" method="post"  accept-charset="UTF-8" enctype="multipart/form-data">
			<div class="inputArea">	
				<label style="width:6vw;">제품 1차 분류</label>
				<select class="category1"style="width:6vw;" name="item_co1">
					<option value="--">선택해주세요</option>
					<option value="outers">아우터</option>
					<option value="top">상의</option>
					<option value="bottom">하의</option>
					<option value="shoes">신발</option>
					<option value="acc">ACC</option>
				</select>
				
			
				<label style="width:6vw;">제품 2차 분류</label>
				<select class="category2" style="width:6vw;" name="item_co2">
					<option value="--">선택해주세요</option>
					<option value="coat">코트</option>
					<option value="cardigan">가디건</option>
					<option value="jumper">점퍼</option>
					<option value="jacket">자켓</option>
					<option value="mentomen">맨투맨/후드</option>
					<option value="knit">니트</option>
					<option value="shirts">셔츠</option>
					<option value="muji">무지</option>
					<option value="pants">팬츠</option>
					<option value="denim">데님</option>
					<option value="shorts">반바지</option>
					<option value="slippers">슬리퍼</option>
					<option value="loafers">로퍼</option>
					<option value="sneakers">스니커즈</option>
					<option value="bag">가방</option>
					<option value="hat">모자</option>
				</select>
			</div>
			
			
			
			
			<div class="inputArea">
				<label for="fitname">상품명</label>
				<input type="text" id="item_name" name="item_name" style="width:20vw;"/>
			</div>
			
			<div class="inputArea">
				<label for="fitPrice">상품가격</label>
				<input type="text" id="item_price" name="item_price" />원
				<input type="hidden" id="login_id" value="${login_id}" />
				<input type="hidden" id="rank" value="${login_rank}" />
			</div>
			
			<!--  색상 , 사이즈 별로 수량 체크 해야함. -->
			<div class="inputArea">
				<button id="optionAdd_btn" class="btn btn-primary mb-3" type="button">옵션추가</button>
				<div id="optionIndex"></div>
				<br />
				<span style="color:red;"><b>최소 1개의 옵션이 필요합니다. ex) red//95, blue//100 </b></span>
			</div>
			
			<!--  메인이미지 , 상세이미지 -->
			<div class="inputArea">
				<label for="mimg" style="width:6vw;">메인 이미지</label>
				<input type="file" id="mimg" name="mimg" multiple/>
			</div>
			
			<div class="inputArea">
				<label for="simg" style="width:6vw;">상세 이미지</label>
				<input type="file" id="simg" name="simg" multiple/>
				<br/>
				<span style="color:red;"><b>최소 1개 이상의 사진이미지가 필요합니다.</b></span>
			</div>
			
			<div class="inputArea">
				<span class="input-group-text">제품 소개</span>
			</div>
			<div class="inputArea">
				<textarea class="form-control" style="width:30vw; height: 20vh;" aria-label="With textarea" name="item_cont"></textarea>
			</div>
			
			<div class="inputArea">
				<button type="submit" id="register_Btn" class="btn btn-primary">등록</button>			
			</div>
			</form>
			
		</div>
	</section>
</div>


</body>
<script>
$(document).ready(function() {
	console.log('ready');

	optionAdd();
});

function optionAdd() {
	console.log('optionadd');
	var optionIndex = 1;
	//$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"<button type='button' style='float:right;' id='fileAddBtn'>"+"추가"+"</button></div>");
	$("#optionAdd_btn")
			.on(
					"click",
					function() {
						console.log('옵션추가');
						$("#optionIndex")
								.append(
										"  <div class='form-group'><input placeholder='옵션을 입력해주세요' class='form-control input-lg' type='text' style='float:left;' name='option_val1"
												
												+ "' id='item_option'>"
												+ "<input type='number' name='option_val2' id='item_vol' placeholder='수량'>"
												+ "<button type='button' ' id='optionDelBtn' class='btn-btn dark'>"
												+ "삭제" + "</button></div>"

								);

					});

	$(document).on("click", "#optionDelBtn", function() {
		$(this).parent().remove();

	});

};
</script>
</html>