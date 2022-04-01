<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../include/admin_header.jsp" %>

<div id="aMain_cont">
 <div id="aMem_wrap">
  <h2 class="aMem_title">관리자 회원정보</h2>
  <table id="aMem_t">
   <tr>
    <th>회원아이디</th> <td>${m.mem_id}</td>
   </tr>
   <tr>
    <th>회원이름</th> <td>${m.mem_name}</td>
   </tr>
   <tr>
    <th>우편번호</th> <td>${m.mem_zip}-${m.mem_zip2}</td>
   </tr>
   <tr>
  <th>회원주소</th> <td>${m.mem_addr}&nbsp;${m.mem_addr2}</td>   
   </tr>
   <tr>
   <th>휴대폰</th>
   <td>${m.mem_phone01}-${m.mem_phone02}-${m.mem_phone03}</td>
   </tr>
   <tr>
    <th>전자우편</th>
    <td>${m.mail_id}@${m.mail_domain}</td>
   </tr>   
   <tr>
    <th>가입회원/탈퇴회원</th>
    <td>
    <c:if test="${m.mem_state == 1}">가입회원</c:if>
    <c:if test="${m.mem_state == 2}">탈퇴회원</c:if>
    </td>   
   </tr>
   <tr>
    <th>가입날짜</th> <td>${m.mem_date}</td>
   </tr>
   <c:if test="${m.mem_state ==2}">
   <tr>
    <th>탈퇴사유</th> <td>${del_cont}</td>
   </tr>
   <tr>
    <th>탈퇴날짜</th> <td>${m.mem_deldate}</td>
   </tr>
   </c:if>
  </table>
  <div id="aMem_menu">
  <input type="button" value="회원목록"
  onclick="location='admin_member_list?page=${page}';" />
  </div>
 </div>
</div>

<jsp:include page="../include/admin_footer.jsp" />

















