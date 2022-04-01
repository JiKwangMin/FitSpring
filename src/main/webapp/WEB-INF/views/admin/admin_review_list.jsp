<%@page import="net.daum.vo.ReviewVO"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:include page="../include/header.jsp" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="container">

	<br><br>
	
	<h1>REVIEW 관리</h1><br>
	<form method="get" action="admin_review_list">
	<table id="review">
		<colgroup>			
			<col style="width: 10%">
			<col style="width: 7%">
			<col style="width: 33%">
			<col style="width: 10%">
			<col style="width: 20%">
			<col style="width: 20%">
		</colgroup>
		<tr>
			<th class="rno">번 호</th>
			<th class="rphoto">사 진</th>
			<th class="rcont">내 용</th>
			<th class="rwrite">작성자</th>
			<th class="ratings">평 점</th>
			<th>관 리</th>
		</tr>
		
																<!-- 루프 -->
		<c:if test="${!empty rlist }">
			<c:forEach var="r" items="${rlist }">
			
		<tr>
			<td style="text-align: center">${r.r_no }</td>
			<td>
				<div class="photo-box p-img-box">
					<img src="./resources/images/review/picture.png"> <!-- 메인으로!!! 사진메인!!! 다중파일업로드1번.... 사이즈변경 요망  width:80px;-->
				</div>
			</td>
			<td style="padding: 5px;"><input type="checkbox" id="answer+${r.r_no }">
				<label for="answer+${r.r_no }">
					<div class="r_cont">
						<c:if test="${fn:length(r.r_cont)>20}"> 
        					${fn:substring(r.r_cont,0,20)}...
      					</c:if>
      					<c:if test="${fn:length(r.r_cont) <= 20}"> 
        					${r.r_cont}
      					</c:if>
					<br>
					</div>
				</label>
				<div>
					<p>
					<div style="padding: 20px;">
						<h6>상품이름(나중에 추가해 넣어야됨)</h6>
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
					</div>
					<div class="photo-review pr-img-box">
						<img src="./resources/images/review/top1.png"><br>
					</div>&nbsp;&nbsp;&nbsp;&nbsp;
   				<div style="float: right;margin: 0 5% 10px 0">
   				<input type="button" value="수정" onclick="location= 'review_cont?no=${r.r_no}&page=${page}&state=edit';" />
   				<input type="button" value="삭제" onclick="location= 'review_cont?no=${r.r_no}&page=${page}&state=del';" /></div>
					</p>
				</div>
			</td>
			<td class="r_writer">${r.r_writer }</td>
			<td class="r_rate" style="color: red;">${r.r_rate }*★</td>
            
            <td align="center">
            	<input type="button" style="margin-top: 5px;" value="수정" onclick="location='admin_review_cont?no=${r.r_no}&page=${page}&state=edit';"/>
				<input style="margin: 5px 0;" type="button" value="삭제" onclick="if(confirm('정말로 삭제할까요?') == true)
													{location='admin_review_del?no=${r.r_no}&page=${page}';}else{ return ;}" />  
            </td>			
		</tr>
		
			</c:forEach>	
		</c:if>
																<!-- 루프 끝 -->
		<c:if test="${empty rlist }">
         	<tr>
         		<th colspan="5">목록이 없습니다.</th>
         	</tr>
        </c:if>
	</table>
	
	<br>
  
	<div id="page_control" class="text-center">
        <%--페이징 즉 쪽나누기 추가 --%>
			<div>
				<c:if test="${(!empty page)}">
					<c:if test="${page<=1}">[이전]&nbsp;</c:if>
					<c:if test="${page>1}">
						<a href="admin_review_list?page=${page-1}">[이전]</a>&nbsp;
    				</c:if>

					<%--현재 쪽번호 출력--%>
					<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
						<c:if test="${a == page}"><${a}></c:if>	<%--현재 페이지가 선택되었다면--%>
						<c:if test="${a != page}">				
							<a href="admin_review_list?page=${a}">[${a}]</a>&nbsp;
     					</c:if><%--현재 페이지가 선택되지 않았다면 --%>
					</c:forEach>

					<c:if test="${page >= maxpage}">[다음]</c:if>
					<c:if test="${page<maxpage}">
						<a href="admin_review_list?page=${page+1}">[다음]</a>
					</c:if>
				</c:if>
			</div>			
    </div>
    <br>
    <div>    
        <select id="search_key" name="find_field">
            <option value="r_cont" <c:if test="${find_field=='r_cont'}">${'selected'}</c:if>>내용</option>
            <option value="r_writer" <c:if test="${find_field=='r_writer'}">${'selected'}</c:if>>작성자</option>
        </select>
        
        <input name="find_name" id="find_name" size="14"
					value="${find_name}" /> <input type="submit" id="q_search_btn" value="검색" />
    </div>
    </form>
</div>
<br><br><br><br><Br>
</body>
</html>
