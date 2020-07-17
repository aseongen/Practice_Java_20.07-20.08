<%@ page contentType="text/html; charset=UTF-8"%>

<%

Cookie [] cookies = request.getCookies();

for(Cookie c : cookies){
	String n = c.getName();
	String v = c.getName();
	out.println(n+":" + v + "<br/>");
	out.println("----------------------------<br/>");
}
/*
banana_Cookie:banana_Cookie
----------------------------
apple_Cookie:apple_Cookie
----------------------------
JSESSIONID:JSESSIONID
---------------------------- 

=>이런 결과가 출력된다.
*/
%>