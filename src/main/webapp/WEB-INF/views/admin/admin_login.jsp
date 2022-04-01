<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인</title>
<link rel="stylesheet" type="text/css" href="./resources/css/admin.css" />
<script src="./resources/js/jquery.js"></script>
<script>
  function adminLogin(){
	  if($.trim($('#admin_id').val()) == ""){
		  alert("관리자 아이디를 입력하세요!");
		  $('#admin_id').val("").focus();
		  return false;
	  }
	  
	  if($.trim($('#admin_pwd').val()) == ""){
		  alert('관리자 비번을 입력하세요!');
		  $('#admin_pwd').val("").focus();
		  return false;
	  }
  }
</script>
</head>
<body>
<div id="aLogin_wrap">
 <h2 class="aLogin_title">관리자 로그인</h2>
 <form method="post" action="admin_login_ok" onsubmit="return adminLogin();">
  <table id="aLogin_t">
   <tr>
    <th>관리자 아이디</th>
    <td><input type="text" name="admin_id" id="admin_id" size="14" tabindex="1" /></td> <%-- tabindex="1" 로 주면 탭키를 눌렀을 때 첫번째로 포커스를 가짐. --%>
    <th rowspan="2"> <%-- rowspan="2" 는 2개행을 합침 --%>
     <input type="submit" value="로그인" class="login_btn" />
    </th>
   </tr>
   
   <tr>
    <th>관리자 비밀번호</th>
    <td><input type="password" name="admin_pwd" id="admin_pwd" size="14" tabindex="2" /></td>
        <%-- tabindex="2"로 설정하면 탭키를 눌렀을 때 두번째로 포커스를 가짐. --%>
   </tr>
  </table>
 </form>
</div>
</body>
</html>