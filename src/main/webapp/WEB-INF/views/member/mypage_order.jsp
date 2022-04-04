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
					    <a class="nav-link px-0 active" aria-current="page" href="/mypage_order">주문목록</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link px-0" href="/mypage_wish">관심상품</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link px-0" href="/mypage_info">개인정보확인/수정</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link px-0" href="/mypage_address">배송지 관리</a>
					  </li>
					</ul>
				</div>
				<div class="col-8">
					<div class="pb-5">
						<h3><span style="font-weight:bold;">주문목록</span></h3>
					</div>
					<div class="mb-4">
						<div class="d-flex justify-content-between">
							<div class="" style="font-weight:bold;">2022.00.00 주문</div>
							<div class="float-end"><a href="/mypage_order_detail" style="text-decoration:none;">주문 상세보기</a></div>
						</div>
						<div class="row border border-2 rounded-3 mt-4">
							<table>
								<colgroup>
									<col width="800">
									<col width="">
								</colgroup>
								<tbody>
									<tr>
										<td class="p-4 td_border">
											<div>
												<span style="font-weight:bold;">배송준비중</span>
												<span class="px-1">•</span>
												<span>3/22(화) 도착</span>
											</div>
											<div>
												<div class="mt-3">
													<div class="d-flex">
														<div>
															<a target="_blank">
																<img class="me-2" width="64" height="64" src="#" alt="상품 이름"/>
															</a>
														</div>
														<div class="">
															<div class="">
																<a class="mb-2" href="#" target="_blank">
																	<span>상품 title</span>
																</a>
																<a class="d-flex justify-content-between" href="#" style="width:500px;">
																	<div>
																		<div>
																			<span>100 원</span>
																			<span class="px-1">•</span>
																			<span>1 개</span>
																		</div>
																	</div>
																	<div>
																		<button type="button" class="btn btn-light">장바구니 담기</button>
																	</div>
																</a>
															</div>
														</div>
													</div>
												</div>
											</div>
										</td>
										<td>
											<div class="d-flex flex-column m-0 col-6 p-4">
												<button type="button" class="btn o_btn" style="border-color:blue;">배송조회</button>
												<button type="button" class="btn o_btn" style="border-color:gray;" >교환,반품 신청</button>
												<button type="button" class="btn o_btn" style="border-color:gray;" >리뷰 작성하기</button>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
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