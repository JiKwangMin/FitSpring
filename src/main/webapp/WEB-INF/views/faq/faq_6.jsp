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
            <a href="faq_6"><li id="faq_menu_bg">회원관련</li></a>
            <a href="faq_7"><li>기타문의</li></a>
        </ul>
    </nav>
    
   <div class="accordion">
        <input type="checkbox" id="answer61">
        <label for="answer61"><div>Q. 회원 탈퇴는 어떻게 하나요?</div></label>
        <div>
<pre>
A. 회원 탈퇴를 원하실 경우 PC로 FitSpring 로그인 후
왼쪽 상단 MODIFY(개인정보수정)에서 오른쪽 하단에 있는 회원 탈퇴를 눌러주시면 되겠습니다.
회원 탈퇴 시 회원 등급, 적립금 및 쿠폰 등 전부 소멸되니 신중한 선택 부탁드립니다.
</pre>
        </div>
        <input type="checkbox" id="answer62">
        <label for="answer62"><div>Q. 회원가입하면 어떤 혜택이 있나요?</div></label>
        <div>
<pre>
A. FitSpring에 회원가입을 하시면 다양한 혜택을 받으실 수 있습니다.
신규 가입 시 쇼핑 지원금 2,000원 지급해드리고 있으며,
FitSpring 신상품은 일주일 동안 5% 할인이 적용되어 판매되고 있는데,
이는 FitSpring 회원에게만 적용되는 할인입니다.
또한, 회원 등급별 할인 쿠폰 지급 및 할인 혜택
구매후기 작성 시 적립금 지급 등
진행하는 다양한 이벤트 혜택을 받아 보실 수 있습니다.
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
