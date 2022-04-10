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
    <body>
    	<!-- header -->
		<jsp:include page="../include/header.jsp"/>
		<!--header 끝-->
        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <div class="col mb-5">
                    	<a href="/mypage_order" style="text-decoration : none; color : black;">
	                        <div class="card h-100">
	                            <div class="card-body p-4">
		                          <div class="text-center">
		                                  <!-- Product name-->
		                               <h1 class="fw-bolder">ORDER</h1>
		                                 (주문내역조회)<br/><br/>고객님께서 주문하신 상품의 주문내역을 확인하실수 <br>있습니다.<br/>
		                                                               비회원의 경우, 주문서의 주문번호와 비밀번호로 주문조회가 가능합니다.
		                           </div>
	                            </div>
	                        </div>
                        </a>
                    </div>
                    <div class="col mb-5">
                      <a href="/mypage_info" style="text-decoration : none; color : black;">
                        <div class="card h-100">
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <h2 class="fw-bolder">USER INFO</h2>
                                     (회원정보 수정)
                                     <br><br>
                                     회원이신 고객님의 개인정보를 관리하는 공간입니다.<br>개인정보를 최신 정보로 유지하시면 보다 간편히 쇼핑을 즐기실 수 있습니다.
                                     <br><br>
                                </div>
                            </div>
                        </div>
                      </a>
                    </div>
                    <div class="col mb-5">
                    	<a href="/mypage_wish" style="text-decoration : none; color : black;">
                        	<div class="card h-100">	
                            	<div class="card-body p-4">
                                	<div class="text-center">
	                                    <h2 class="fw-bolder">WISH LIST</h2>
    	                                (관심 상품)
        	                            <br>
            	                        <br>
                	                    <p>관심 상품으로 등록하신 상품의 몰록을 보여드립니다
                    	                    <br><br><br><br>
                        	        </div>
                            	</div>
	                        </div>
	                	</a>
                    </div>
                    <div class="col mb-5">
                    	<a href="/mypage_address" style="text-decoration : none; color : black;">
                        <div class="card h-100">
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <h2 class="fw-bolder">DELIVERY</h2>
                                    (배송지 관리)
                                    <br>
                                    <br>
                                    고객님께서 저장한 주소를 관리하는 공간입니다.
                                </div>
                            </div>
                        </div>
                        </a>
                    </div>
                </div>
            </div>
        </section>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="../../js/scripts.js"></script>
    </body>
</html>