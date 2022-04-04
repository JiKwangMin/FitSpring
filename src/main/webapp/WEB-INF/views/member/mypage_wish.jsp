<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		.st-select-text .st-selected-delete {
		    border: 1px solid #ccc;
		    border-radius: 2px;
		    color: #0073e9;
		    text-align: center;
		    background: #fff;
		    cursor: pointer;
		    display: inline-block;
		    margin-left: 10px;
		    padding: 5px 8px 4px;
		    letter-spacing: -0.5px;
		    vertical-align: middle;
		}
		.paging-area{
			align-items: center;
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
					    <a class="nav-link px-0" aria-current="page" href="/mypage_order">주문목록</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link px-0 active" href="/mypage_wish">관심상품</a>
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
					<div class="pb-5 d-flex align-items-end">
						<h3><span style="font-weight:bold;"><i class="bi bi-suit-heart-fill" style="color:red;"></i>관심상품</span></h3>
						<span class="ms-3"> 총<span> ${cnt}</span>개</span>
					</div>
					<div class="wish-area">
						<div class="table-responsive text-nowrap">
							<table class="table" style="width:100%;">
						        <caption class="captionhide"> 내가 찜한 상품 목록을 확인하실 수 있습니다. </caption>
						        <thead>
							        <tr class="align-middle">
							            <th class="border-bottom">
								           	<div>
									           <input type="checkbox" checked="checked" name="item" class="all-select-chk" onclick="selectAll(this)">
									           <span class="ms-5 select-txt st-select-text" style="position:absolute;">전체선택
									     	   </span>
									        </div>
							            </th>
							        </tr>
						        </thead>
						        <c:if test="${!empty wishlist}">
							        <tbody class="">
						        		<c:forEach items="${wishlist}" var="wish">
											
								        	<tr class="align-middle">
								            	<td class="" style="vertical-align:middle; width:1%;">
								                	<input type="checkbox" checked="checked" name="item" class="select-chk" value="${wish.itemInfoVO.item_no}">
								                </td>
								                <td class="" style="width:15%;">
								                	<a href="/item_detail?item_no=${wish.itemInfoVO.item_no}" class="item-link">
								                		<img src="../resources/upload${wish.itemInfoVO.main_item_img}" width="100" height="100" class="img" alt="#">
								                    </a>
								                </td>
								                <td class="" style="vertical-align:middle;">
								                	<a href="/item_detail?item_no=${wish.itemInfoVO.item_no}" class="">${wish.itemInfoVO.item_name}</a>
								                    <div class="">
								                 		<span class=""><fmt:formatNumber value="${wish.itemInfoVO.item_price}" pattern="#,###" />원</span>
								                 		
								                    </div>
								                 </td>
								                 <td class="edit st-edit text-end" style="vertical-align:middle;">
					                             	<button type="button" class="btn" onclick="wishDel(${wish.itemInfoVO.item_no})" style="border-color:red;">삭제</button>
								                 </td>
								              </tr>
							              </c:forEach>
							        </tbody>
						        </c:if>
						        <c:if test="${empty wishlist}">
						        	<tbody>
						        		<tr class="text-center"  >
						        			<td class="fs-3" style="width:100%; padding:140px 0px;">
						        				<strong>찜한 상품이 없습니다.</strong>
						        				<div>상품정보 페이지에서 추가해 보세요.</div>
						        			</td>
						        		</tr>
						        	</tbody>
						        </c:if>
						    </table>
						    <div class="d-flex justify-content-between">
							    <div class="">
							        <input type="checkbox" checked="checked"id="all_ck" class="all-select-chk" name="item" onclick="selectAll(this)">
							        <span class="select-txt st-select-text st-bottom-select-text">
							            전체선택 <a href="#" class="selected-delete st-selected-delete" onclick="ckdDelete()">선택삭제</a>
							        </span>
							    </div>
							    <div class="paging-area">
							        <button type="button" class="btn prev-page" style="border-color:gray;"<c:if test="${cnt < 5}">disabled</c:if>><i class="bi bi-chevron-left"></i></button>
									<button type="button" class="btn next-page" style="border-color:gray;"<c:if test="${cnt < 5}">disabled</c:if>><i class="bi bi-chevron-right"></i></button>
							    </div>
							    <div style="width:20%;">
							    </div>
						    </div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script>
		//세션 아이디값 받아오기
		var login_id = "<%= session.getAttribute("id") %>"
			$(document).ready(function(){
				
			});
			function selectAll(selectAll){
				const checkboxes = document.getElementsByName('item');
				checkboxes.forEach((checkbox) => {
					checkbox.checked = selectAll.checked;
			    })
			}
			
			//1개 상품 선택해제시 전체 선택 체크 해제
			$(".select-chk").click(function(){
				$(".select-chk").each(function(){
					$(".all-select-chk").prop("checked", false);
				});
			});
			
			function wishDel(item_no){
				console.log(item_no);
				$.ajax({
					type : "post",
					url : "/wishlist_del",
					dataType: "json",
					data : {
						"wish_mem_id" : login_id,
						"wish_item_no": item_no 
					},
					error : function(request, status, error) {
						alert("code:"
								+ request.status
								+ "\n"
								+ "message:"
								+ request.responseText
								+ "\n"
								+ "error:"
								+ error);
					},
					success : function(data){
						if(data == 1){
							alert("찜 목록에서 삭제하였습니다.");
							location.reload();
						}else if(data == 2){
						}
					}
				});
			}
			
			function ckdDelete(){
				
				if($('input:checkbox[class="select-chk"]').is(":checked")==true){
					var arr = new Array();
					$('input:checkbox[class="select-chk"]:checked').each(function(){
						arr.push($(this).attr('value'));
					});
					console.log("선택된 상품",arr);
					
					$.ajax({
						type : "post",
						url : "/mypage_wish/chkDelete",
						dataType : "json",
						data : {
							"item_no" : arr,
						},
						error : function(request, status, error) {
							alert("code:"
									+ request.status
									+ "\n"
									+ "message:"
									+ request.responseText
									+ "\n"
									+ "error:"
									+ error);
						},
						success : function(data){
							console.log(data);
							if(data == '1'){
								alert("선택하신 상품을 삭제하셨습니다.");
								location.reload();
							}else if(data != 1){
								alert("삭제에 실패하셨습니다.");
							}
						}
					});
				}else{
					alert("선택된 상품이 없습니다.");
				}
			}
		</script>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="../../js/scripts.js"></script>
    </body>
</html>