<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 자료실 수정 </title>
<link rel="stylesheet" type="text/css" href="./resources/css/bbs.css" />
<script src="./resources/js/jquery.js"></script>
<script src="./resources/js/bbs.js"></script>
</head>
<body>
 <div id="bsW_wrap">
   <h2 class="bsW_title">자료실 수정</h2>
   <form method="post" action="bbs_edit_ok" onsubmit="return write_check();" enctype="multipart/form-data">
    <%--
                파일 첨부하는 자료실 기능을 만들기 위해서 필요한 사항)
         1. 폼태그내에서 enctype="multipart/form-data" 속성을 지정해야 한다.
         2. method=post만 가능하고 get방식은 안된다. 그리고 method속성을 생략하면 기본값이 get이기 때문에 생략하면 안된다.
         3. 첨부되는 파일과 입력한 문자 모두 바이너리 모드(binary mode) 즉 이진파일이라고 한다.               
     --%>
     <%-- 히든값 --%>
     <input type="hidden" name="bbs_no" value="${b.bbs_no}" /> <%--번호 --%>
     <input type="hidden" name="page" value="${page}" /> <%--페이징에서 책갈피 기능때문에 히든으로 쪽번호 전달 --%>
     
     <table id="bsW_t">
      <tr>
       <th>이름</th>
       <td><input name="bbs_name" id="bbs_name" size="14" value="${b.bbs_name}" /></td>
           <%-- type속성을 생략하면 기본값이 text이다. --%>
      </tr>
      
      <tr>
       <th>제목</th>
       <td><input name="bbs_title" id="bbs_title" size="33" value="${b.bbs_title}" /></td>
      </tr>
      
      <tr>
       <th>비밀번호</th>
       <td><input type="password" name="bbs_pwd" id="bbs_pwd" size="14" /></td>
      </tr>
      
      <tr>
       <th>글내용</th>
       <td><textarea name="bbs_cont" id="bbs_cont" rows="8" cols="34">${b.bbs_cont}</textarea></td>
      </tr>
      
      <tr>
       <th>파일 첨부</th>
       <td><input type="file" name="bbs_file" /><br/>${b.bbs_file}</td>
      </tr>
     </table>
     
     <div id="bsW_menu">
      <input type="submit" value="수정" />
      <input type="reset" value="취소" onclick="$('#bbs_name').focus();" />
      <input type="button" value="목록" onclick="location='bbs_list?page=${page}';" /> <%--페이징에서 책갈피 기능을 구현을 위해 get방식으로 쪽번호 전달. --%>     
     </div>
   </form>
 </div>
</body>
</html>


