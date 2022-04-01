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

<form method="post" action="total_qna_reply_ok" onsubmit="return qw_check(); ">

<input type="hidden" name="q_ref" value="${q.q_ref }">
<input type="hidden" name="q_step" value="${q.q_step }">
<input type="hidden" name="q_level" value="${q.q_level }">
<input type="hidden" name="page" value="${page }">

<table style="width: 100%;" class="qnatable">
    <colgroup>
        <col style="width: 10%">
        <col style="width:50%">
    </colgroup>
 <tr>
     <th>제목</th>
     <td>
        <select id="q_title" name="q_title" style="width: 100%; height: 30px;">
            <option value="&nbsp;&nbsp;▶ Re:${q.q_title }">${q.q_title }</option>
        </select>
    </td>
 </tr>
 <tr>
     <th>작성자</th>
     <td><input id ="q_writer" name="q_writer" size="15px" value=${q.q_writer }></td>
 </tr>
 <tr>
    <th colspan="2">
        <textarea id="q_cont" name="q_cont" rows="9" cols="36"></textarea>
    </th>
 </tr>
 <tr>
     <th>첨부파일1</th> <td>파일선택!<!--<input type="file">--></td>
 </tr>
 <tr>
    <th>첨부파일2</th> <td>파일선택!<!--<input type="file">--></td>
</tr>
<tr style="border-bottom: 1px solid #e8e8e8;">
    <th>비밀번호</th> 
    <td>
        <input type="password" id="q_pwd" name="q_pwd" size="5" value="${q.q_pwd }">
    </td>
</tr>
</table>

<br>

<input type="button" class="listBtn" value="목록"
onclick="location='total_qna_list?page=${page}';" />    
<input type="submit" class="submitBtn "value="답변" />
<input type="reset" class="cancleBtn" value="취소" 
    onclick="$('#q_writer').focus();" />
<div class="clear"></div>

<br><br><br>
</form>
</div>
</body>
</html>