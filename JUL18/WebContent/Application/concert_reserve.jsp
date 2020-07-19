<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%
	if (session.getAttribute("auth_pass") == null) {
		response.sendRedirect("concert_auth.jsp");
	}

    List<String> list = new ArrayList<>();
    if(application.getAttribute("complete_list") != null){
    	list = (List<String>)application.getAttribute("complete_list");
    	//null 값이 아닐 때만 list에다가 다시 넣어주고, 다시 지역변수 리스트에 다가 넣어준다
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

	<div align="center">
		<h2>콘서트 좌석 예매</h2>
		<h4>예매할 좌석을 체크한 후 예약 버튼을 눌러주세요.</h4>
	</div>

	<hr />

	<form action="concert_reserve.check.jsp">
		<!--get 방식 -->
		<p align="center">
			<strong>좌석 배치도</strong> <br />&nbsp;&nbsp;&nbsp;&nbsp;
			<%for (char c = 'A'; c <= 'Z'; c++) {	%>
			<!--'A' => 유니코드65 에서 c++ -> 값을 다시 char로 표현  -->
			<small><%=c%></small>&nbsp;&nbsp;
			<!-- 유니코드 값 출력 -->
			<% } %><br />

			<% for(int r=1; r<=3; r++) { %>
			<%= r %>
			<% for(char c='A'; c<='Z'; c++) { %>
			
            <!-- 다른 사람 선택시 해당부분 막혀있음 -->
			<% if(list.contains(c + "-" + r)) { %>
			<input type="checkbox" name="seat" value="<%=c %>-<%=r %>" disabled />
			<!-- 각 체크박스에 자리에 관한 값이 들어가야 하기 때문에 value를 입력해준다.단, 가변적이어야 한다. -->
			<!-- value="<%=c%>-<%=r%>" : 알파벳-숫자 : A-1,A-2 => 입력된다.-->
			<% } else { %>
			<input type="checkbox" name="seat" value="<%=c %>-<%=r %>" />
			<% } %>	<% } %>	<br />
			<% } %>
			
			<br />

			<% for(int r=4; r<=6; r++) { %>
			<%= r %>
			<% for(char c='A'; c<='Z'; c++) { %>
			<% if(list.contains(c + "-" + r)) { %>
			<input type="checkbox" name="seat" value="<%=c %>-<%=r %>" disabled />
			<!-- 각 체크박스에 자리에 관한 값이 들어가야 하기 때문에 value를 입력해준다.단, 가변적이어야 한다. -->
			<!-- value="<%=c%>-<%=r%>" : 알파벳-숫자 : A-1,A-2 => 입력된다.-->
			<%	} else {%>
			<input type="checkbox" name="seat" value="<%=c%>-<%=r%>" />
			<%	}	%>
			<%	}%>
			<br />
			<% } %>
			<br /><br /> 
			
			<input type="submit" value="예약"> &nbsp;
			<input	type="reset" value="재설정">
	</form>

</body>
</html>