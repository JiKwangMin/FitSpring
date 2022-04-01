<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 자료실 답변폼 </title>
<link rel="stylesheet" type="text/css" href="./resources/css/bbs.css" />
<script src="./resources/js/jquery.js"></script>
<script src="./resources/js/bbs.js"></script>
</head>
<body>
 <div id="bsW_wrap">
   <h2 class="bsW_title">자료실 답변글</h2>
   <form method="post" action="bbs_reply_ok" onsubmit="return write_check();" >
   <%--답변글 히든값 --%>
   <input type="hidden" name="bbs_ref" value="${b.bbs_ref}" /> <%--글 그룹번호 --%>
   <input type="hidden" name="bbs_step" value="${b.bbs_step}" /> <%--원본글과 답변글을 구분하는 번호값 이면서 몇번째 답변글인가를 알려준다. --%>
   <input type="hidden" name="bbs_level" value="${b.bbs_level}" /> <%-- 답변글 정렬순서 --%>
   
   <%-- 페이징(쪽나누기)에서 책갈피 기능 때문에 히든으로 쪽번호를 전달 --%>
   <input type="hidden" name="page" value="${page}" />
   
     <table id="bsW_t">
      <tr>
       <th>이름</th>
       <td><input name="bbs_name" id="bbs_name" size="14" /></td>
           <%-- type속성을 생략하면 기본값이 text이다. --%>
      </tr>
      
      <tr>
       <th>제목</th>
       <td><input name="bbs_title" id="bbs_title" size="33" value="Re:${b.bbs_title}" /></td>
      </tr>
      
      <tr>
       <th>비밀번호</th>
       <td><input type="password" name="bbs_pwd" id="bbs_pwd" size="14" /></td>
      </tr>
      
      <tr>
       <th>글내용</th>
       <td><textarea name="bbs_cont" id="bbs_cont" rows="8" cols="34"></textarea></td>
      </tr>      
      
     </table>
     
     <div id="bsW_menu">
      <input type="submit" value="답변" />
      <input type="reset" value="취소" onclick="$('#bbs_name').focus();" />
      <input type="button" value="목록" onclick="location='bbs_list?page=${page}';" /> <%--페이징에서 책갈피 기능을 구현을 위해 get방식으로 쪽번호 전달. --%>     
     </div>
   </form>
 </div>
</body>
</html>


