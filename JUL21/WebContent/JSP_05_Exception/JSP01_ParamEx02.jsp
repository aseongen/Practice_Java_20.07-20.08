<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<!-- Ex01 페이지에서 액션으로 Ex02 페이지로 온다. -> 다시03으로 안내
Ex01 에서 넘어올때 request : 2개의 파라미터를 갖고 온다.
Ex02 에서 Ex03으로 넘어올 때 nick 라는 파라미터를 하나 더 추가한다.  -->

<jsp:forward page="JSP01_ParamEx03.jsp">
	<jsp:param value="멍멍이" name="nick" />
</jsp:forward>

