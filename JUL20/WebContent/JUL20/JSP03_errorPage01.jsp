<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page errorPage="JSP03_errorPage02.jsp"%>
<!-- 실행시 JSP04_errorPage02.jsp 페이지가 실행된다.
하지만  URL :http://localhost:8081/JUL20/JSP03_errorPage01.jsp =>확인된다.
해당 URL 에 파라미터("id")로 입력하면 ID 값이 확인된다.
즉, 예외처리하는 페이지가 확인된다.-->

<!-- #에러페이지의 우선순위
-에러페이지를 여러 방법으로 지정한 경우 다음의 우선순위에 따라 사용할 에러 페이지를 선택합니다.
1) 페이지 지시자 태그의 errorPage 속성에 지정한 페이지
2) web.xml 에 지정한 에러타입에 따른 페이지
3) web.xml 에 지정한 응답 상태코드에 따른 페이지
4) 위 3 항목에 해당하지 않을 경우 톰캣이 제공하는 에러 페이지 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<%=10 / 0%>
	<%=request.getParameter("id").toLowerCase()%>
</body>
</html>