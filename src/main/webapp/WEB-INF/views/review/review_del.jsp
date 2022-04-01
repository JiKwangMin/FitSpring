<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:include page="../include/header.jsp"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Review 삭제</title>
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
</head>
<body>
<div class="container">
<br>
<h3>Review 삭제</h3>
<hr>
<form method="post" action="review_del_ok" onsubmit="return del_check();">
    <input type="hidden" name="r_no" value="${r.r_no}" />
    <input type="hidden" name="page" value="${page}" />
    <table>
     <tr>
      <th>비밀번호&nbsp;&nbsp;</th>
      <td>
		<input type="password" name="del_pwd" id="del_pwd" size="14" />      
      </td>
     </tr>
    </table>
    <br>
    <div>
    	<input type="submit" value="삭제" />
    	<input type="reset" value="취소" onclick="$('#del_pwd').focus();" />    
    </div>    
</form>

</div> 
</body>
</html>