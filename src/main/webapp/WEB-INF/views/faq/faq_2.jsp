<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:include page="../include/faq_header.jsp"/>

	<div class="container">
    <br>
    <nav class="faq_menu">
        <ul>
      		<a href="faq_0"><li>전체</li></a>
            <a href="faq_1"><li>배송관련</li></a>
            <a href="faq_2"><li id="faq_menu_bg">반품/교환</li></a>
            <a href="faq_3"><li>결제/입금</li></a>
            <a href="faq_4"><li>주문관련</li></a>
            <a href="faq_5"><li>취소/환불체</li></a>
            <a href="faq_6"><li>회원관련</li></a>
            <a href="faq_7"><li>기타문의</li></a>
        </ul>
    </nav>
    
   <div class="accordion">
        <input type="checkbox" id="answer21">
        <label for="answer21"><div>Q. 반품이 불가능한 경우는 어떤 건가요?</div></label>
        <div>
        	<img src="./resources/images/faq/answer21.png">
            <p>(상품 불량/오배송의 경우 모든 비용은 FitSpring에서 부담하여 교환해드리며. 반품도 가능하십니다.)</p>
        </div>
        <input type="checkbox" id="answer22">
        <label for="answer22"><div>Q. 불량/오배송 상품을 받았습니다.</div></label>
        <div>
<pre>
A. 먼저 상품 불량/오배송으로 인해 불편 드려 정말 죄송합니다.
불량/오배송 상품을 받아보셨을 경우 모든 비용은 FitSpring에서 전액 부담하여 교환 및 반품 도와드리고 있습니다.

불량/오배송 상품의 불량 부분을 사진촬영하여 Q&A 게시판 또는 카카오톡으로
문의해주시면 최대한 빠른 답변 도와드리겠습니다.

이용에 불편 드려 죄송합니다.
</pre>
        </div>        
        <input type="checkbox" id="answer23">
        <label for="answer23"><div>Q. 배송후 반품/교환을 하고 싶어요.</div></label>
        <div>
<pre>
A. 반품 및 교환 안내사항은 오른쪽 상단 커뮤니티 - 공지사항 상단 게시물에 자세히 기재되어있습니다.

http://나중에 경로 잡으세여.

위 링크 참고 부탁드리겠습니다.
</pre>
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
