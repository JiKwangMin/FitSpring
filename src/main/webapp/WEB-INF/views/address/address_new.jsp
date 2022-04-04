<%@ page  contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title></title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
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
						<h3><span style="font-weight:bold;">배송지 추가</span></h3>
					</div>
					<div>
						<div class="content-block">
            				<div class="content-wrapper">
                				<div class="content-body content-body--fixed">
   									<div class="info-blocks">
									    <div class="info-block _addressBookInfo" style="display: none;">
									        <div class="info-block__corset">
									            <i class="info-block__icon"></i>
									            <span class="info-block__text"></span>
									        </div>
									    </div>
									</div>
                   					<div class="content-body__corset">
									    <form action="/addressbook/save" method="post" class="_addressBookSaveForm" >
									    	 <div class="form-group mb-3">
											 	<label class="form-label">받는 사람</label>
										 		<input type="text" class="form-control" name="recipientName"/>
											 </div>
											 <div class="form-group">
												<input class="form-control" style="width: 40%; display: inline;"
													placeholder="우편번호" name="mem_oaddress" id="mem_oaddress"
													type="text" readonly="readonly">
												<button type="button" class="btn btn-default"
													onclick="execPostCode();">
													<i class="fa fa-search"></i> 우편번호 찾기
												</button>
											</div>
											<div class="form-group">
												<input class="form-control" style="top: 5px;" placeholder="도로명 주소"
												name="mem_address" id="mem_address" type="text"
												readonly="readonly" />
											</div>
							
											<div class="form-group">
												<input class="form-control" placeholder="상세주소"
													name="mem_detailaddress" id="mem_detailaddress" type="text" />
											</div>
											<input type="hidden" name="roadAddressRefer" value="">
											<input type="hidden" name="roadAddress" value="">
											<input type="hidden" name="addressType" value="">
											<input type="hidden" name="landAddress" value="">
											<input type="hidden" name="zipcode" value="">
											<div class="form-group mb-3">
											 	<label class="form-label">휴대폰 번호</label>
										 		<input type="text" class="form-control" name="phone"/>
											 </div>
										    <div class="save-as-default">
										        <label for="_addressBookSaveAsDefault" class="save-as-default__container">
										            <input id="_addressBookSaveAsDefault" value="true" type="checkbox" class="save-as-default__checkbox _addressBookSaveDefault">
										          
										            <span class="save-as-default__label">기본 배송지로 선택</span>
										        </label>
										    </div>
										    <div class="d-grid">
										        <button type="submit" class="btn btn-primary">
										            <span class="addressbook__text">
										               	저장
										            </span>
										        </button>
										    </div>
											<input type="hidden" name="defaultAddress" value="false">
										</form>
									</div>
				                </div>
				            </div>
				        </div>
					</div>
				</div>
			</div>
		</div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>