<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:include page="../include/header.jsp"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="container">

    <div class="row">
        <div class="col-md-12 text-right">
            <p class="root"><a href="index">홈</a> > Q & A</p>
        </div>
    </div>
        
<h1>Q & A</h1>  
<br>
<div class="qna"><p>FitSpring 상품문의 및 교환&반품문의입니다.</p></div>


    <table id="notice"> 
        <colgroup>
            <col style="width: 7%">
            <col style="width: 55%">
            <col style="width: 15%">
            <col style="width: 10%">
        </colgroup>
        <tr>
            <th class="tno">번호</th>
            <th class="ttitle">제목</th>
            <th class="twrite">작성자</th>
            <th class="tdate">작성일</th>
        </tr>
        
<!-- 루프 -->
 		 <c:if test="${!empty litoqna }">
 		 	<c:forEach var="q" items="${litoqna }">

		 <tr>
            <!--<td class="tno"><c:if test="${q.q_step == 0 }">${q.q_ref }</c:if></td>-->
            <td class="tno">${q.no}</td>
            <td style="padding: 5px;">
                <span style="font-size: 10px;">분류&nbsp;:</span>
                
                <input type="checkbox" id="q_answer+${q.q_no }">
					<label for="q_answer+${q.q_no }">
						<div>
							<p>${q.q_title }</p>
						</div>
				</label>
					<div>
						<p>
						<div>&nbsp;							
							<input type="text" value="${q.q_writer }" style="display: none;">
							<p>${q.q_cont }</p>
						</div>
						<div class="photo-review pr-img-box">
							<img src="../resources/upload${q.qna_img}" style="width: 170px; height: 190pxl;" alt="이미지없음"/>
							<br>
						</div>&nbsp;&nbsp;
					<div style="float: right;margin: 0 5% 10px 0">	
					
					<input type="submit" value="답변" onclick="location='TotalQnaReply?q_no=${q.q_no}&page1=${page1}&state=reply&item_no=${q.item_no}';" />
   					<input type="submit" value="수정" onclick="location='TotalQnaEdit?q_no=${q.q_no}&page1=${page1}&state=edit&item_no=${q.item_no}';" />
   					<input type="submit" value="삭제" onclick="location='TotalQnaDel?q_no=${q.q_no}&page1=${page1}&state=del&item_no=${q.item_no}';" /></div>  
						</p>
					</div>
            </td>
            <td class="twrite">${q.q_writer }</td>
            <td class="tdate">${q.q_date }</td>
       	 </tr>

       	 	</c:forEach>
		 </c:if>
																		<!-- 루프 -->
         <c:if test="${empty litoqna }">
         	<tr>
         		<th colspan="5">목록이 없습니다.</th>
         	</tr>
         </c:if>
    </table>
    
	<br>
<form method="get"  action="total_qna_list">	
	
	<div id="page_control" class="text-center">
        <%--페이징 즉 쪽나누기 추가 --%>
			<div>
				<%-- 검색전 페이징 --%>
				<c:if test="${(empty find_field) && (empty find_name)}">
					<c:if test="${page1<=1}">[이전]&nbsp;</c:if>
					<c:if test="${page1>1}"><a href="total_qna_list?page1=${page1-1}">[이전]</a>&nbsp;</c:if>

					<%--현재 쪽번호 출력--%>
					<c:forEach var="a" begin="${startpage1}" end="${endpage1}" step="1">
						<c:if test="${a == page1}"><${a}></c:if>	<%--현재 페이지가 선택되었다면--%>
						<c:if test="${a != page1}"><a href="total_qna_list?page1=${a}">[${a}]</a>&nbsp;</c:if> 	<%--현재 페이지가 선택되지 않았다면 --%>
					</c:forEach>

					<c:if test="${page1 >= maxpage1}">[다음]</c:if>
					<c:if test="${page1 < maxpage1}"><a href="total_qna_list?page1=${page1+1}">[다음]</a></c:if>
				</c:if>

				<%-- 검색후 페이징 --%>
				<c:if test="${(!empty find_field) || (!empty find_name)}">
					<c:if test="${page1 <= 1}">[이전]&nbsp;</c:if>
					<c:if test="${page1 > 1}">
						<a href="total_qna_list?page1=${page1-1}&find_field=${find_field}&find_name=${find_name}">[이전]</a>&nbsp;
    				</c:if>

					<%--현재 쪽번호 출력--%>
					<c:forEach var="a" begin="${startpage1}" end="${endpage1}" step="1">
						<c:if test="${a == page1}"><${a}></c:if>	<%--현재 페이지가 선택되었다면--%>
						<c:if test="${a != page1}">				
							<a href="total_qna_list?page1=${a}&find_field=${find_field}&find_name=${find_name}">[${a}]</a>&nbsp;
     					</c:if><%--현재 페이지가 선택되지 않았다면 --%>
					</c:forEach>

					<c:if test="${page1 >= maxpage1}">[다음]</c:if>
					<c:if test="${page1< maxpage1}">
						<a href="total_qna_list?page1=${page1+1}&find_field=${find_field}&find_name=${find_name}">[다음]</a>
					</c:if>
				</c:if>
			</div>
    </div>
 
    <br>

    <div>
        
        <select id="search_key" name="find_field">
            <option value="q_title" <c:if test="${find_field=='q_title'}">${'selected'}</c:if>>분류</option>
            <option value="q_cont" <c:if test="${find_field=='q_cont'}">${'selected'}</c:if>>내용</option>
            <option value="q_writer" <c:if test="${find_field=='q_writer'}">${'selected'}</c:if>>작성자</option>
        </select>
        
        <input name="find_name" id="find_name" size="14"
					value="${find_name}" /> <input type="submit" id="q_search_btn" value="검색" />
    </div>
</form>
</div>

<br><br><br><br><br><br>

</body>
</html>