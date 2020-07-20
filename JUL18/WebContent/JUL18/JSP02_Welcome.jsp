<%@ page contentType="text/html; charset=UTF-8"%>
<%
	/*
	1. 로그인하지 않은 사용자가 주소창에 이 페이지의 URL 을 적고 들어왔을 떄 
	   로그인창으로 돌려보내는 코드를 작성하세요 
	   
	2. 로그인한 회원의 아이디와 별명을 통해 "nick(id) 님 환영하세요"를 출력하세요.
	
	3. a 태그로 로그인창으로 돌아가는 링크와  request 폴더에 앨범 페이지로 갈수 있는 링크 2개를 작성하세요 
	
	*/

	if (session.getAttribute("user_id") == null) {//사전에 로그인 되어있지 않을 때
		response.sendRedirect("JSP02.jsp");
	}

	String id = (String) session.getAttribute("user_id");
	String nick = (String) session.getAttribute("user_nick");
%>
<%@ include file="./JSP03_app.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<h3><%=nick %> ( <%= id %> ) 님 환영합니다. ^^ </h3>
	<a href="JSP_06.jsp">앨범 리스트 보기 </a>&nbsp;
	<a href="JSP02_Login.jsp">로그인 페이지로</a>&nbsp;
	<a href="JSP02_Logout.jsp">로그아웃</a>
	<hr/><h3>"방문자 수 " <%=count %></h3><hr/>
 
</body>
</html>