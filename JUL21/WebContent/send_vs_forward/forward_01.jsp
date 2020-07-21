<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

	<form action="forward_02.jsp" method="post">
		<input type="text" name="id" placeholder="ID" /><br /> 
		<input type="password" name="pw" placeholder="PW" /><br />
		<input type="submit" value="로그인"/>
	</form>

</body>
</html>

<!-- forward 의 경우 
ex01 번에서 입력한 값을 ex02로 전달하고
forward_ex02에서 03으로 전달 할때 데이터 내용이 동일하다 -->