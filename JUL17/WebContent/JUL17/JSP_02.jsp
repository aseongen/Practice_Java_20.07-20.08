<%@ page contentType="text/html; charset=UTF-8"%>
<!-- # Get 방식)
  1. 서버에 데이터를 요청하는 용도
  2. 전송하는 데이터가 주소(URL)에 노출됨.
  3. 전송했던 데이터는 브라우저의 히스토리에 접속했던 주소와 함께 남아 있어 보안성에 취약함.
  4. 게시판 글 조회나 검색 같이 서버의 정보를 가져올 필요성이 있을 때 사용함.
  5. 전송할 수 있는 최대 크기는 브라우저별로 다르지만 크기가 정해져있음
  6. HTML form 태그가 반드시 필요하지는 않는다.
 
 #Post 방식)
  1. 서버에 데이터를 전송하는 용도
  2. 전송되는 데이터가 URL 에 묻어나지 않고 전송 객체의 메시지 바디를 통해 전달됨.
  3. 브라우저에 전달되는 데이터가 남지 않기 때문에 보안성에 강함.
  4. 비밀번호나 주민번호 등 private 한 데이터를 서버에 전송해야 할 때 사용함.
  5. 반드시 HTML form 태그가 필요하다.
  6. 데이터 양의 제한이 없기 때문에 대량의 데이터를 전송할 수 있다.
 -->
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

	<form action="JSP_02_Send.jsp" method="post">
		<%-- form 태그 안에 method ="post " 작성하는 순간 POST 방식으로 변환된다 --%>
		<%-- 전 : http://localhost:8081/JUL17/JUL17/JSP_02_Send.jsp?id=ㅇㅇ&pw=dd&name=dd  --%>
		<%-- 후: http://localhost:8081/JUL17/JUL17/JSP_02_Send.jsp --%>
		<%-- 파일 뒤에 후반 부분이 보이지 않는다. => POST 방식--%>
		-아이디 : <input type="text" name="id" size="10px" /><br /> 
		-비밀번호 : <input type="password" name="pw" size="10px" /><br /> 
		-이름 : <input type="text" name="name" size="10px" /><br /> 
		      <input type="submit" value="전송" />
	</form>

	<%-- 상단과 같이 Request Method :GET 방식의 경우 모든 정보가 URL 에 노출되기 때문에 보안성이 매우 안좋다. 
                    따라서 POST 방식을 권장한다.

                    전송 방식을 POST 방식으로 사용하기 위해서는 반드시 form 태그가 필요하다.
         form 태그의 method 속성을 "post"  로 설정하면 요청 방식이 post 방식으로 전달된다.--%>

	<%--이름 text 박스에 한글 입력시 깨짐 	
     1. Servers -> tomcat v9.0 ->server.xml -> 46번째줄 ->  URIEncoding 를 입력해준다
         <Connector URIEncoding="utf-8" connectionTimeout="20000"
     2."Send.jsp" 파일에서 " request.setCharacterEncoding("utf-8"); " 입력해준다 --%>

</body>
</html>