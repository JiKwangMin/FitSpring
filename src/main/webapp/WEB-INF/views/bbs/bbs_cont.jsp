<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자료실 내용보기</title>
<link rel="stylesheet" type="text/css" href="./resources/css/bbs.css" />
</head>
<body>
 <div id="bsC_wrap">
  <h2 class="bsC_title">자료실 내용</h2>
  <table id="bsC_t">
   <tr>
    <th>제목</th> <td>${b.bbs_title}</td>
   </tr>
   <tr>
    <th>글내용</th> <td>${bbs_cont}</td>
   </tr>
   <tr>
    <th>조회수</th> <td>${b.bbs_hit}</td>
   </tr>
   
   <c:if test="${!empty b.bbs_file}"> <%-- 첨부파일이 있는 경우 실행 --%>
    <tr>
     <th>첨부 이미지</th>
     <td>
      <img src="./resources/upload${b.bbs_file}" width="130" height="100" alt="첨부 이미지" />
     </td>
    </tr>
   </c:if>
  </table>
  
  <div id="bsC_menu">
    <input type="button" value="답변" onclick="location='bbs_cont?bbs_no=${b.bbs_no}&page=${page}&state=reply';" />  
    <input type="button" value="수정" onclick="location='bbs_cont?bbs_no=${b.bbs_no}&page=${page}&state=edit';" />  
    <input type="button" value="삭제" onclick="location='bbs_cont?bbs_no=${b.bbs_no}&page=${page}&state=del';" />  
    <input type="button" value="목록" onclick="location='bbs_list?page=${page}';" />    
  </div>
 </div>
</body>
</html>



