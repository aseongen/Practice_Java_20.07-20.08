<%@ page contentType="text/html; charset=UTF-8"%>
<%-- @요청 파라미터 (request parameters)
 - 클라이언트 측에서 서버로 데이터를 요청 할 때 전달되는 값들을 담은 변수를 요청 파라미터라고 부른다. (변수와 유사 개념)
 - 요청 파라미터는 URL 주소 뒤에 ?를 붙인 이후 [파라미터변수명=값]의 형식을 통해 서버로 데이터를 전달한다.
 - 요청 파라미터를 여러 개 전달할 때는 & 기호로 나열하여 전달한다.
  --%>
<%
	/* 클라이언트에서 전송된 요청 파라미터의 값을 읽는 방법
	 * 내장 객체 request의 메서드 getParameter(파라미터 이름)*/

	String breakfast = request.getParameter("bf"); //getParameter : string 리턴받음
	String lunch = request.getParameter("lunch");
	String dinner = request.getParameter("dinner");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<h2>요청 파라미터 읽기 연습!!</h2>
	<p>
		- 아침: <%=breakfast %> <br /> 
		- 점심: <%=lunch %><br /> 
		- 저녁: <%=dinner %><br />

	</p>
<!-- http://localhost:8081/JUL16/JSP_02.jsp?
URL 위치에 : bf=샌드위치&lunch=떡볶이&dinner=삼겹살  -> 입력 -> 웹 페이지 화면에 구현됨
URL 위치에 다른 값을 넣어줘도 된다. -->
<!-- bf, lunch, dinner 파라미터를 활용해 서버측에 해당 정보를 열어달라고 요청한 것. -->
</body>
</html>