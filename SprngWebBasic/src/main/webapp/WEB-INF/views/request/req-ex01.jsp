<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	
	<h2>Request컨트롤러를 이용한 요청 처리 작업</h2>
	<p> 컨트롤러 테스트 중입니다.</p>
	
	<form action="/web/request/basic01" method="get">
	<p><input type="submit" value="GET요청!!"></p>
	</form>
	
	<form action="/web/request/basic01" method="post">
	<p><input type="submit" value="post요청!!"></p>
	</form> 
	
</body>
</html>