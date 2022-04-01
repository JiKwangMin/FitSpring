<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세목록</title>
</head>
<body>
<h2>상품상세목록</h2>
<table border="1">
   <tr>
   <th width="5%" rowspan="2">번호</th>
   <th width="10%">대분류</th>
   <th width="15%" rowspan="2">이미지</th>
   <th width="10%">사이즈</th>
   <th width="25%">상품이름</th>
   <th width="10%">재고</th>
   <th width="25%">활성화</th>
  </tr>
  <tr>
  <th>소분류</th>
  <th>색상</th>
  <th>가격</th>
  <th>판매수</th>
  <th>등록일</th>
  </tr>
  
   <tr>
   <th width="5%" rowspan="2">${p.p_id }</th>
   <th width="10%">${p.p_category1 }</th>
   <th width="15%" rowspan="2">
   	<img src="./resources/upload/${p.p_path}" width="100" height="130" alt="이미지없음" />
   </th>
   <th width="10%">${p.p_size }</th>
   <th width="25%">${p.p_name }</th>
   <th width="10%">${p.p_stock }</th>
   <th width="25%">${p.p_activition }</th>
  </tr>
  <tr>
  <th>${p.p_category2 }</th>
  <th>${p.p_color }</th>
  <th>${p.p_price }</th>
  <th>${p.p_sell }</th>
  <th>${p.p_date }</th>
  </tr>
</table>

<div>  
    <input type="button" value="수정" onclick="location='product_cont?p_id=${p.p_id}&page=${page}&state=edit';" />  
    <input type="button" value="삭제" onclick="location='product_cont?p_id=${p.p_id}&page=${page}&state=del';" />  
    <input type="button" value="목록" onclick="location='product_list?page=${page}';" />    
</div>

</body>
</html>