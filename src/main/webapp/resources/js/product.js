/**
 * product.js
 */

function write_check(){
	if($.trim($("#p_id").val())==""){
		alert("상품아이디를 입력하세요!");
		$("#bbs_name").val("").focus();
		return false;
	}
	if($.trim($("#p_path").val())==""){
		alert("이미지를 등록하세요!");
		$("#p_path").val("").focus();
		return false;
	}
	if($.trim($("#p_category1").val())==""){
		alert("대분류!");
		$("#p_category1").val("").focus();
		return false;
	}
	if($.trim($("#p_category2").val())==""){
		alert("소분류!");
		$("#p_category2").val("").focus();
		return false;
	}
	if($.trim($("#p_name").val())==""){
		alert("상품이름!");
		$("#p_name").val("").focus();
		return false;
	}
	if($.trim($("#p_size").val())==""){
		alert("사이즈!");
		$("#p_size").val("").focus();
		return false;
	}
	if($.trim($("#p_color").val())==""){
		alert("컬러!!");
		$("#p_color").val("").focus();
		return false;
	}
	if($.trim($("#p_price").val())==""){
		alert("가격!");
		$("#p_price").val("").focus();
		return false;
	}
	if($.trim($("#p_activition").val())==""){
		alert("상품활성화여부!(Y/N)");
		$("#p_activition").val("").focus();
		return false;
	}
	if($.trim($("#p_stock").val())==""){
		alert("등록재고!");
		$("#p_stock").val("").focus();
		return false;
	}
	if($.trim($("#p_sell").val())==""){
		alert("판매수!");
		$("#p_sell").val("").focus();
		return false;
	}
}














