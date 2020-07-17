<%@page import="java.util.Arrays"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!-- JSP_04 에서 보낸 데이터들을 getParameter을 통해 가져오고 
     <body>를 통해 출력할 형식 및 데이터를 작성해준다. -->
<%
	String name = request.getParameter("user_name");
	String id = request.getParameter("user_id");
	String pw = request.getParameter("user_pw");
	String gender = request.getParameter("gender");
	String regin = request.getParameter("regin");
	String[] hobbys = request.getParameterValues("hobby");
	//hobby의 경우 여러개가 선택 될 수 있기 때문에 배열타입으로 받는다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

	<h2>form 태그로 전달된 데이터 읽기 학습</h2>

	<p>
		#이름: <%=name%><br /> 
		#id:  <%=id%><br /> 
		#PW:  <%=pw%><br /> 
		#취미: <%=Arrays.toString(hobbys)%><br/>
		<!--배열로 받은 내부 데이터들을 다 받는다.  -->
		#성별: <%=gender%><br /> 
		#지역: <%=regin%><br />
</body>
</html>