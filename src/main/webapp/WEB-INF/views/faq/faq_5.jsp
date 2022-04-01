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
            <a href="faq_5"><li id="faq_menu_bg">취소/환불체</li></a>
            <a href="faq_6"><li>회원관련</li></a>
            <a href="faq_7"><li>기타문의</li></a>
        </ul>
    </nav>
    
   <div class="accordion">
        <input type="checkbox" id="answer51">
        <label for="answer51"><div>Q. 카드 결제 취소는 됐는데 환급은 아직 안 됐어요.</div></label>
        <div>
<pre>
A. 카드 결제 취소는 카드 결제 취소일로부터 카드사에 따라 영업일 기준으로 1~3일 정도 소요됩니다.
따라서, 조금만 기다려주시면 자동으로 환급처리되며, 정확한 환급 일정 문의는 카드사 측으로 문의 부탁드립니다.
</pre>
        </div>
        <input type="checkbox" id="answer52">
        <label for="answer52"><div>Q. 주문한 상품을 취소하고 싶습니다.</div></label>
        <div>
<pre>
A. 상품 취소는 FitSpring에 문의 글을 남겨주시거나 고객센터로 연락 주시면 취소 접수 도와드리고 있습니다.
상담 시간 외에는 FitSpring 로그인 후 주문 내역에서 취소 접수 신청해주시거나, Q&A 게시판에 남겨주시면 되겠습니다.
(네이버페이 구매는 네이버페이 센터 - 구매내역에서 취소 접수 부탁드리겠습니다.)
입고가 되어 이미 출고 진행이 된 경우 취소가 불가할 수 있기 때문에 빠른 연락 부탁드리겠습니다.
</pre>
        </div>        
        <input type="checkbox" id="answer53">
        <label for="answer53"><div>Q. 입금을 하고 취소 접수를 했는데 환불 처리가 되지 않습니다.</div></label>
        <div>
<pre>
A. 입금을 하고 빠른 시간 내로 주문취소 접수를 하실 경우 입금확인 전에 취소 접수되는 경우가 있습니다.
이런 경우는 입금 전 취소 처리가 되기 때문에 입금을 안 한 것으로 처리가 됩니다.
입금확인 전에 취소 접수를 해주신 고객님께서는 따로 고객센터(070-4814-2809)로 연락 주시면
수동으로 입금확인 후 환급계좌번호 말씀해주시면 정상적으로 환불 진행 도와드리고 있습니다.
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
