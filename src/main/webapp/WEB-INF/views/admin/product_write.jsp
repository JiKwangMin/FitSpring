<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
<script src="./resources/js/jquery.js"></script>
<script src="./resources/js/product.js"></script>
</head>
<body>
 
 <h2>상품 등록</h2>
 
 <form method="post" action="product_write_ok" onsubmit="return write_check();" enctype="multipart/form-data">
  <table>
   <tr>
    <th>상품아이디</th>
    <td><input name="p_id" id="p_id" size="14"></td>
   </tr>
   
   <tr>
    <th>상품이미지</th>
    <td><input type="file" name="p_path" id="p_path" size="14" multiple></td>
   </tr>
  
   <tr>
    <th>분류</th>
    <td>
     <select id="p_category1" name="p_category1" onchange="loadp_category2();"></select>
     <select id="p_category2" name="p_category2"></select>
     
     <script>
      let p_category1 = [
    	  {v:"",t:""},
    	  {v:"아우터",t:"아우터"},
    	  {v:"상의",t:"상의"},
    	  {v:"하의",t:"하의"},
    	  {v:"신발",t:"신발"},
    	  {v:"ACC",t:"ACC"}
      ];
      let p_category2_1 = [
      	  {v:"가디건",t:"가디건"},
      	  {v:"코트",t:"코트"},
      	  {v:"점퍼",t:"점퍼"},
      	  {v:"자켓",t:"자켓"}
      ];
      let p_category2_2 = [
      	  {v:"맨투맨후드",t:"맨투맨후드"},
      	  {v:"니트",t:"니트"},
      	  {v:"셔츠",t:"셔츠"},
      	  {v:"무지",t:"무지"}
      ];
      let p_category2_3 = [
      	  {v:"팬츠",t:"팬츠"},
      	  {v:"데님",t:"데님"},
      	  {v:"반바지",t:"반바지"}
      ];
      let p_category2_4 = [
      	  {v:"슬리퍼",t:"슬리퍼"},
      	  {v:"로퍼",t:"로퍼"},
      	  {v:"스니커즈",t:"스니커즈"},
      ];
      let p_category2_5 = [
      	  {v:"가방",t:"가방"},
      	  {v:"모자",t:"모자"}
      ];
      
      function loadp_category1(){
      	  let h = [];
    	  p_category1.forEach(item => {
    		h.push('<option value="' + item.v + '">' + item.t + '</option>');
    	  });
    	  
    	  document.getElementById("p_category1").innerHTML = h.join("");
      }
   
      function loadp_category2() {
    	  let category1_p = document.getElementById("p_category1").value;
    	  let h = [];
    	  
    	  if(category1_p == "") {
    		  
    	  }else {
    			if(category1_p == "아우터") {
    		 		p_category2_1.forEach(item => {
    	   			h.push('<option value="' + item.v + '">' + item.t + '</option>');
    		 	});
    		}else if(category1_p == "상의"){
    				p_category2_2.forEach(item => {
    	   			h.push('<option value="' + item.v + '">' + item.t + '</option>');
    		 	});
    		}else if(category1_p == "하의"){
    				p_category2_3.forEach(item => {
    	   			h.push('<option value="' + item.v + '">' + item.t + '</option>');
    		 	});
    		}else if(category1_p == "신발"){
    				p_category2_4.forEach(item => {
    	   			h.push('<option value="' + item.v + '">' + item.t + '</option>');
    		 	});
    		}else if(category1_p == "ACC"){
    				p_category2_5.forEach(item => {
    	   			h.push('<option value="' + item.v + '">' + item.t + '</option>');
    		 	});
    	  	}
      	}
	
    	document.getElementById("p_category2").innerHTML = h.join("");
      }
    
      loadp_category1();
    </script>

    </td>
   </tr>
   
   <tr>
    <th>상품이름</th>
    <td><input name="p_name" id="p_name" size="14"></td>
   </tr>
   
   <tr>
    <th>상품사이즈</th>
    <td><input name="p_size" id="p_size" size="14"></td>
   </tr>
   
   <tr>
    <th>상품색상</th>
    <td><input name="p_color" id="p_color" size="14"></td>
   </tr>
   
   <tr>
    <th>가격</th>
    <td><input name="p_price" id="p_price" size="14"></td>
   </tr>
  
   <tr>
    <th>상품활성화</th>
    <td><input name="p_activition" id="p_activition" size="14"></td>
   </tr>
   
   <tr>
    <th>재고</th>
    <td><input name="p_stock" id="p_stock" size="14"></td>
   </tr>
  
   <tr>
    <th>판매수</th>
    <td><input name="p_sell" id="p_sell" size="14"></td>
   </tr> 
  
  </table>
  
  <div>
   <input type="submit" value="저장">
   <input type="reset" value="취소" onclick="$('#p_id').focus();">
   <input type="button" value="목록" onclick="location='product_list?page=${page}';">
  </div> 
 </form>
 
</body>
</html>
