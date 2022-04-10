<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../include/header.jsp"/>

<script src="./resources/js/jquery.js"></script>
<script src="./resources/js/review.js"></script>

<div class="container">
<!-- 리뷰 작성 -->
	<br><br><br><br>			
	<div class="row">
		<div class="col-md-2 col-sm-12">
			<p style="font-size: 35px;">REVIEW<p>
		</div>
		<div class="col-md-10 col-sm-12" style="margin: 20px 0 5px 0;">
			<span style="font-size: 17px;">|&nbsp; 악의적인 비방글은 무통보 삭제된다는 점
				유의해주세요^^</span>
		</div>
	</div>

	<form id="myform" method="post" action="review_write_OK" onsubmit="return rw_check();" enctype="multipart/form-data" accept-charset="UTF-8">
		 
		<textarea id="r_cont" name="r_cont" style="margin-bottom: 10px;" placeholder="여기에 리뷰를 입력해주세요.로그인 후 이용가능합니다."></textarea>
		
		<div style="float: left; margin-bottom: 5px;">
			<input type="file" id="rimg" name="rimg" /><span style="color:red;"><b>사진을 등록해주세요.</b></span>
		</div> 
			
		<div style="float: right;margin-bottom: 10px">
		키 : <input class="rd_height" id="r_height" name="r_height" style="width: 45px;">&nbsp;cm &nbsp;
		몸무게 : <input class="rd_weight" id="r_weight" name="r_weight" style="width: 45px">&nbsp;kg &nbsp;
		평소 사이즈 : <input class="rd_size" id="r_size" name="r_size" style="width: 46px">
		<input type="hidden" id="item_no" name="item_no" value="${item_no}">
		<br><div style="margin-bottom: 5px;"></div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		
		작성자 : <input class="rd_writer" id="r_writer" name="r_writer" value="${mem_id}" readonly style="width: 90px;">&nbsp;
		
		비밀번호입력 : <input class="rd_pwd" id="r_pwd" name="r_pwd" type="password" style="width: 80px;">
		</div>
		<br>
		<div class="clear"></div>
		
		<div style="float: right;">
			<input class="reviewBtn" type="submit" value="리뷰 등록하기">
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
	<div class="clear"></div>
	<br><br><br><br>
<!-- 리뷰 작성 끝 -->
</div>
</body>
</html>






