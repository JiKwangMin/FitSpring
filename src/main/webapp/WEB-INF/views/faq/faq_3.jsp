<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:include page="../include/faq_header.jsp"/>

	<div class="container">
    <br>
    <nav class="faq_menu">
        <ul>
      		<a href="faq_0"><li>전체</li></a>
            <a href="faq_1"><li>배송관련</li></a>
            <a href="faq_2"><li>반품/교환</li></a>
            <a href="faq_3"><li id="faq_menu_bg">결제/입금</li></a>
            <a href="faq_4"><li>주문관련</li></a>
            <a href="faq_5"><li>취소/환불체</li></a>
            <a href="faq_6"><li>회원관련</li></a>
            <a href="faq_7"><li>기타문의</li></a>
        </ul>
    </nav>
    
   <div class="accordion">
        <input type="checkbox" id="answer31">
        <label for="answer31"><div>Q. 주문 건이 여러 개인데 배송비를 절감하고 싶습니다.</div></label>
        <div>
<pre>
A. 배송비는 주문 건당 개별적으로 배송비가 발생하기 때문에 임의로 배송비 제외 후 입금하실 경우 입금확인에서 누락되실 수 있습니다.
주문 건이 여러 개인데 배송비를 절감하여 일괄 배송으로 받아보고 싶으실 경우, 기존 주문 건 취소 후 전체 상품 재주문해주시면 감사하겠습니다.

주문 건이 여러 개인데 각 주문 건이 동시에 배송 준비가 됐을 경우 묶음배송을 받아보실 수도 있으며,
이 경우에 배송비 환급을 원할 시 적립금으로만 지급되고 있습니다.
</pre>
        </div>
        <input type="checkbox" id="answer32">
        <label for="answer32"><div>Q. 입금했는데 입금확인이 되지 않습니다.</div></label>
        <div>
<pre>
Q. 입금 했는데 입금확인이 되지 않습니다.


A. 입금 확인이 되지 않는 경우는 다음과 같습니다.
1. 주문금액과 입금 금액이 일치하지 않는 경우 (ex: 주문금액 30500원, 입금 금액 35000원)

2. 주문자명과 입금자명이 일치하지 않는 경우 (ex: 주문자 정부중, 입금자 FitSpring)

3. 중복 주문 건이 있을 경우
: 동일한 상품을 중복 주문하여 처음 구매한 주문 건은 입금확인이 되었지만 두 번째 주문 건은 입금확인 처리가 되지 않기 때문에
미입금 안내 문자를 받아 보실 수 있습니다. (중복 주문되어 입금 처리되지 않는 주문 건은 자동으로 입금 전 취소 처리됩니다.)


위 1번, 2번의 경우는 자동입금확인 처리 시스템에서 누락이 되어 자동으로 입금확인이 되지 않은 경우입니다.
이런 경우 고객센터(070-4814-2809)로 연락 주시면 수동으로 입금확인 처리 도와드리겠습니다.
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
