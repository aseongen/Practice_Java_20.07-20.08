<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

	<form action="JSP02_CookieLogin_ok.jsp" method="post">
		<input type="text" name="id" size="10" placeholder="ID" /> 
		<input type="checkbox" name="id_remember" value="yes" /> 
		<small>아이디 기억하기 </small><!-- small 태그: 글씨의 70% 축소 --><br />
		<input type="password" name="PW" size="10" placeholder="PW" /><br /> <input type="submit" value="로그인" />
	</form> 

</body>
</html>