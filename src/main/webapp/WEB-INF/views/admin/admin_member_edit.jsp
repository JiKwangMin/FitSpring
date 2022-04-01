<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../include/admin_header.jsp" %>

<div id="aMain_cont">
 
  <div id="aMd_wrap">
   <h2 class="aMd_title">관리자 회원정보 수정</h2>
   <form method="post" name="m" 
   action="admin_member_edit" onsubmit="return edit_check();">
    <table id="aMd_t">
     <tr>
      <th class="left_box">회원아이디</th>
      <td><input name="mem_id" size="14" value="${m.mem_id}"
      readonly /></td>
     </tr>
     <tr>
      <th class="left_box">비밀번호</th>
      <td><input type="password" name="mem_pwd" id="mem_pwd"
      size="14" /></td>
     </tr>
     <tr>
      <th class="left_box">비밀번호 확인</th>
      <td><input type="password" name="mem_pwd2" id="mem_pwd2"
      size="14" /></td>     
     </tr>
     <tr>
      <th class="left_box">회원이름</th>
      <td><input name="mem_name" id="mem_name" size="14"
      value="${m.mem_name}" /></td>
     </tr>
     <tr>
      <th class="left_box">우편번호</th>
      <td><input name="mem_zip" id="mem_zip" size="5"
      value="${m.mem_zip}" readonly />-<input name="mem_zip2"
      id="mem_zip2" size="5" value="${m.mem_zip2}" readonly />
      <input type="button" value="우편검색" 
      onclick="post_check();" />
      </td>
     </tr>
     <tr>
      <th class="left_box">주소</th>
      <td><input name="mem_addr" id="mem_addr" size="40"
      value="${m.mem_addr}" readonly /></td>
     </tr>
     <tR>
      <th class="left_box">나머지 주소</th>
      <td><input name="mem_addr2" id="mem_addr2" size="36"
      value="${m.mem_addr2}" /></td>
     </tR>
     <tr>
      <th class="left_box">폰번호</th>
      <td>
       <select name="mem_phone01">
        <c:forEach var="p" items="${phone}">
         <option value="${p}"
         <c:if test="${m.mem_phone01 == p}">
         ${'selected'}</c:if>>${p}</option>
        </c:forEach>
       </select>-<input name="mem_phone02" id="mem_phone02"
       size="4" maxlength="4" value="${m.mem_phone02}" />-
       <input name="mem_phone03" id="mem_phone03"
       size="4" maxlength="4" value="${m.mem_phone03}" />
      </td>
     </tr>
     <tr>
      <th class="left_box">전자우편</th>
      <td>
      <input name="mail_id" id="mail_id" size="14"
      value="${m.mail_id}" />@<input name="mail_domain"
      id="mail_domain" size="12" value="${m.mail_domain}"
      readonly />
      <select name="mail_list" onchange="domain_list();">
       <c:forEach var="mail" items="${email}">
        <option value="${mail}"
        <c:if test="${m.mail_domain == mail}">
        ${'selected'}</c:if>>${mail}</option>
       </c:forEach>
      </select>
      </td>
     </tr>
     <tr>
      <th class="left_box">가입/탈퇴</th>
      <td><input name="mem_state" size="2" 
      value="${m.mem_state}" /></td>
     </tr>
     <tr>
      <th class="left_box">탈퇴사유</th>
      <td><textarea name="mem_delcont" rows="8" cols="33"
      >${m.mem_delcont}</textarea></td>
     </tr>
     <tr>
      <th colspan="2">
      <input type="submit" value="수정" />
      <input type="reset" value="취소" 
      onclick="$('#mem_pwd').focus();" />
      <input type="button" value="회원목록"
onclick="location='admin_member_list?page=${page}';" />      
      </th>
     </tr>
    </table>
   </form>
  </div>
</div>

<%@ include file="../include/admin_footer.jsp" %>












