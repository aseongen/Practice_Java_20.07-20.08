<%@ page contentType="text/html; charset=UTF-8"%>

<%
	/* 아이디는 선언부나, 클래스를 벗어나는 순간 초기화가 된다 따라서 id의 역할을 담기위해  
	   Cookie 객체 생성시 "id_cookie"에 해당하는 값을 넣어준다.
	*/

	Cookie[] cookies = request.getCookies();

	String userID = null;
	for (Cookie c : cookies) {

		if (c.getName().equals("id_cookie")) {
			userID = c.getValue();
			//만약에 for 배열에 id_cookie 가 발견된다면, userID 변수에 c.getValu()값을 담아라
			break;
		}
	}
	if (userID != null) {
		out.println("<p>" + userID + "님 환영합니다</p>");
		out.println("<a href = 'JSP02_CookieLogin.jsp'>로그인화면으로 돌아가기</a>");
		//만약 userID가 null 값이 아니라면 출력
		
	} else {
		out.println("<p>시간이 지나자동 로그아웃 처리 되었습니다.</p>");
		out.println("<a href='JSP02_CookieLogin.jsp'>다시로그인하기</a>");

	}
%>