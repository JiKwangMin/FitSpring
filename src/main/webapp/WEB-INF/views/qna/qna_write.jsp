<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../include/header.jsp"/>

<script src="./resources/js/jquery.js"></script>
<script src="./resources/js/qna.js"></script>

<div class="container">
	
	<div class="row">
        <div class="col-md-12 text-right">
            <p class="root"><a href="index">홈</a> > Q & A</p>
        </div>
    </div>
    
<h1>Q & A</h1>
<br>
<div class="qna"><p>Q & A 게시판입니다.</p></div>

<div class="clear"></div>
<br>	

<form method="post" action="qna_write_OK" onsubmit="return qw_check();" enctype="multipart/form-data" accept-charset="utf-8">


										 
<table style="width: 100%;" class="qnatable">
    <colgroup>
        <col style="width: 10%">
        <col style="width:50%">
    </colgroup>
 <tr>
     <th>제목</th>
     <td>
        <select id="q_title" name="q_title" style="width: 100%; height: 30px;">
            <option value="상품문의">상품문의</option>
            <option value="배송문의">배송문의</option>
            <option value="교환&반품문의">교환&반품문의</option>
            <option value="배송전취소&교환문의">배송전취소&교환문의</option>
            <option value="기타문의">기타문의</option>
        </select>
    </td>
 </tr>
 <tr>
     <th>작성자</th>
     <td><input id ="q_writer" name="q_writer" size="15px" value="${mem_id }" readonly><input type="hidden" id="item_no" name="item_no" value="${item_no}"></td>
 </tr>
 <tr>
    <th colspan="2">
        <textarea id="q_cont" name="q_cont" rows="9" cols="36" placeholder="여기에 질문을 남겨주세요."></textarea>
    </th>
 </tr>
 <tr>
     <th>첨부파일</th> <td><input type="file" id="qimg" name="qimg" /><span style="color:red;"><b>사진을 등록해주세요.</b></span>
</td>
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
<input type="submit" class="submitBtn "value="등록" />
<div class="clear"></div>

<br><br><br>
</form>
</div>

</body>
</html>


