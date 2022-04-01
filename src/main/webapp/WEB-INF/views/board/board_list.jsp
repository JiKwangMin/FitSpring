<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
<link rel="stylesheet" type="text/css" href="./resources/css/board.css" />
</head>
<body>
	<form method="get" action="board_list">
		<div id="bList_wrap">
			<h2 class="bList_title">게시판 목록</h2>
			<div class="bList_count">글개수: ${listcount} 개</div>
			<table id="bList_t">
				<tr>
					<th width="6%" height="26">번호</th>
					<th width="50%">제목</th>
					<th width="14%">작성자</th>
					<th width="17%">작성일</th>
					<th width="14%">조회수</th>
				</tr>
				<c:if test="${!empty blist}">
					<c:forEach var="b" items="${blist}">
						<tr>
							<td align="center"><c:if test="${b.board_step == 0}">
									<%-- 원본글일때만 그룹번호가 출력 --%>
     ${b.board_ref}
    </c:if></td>
							<td><c:if test="${b.board_step != 0}">
									<%--답변글일때만 실행--%>
									<c:forEach begin="1" end="${b.board_step}" step="1">
   &nbsp;<%--답변글 들여쓰기 --%>
									</c:forEach>
									<img src="./resources/images/AnswerLine.gif" />
									<%--답변글 이미지 출력부분 --%>
								</c:if> <a href="board_cont?no=${b.board_no}&page=${page}&state=cont">
									${b.board_title}</a> <%-- board_cont?no=번호&page=쪽번호&state=cont 3개의 인자값이
get방식으로 &구분하면서 전달된다. --%></td>
							<td align="center">${b.board_name}</td>
							<td align="center">${b.board_date}</td>
							<td align="center">${b.board_hit}</td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${empty blist}">
					<tr>
						<th colspan="5">목록이 없습니다!</th>
					</tr>
				</c:if>
			</table>

			<%--페이징 즉 쪽나누기 추가 --%>
			<div id="bList_paging">
				<%-- 검색전 페이징 --%>
				<c:if test="${(empty find_field) && (empty find_name)}">
					<c:if test="${page<=1}">
     [이전]&nbsp;
    </c:if>
					<c:if test="${page>1}">
						<a href="board_list?page=${page-1}">[이전]</a>&nbsp;
    </c:if>

					<%--현재 쪽번호 출력--%>
					<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
						<c:if test="${a == page}">
							<%--현재 페이지가 선택되었다면--%>
      <${a}>
     </c:if>
						<c:if test="${a != page}">
							<%--현재 페이지가 선택되지 않았
     다면 --%>
							<a href="board_list?page=${a}">[${a}]</a>&nbsp;
     </c:if>
					</c:forEach>

					<c:if test="${page >= maxpage}">
    [다음]
    </c:if>
					<c:if test="${page<maxpage}">
						<a href="board_list?page=${page+1}">[다음]</a>
					</c:if>
				</c:if>

				<%-- 검색후 페이징 --%>
				<c:if test="${(!empty find_field) || (!empty find_name)}">
					<c:if test="${page<=1}">
     [이전]&nbsp;
    </c:if>
					<c:if test="${page>1}">
						<a
							href="board_list?page=${page-1}&find_field=${find_field}&find_name=${find_name}">[이전]</a>&nbsp;
    </c:if>

					<%--현재 쪽번호 출력--%>
					<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
						<c:if test="${a == page}">
							<%--현재 페이지가 선택되었다면--%>
      <${a}>
     </c:if>
						<c:if test="${a != page}">
							<%--현재 페이지가 선택되지 않았
     다면 --%>
							<a
								href="board_list?page=${a}&find_field=${find_field}&find_name=${find_name}">[${a}]</a>&nbsp;
     </c:if>
					</c:forEach>

					<c:if test="${page >= maxpage}">
    [다음]
    </c:if>
					<c:if test="${page<maxpage}">
						<a
							href="board_list?page=${page+1}&find_field=${find_field}&find_name=${find_name}">[다음]</a>
					</c:if>
				</c:if>
			</div>

			<div id="bList_menu">
				<input type="button" value="글쓰기"
					onclick="location='board_write?page=${page}';" />
				<c:if test="${(!empty find_field) && (!empty find_name)}">
					<%-- 검색후 실행 --%>
					<input type="button" value="전체목록"
						onclick="location='board_list?page=${page}';" />
				</c:if>
			</div>

			<%--검색 폼추가 --%>
			<div id="bFind_wrap">
				<select name="find_field">
					<option value="board_title"
						<c:if test="${find_field=='board_title'}">
   ${'selected'}</c:if>>제목</option>
					<option value="board_cont"
						<c:if test="${find_field=='board_cont'}">
   ${'selected'}</c:if>>내용</option>
				</select> <input name="find_name" id="find_name" size="14"
					value="${find_name}" /> <input type="submit" value="검색" />
			</div>
		</div>
	</form>
</body>
</html>


















