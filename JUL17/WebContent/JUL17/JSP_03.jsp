<%@ page contentType="text/html; charset=UTF-8"%>
<%--response 객체 )
1. 웹 브라우저의 요청에 응답하는 것을 response 라고 한다.
2. 이러한 응답의 정보를 가지고 있는 객체를 response 객체 라고 한다.
3. response 객체 주요 메서드
    - getCharacterEncoding() : 응답할 때의 문자의 인코딩 형태를 구한다.
    - addCookie(Cookie c) : 쿠키를 지정한다.
    - sendRedirect(URL) : 지정한 URL로 이동한다.--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

	<form action="JSP_03_Send01.jsp" method="post">
		-당신의 나이는 ?? <input type="text" name="age" size="5" /> 
		<input type="submit" value="확인" />
	</form>
</body>
</html>