<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="../include/admin_header.jsp" />
<%--관리자 상단 공통 페이지 --%>

<%--관리자 메인 본문 --%>
<div id="aMain_cont">
  
  <div id="aBw_wrap">
		<h2 class="aBw_title">관리자 자료실 수정</h2>
		<form method="post" action="admin_bbs_edit_ok"
			onsubmit="return write_check();" enctype="multipart/form-data">
			
			<%--히든값 --%>
			<input type="hidden" name="bbs_no" value="${b.bbs_no}" />
			<input type="hidden" name="page" value="${page}" /> <%--책갈피 -> 페이징(쪽나누기)--%>
			
			<table id="aBw_t">			
				<tr>
					<th>이름</th>
					<td><input name="bbs_name" id="bbs_name" size="14" value="${b.bbs_name}"/></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input name="bbs_title" id="bbs_title" size="35" value="${b.bbs_title}" /></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="bbs_pwd" id="bbs_pwd"
						size="14" /></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea name="bbs_cont" id="bbs_cont" rows="9" cols="36">${b.bbs_cont}</textarea>
					</td>
				</tr>
				<tr>
					<th>파일첨부</th>
					<td><input type="file" name="bbs_file" /></td>
				</tr>
			</table>
			<div id="aBw_menu">
				<input type="submit" value="수정" /> <input type="reset" value="취소"
					onclick="$('#bbs_name').focus();" /> <input type="button"
					value="목록" onclick="location='admin_bbs_list?page=${page}';" />
			</div>
		</form>
	</div>
	
</div>

<jsp:include page="../include/admin_footer.jsp" />
<%--관리자 하단 공통 페이지 --%>