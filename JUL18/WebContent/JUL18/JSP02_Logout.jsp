<%@ page contentType="text/html; charset=UTF-8"%>
<%
 session.invalidate();  //세션의 데이터 모두 날라감
 response.sendRedirect("JSP02_Login.jsp");

%>