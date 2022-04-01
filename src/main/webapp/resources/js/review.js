/**
 * review.js
 */

function rw_check(){
	if($.trim($("#r_cont").val())==""){
		alert("내용을 입력하세요!");
		$("#r_cont").val("").focus();
		return false;
	}
	if($.trim($("#r_height").val())==""){
		alert("키를 입력하세요!");	
		$("#r_height").val("").focus();
		return false;
	}
	if($.trim($("#r_weight").val())==""){
		alert("몸무게를 입력하세요!");
		$("#r_weight").val("").focus();
		return false;
	}
	if($.trim($("#r_size").val())==""){
		alert("사이즈를 입력하세요!");
		$("#r_size").val("").focus();
		return false;
	}
	if($.trim($("#r_writer").val())==""){
		alert("작성자를 입력하세요!");
		$("#r_writer").val("").focus();
		return false;
	}
	if($.trim($("#r_pwd").val())==""){
		alert("비밀번호를 입력하세요!");
		$("#r_pwd").val("").focus();
		return false;
	}
	
}














