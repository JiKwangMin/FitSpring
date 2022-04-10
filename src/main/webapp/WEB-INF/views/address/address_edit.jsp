<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
						<h3><span style="font-weight:bold;">배송지 수정</span></h3>
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
									    <form action="/address/edit" method="post" class="_addressBookSaveForm" >
									    	 <div class="form-group mb-3">
											 	<label class="form-label">받는 사람</label>
										 		<input type="text" class="form-control" name="recipientName" value="${book.to_name}"/>
											 </div>
											 <div class="form-group align-items-center">
												<input class="form-control" style="width: 40%; display: inline;"
													placeholder="우편번호" name="to_post" id=to_post
													type="text" readonly="readonly" value="${book.to_post}">
												<button type="button" class="btn btn-default"
													onclick="execPostCode();">
													<i class="fa fa-search"></i> 우편번호 찾기
												</button>
											</div>
											<div class="form-group">
												<input class="form-control" style="top: 5px;" placeholder="도로명 주소"
												name="to_address" id="to_address" type="text"
												readonly="readonly" value="${book.to_addr}" />
											</div>
							
											<div class="form-group">
												<input class="form-control" placeholder="상세주소"
													name="to_detailaddress" id="to_detailaddress" type="text" value="${book.to_detailaddr}" />
											</div>
											<div class="form-group mb-3">
											 	<label class="form-label">휴대폰 번호</label>
										 		<input type="text" class="form-control" name="phone" value="${book.to_phone}"/>
											</div>
											<div class="form-group mb-3">
											 	<label class="form-label">요청사항</label>
										 		<input type="text" class="form-control" name="message" value="${book.to_message}"/>
											</div>
										    <div class="save-as-default">
										        <label for="_addressBookSaveAsDefault" class="save-as-default__container">
										            <input id="_addressBookSaveAsDefault" value="T" type="checkbox" class="save-as-default__checkbox _addressBookSaveDefault">
										          
										            <span class="save-as-default__label">기본 배송지로 선택</span>
										        </label>
										    </div>
										    <div class="d-grid mb-3">
										        <button type="submit" class="btn btn-primary">
										            <span class="addressbook__text">
										               	저장
										            </span>
										        </button>
										    </div>
										    <input type="hidden" name="to_addr_no" value="${book.to_addr_no}" />
											<input type="hidden" name="defaultAddress" value="F">
										</form>
										<form action="/address/delete" method="post">
											<div class="d-grid">
										        <button type="submit" class="btn btn-danger">
										            <span class="addressbook__text">
										               	삭제
										            </span>
										        </button>
										    </div>
										    <input type="hidden" name="to_addr_no" value="${book.to_addr_no}" />
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
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script>
    	var defaultaddress = "${book.defaultaddress}";
    	$(document).ready(function(){
    		if(defaultaddress == 'T'){
    			$('#_addressBookSaveAsDefault').prop('checked',true);
    		}else{
    			$('#_addressBookSaveAsDefault').prop('checked',false);
    		}
    	});
    	//기본 배송지 체크박스 선택시
    	$("#_addressBookSaveAsDefault").click(function(){
    		var chkval = $("#_addressBookSaveAsDefault").val();
    		var F = "F";
    		if($(this).is(':checked')){
    			$('input:hidden[name="defaultAddress"]').val(chkval);
    		}else{
    			$('input:hidden[name="defaultAddress"]').val(F);
    		}
    	});
	  	//우편번호 찾기 버튼 클릭시 발생 이벤트
	    function execPostCode() {
	         new daum.Postcode({
	             oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
	                var extraRoadAddr = ''; // 도로명 조합형 주소 변수
	
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraRoadAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraRoadAddr !== ''){
	                    extraRoadAddr = ' (' + extraRoadAddr + ')';
	                }
	                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
	                if(fullRoadAddr !== ''){
	                    fullRoadAddr += extraRoadAddr;
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                console.log(data.zonecode);
	                console.log(fullRoadAddr);
	                
	                $("[name=to_post]").val(data.zonecode);
	                $("[name=to_address]").val(fullRoadAddr);
	                
	                document.getElementById('to_post').value = data.zonecode; //5자리 새우편번호 사용
	                document.getElementById('to_address').value = fullRoadAddr;
	
	                //document.getElementById('mem_detailaddress').value = data.jibunAddress; 
	            }
	         }).open();
	     }
    </script>
</html>