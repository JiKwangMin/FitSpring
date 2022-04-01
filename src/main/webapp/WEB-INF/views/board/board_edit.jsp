<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 게시판 수정폼</title>
<script src="./resources/js/jquery.js"></script>
<script src="./resources/js/board.js"></script>
<link rel="stylesheet" type="text/css" 
href="./resources/css/board.css" />
</head>
<body>
 <div id="bWrite_wrap">
  <h2 class="bWrite_title">게시판 수정폼</h2>
  <form method="post" action="board_edit_ok"
  onsubmit="return bw_check();">
  <input type="hidden" name="board_no" 
  value="${b.board_no}" />
  <input type="hidden" name="page" 
  value="${page}" />
   <table id="bWrite_t">
    <tr>
     <th>이름</th>
     <td>
     <input name="board_name" id="board_name" size="14" 
     value="${b.board_name}" />
     </td>
    </tr>
    <tr>
     <th>제목</th>
     <td>
     <input name="board_title" id="board_title" size="35" 
     value="${b.board_title}" />
     </td>
    </tr>
    <tr>
     <th>비밀번호</th>
     <td>
     <input type="password" name="board_pwd" id="board_pwd"
     size="14" />
     </td>    
    </tr>
    <tr>
     <th>내용</th>
     <td>
     <textarea name="board_cont" id="board_cont" rows="9"
     cols="36">${b.board_cont}</textarea>
     </td>
    </tr>
   </table>
   <div id="bWrite_menu">
    <input type="submit" value="수정" />
    <input type="reset" value="취소" 
    onclick="$('#board_name').focus();" />
    <input type="button" value="목록"
    onclick="location='board_list?page=${page}';" />
   </div>
  </form>
 </div>
</body>
</html>







