<%@ page  contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Shop Homepage - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    </head>
	<style>
		.o_btn{
			padding:0px;
			width:150px;
			margin-top:5px;
			margin-botton:5px;
		}
		
		.m-0{
			margin:0px;
		}
		
		.td_border{
			border-right:2px solid #dee2e6;
		}
		.address-card{
			border:1px solid black;
			padding:16px;
		}
	</style>
    <body>
    	<!-- header -->
		<jsp:include page="../include/header.jsp"/>
		<!--header 끝-->
		<div class="container">
			<div class="row">
				<div class="col-2">
					<ul class="nav flex-column">
					  <li class="nav-item">
					    <a class="nav-link px-0"  href="/mypage_order">주문목록</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link px-0" href="/mypage_wish">관심상품</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link px-0" href="/mypage_info">개인정보확인/수정</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link px-0 active" aria-current="page" href="/mypage_address">배송지 관리</a>
					  </li>
					</ul>
				</div>
				<div class="col-8">
					<div class="pb-5">
						<h3><span style="font-weight:bold;">배송지 관리</span></h3>
					</div>
					<div>
						<div class="address-card">
        					<div class="address-card__head">
             	 				<div class="mb-1">
	                				<div class="address-card__title fw-bold fs-3">{name}</div>
	                			</div>
		                		<div class="address-card__fresh-mvp2">
		                        	<span class="border rounded-pill border-primary px-2">기본배송지</span>
		                		</div>
		        			</div>
			        		<div class="address-card__body">
					            <div class="address-card__text address-card__text--address">{주소},{상세주소}</div>
					            <div class="address-card__text address-card__text--cellphone">{phone}</div>
				    			<div class="address-card__text address-card__text--delivery-preference">
				      		              요청사항&nbsp;:&nbsp;
							                문 앞
							    </div>
	     			 		</div>
    		     			<div class="address-card__foot">
			                	<form action="/addressbook/edit" method="get" class="">
				                 	<input name="deliveryType" value="STANDARD" type="hidden">
									<input name="displayBackButton" value="false" type="hidden">
									<input name="displayDeliveryPreferences" value="true" type="hidden">
									<button class="btn btn-outline-primary py-1 mt-3" style="border:1px solid #0d6efd;" type="submit">
										<span class="addressbook__text">수정</span>
									</button>
								</form>
							</div>
						</div>
						<form class="" method="get" action="/address/new">
						    <input name="deliveryType" value="STANDARD" type="hidden">
							<input name="displayBackButton" value="false" type="hidden">
							<input name="displayDeliveryPreferences" value="true" type="hidden">
							<input name="displayTitle" value="false" type="hidden">
							<input name="historyCount" value="1" type="hidden">
						    <div class="d-grid mt-4">
						        <button type="submit" class="btn border border-dark">
						            <i class="bi bi-plus-lg" style="color:#0d6efd;"></i>
						            <span class="addressbook__text" style="color:#0d6efd;">배송지 추가</span>
						        </button>
						    </div>
						</form>
					</div>
				</div>
			</div>
		</div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="../../js/scripts.js"></script>
    </body>
</html>