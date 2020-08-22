<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- JSTL 사용하는 코어태그립 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

<h2>Model 객체에 대해 알아보기</h2>


<%-- 
<c:url value='/response/test/'> 
- value 속성 안에 컨테스트 루트 경로를 제외한 절대 경로를 작성 
- 컨테스트 루트를 제외하고 연결 가능

 --%>

<a href="<c:url value='/response/test?age=30'/>">테스트 페이지로~~~</a>
	
</body>
</html>

