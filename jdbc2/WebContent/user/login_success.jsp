<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String id = (String)session.getAttribute("login_id"); %>
<% String name = (String)session.getAttribute("user_name"); %>
<!-- session은 수명기간이 웹페이지 작동시간까지이고  -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h3><%=name%>(<%=id%>)님 로그인이 완료되었습니다.</h3>
	<a href="update_form.jsp">회원 정보 수정</a>
	<a href="delete_ok.jsp">회원 탈퇴</a>
	<a href="logout.jsp">로그아웃</a>
</body>
</html>