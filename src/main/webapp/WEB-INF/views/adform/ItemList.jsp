<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
	<title>ItemList</title>
	
<script src="/resources/jquery/jquery-3.3.1.min.js"></script>

<link rel="stylesheet" href="/resources/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="/resources/bootstrap/bootstrap-theme.min.css">
<script src="/resources/bootstrap/bootstrap.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">	
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

<style>
	.pagination li {list-style-type:none; display:inline-block; float:left;}
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
				<li><a href="/OrderList">주문 목록</a></li>
			</ul>
		</aside>
		<div id="container_box">
			<div>
  				<h3>상품목록</h3>
     			<c:if test="${empty iilist}">
     			<table>
     				<tr>
     					<th>게시글 없습니다.</th>
     				</tr>
     			</table>
     			</c:if>
     			<c:if test="${!empty iilist }">
     			<div>총 상품 종류 : ${totalCount}</div>
     			<c:forEach items="${iilist}" var="a">
     			
  				<table border="1">
  					<tr>
  						<th width="10%" rowspan="2">이미지</th>
   						<th width="5%">번호</th>
   						<th width="15%">분류</th>
   						<th width="30%">등록일</th>
   						<th width="5%"rowspan="4">
   							<form action="/ItemBanner" method="post">
   								<input type="hidden" name="item_no" id="item_no" value="${a.item_no}" />
   								<button type="submit">배너등록</button>
   							</form>
   						</th>
						</script>
   						<th width="5%"rowspan="4">
   							<form action="/ItemStock" method="post">
   								<input type="hidden" name="item_no" id="item_no" value="${a.item_no}" />
   								<button type="submit">재고확인</button>
   							</form>
   						</th>
   						<th width="3%"rowspan="4">
   							<form action="/ItemEdit" method="post">
   								<input type="hidden" name="item_no" id="item_no" value="${a.item_no}" />
   								<button type="submit">수정</button>
   							</form>
   						</th>
   						<th width="3%"rowspan="4">
   							<a href="/ItemDel_OK?item_no=${a.item_no}">
   								<button type="button">삭제</button>
   							</a>
   						</th>
  					</tr>
  					<tr>
  						<td>${a.item_no}</td>
      					<td>${a.item_co1} -> ${a.item_co2}</td>
      					<td style="text-align:center;">${fn:substring(a.item_write_date,0,10)}</td>
      				</tr>
     				<tr>
     					<td rowspan="2" style="text-align:center;">
      						<img src="../resources/upload${a.main_item_img}" width="140px;" height="150px;" alt="이미지없음"/>
	  					</td>
     					<th colspan="2">상품이름</th>
      					<th>상품가격</th>
      					
     				</tr>
     				<tr>
     					<td colspan="2" style="text-align:center;"> ${a.item_name} </td>
     					<td style="text-align:center;"> ${a.item_price}원</td>
     				</tr>
     			</table>
     			</c:forEach>
     			</c:if>
     			<nav aria-label="Page navigation example">
                	<ul class="pagination">
                    	<li>
                        <c:choose>
                        	<c:when test="${page < 1}">
                            <a class="page-link"  aria-label="Previous">
                            	<span aria-hidden="true">&laquo;</span>
                            </a>
                            </c:when>
                            <c:when test="${page > 1}">
                            <a class="page-link"  href="/ItemList?page=${page-1} "aria-label="Previous">
                            	<span aria-hidden="true">&laquo;</span>
                            </a>
                            </c:when>
                        </c:choose>
                            	
                        </li>
                        <c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
                    	<c:if test="${a == page}">
                    	<li class="page-item"><a class="page-link" href="#">[${a}]</a></li>
                    	</c:if> <%-- 현재쪽 선택 --%>
                    			
                    	<c:if test="${a != page}"> <%-- 현재쪽 비선택 --%>
                    	<li class="page-item"><a class="page-link" href="/ItemList?page=${a}">[${a}]</a></li>
                    	</c:if>
                    	</c:forEach>
                        <c:if test="${page >= maxpage}">
                        <li class="page-item">
                        	<a class="page-link"  aria-label="Next">
                            	<span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                        </c:if>
                    	<c:if test="${page < maxpage}" >
                    	<li class="page-item">
                        	<a class="page-link" href="/ItemList?page=${page+1}" aria-label="Next">
                            	<span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    	</c:if>
                        	
                    </ul>
            	</nav>      			
     		</div>
		</div>
	</section>

</div>
</body>
</html>