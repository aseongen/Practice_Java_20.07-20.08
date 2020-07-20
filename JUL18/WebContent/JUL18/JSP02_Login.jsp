<%@ page contentType="text/html; charset=UTF-8"%>
<!-- 쿠키 대신 세션을 사용하는 이유 : 세션이 쿠키보다 보안에서 앞서기 때문이다. -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
fieldset {
	width: 50%;
}
</style>
</head>
<body>
	<%@ include file="JSP03_app.jsp"%>
	<%
		if (session.getAttribute("user_id") != null) { //로그인 되어있는 상태
			String nick = (String) session.getAttribute("user_nick");
	%>
	<p><%=nick%>님이 현재 로그인중입니다.
	</p>
	
	<a href="JSP02_Welcome.jsp">메인페이지로</a>
	
	<% } else {	%>

	<form action="JSP02_SessionLoginOk.jsp" method="post">
		<fieldset>
			<legend>로그인 폼</legend>
			<%--div : 한줄 상자, 자동 줄갱 가능, span: 한줄 상자, 줄갱 불가능 --%>
			<input type="text" name="id" size="10" placeholder="ID" /><br /> 
			<input type="password" name="pw" size="10" placeholder="PW" /><br /> 
			<input type="text" name="nick" size="10" placeholder="별명" /><br /> 
			<input type="submit" value="로그인" />
		</fieldset>
	</form>
	<%	}	%>
	<hr/>
	
	<h3> 방문자수 :	<%=count%></h3>
</body>
</html>