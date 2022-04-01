<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>Admin</title>
	
<script src="/resources/jquery/jquery-3.3.1.min.js"></script>

<link rel="stylesheet" href="/resources/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="/resources/bootstrap/bootstrap-theme.min.css">
<script src="/resources/bootstrap/bootstrap.min.js"></script>
	
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
			<form action="ItemBanner_OK" enctype="multipart/form-data" method="post" accept-charset="UTF-8"> 
            	<table class="table">
                	<thead>
                    	<th colspan="2">배너 등록</th>
                    </thead>
                    <tbody>
                    	<tr>
                        	<th>
                            	*배너 등록은 3개까지 가능합니다. 이미지를 한개만 업로드 해주세요.*
                                <input type="hidden" name="item_no" value="${item_no}"/>
                            </th>
                        </tr>
                        <tr>
                        	<td colspan="2">
                            	<input class="form-control" type="file"  name="bimg" > 
                        	</td>
                        </tr>
                    </tbody>
                 </table>
                 	<input class="btn btn-primary" type="submit" value="완료" >
        	</form>	
		</div>
	</section>
</div>
</body>
</html>


