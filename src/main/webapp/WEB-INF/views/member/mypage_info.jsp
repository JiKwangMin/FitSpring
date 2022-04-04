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
					    <a class="nav-link px-0" href="/mypage_order">주문목록</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link px-0" href="/mypage_wish">관심상품</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link px-0 active" aria-current="page" href="/mypage_info">개인정보확인/수정</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link px-0" href="/mypage_address">배송지 관리</a>
					  </li>
					</ul>
				</div>
				<div class="col-8">
					<form action="/mypage_info_login">
						<div class="pb-5">
							<h2><span class="fw-bold">회원정보확인</span></h2>
							<p class="">
	                			<strong class="">{nickname}</strong>님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인 합니다.
	         				</p>
	         				<table class="table border-top border-3 border-dark">
				                <tbody>
				                <tr>
				                    <th scope="row" style="width:16%;">아이디</th>
				                    <td>
				                        {mem_id}
				                    </td>
				                </tr>
				                <tr>
				                    <th scope="row">
				                        비밀번호
				                    </th>
				                    <td>
				                        <input class="" type="password" placeholder="비밀번호를 입력해주세요.">
				                    </td>
				                </tr>
				                </tbody>
				            </table>
				            <div class="text-center">
				                <button type="submit" class="btn btn-info">확인</button>
				                <button type="button" class="btn btn-secondary">취소</button>
				            </div>
						</div>
					</form>
				</div>
			</div>
		</div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="../../js/scripts.js"></script>
    </body>
</html>