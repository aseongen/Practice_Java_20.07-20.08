<%@ page contentType="text/html; charset=UTF-8"%>
<%
 //클라이언트에서 저장된 쿠키를 가져오는 방법.
 //return 배열 -> 전체를 가져오고 일부 데이터만을 가져올 수는 없다.
 Cookie[] cookies = request.getCookies(); 
 
 //for 반복문을 통해 배열의  쿠키 이름을 얻어온다.
 boolean flag = false;
		 
 for( Cookie c : cookies) {
   String cookieName = c.getName();//쿠키 이름을 얻어오는 메서드
   
    if (cookieName.equals("apple_cookie")){
    	out.println("<h3>사과 쿠키가 존재합니다.</h3>");
    	
    	String value = c.getValue();//쿠키의 값을 읽어오는 메서드 
    	flag= true;
    	break;
    }
 }

 if(!flag){
	 out.println("<h3>사과 쿠키가 사라졌습니다.</h3>");
	 
 }
%>

<a href = "JSP01Cookie_check_all.jsp">모든 쿠키보기~~</a>