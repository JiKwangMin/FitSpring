<%--상품아이디 // 상품이미지 // 대분류 // 소분류 // 상품이름 // 등록일  --%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품목록</title>
</head>
<body>

<form method="get" action="product_list">
 <div>
  
  <h2>상품목록</h2>
  <div>총 상품 종류 : ${listCount }</div>
  
  <table border="1">
  <tr>
   <th width="5%" rowspan="2">번호</th>
   <th width="15%">대분류</th>
   <th width="5%" rowspan="2">이미지</th>
   <th width="30%" rowspan="2">상품이름</th>
   <th width="25%" rowspan="2">등록일</th>
  </tr>
  <tr><th>소분류</th></tr>
 
   <c:if test="${!empty plist }">
    <c:forEach var="p" items="${plist }">
     <tr>
      <td rowspan="2">${p.p_id }</td>
      <td>${p.p_category1}</td>
      <td rowspan="2">
      	<img src="./resources/upload/${p.p_path}" width="100" height="130" alt="이미지없음"/>
	  </td>
      <td rowspan="2"><a href="product_cont?p_id=${p.p_id}&state=cont&page=${page}">${p.p_name}</a></td>
      <td rowspan="2">${p.p_date}</td>
     </tr>
     <tr><td>${p.p_category2}</td></tr>
    </c:forEach>
   </c:if>
 
  <c:if test="${empty plist}">
    <tr>
     <th colspan="5">자료실 목록이 없습니다.</th>
    </tr>
  </c:if>    
  </table>
  
  <div>
    <%--검색전 페이징 --%>
    <c:if test="${(empty find_field) && (empty find_name)}">
     <c:if test="${page <= 1}">
      [이전]&nbsp;
     </c:if>
     <c:if test="${page>1}">
      <a href="product_list?page=${page-1}">[이전]</a>&nbsp;
     </c:if>
     
     <%-- 쪽번호 출력 --%>
     <c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
       <c:if test="${a == page}"><${a}></c:if> <%--현재 쪽번호가 선택된 경우 --%>
       
       <c:if test="${a !=page}"> <%--현재 쪽번호가 선택 안된 경우 --%>
        <a href="product_list?page=${a}">[${a}]</a>&nbsp;
       </c:if>
     </c:forEach>
     
     <c:if test="${page >= maxpage}">[다음]</c:if>
     <c:if test="${page < maxpage}">
      <a href="product_list?page=${page+1}">[다음]</a>
     </c:if>
    </c:if>
    
    <%-- 검색후 페이징 --%>
     <c:if test="${(!empty find_field) && (!empty find_name)}">
     <c:if test="${page <= 1}">
      [이전]&nbsp;
     </c:if>
     <c:if test="${page>1}">
      <a href="product_list?page=${page-1}&find_field=${find_field}&find_name=${find_name}">[이전]</a>&nbsp;
     </c:if>
     
     <%-- 쪽번호 출력 --%>
     <c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
       <c:if test="${a == page}"><${a}></c:if> <%--현재 쪽번호가 선택된 경우 --%>
       
       <c:if test="${a !=page}"> <%--현재 쪽번호가 선택 안된 경우 --%>
        <a href="product_list?page=${a}&find_field=${find_field}&find_name=${find_name}">[${a}]</a>&nbsp;
       </c:if>
     </c:forEach>
     
     <c:if test="${page >= maxpage}">[다음]</c:if>
     <c:if test="${page < maxpage}">
      <a href="product_list?page=${page+1}&find_field=${find_field}&find_name=${find_name}">[다음]</a>
     </c:if>
    </c:if>    
   </div>
  
  <div>
   <input type="button" value="상품등록" onclick="location='product_write?page=${page}';" /> <%-- 책갈피 기능때문에 get방식으로 쪽번호를 전달 --%>
   <c:if test="${(!empty find_field) && (!empty find_name)}"> <%-- 검색후 실행 --%>
    <input type="button" value="상품목록" onclick="location='product_list?page=${page}';" />
   </c:if>
  </div>
  
  <%-- 검색 폼 추가 --%>
  <div>
   <select name="find_field">
    <option value="p_category1" <c:if test="${find_field == 'p_category1'}"> ${'selected'}</c:if>>대분류</option>
    <option value="p_category2" <c:if test="${find_field == '[p_category2'}"> ${'selected'}</c:if>>소분류</option>
    <option value="p_name" <c:if test="${find_field == 'p_name'}"> ${'selected'}</c:if>>상품이름</option>
   </select>
   <input name="find_name" size="14" value="${find_name}" />
   <input type="submit" value="검색" />
  </div>
 
 </div>
</form>
<br><br><br><br><br>
</body>
</html>