<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
			<span><b>재고 수량 변경하기</b></span>
            <table class="table">         
            <c:if test="${!empty ilist}">
            	<tr>
                	<th>상품이름</th>
                    <td>${item_name}</td>
                </tr>
            <c:forEach items="${ilist}" var="b">
                
                 	<thead>
            			<tr>
               				<th>컬러/사이즈</th>
               				<th>재고수량</th>
               				<th>추가수량</th>
               				<th>BTN</th>
            			</tr>
         			</thead>
                    <tbody>
                    <form action="/ItemStock_OK" method="post">
                    	<tr>
                        	<td>${b.option_val1}</td>
                        	<td>${b.option_val2 - b.selcount}</td>
                        	<td>
                           		<input type="text" name="pluse_stock" size="12" placeholder="추가 수량 입력하세요." />
                           		<input type="hidden" name="item_no" value="${b.item_no}" />
                           		<input type="hidden" name="option_val1" value="${b.option_val1}" />
                           		<input type="hidden" name="stock" value="${b.option_val2 - b.selcount}" />
                        	</td>
                        	<td>
                           		<button type="submit" >재고 +</button>
                        	</td>
                    	</tr>
                    </form>
               </c:forEach>
               </c:if>
               	</tbody>
        	</table>
		</div>
	</section>
</div>
</body>
</html>

