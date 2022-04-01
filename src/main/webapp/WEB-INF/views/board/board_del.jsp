<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 삭제</title>
<script src="./resources/js/jquery.js"></script>
<script>
 function del_check(){
	 if($.trim($("#del_pwd").val())==""){
		 alert("삭제 비번을 입력하세요!");
		 $("#del_pwd").val("").focus();
		 return false;
	 }
 }
</script>
<link rel="stylesheet" type="text/css" 
href="./resources/css/board.css" />
</head>
<body>
  <div id="bDel_wrap">
    <h2 class="bDel_title">게시판 삭제</h2>
    <form method="post" action="board_del_ok"
    onsubmit="return del_check();">
    <input type="hidden" name="board_no" 
value="${b.board_no}" />
    <input type="hidden" name="page" value="${page}" />
    <table id="bDel_t">
     <tr>
      <th>비밀번호</th>
      <td>
<input type="password" name="del_pwd" id="del_pwd"
size="14" />      
      </td>
     </tr>
    </table>
    <div id="bDel_menu">
    <input type="submit" value="삭제" />
    <input type="reset" value="취소"
onclick="$('#del_pwd').focus();" />    
    </div>    
    </form>
  </div> 
</body>
</html>






















