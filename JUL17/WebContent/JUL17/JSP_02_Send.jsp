<%@ page contentType="text/html; charset=UTF-8"%>
<%
//post 방식을 통해 전송된 데이터의 한글처리는 아래의 메서드를 사용한다.
request.setCharacterEncoding("utf-8");
 String id = request.getParameter("id");
 String pw = request.getParameter("pw");
 String name = request.getParameter("name");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> </title>
</head>
<body>

<p>
# 아이디 : <%=id %><br/>
# 패스워드 : <%=pw %><br/>
# 이름: <%= request.getParameter("name") %><br/>
</p>

</body>
</html>