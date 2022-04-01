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

<form method="get"  action="qna_list">
    <table id="notice"> 
        <colgroup>
            <col style="width: 7%">
            <col style="width: 13%">
            <col style="width: 55%">
            <col style="width: 15%">
            <col style="width: 10%">
        </colgroup>
        <tr>
            <th class="tno">번호</th>
            <th class="p_info">상품정보</th>
            <th class="ttitle">제목</th>
            <th class="twrite">작성자</th>
            <th class="tdate">작성일</th>
        </tr>
        
<!-- 루프 -->
 		 <c:if test="${!empty qlist }">
 		 	<c:forEach var="q" items="${qlist }">

		 <tr>
            <td class="tno"><c:if test="${q.q_step == 0 }">${q.q_ref }</c:if></td>
            <td>
            <div class="q-max-auto">
                <div class="q-box q-img-box">
                    <a href="#"><img src="./resources/images/qna/change1.png"></a>
                </div>
            </div>
            </td>
            <td style="padding: 5px;">
                <span class="product-name"><a href="#">나중에바꿔(상품이름)</a><br></span>
                
                <input type="checkbox" id="q_answer+${q.q_no }">
					<label for="q_answer+${q.q_no }">
						<div>
							<p>${q.q_title }</p>
						</div>
				</label>
					<div>
						<p>
						<div>&nbsp;							
							<p>${q.q_cont }</p>
						</div>
						<div class="photo-review pr-img-box">
							<img src="./resources/images/qna/change1.png">
							<br>
						</div>&nbsp;&nbsp;
					<div style="float: right;margin: 0 5% 10px 0">	
					<input type="button" value="답변" onclick="location= 'qna_cont?no=${q.q_no}&page=${page}&state=reply';" />
   					<input type="button" value="수정" onclick="location= 'qna_cont?no=${q.q_no}&page=${page}&state=edit';" />
   					<input type="button" value="삭제" onclick="location= 'qna_cont?no=${q.q_no}&page=${page}&state=del';" /></div>
						</p>
					</div>
            </td>
            <td class="twrite">${q.q_writer }</td>
            <td class="tdate">${q.q_date }</td>
       	 </tr>

       	 	</c:forEach>
		 </c:if>
																		<!-- 루프 -->
         <c:if test="${empty qlist }">
         	<tr>
         		<th colspan="5">목록이 없습니다.</th>
         	</tr>
         </c:if>
    </table>
    
	<br>
	
	<div id="page_control" class="text-center">
        <%--페이징 즉 쪽나누기 추가 --%>
			<div>
				<%-- 검색전 페이징 --%>
				<c:if test="${(empty find_field) && (empty find_name)}">
					<c:if test="${page<=1}">[이전]&nbsp;</c:if>
					<c:if test="${page>1}"><a href="qna_list?page=${page-1}">[이전]</a>&nbsp;</c:if>

					<%--현재 쪽번호 출력--%>
					<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
						<c:if test="${a == page}"><${a}></c:if>	<%--현재 페이지가 선택되었다면--%>
						<c:if test="${a != page}"><a href="qna_list?page=${a}">[${a}]</a>&nbsp;</c:if> 	<%--현재 페이지가 선택되지 않았다면 --%>
					</c:forEach>

					<c:if test="${page >= maxpage}">[다음]</c:if>
					<c:if test="${page<maxpage}"><a href="qna_list?page=${page+1}">[다음]</a></c:if>
				</c:if>

				<%-- 검색후 페이징 --%>
				<c:if test="${(!empty find_field) || (!empty find_name)}">
					<c:if test="${page<=1}">[이전]&nbsp;</c:if>
					<c:if test="${page>1}">
						<a href="qna_list?page=${page-1}&find_field=${find_field}&find_name=${find_name}">[이전]</a>&nbsp;
    				</c:if>

					<%--현재 쪽번호 출력--%>
					<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
						<c:if test="${a == page}"><${a}></c:if>	<%--현재 페이지가 선택되었다면--%>
						<c:if test="${a != page}">				
							<a href="qna_list?page=${a}&find_field=${find_field}&find_name=${find_name}">[${a}]</a>&nbsp;
     					</c:if><%--현재 페이지가 선택되지 않았다면 --%>
					</c:forEach>

					<c:if test="${page >= maxpage}">[다음]</c:if>
					<c:if test="${page<maxpage}">
						<a href="qna_list?page=${page+1}&find_field=${find_field}&find_name=${find_name}">[다음]</a>
					</c:if>
				</c:if>
			</div>
    </div>

    <div id="table_write" class="text-right">
        <a href="qna_write" class="write_btn">글쓰기</a>
    </div>    

    <br>

    <div>
        <!-- <select id="search_date" name="search_date">
            <option value="week">일주일</option>
            <option value="month">한달</option>
            <option value="month3">세달</option>
            <option value="all">전체</option>
        </select> -->
        
        <select id="search_key" name="find_field">
            <option value="q_title" <c:if test="${find_field=='q_title'}">${'selected'}</c:if>>제목</option>
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