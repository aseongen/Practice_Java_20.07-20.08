<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//HttpServletRequest request = new HttpServletRequest(); =>JSP 에서는 생략이 가능하다
	// request.getRequestURL(); ->호출된 FULL 주소를 가져온다.
	StringBuffer reqUrl = request.getRequestURL(); //getRequestURL : StringType
	String reqUri = request.getRequestURI(); //getRequestURI : String type
	String protocol = request.getProtocol(); //서버 프로토콜
	String conPath = request.getContextPath(); //도메인 주소 뒤의 Route폴더 
	int serverPort = request.getServerPort();//getServerPort: int 타입
	String userIP = request.getRemoteAddr(); //=>이런 방식으로 주소를 읽을 수 있다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

	<p>
		# 요청 URL:<%=reqUrl%></p><br/><!-- # 요청 URL:http://localhost:8081/JUL16/JSP_01.jsp -->
	<p>	
	   # 요청 URI:<%=reqUri%></p><br/> <!--# 요청 URI:/JUL16/JSP_01.jsp  -->
	<p>
		# 요청 프로토콜:	<%=protocol%></p><br/><!-- # 요청 프로토콜: HTTP/1.1 -->
	<p>
		# 요청 컨텍스트 루트경로:<%=conPath%></p><br/><!--# 요청 컨텍스트 루트경로:/JUL16 -->
	<p>
		# 서버 포트번호:	<%=serverPort%></p><br/><!-- # 서버 포트번호: 8081 -->
	<p>
		# 요청자 ip주소:<%=userIP%></p><br/><!-- # 요청자 ip주소:0:0:0:0:0:0:0:1 -->

</body>
</html>