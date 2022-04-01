<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:include page="../include/header.jsp"/>
	
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
    <form>
        <table style="height: 50px; width: 100%;">
            <colgroup>
                <col style="width: 8%;">
                <col style="width: 68%">
                <col style="width: 11%">
                <col style="width: 12%">
            </colgroup>
            <tr>
                <th style="text-align: center;">카테고리 분류</th>
                <td style=" padding-left: 5px;">
                    <select id="category" style="width: 100%; height: 30px;">
                        <option value="*">카테고리를 선택해주세요</option>
                        <option value="1">아우터</option>
                        <option value="2">상의</option>
                        <option value="3">하의</option>
                    </select>
                </td>
                <td style="padding-left: 5px;">
                    <select id="cgroup" style="width: 100%; height: 30px;">
                        <option value="1">최신순</option>
                        <option value="2">평점순</option>
                    </select>
                </td>
                <td style="padding-left: 5px;">
                    <input type="text" style="width: 100%; height: 30px; font-size: 10px;" placeholder="&nbsp;&nbsp;검색어 입력">
                </td>
            </tr>
        </table>
    </form>

		<table id="review">
			<colgroup>
				<col style="width: 7%">
				<col style="width: 63%">
				<col style="width: 13%">
				<col style="width: 10%">
				<col style="width: 7%">
			</colgroup>
			<tr>
				<th class="rphoto">사 진</th>
				<th class="rtitle">제목</th>
				<th class="rwrite">작성자</th>
				<th class="ratings">평 점</th>
				<th >리 뷰</th>
			</tr>

			<tr>
				<td>
					<div class="qr-max-auto">
						<div class="qr-box qr-img-box">
                    		<a href="#"><img src="./resources/images/qna/change1.png"></a>
                		</div>					 
					</div>
				</td>
				<td style="padding: 5px;"><input type="checkbox" id="answer01">
					<label for="answer01">
						<div class="r_title">
							카테고리이름(ex..상의 or 상품이름??)<br>
							조금 크게 나온 것 같습니다 참고해서 구매하세요.진짜 좋아요 진짜로 만족합...
						</div>
				</label>
					<div>
					<br>
						<p>&nbsp;카테고리이름(ex..상의 or 상품이름??)</p>
						<p>
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
									<th>평소 사이즈</th>
								</tr>
								<tr>
									<th>181cm</th>
									<th>64kg</th>
									<th>xl</th>
								</tr>
							</table>
							<br>
							조금 크게 나온 것 같습니다 참고해서 구매하세요.진짜 좋아요 진짜로 만족합니다. 굿굿!
						</div>
						<div class="photo-review pr-img-box">
							<img src="./resources/images/review/top1.png">
						</div>
						</p>
					</div></td>
				<td class="r_writer">양아치</td>
				<td class="r_ratings">★★★★<br>3.7</td>
				<td class="r_reviewcount">(48)</td>
			</tr>
			<tr>
				<td>
					<div class="qr-max-auto">
						<div class="qr-box qr-img-box">
                    		<a href="#"><img src="./resources/images/qna/change1.png"></a>
                		</div>					 
					</div>
				</td>
				<td style="padding: 5px;"><input type="checkbox" id="answer02">
					<label for="answer02">
						<div class="r_title">
							카테고리이름(ex..상의 or 상품이름??)<br>
							조금 크게 나온 것 같습니다 참고해서 구매하세요.진짜 좋아요 진짜로 만족합...
						</div>
				</label>
					<div>
						<br>
						<p>&nbsp;카테고리이름(ex..상의 or 상품이름??)</p>
						<p>
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
									<th>평소 사이즈</th>
								</tr>
								<tr>
									<th>181cm</th>
									<th>64kg</th>
									<th>xl</th>
								</tr>
							</table>
							<br>
							조금 크게 나온 것 같습니다 참고해서 구매하세요.진짜 좋아요 진짜로 만족합니다. 굿굿!
						</div>
						<div class="photo-review pr-img-box">
							<img src="./resources/images/review/top1.png">
						</div>
						</p>
					</div></td>
				<td class="r_writer">양아치</td>
				<td class="r_ratings">★★★★★<br>4.7</td>
				<td class="r_reviewcount">(55)</td>
			</tr>
			<tr>
				<td>
					<div class="qr-max-auto">
						<div class="qr-box qr-img-box">
                    		<a href="#"><img src="./resources/images/qna/change1.png"></a>
                		</div>					 
					</div>
				</td>
				<td style="padding: 5px;"><input type="checkbox" id="answer03">
					<label for="answer03">
						<div class="r_title">
							카테고리이름(ex..상의 or 상품이름??)<br>
							조금 크게 나온 것 같습니다 참고해서 구매하세요.진짜 좋아요 진짜로 만족합...
						</div>
				</label>
					<div>
						<br>
						<p>&nbsp;카테고리이름(ex..상의 or 상품이름??)</p>
						<p>
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
									<th>평소 사이즈</th>
								</tr>
								<tr>
									<th>181cm</th>
									<th>64kg</th>
									<th>xl</th>
								</tr>
							</table>
							<br>
							조금 크게 나온 것 같습니다 참고해서 구매하세요.진짜 좋아요 진짜로 만족합니다. 굿굿!
						</div>
						<div class="photo-review pr-img-box">
							<img src="./resources/images/review/top1.png">
						</div>
						</p>
					</div></td>
				<td class="r_writer">양아치</td>
				<td class="r_ratings">★★★<br>3.2</td>
				<td class="r_reviewcount">(48)</td>
			</tr>
		</table>
	
	<br><br><br><br><br><br><br>


	</div>
</body>
	