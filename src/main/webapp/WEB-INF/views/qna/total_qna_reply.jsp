<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:include page="../include/header.jsp"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA 답변폼</title>
<script src="./resources/js/jquery.js"></script>
<script src="./resources/js/qna.js"></script>
<link rel="stylesheet" type="text/css" href="./resources/css/qna_write.css" />
</head>
<body>
<div class="container">
<h3>QnA답변</h3>

<form method="post" action="total_qna_reply_OK" onsubmit="return qw_check(); ">

<input type="hidden" name="q_ref" value="${qi.q_ref}">
<input type="hidden" name="q_step" value="${qi.q_step }">
<input type="hidden" name="q_level" value="${qi.q_level }">
<input type="hidden" name="q_no" value="${qi.q_no }">
<input type="hidden" name="item_no" value="${item_no }">

<table style="width: 100%;" class="qnatable">
    <colgroup>
        <col style="width: 10%">
        <col style="width:50%">
    </colgroup>
 <tr>
     <th>제목</th>
     <td>
        <select id="q_title" name="q_title" style="width: 100%; height: 30px;">
            <option value="&nbsp;&nbsp;▶ Re:${qi.q_title }">${qi.q_title }</option>
        </select>
    </td> 
 </tr>
 <tr>
     <th>작성자</th>
     <td><input id ="q_writer" name="q_writer" size="15px" value="${mem_id }" readonly></td>
 </tr>
 <tr>
    <th colspan="2">
        <textarea id="q_cont" name="q_cont" rows="9" cols="36"></textarea>
    </th>
 </tr>

<tr style="border-bottom: 1px solid #e8e8e8;">
    <th>비밀번호</th> 
    <td>
        <input type="password" id="q_pwd" name="q_pwd" size="5">
    </td>
</tr>
</table>

<br>

  
<input type="reset" class="cancleBtn" value="취소" 
    onclick="history.back();" />
<input type="submit" class="submitBtn "value="답변" />

<div class="clear"></div>

<br><br><br>
</form>
</div>
</body>
</html>