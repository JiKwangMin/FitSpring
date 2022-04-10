<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:include page="../include/header.jsp"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	
<!-- review -->
	<div style="margin-bottom: 60px;"></div>
	<div class="container">
    
		<div class="d-max-auto">
			<div class="review-box r-img-box">
				<img src="./resources/images/review/reviewevent.png">
			</div>
		</div>

		<div class="row">
			<div class="col-md-2 col-sm-12 d-max-auto"
				style="background: #f3f3f3; font-weight: bold;">
				<div style="text-align: center;">
					적립금<br>지급조건
				</div>
			</div>
			<div class="col-md-4 col-sm-12">
				<div>
					ㆍ제품수령 후 <strong>60일 안에 리뷰를 등록</strong><br> ㆍ착용사진은 포토리뷰 게시판에 기재<br>
					ㆍ리뷰작성시 <strong>10자이상</strong> 포토리뷰시 <strong>30자이상</strong> 기재<br>
					ㆍ포토후기의 경우, 착용사진이 아닌 <strong>제품사진만 등록하는 경우 500원</strong> 지급<br>
					ㆍ적립금은 구매후기, 포토후기 중 한번의 적립금만 지급 <strong>[중복지급불가]</strong><br>
					ㆍ상품구매/포토후기 적립금은 <strong>매주 금요일에 적립</strong> <br>
					<br>
				</div>
			</div>
			<div class="col-md-2 col-sm-12 d-max-auto"
				style="background: #f3f3f3; font-weight: bold;">
				<div style="text-align: center;">
					적립금<br>미지급
				</div>
			</div>
			<div class="col-md-4 col-sm-12">
				<div>
					ㆍ양식대로 작성하지 않은 경우<br> ㆍ후기가 너무 짧고 성의가 없는 경우<br>
					&nbsp;&nbsp;&nbsp;(제품소감이 10자이하로 짧은 경우)<br> ㆍ상품을 구매하고 60일 이상이
					지난 경우<br> ㆍ타사이트에서 구매하신 경우나, 비회원으로 구매하신 경우<br> ㆍ구매후기를 올리신
					후 반품을 하신 경우<br> ㆍ세일 상품을 구매하신 경우
				</div>
			</div>
		</div>
		<br> <br>
		<div class="row">
			<div class="col-md-2 col-sm-12">
				<span style="font-size: 35px;">REVIEW<span>
			</div>
			<div class="col-md-10 col-sm-12" style="margin: 20px 0 5px 0;">
				<span style="font-size: 17px;">|&nbsp; 악의적인 비방글은 무통보 삭제된다는 점
					유의해주세요^^</span>
			</div>
		</div>

    <br><br>
	<table id="review">
		<colgroup>			
			<col style="width: 10%">
			<!--<col style="width: 7%"> -->
			<col style="width: 63%">
			<col style="width: 10%">
			<col style="width: 20%">
		</colgroup>
		<tr>
			<th class="rno">번 호</th>
			<!-- <th class="rphoto">사 진</th> -->
			<th class="rcont">내 용</th>
			<th class="rwrite">작성자</th>
			<th class="ratings">평 점</th>
		</tr>
	
																<!-- 루프 -->
		<c:if test="${!empty litore }">
			<c:forEach var="r" items="${litore }">
			
		<tr>
			<td style="text-align: center">${r.r_no }</td>

			<td style="padding: 5px;"><!-- <input type="checkbox" id="answer+${r.r_no }"> -->

				<div>
					<p>
					<div class="photo-review pr-img-box">
						<img src="../resources/upload${r.review_img}" style="width: 170px; height: 190pxl;" alt="이미지없음"/>
					</div>
					<div style="padding: 20px;">
						<table style="width: 270px; border: 1px solid gray;">
							<colgroup>
								<col style="width: 2%;">
								<col style="width: 3%;">
								<col style="width: 5%;">
							</colgroup>
							<tr>
								<th>키</th>
								<th>몸무게</th>
								<th>구매 사이즈</th>
							</tr>
							<tr>
								<th>${r.r_height}cm</th>
								<th>${r.r_weight}kg</th>
								<th>${r.r_size}</th>
							</tr>
						</table>
						<br>${r.r_cont }
						<div style="text-align: right;"><a href="item_detail?item_no=${r.item_no}">해당 아이템 보러가기</a></div>	  
					</div>

			</td>
			<td class="r_writer">${r.r_writer}</td>
			<td class="r_rate" style="color: red;">${r.r_rate }★</td>
		</tr>
		
			</c:forEach>	
		</c:if>
	</table>
																<!-- 루프 끝 -->
	
	<br>
	
	<div id="page_control" class="text-center">
        <%--페이징 즉 쪽나누기 추가 --%>
			<div>
				<c:if test="${(!empty page)}">
					<c:if test="${page<=1}">[이전]&nbsp;</c:if>
					<c:if test="${page>1}">
						<a href="photo?page=${page-1}">[이전]</a>&nbsp;
    				</c:if>

					<%--현재 쪽번호 출력--%>
					<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
						<c:if test="${a == page}"><${a}></c:if>	<%--현재 페이지가 선택되었다면--%>
						<c:if test="${a != page}">				
							<a href="photo?page=${a}">[${a}]</a>&nbsp;
     					</c:if><%--현재 페이지가 선택되지 않았다면 --%>
					</c:forEach>

					<c:if test="${page >= maxpage}">[다음]</c:if>
					<c:if test="${page<maxpage}">
						<a href="photo?page=${page+1}">[다음]</a>
					</c:if>
				</c:if>
			</div>			
    </div>
	
	<br><br><br><br><br><br><br>

	</div>
</body>

	