<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 공지목록(최신글 5개 보기)</title>
<link rel="stylesheet" type="Text/css" href="./resources/css/gongji.css" />
</head>
<body>
	<div id="gMain_wrap">
		<h2 class="gMain_title">사용자 공지목록</h2>
		<table id="gMain_t">
			<tr>
				<th>제목</th>
				<th>날짜</th>
			</tr>
			<c:if test="${!empty glist}">
				<c:forEach var="g" items="${glist}">
					<tr>
						<th><a href="gongji_cont?gongji_no=${g.gongji_no}"> <c:if
									test="${fn:length(g.gongji_title)>16}">
       ${fn:substring(g.gongji_title,0,16)}...
      </c:if> <c:if test="${fn:length(g.gongji_title)<16}">
      ${g.gongji_title}
      </c:if>
						</a></th>
						<th>${g.gongji_date}</th>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${empty glist}">
				<tr>
					<th colspan="2">공지 목록이 없습니다!</th>
				</tr>
			</c:if>
		</table>
	</div>
</body>
</html>