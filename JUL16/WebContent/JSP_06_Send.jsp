<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String title = request.getParameter("title");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
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
</body>
</html>