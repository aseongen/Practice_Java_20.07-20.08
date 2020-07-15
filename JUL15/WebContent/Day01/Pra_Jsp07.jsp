<%@ page contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%-- trimDirectiveWhitespaces : 디렉티브의 흔적을 지워버린다.. --%>
<%@ page import="java.util.Random"%>

<%!int total;%>
<%
	total++;
	Random r = new Random();
	//nextInt ()메서드는 정수 난수값을 발생시키는 메서드이다.
	//매개값으로 정수 n을 주면 0이상 n 미만의 정수 난수를 리턴합니다.
	int num = r.nextInt(8) + 2; //0~7까지 이지만 +2 => 2~9까지 단수
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<p>
		페이지 누적 요청수   <%=total%>
		<br /> 매 <strong> 10</strong> 번째 방문자에게는 기프티콘을 드립니다.
		<% if (total % 10 == 0) { %>
		당첨되셨습니다!!
		<%	}	%>
	</p>
	
	<hr/>
	
	<p>
		<% for (int i = 1; i <= 9; i++) { %>
		<%=num %> X <%= i %> = <%= num * i %> <br/>
		<% } %>
	</p>
	
</body>
</html>