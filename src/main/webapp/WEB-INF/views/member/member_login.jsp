<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>CodePen - Log In / Snslogin- pure css - #12</title>
<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css'>
<link rel='stylesheet'
	href='https://unicons.iconscout.com/release/v2.1.9/css/unicons.css'>
<link rel="stylesheet" type="text/css" href="./resources/css/login.css" />
<script>
function login_check(){
	 if($.trim($('#mem_id').val())== ""){
		 alert("로그인 아이디를 입력하세요!");
		 $('#mem_id').val("").focus();
		 return false;
	 }
	 
	 if($.trim($('#mem_pw').val())== ""){
		 alert("로그인 비번을 입력하세요!");
		 $('#mem_pw').val("").focus();
		 return false;
	 }
}
 
 

 function pwd_find(){
	 $url = "pwd_find";
	 window.open($url,'비번검색','width=500px, height=600px,');
 }
 function id_find(){
	 $url = "id_find";
	 window.open($url,'아이디검색','width=500px, height=600px,');
 }
</script>
<!-- Kakao login str -->
<script>
Kakao.init('8a7ddb15aa7f0849b85b90b267fde7d1'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단
//카카오로그인
function kakaoLogin() {
    Kakao.Auth.login({
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
        	  console.log(response)
          },
          fail: function (error) {
            console.log(error)
          },
        })
      },
      fail: function (error) {
        console.log(error)
      },
    })
  }
function kakaoLogout() {
    if (Kakao.Auth.getAccessToken()) {
      Kakao.API.request({
        url: '/v1/user/unlink',
        success: function (response) {
        	console.log(response)
        },
        fail: function (error) {
          console.log(error)
        },
      })
      Kakao.Auth.setAccessToken(undefined)
    }
  }  
</script>
<!-- Kakao login end -->
<!-- Naver login str -->
<script>
var naverLogin = new naver.LoginWithNaverId(
		{
			clientId:"afWLSk2eqya6UXSDb8rd", //내 애플리케이션 정보에 cliendId를 입력해줍니다.
			callbackUrl: "http://localhost:8080/index",// 내 애플리케이션 API설정의 Callback URL 을 입력해줍니다.
			isPopup: false,
			callbackHandle: true
		}
	);	

naverLogin.init();

window.addEventListener('load', function () {
	naverLogin.getLoginStatus(function (status) {
		if (status) {
			var email = naverLogin.user.getEmail(); // 필수로 설정할것을 받아와 아래처럼 조건문을 줍니다.
    		
			console.log(naverLogin.user); 
    		
            if( email == undefined || email == null) {
				alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
				naverLogin.reprompt();
				return;
			}
		} else {
			console.log("callback 처리에 실패하였습니다.");
		}
	});
});


var testPopUp;
function openPopUp() {
    testPopUp= window.open("https://nid.naver.com/nidlogin.logout", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
}
function closePopUp(){
    testPopUp.close();
}

function naverLogout() {
	openPopUp();
	setTimeout(function() {
		closePopUp();
		}, 1000);
	
	
}
</script>
<!-- Naver login end -->
</head>
<body>
		<div class="section">
			<div class="container">
				<div class="row full-height justify-content-center">
					<div class="col-12 text-center align-self-center py-5">
						<div class="section pb-5 pt-5 pt-sm-2 text-center">
							<h6 class="mb-0 pb-3">
								<span>Log In </span><span>Sns login</span>
							</h6>
							<input class="checkbox" type="checkbox" id="reg-log"
								name="reg-log" /> <label for="reg-log"></label>
							<div class="card-3d-wrap mx-auto">
								<div class="card-3d-wrapper">
									<!--  구분 1 일반 회원 -->
									<div class="card-front">
										<div class="center-wrap">
											<div class="section text-center">
												<h4 class="mb-4 pb-3">로그인</h4>
												<form method="post" action="member_login_ok"
													onsubmit="return login_check();">
													<div class="form-group">
														<input name="mem_id" class="form-style"
															placeholder="아이디 입력하세요!" id="mem_id" autocomplete="off"
															tabindex="1"> <i class="input-icon uil uil-user"></i>
													</div>
													<div class="form-group mt-2">
														<input type="password" name="mem_pw" class="form-style" placeholder="비밀번호 입력하세요!" id="mem_pw" autocomplete="off">
														<i class="input-icon uil uil-lock-alt"></i>
													</div>
													<div class="form-group">
														<div style="text-align: left" class="custom-control custom-checkbox small">
															<input type="checkbox" class="custom-control-input" id="customCheck" name="customCheck" /> 
															<label class="custom-control-label mt-2" for="customCheck">아이디 기억</label>
														</div>
													</div>

													<p>
														<input type="submit" href="" class="btn mt-2" style="width: 100%" value="로그인" />
													</p>
													<span style="margin-right: 1vw" class="mb-0 mt-4 text-center">
														<a href="" onclick="id_find()" class="link">아이디 찾기</a>
													</span> 
													<span class="mb-0 mt-4 text-center">
														<a href="" onclick="pwd_find()" class="link">비밀번호 찾기</a>
													</span>
													<span style="margin-left: 2vw" mb-0mt-4text-center"> 
														<a href="member_join" class="link">회원가입</a>
													</span>
												</form>

											</div>

										</div>

									</div>

									<!--  구분 2 sns-->
									<div class="card-back">
										<div class="center-wrap">
											<div class="section text-center">
												<h4 class="mb-4 pb-3">Snslogin</h4>
												<div>
													<ul style="padding: 0px; list-style: none;">
														<li onclick="kakaoLogin();">
															<a href="javascript:void(0)"> <img style="width: 85%;"	src="./resources/images/kakao.png"></a>
														</li>
													</ul>
												</div>
												<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
												<div>
													<ul style="padding: 0px; list-style: none;">
														<li><!-- 아래와같이 아이디를 꼭 써준다. -->
															 <a id="naverIdLogin_loginButton" href="javascript:void(0)">
																<img style="width: 85%;" src="./resources/images/naver.png">
															</a>
														</li>
													</ul>
												</div>
												<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
</body>
</html>