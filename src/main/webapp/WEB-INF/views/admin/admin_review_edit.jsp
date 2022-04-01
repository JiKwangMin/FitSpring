<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:include page="../include/header.jsp"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰관리</title>
</head>
<body>
 <div class="container">
 		
 		<form name="myform" id="myform" method="post" action="admin_review_edit_ok" onsubmit="return rw_check();">
		<input type="hidden" name="r_no" value="${r.r_no}" />
  		<input type="hidden" name="page" value="${page}" />
  		
		<textarea id="r_cont" name="r_cont" style="margin-bottom: 10px;">${r.r_cont }</textarea>
		
		<div style="float: left; margin-bottom: 5px;">
		<!-- <input type="file"> --> 사진 나중에 업로드(선택된 파일 없음)
		</div> 
		
		<div style="float: right;margin-bottom: 10px">
		키 : <input class="rd_height" id="r_height" name="r_height" style="width: 45px;" value="${r.r_height }">&nbsp;cm &nbsp;
		몸무게 : <input class="rd_weight" id="r_weight" name="r_weight" style="width: 45px" value="${r.r_weight }">&nbsp;kg &nbsp;
		평소 사이즈 : <input class="rd_size" id="r_size" name="r_size" style="width: 46px" value="${r.r_size }">
		<br><div style="margin-bottom: 5px;"></div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		작성자 : <input class="rd_writer" id="r_writer" name="r_writer" style="width: 90px;" value="${r.r_writer }"> &nbsp;
		 비밀번호입력 : <input class="rd_pwd" id="r_pwd" name="r_pwd" type="password" style="width: 80px;" value="${r.r_pwd }">
		</div>
		
		<br>
		<div class="clear"></div>
		
		<div style="float: right;">
			<input class="reviewBtn" type="submit" value="리뷰 수정">
			<input class="reviewBtn" type="reset" value="취소" onclick="location='admin_review_list';">
			
		</div>

		<div style="float: right; padding-top: 6px; margin-right: 12px;">
			<fieldset>
				<input type="radio" name="r_rate" value="5" id="rate1" checked><label for="rate1">⭐</label>
				<input type="radio" name="r_rate" value="4" id="rate2"><label for="rate2">⭐</label>
				<input type="radio" name="r_rate" value="3" id="rate3"><label for="rate3">⭐</label>
				<input type="radio" name="r_rate" value="2" id="rate4"><label for="rate4">⭐</label>
				<input type="radio" name="r_rate" value="1" id="rate5"><label for="rate5">⭐</label>
			</fieldset>
		</div>	
	</form>
 
 </div>
</body>
</html>