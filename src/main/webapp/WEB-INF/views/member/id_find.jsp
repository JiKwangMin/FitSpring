<%@ page  contentType="text/html; charset=UTF-8"%>
<html lang="ko"><head>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>아이디 찾기</title>
    <style>
        @import url("http://fonts.googleapis.com/earlyaccess/nanumgothic.css");
	
	html {
		height: 100%;
	}
	
	body {
	    width:100%;
	    height:100%;
	    margin: 0;
  		padding-top: 200px;
  		padding-bottom: 40px;
  		font-family: "Nanum Gothic", arial, helvetica, sans-serif;
  		background-repeat: no-repeat;
	}
	
    .card {
        margin: 0 auto; /* Added */
        float: none; /* Added */
        margin-bottom: 10px; /* Added */
	}

    #btn-Yes{
        background-color: #000000;
        border: none;
    }
	
	.form-signin .form-control {
  		position: relative;
  		height: auto;
  		-webkit-box-sizing: border-box;
     	-moz-box-sizing: border-box;
        	 box-sizing: border-box;
  		padding: 10px;
  		font-size: 16px;
	}
    .card-title{
        margin-left: 0px;
    }
	 .links{
        text-align: center;
        margin-bottom: 10px;
    }

    a{ 
    	color: #f58b34; text-decoration: none; 
    }
    .text2{
    	color : blue;
    }
    </style>
  </head>

  <body cellpadding="0" cellspacing="0" marginleft="0" margintop="0" width="100%" height="100%" align="center">

	<div class="card align-middle" style="width:25rem;">
		<div class="card-title mt-5">
            
			<h2 class="card-title" style="color:#f58b34;"><img width="100%" src="./resources/images/1.png"></h2>
		</div>
        
		<div class="card-body">
      <form action="findId" class="form-signin" method="POST">
  		 <p class="text2"> </p>
        <input type="text" name="name" id="name" class="form-control" placeholder="이름" required="" autofocus=""><br>
        <input type="email" name="email" id="email" class="form-control" placeholder="이메일" required=""><br>
        	<p class="check" id="check" style="color: red; display: none;">이름을 입력해주세요.</p><br>
        <button id="btn-Yes" class="btn btn-lg btn-primary btn-block" type="submit">아 이 디 찾 기</button>
      
      </form>
        
		</div>
        <div class="links">
            <a href="pwd_find">비밀번호 찾기</a> | <a href="member_login">로그인</a> | <a href="member_join">회원가입</a>

        </div>
	</div>
   <b>${mem_id}</b>
  
  <script type="text/javascript">
		
  		
  
  		$("#name").focusout(function(){
  			
	     if($('#name').val() == ""){
	   		$('#check').text('이름을 입력해주세요.');
	   	  	$('#check').css('color', 'red');
	   
	     }else{
	    	 $('#check').hide();
	     }
	     });
	     
  		$("#email").focusout(function(){
	     if($('#email').val() == ""){
	   		$('#check').text('이메일을 입력해주세요');
	   	  	$('#check').css('color', 'red');
	     }else{
	    	 $('#check').hide();
	     }
	     });
  
  </script>
</body>
</html>