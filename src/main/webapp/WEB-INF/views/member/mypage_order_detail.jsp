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
		.captionhide{
			display:none;
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
						<div class="d-flex flex-row">
							<div style="font-weight:bold;">2022.00.00 주문</div>
							<span class="px-1">•</span>
							<span>주문번호 {ordernumber}</span>
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
												<span style="font-weight:bold;">{배송준비중}</span>
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
												<button type="button" class="btn o_btn" style="border-color:blue; color:blue;">배송조회</button>
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
		<div class="container mt-3">
			<div class="row justify-content-start">
				<div class="col-2">
				</div>
				<div class="col-8">
					<h4 class="pb-2"><span style="font-weight:bold;">받는사람 정보</span></h4>
					<table class="table">
						<caption class="captionhide">받는사람 정보</caption>
						<colgroup><col width="105"><col><col width="100"></colgroup>
						<tbody class="">
							<tr class="">
								<th class="" style="color: rgb(85, 85, 85);">받는사람</th>
								<td class="">{김진성}</td>
								<td class=""></td>
							</tr>
							<tr class="">
								<th class="" style="color: rgb(85, 85, 85);">연락처</th>
								<td class="">{010-3301-6808}</td>
								<td class=""></td>
							</tr>
							<tr class="">
								<th class="" style="color: rgb(85, 85, 85);">받는주소</th>
								<td class="">(우편번호) {주소}</td>
								<td class=""></td></tr><tr class="">
								<th class="" style="color: rgb(85, 85, 85);">배송요청사항</th>
								<td class=""><div class=""><span>{문앞에 놓아주세요}</span></div></td>
								<td class=""></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="row justify-content-start">
				<div class="col-2">
				</div>
				<div class="col-8">
					<h4 class="pb-2"><span style="font-weight:bold;">결제정보</span></h4>
					<table class="table">
						<caption class="captionhide">결제 정보</caption>
						<colgroup><col><col width="340"></colgroup>
						<tbody class="">
							<tr class="">
								<th class="">결제수단</th>
								<th rowspan="2" class="info">
									<div class="d-flex justify-content-between">
										<div class="">총 상품가격</div>
										<div class="sc-1w2sdij-5 kTDTkp">
											<strong>{52,450} 원</strong>
										</div>
									</div>
									<div class="d-flex justify-content-between">
										<div class="sc-1w2sdij-4 jLknds">배송비</div>
										<div class="">
											<span>0 원</span>
										</div>
									</div>
									<div class="d-flex justify-content-between">
										<div class="sc-1w2sdij-4 jLknds">포인트</div>
											<div class="">
												<span>{1000} 원</span>
											</div>
									</div>
									<div class="d-flex justify-content-between">
										<div class="">할인 쿠폰</div>
										<div class="">
											<span>(10%할인),{1000} 원</span>
										</div>
									</div>
								</th>
							</tr>
							<tr class="">
								<th class="">
									<div class="" style="color: rgb(17, 17, 17);">{결제수단}</div>
								</th>
							</tr>
						</tbody>
						<tbody class="">
							<tr class="">
								<td class="">
									<div>
										<span class=" ">포인트 적립예정  : </span>
										<strong class="">{0} 원</strong>
									</div>
								</td>
								<td class="info">
									<div class="d-flex justify-content-between">
										<div class="" style="color: rgb(17, 17, 17);"><strong>총 결제금액 </strong></div>
										<div class="">
											<strong>52,450 원</strong>
										</div>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="row justify-content-start">
				<div class="col-2"></div>
				<div class="col-8 mt-2 mb-5 d-flex justify-content-between">
					<div>
						<button type="button" class="btn" style="border-color:blue; color:blue;" onclick="history.back();"><i class="bi bi-chevron-left"></i>주문목록 돌아가기</button>
					</div>
					<div>
						<button type="button" class="btn" style="border-color:blue; color:blue;">주문내역 삭제</button>
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