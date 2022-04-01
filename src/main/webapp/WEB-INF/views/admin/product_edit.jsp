<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정</title>
<script src="./resources/js/jquery.js"></script>
<script src="./resources/js/product.js"></script>
</head>
<body>

<h2>상품 수정</h2>
 
 <form method="post" action="product_edit_ok" onsubmit="return write_check();" enctype="multipart/form-data">
  
   <%-- 히든값 --%>
     <input type="hidden" name="p_id" value="${p.p_id}" /> <%--번호 --%>
     <input type="hidden" name="page" value="${page}" /> <%--페이징에서 책갈피 기능때문에 히든으로 쪽번호 전달 --%>
  
  <table>
   <tr>
    <th>상품아이디</th>
    <td><input name="p_id" id="p_id" size="14" value="${p.p_id }"></td>
   </tr>
   
   <tr>
    <th>상품이미지</th>
    <td><input type="file" name="p_path" id="p_path" size="14" value="${p.p_path }"></td>
   </tr>
   
   <tr>
    <th>대분류</th>
    <td><input name="p_category1" id="p_category1" size="14" value="${p.p_category1 }"></td>
   </tr>

   <tr>
    <th>소분류</th>
    <td><input name="p_category2" id="p_category2" size="14" value="${p.p_category2 }"></td>
   </tr>
   
   <tr>
    <th>상품이름</th>
    <td><input name="p_name" id="p_name" size="14" value="${p.p_name }"></td>
   </tr>
   
   <tr>
    <th>상품사이즈</th>
    <td><input name="p_size" id="p_size" size="14" value="${p.p_size }"></td>
   </tr>
   
   <tr>
    <th>상품색상</th>
    <td><input name="p_color" id="p_color" size="14" value="${p.p_color }"></td>
   </tr>
   
   <tr>
    <th>가격</th>
    <td><input name="p_price" id="p_price" size="14" value="${p.p_price }"></td>
   </tr>
  
   <tr>
    <th>상품활성화</th>
    <td><input name="p_activition" id="p_activition" size="14" value="${p.p_activition }"></td>
   </tr>
   
   <tr>
    <th>재고</th>
    <td><input name="p_stock" id="p_stock" size="14" value="${p.p_stock }"></td>
   </tr>
  
   <tr>
    <th>판매수</th>
    <td><input name="p_sell" id="p_sell" size="14" value="${p.p_sell }"></td>
   </tr> 
  
  </table>
  
  <div>
   <input type="submit" value="수정">
   <input type="reset" value="취소" onclick="$('#p_id').focus();">
   <input type="button" value="목록" onclick="location='product_list?page=${page}';">
  </div> 
 </form>
</body>
</html>