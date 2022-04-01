<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:include page="../include/faq_header.jsp"/>

	<div class="container">
    <br>
    <nav class="faq_menu">
        <ul>
      		<a href="faq_0"><li>전체</li></a>
            <a href="faq_1"><li>배송관련</li></a>
            <a href="faq_2"><li>반품/교환</li></a>
            <a href="faq_3"><li>결제/입금</li></a>
            <a href="faq_4"><li id="faq_menu_bg">주문관련</li></a>
            <a href="faq_5"><li>취소/환불체</li></a>
            <a href="faq_6"><li>회원관련</li></a>
            <a href="faq_7"><li>기타문의</li></a>
        </ul>
    </nav>
    
   <div class="accordion">
        <input type="checkbox" id="answer41">
        <label for="answer41"><div>Q. 상품 변경/주소지 변경을 하고 싶어요.</div></label>
        <div>
<pre>
A. 상품 변경(색상or사이즈)/주소지변경을 원하실 경우
Q&A, 플러스친구 카카오톡, 고객센터(070-4814-2905)로 연락 주시면 가능하십니다.
문의하실 때 주문번호와 변경 원하시는 상품명, 변경하시는 내용 함께 기재해주시면 보다 빠른 처리 도와드리겠습니다.
</pre>
        </div>
    </div>

	<form action="#" method="post">
		<div class="serch_box">
			<select id="faq_serch" name="faq_serch">
				<option value="title">제목</option>
				<option value="content">내용</option>
			</select>
			
			<input id="serch" name="serch" type="text" size="25">
			<input type="button" value="찾기" onclick="location='#'">
		</div>
	</form>
	
</div>
</body>
</html>
