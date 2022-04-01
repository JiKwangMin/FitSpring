<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:include page="../include/faq_header.jsp"/>

	<div class="container">
    <br>
    <nav class="faq_menu">
        <ul>
            <a href="faq_0"><li>전체</li></a>
            <a href="faq_1"><li id="faq_menu_bg">배송관련</li></a>
            <a href="faq_2"><li>반품/교환</li></a>
            <a href="faq_3"><li>결제/입금</li></a>
            <a href="faq_4"><li>주문관련</li></a>
            <a href="faq_5"><li>취소/환불체</li></a>
            <a href="faq_6"><li>회원관련</li></a>
            <a href="faq_7"><li>기타문의</li></a>
        </ul>
    </nav>
    
    <div class="accordion">
        <input type="checkbox" id="answer11">
        <label for="answer11"><div>Q. 배송 메시지에 상품 변경사항을 남겼는데 처리가 되지 않았어요.</div> </label>
        <div>
<pre>
A. 배송 메시지는 고객님께 상품을 배달해주시는 기사님께 남기는 메시지이며(ex 부재 시 경비실에 맡겨주세요),
FitSpring에서 별도 확인 후 변경이 불가능합니다.

상품이나 개인적인 변경사항이 있으실 경우 고객센터로 문의 부탁드리겠습니다.
</pre>           
        </div>
        <input type="checkbox" id="answer12">
        <label for="answer12"><div>Q. 주문한 상품중 일부 상품만 왔어요. (부분배송)</div> </label>
        <div>
<pre>
A. 저희 FitSpring은 고객님의 편의를 위해 입고 지연이 5일 이상 경과된 경우 준비된 상품을 먼저 부분 출고하고 있습니다.
배송되지 않은 상품은 입고되는 대로 검수과정 마친 뒤 출고 진행 도와드리고 있습니다.
(부분배송시 발생되는 택배비는 FitSpring에서 부담합니다.)

단, 주문 경과일 5일 이전에 부분 배송을 요청하실 경우 부분 배송비는 고객님의 부담으로
FitSpring 계좌번호 KB 350601-04-346338 (주)828컴퍼니로 부분 배송비(3000원) 입금 후 고객센터로 연락 주시면 부분배송 도와드리고 있습니다.
* 부분 배송은 준비된 상품이 1개 이상 있어야 가능합니다. *
</pre>            
        </div>
        <input type="checkbox" id="answer13">
        <label for="answer13"><div>Q. 주문했는데 품절됐어요.</div> </label>
        <div>
<pre>
A. 먼저 상품 품절로 인해 불편 드려 대단히 죄송합니다.

저희 FitSpring은 선주문/후입고 시스템으로 재고를 쌓아두고 판매하고 있지 않아,
거래처 사정에 따라 일부 상품이 품절될 수 있습니다.

품절 상품이 생길 경우 개별적으로 연락드려 안내 도와드리고 있습니다.

품절 상품은 보통 재입고 예정이 없으며,
다른 색상 or 사이즈, 다른 상품, 환불 등 원하시는 방안으로 조치해드리고 있습니다.
</pre>            
        </div>
        <input type="checkbox" id="answer14">
        <label for="answer14"><div>Q. 언제 배송되나요?</div> </label>
        <div>
<pre>

A.     주문/결제          →            발주           →        입고(1~5일소요)            →          검수              →        출고/배송(1~2일)
                                                                                                                         
                                      ↑                                                            ↓(불량)

                                               
                                               ←                                ←

                                                                                                       
저희 FitSpring은 선주문/ 후입고 시스템으로 위 과정을 거친 뒤에 출고 진행을 도와드리고 있습니다.


주문/결제 단계에서 당일 20시 이전까지 결제 완료 주문 건은 당일 밤에 발주가 들어가고 있습니다.


(20시 이후 주문 건은 다음날 밤에 주문이 들어가기 때문에 같은 날 주문 건이더라도 최소 하루 정도의 차이가 있습니다.)


입고 일은 거래처 사정에 따라 다르며, 입고 지연일 경우 주문 경과일이 2일 이상인 고객분들께 개별적으로 양해 전화드리고 있으며, 부재 시 카카오톡으로 안내드리고 있습니다.

선주문/후입고 시스템상 발주가 들어간 상품만 입고 지연 여부를 파악할 수 있어, 홈페이지 상에 입고 지연 파악이 된 상품만 Editior Note 하단에 표기해두고 있습니다.


상품이 입고되었어도 불량 상품이 입고되었을 수 있기 때문에 검수과정에서 불량이 발견되면 다시 새 상품을 입고 받아 출고 진행 도와드리고 있습니다.


배송은 서울/경기권은 보통 하루면 받아보십니다. 이외 지역은 빠르면 1일, 늦어지면 2일이며, 도서산간 지역 및 특수 지역은 3~4일정도 소요되는 점 참고부탁드립니다.
롯데택배사로 발송되며, 토요일에도 기사님들께서 배송하고 있습니다.(공휴일 또는 일요일 휴무)

항상 빠른 배송을 위해 전 직원 모두 노력하겠습니다 :)            
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











