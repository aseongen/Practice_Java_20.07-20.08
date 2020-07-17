<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String title = request.getParameter("title");
/* request.getParameter: 클라이언트가 요청 한 정보를 파라미터를 통해 서버에서 정보를 
    넘겨주고, 해당 정보 페이지로 이동시켜준다.
*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<%
   if(title.equals("IU")){
	   //상대경로
	   response.sendRedirect("http://localhost:8081/JUL17/JUL17/IU.jsp" );

   }else if (title.equals("AKMU")) {
	   //절대경로
	   response.sendRedirect("./AKMU.jsp" );
   }
 
%>

<!-- 이전에는 하단과 같이 한 클래스 안에 모아서 한번에 정보를 보냈다면
 이제는 메인에서 선언된 부분을 JSP_01_Send.jsp 통로를 통해 IU.jsp 클래스의 정보를 가져온다. 
 =>이 부분 역시 POST선언이다. -->

<%--
	<%
		if (title.equals("IU")) {
	%>
	 <div align="center">
		<h2>선택하신 앨범 정보</h2>
		<p>당신이 선택한 앨범의 가수는 아이유 입니다.</p>
		<hr />
		<h3>타이틀 곡 MV</h3>
		<iframe width="640" height="360" src="https://www.youtube.com/embed/D1PvIWdJ8xo" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	</div>
	
	<% } else if (title.equals("AKMU")) {	%>
	<div align="center">
		<h2>선택하신 앨범 정보</h2>
        <p>당신이 선택한 앨범의 가수는 악동뮤지션 입니다.</p>
		<hr/>
		<h3>타이틀 곡 MV</h3>
		<iframe width="640" height="360" src="https://www.youtube.com/embed/mZz9uYdj_v4" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	</div>
	<% } %>
	
	--%>
</body>
</html>