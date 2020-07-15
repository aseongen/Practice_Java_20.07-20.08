<%@ page contentType="text/html; charset=UTF-8"%>
<%! public String name="홍길동"; %>
<%
 String address="서울시";
 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> </title>
</head>
<body>
<!-- 표현식: out.println() 를 대체한다. -->
이름: <%= name %> <br/><!-- out.println ( "이름: " + name + "<br/> -->
주소: <%= address %> <br/>
</body>
</html>