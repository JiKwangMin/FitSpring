/**
 *  gongji.js
 */
function gw_check(){
	if($.trim($("#gongji_name").val())==""){
		alert("작성자를 입력하세요!");
		$("#gongji_name").val("").focus();
		return false;
	}
	if($.trim($("#gongji_title").val())==""){
		alert("공지제목을 입력하세요!");
		$("#gongji_title").val("").focus();
		return false;
	}
	if($.trim($("#gongji_pwd").val())==""){
		alert("비밀번호를 입력하세요!");
		$("#gongji_pwd").val("").focus();
		return false;
	}
	if($.trim($("#gongji_cont").val())==""){
		alert("공지내용을 입력하세요!");
		$("#gongji_cont").val("").focus();
		return false;
	}
}