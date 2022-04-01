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
            <a href="faq_4"><li>주문관련</li></a>
            <a href="faq_5"><li>취소/환불체</li></a>
            <a href="faq_6"><li>회원관련</li></a>
            <a href="faq_7"><li id="faq_menu_bg">기타문의</li></a>
        </ul>
    </nav>
    
   <div class="accordion">
        <input type="checkbox" id="answer71">
        <label for="answer71"><div>Q. 전화연결이 되지 않아요.</div></label>
        <div>
<pre>
A. FitSpring 전화상담 운영시간은 11:00am ~ 16:30pm이며,
12:00pm~13:00pm 은 점심시간으로 상담이 어렵습니다.

운영시간에도 문의량이 많을 경우 상담이 어려울 수 있는 점 양해 바랍니다.
상담이 어려울 경우 Q&A와 플러스친구 카카오톡으로 문의해주시면 빠른 답변 도와드리겠습니다 :)
</pre>
        </div>
        <input type="checkbox" id="answer72">
        <label for="answer72"><div>Q. 현금영수증 발급을 하고 싶어요.</div></label>
        <div>
<pre>
A. 현금영수증은 상품을 받아 보신 후 구매확정 뒤에 가능하십니다.
구매확정은 상품 수령 후 7일 뒤(교환/반품 의사 없을 경우) 자동으로 구매확정 처리되십니다.

구매확정 처리되신 후 Q&A, 카카오톡, 고객센터로 연락 주시면 확인 후 발급 도와드리겠습니다.
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
