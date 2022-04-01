/**
 * qna.js
 */

function qw_check(){
	if($.trim($("#q_writer").val())==""){
		alert("작성자를 입력하세요!");
		$("#q_writer").val("").focus();
		return false;
	}
	if($.trim($("#q_cont").val())==""){
		alert("내용을 입력하세요!");
		$("#q_cont").val("").focus();
		return false;
	}
	if($.trim($("#q_pwd").val())==""){
		alert("비밀번호를 입력하세요!");
		$("#q_pwd").val("").focus();
		return false;
	}
}














