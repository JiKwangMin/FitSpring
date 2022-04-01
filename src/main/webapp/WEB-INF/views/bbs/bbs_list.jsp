<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자료실 목록</title>
<link rel="stylesheet" type="text/css" href="./resources/css/board.css" />
</head>
<body>
<form method="get" action="bbs_list">
 <div id="bList_wrap">
  <h2 class="bList_title">자료실 목록</h2>
  <div class="bList_count">글개수 : ${listCount}</div>
  <table id="bList_t">
   <tr>
    <th width="6%" height="26">번호</th>
    <th width="50%">제목</th>
    <th width="14%">글쓴이</th>
    <th width="17%">작성일</th>
    <th width="14%">조회수</th>
   </tr>
   
   <c:if test="${!empty blist }">
    <c:forEach var="b" items="${blist}">
     <tr>
      <td align="center">
       <c:if test="${b.bbs_step == 0}"> <%--원본글일 때만 글그룹번호(원본글과 답변글을 묶어주는 그룹번호) 출력 --%>
        ${b.bbs_ref}
       </c:if>
      </td>
      <td>
      <c:if test="${b.bbs_step !=0}"> <%-- 답변글일때만 실행 --%>
       <c:forEach begin="1" end="${b.bbs_step}" step="1">
        &nbsp;<%-- 답변글 만큼 공백을 띄운다. 들여쓰기 --%>
       </c:forEach>
       <img src="./resources/images/AnswerLine.gif" /><%--답변글 이미지 --%>
      </c:if>
      <a href="bbs_cont?bbs_no=${b.bbs_no}&state=cont&page=${page}">${b.bbs_title}</a>
      </td>
      <td align="center">${b.bbs_name}</td>
      <td align="center">${fn:substring(b.bbs_date,0,10)}</td>
                        <%-- 0이상 10미만 사이의 년월일만 반환 --%>
      <td align="center">${b.bbs_hit}</td>
     </tr>
    </c:forEach>
   </c:if>
   
   <c:if test="${empty blist}">
    <tr>
     <th colspan="5">자료실 목록이 없습니다.</th>
    </tr>
   </c:if>   
  </table>
  
  <%-- 페이징 쪽나누기 --%>
  <div id="bList_paging">
    <%--검색전 페이징 --%>
    <c:if test="${(empty find_field) && (empty find_name)}">
     <c:if test="${page <= 1}">
      [이전]&nbsp;
     </c:if>
     <c:if test="${page>1}">
      <a href="bbs_list?page=${page-1}">[이전]</a>&nbsp;
     </c:if>
     
     <%-- 쪽번호 출력 --%>
     <c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
       <c:if test="${a == page}"><${a}></c:if> <%--현재 쪽번호가 선택된 경우 --%>
       
       <c:if test="${a !=page}"> <%--현재 쪽번호가 선택 안된 경우 --%>
        <a href="bbs_list?page=${a}">[${a}]</a>&nbsp;
       </c:if>
     </c:forEach>
     
     <c:if test="${page >= maxpage}">[다음]</c:if>
     <c:if test="${page < maxpage}">
      <a href="bbs_list?page=${page+1}">[다음]</a>
     </c:if>
    </c:if>
    
    <%-- 검색후 페이징 --%>
     <c:if test="${(!empty find_field) && (!empty find_name)}">
     <c:if test="${page <= 1}">
      [이전]&nbsp;
     </c:if>
     <c:if test="${page>1}">
      <a href="bbs_list?page=${page-1}&find_field=${find_field}&find_name=${find_name}">[이전]</a>&nbsp;
     </c:if>
     
     <%-- 쪽번호 출력 --%>
     <c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
       <c:if test="${a == page}"><${a}></c:if> <%--현재 쪽번호가 선택된 경우 --%>
       
       <c:if test="${a !=page}"> <%--현재 쪽번호가 선택 안된 경우 --%>
        <a href="bbs_list?page=${a}&find_field=${find_field}&find_name=${find_name}">[${a}]</a>&nbsp;
       </c:if>
     </c:forEach>
     
     <c:if test="${page >= maxpage}">[다음]</c:if>
     <c:if test="${page < maxpage}">
      <a href="bbs_list?page=${page+1}&find_field=${find_field}&find_name=${find_name}">[다음]</a>
     </c:if>
    </c:if>    
  </div>
  
  <div id="bList_menu">
   <input type="button" value="글쓰기" onclick="location='bbs_write?page=${page}';" /> <%-- 책갈피 기능때문에 get방식으로 쪽번호를 전달 --%>
   <c:if test="${(!empty find_field) && (!empty find_name)}"> <%-- 검색후 실행 --%>
    <input type="button" value="전체목록" onclick="location='bbs_list?page=${page}';" />
   </c:if>
  </div>
  
  <%-- 검색 폼 추가 --%>
  <div id="bFind_wrap">
   <select name="find_field">
    <option value="bbs_title" <c:if test="${find_field == 'bbs_title'}"> ${'selected'}</c:if>>제목</option>
    <option value="bbs_cont" <c:if test="${find_field == 'bbs_cont'}"> ${'selected'}</c:if>>내용</option>
   </select>
   <input name="find_name" size="14" value="${find_name}" />
   <input type="submit" value="검색" />
  </div>
 </div>
</form>
</body>
</html>