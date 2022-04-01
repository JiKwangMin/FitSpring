<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../include/admin_header.jsp" %>

 
 <%--관리자 메인 본문 --%>
  <div id="aMain_cont">
    <div id="aBw_wrap">
     <h2 class="aBw_title">관리자 게시판 수정</h2>
     <form method="post" action="admin_board_edit_ok"
     onsubmit="return bw_check();">
     <input type="hidden" name="board_no" 
     value="${b.board_no}" />
     <input type="hidden" name="page" value="${page}" />
     <table id="aBw_t">
    <tr>
     <th>이름</th>
     <td>
     <input name="board_name" id="board_name" size="14" 
     value="${b.board_name}"/>
     </td>
    </tr>
    <tr>
     <th>제목</th>
     <td>
     <input name="board_title" id="board_title" size="35" 
     value="${b.board_title}" />
     </td>
    </tr>
    <tr>
     <th>비밀번호</th>
     <td>
     <input type="password" name="board_pwd" id="board_pwd"
     size="14" />
     </td>    
    </tr>
    <tr>
     <th>내용</th>
     <td>
     <textarea name="board_cont" id="board_cont" rows="9"
     cols="36">${b.board_cont}</textarea>
     </td>
    </tr>
   </table>
   <div id="aBw_menu">
    <input type="submit" value="수정" />
    <input type="reset" value="취소" 
    onclick="$('#board_name').focus();" />
    <input type="button" value="목록"
    onclick="location='admin_board_list?page=${page}';" />
   </div>
     </form>
    </div>
  </div>
  
<jsp:include page="../include/admin_footer.jsp" /> 




 