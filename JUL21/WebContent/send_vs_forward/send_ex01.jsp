<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

	<form action="send_ex02.jsp" method="post">
		<input type="text" name="id" placeholder="ID" /><br /> 
		<input type="password" name="pw" placeholder="PW" /><br />
		<input type="submit" value="로그인"/>
	</form>

</body>
</html>

<!-- forward의 경우는 정보를 그대로 넘기기 때문에 로그인 정보가 유지되지만.
sendredirect 의 경우 요청할 떄마다 정보를 계속해서 새로 요청하고, 이전데이터는 버려지기 떄문에
null 값이 올라온다. -->