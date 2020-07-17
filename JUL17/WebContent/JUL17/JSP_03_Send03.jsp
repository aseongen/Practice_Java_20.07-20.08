<%@ page contentType="text/html; charset=UTF-8"%>
<%
//String strage = request.getParameter("age");//getParameter:String 타입
//int age = Integer.parseInt(strage); //string 타입을 Integer.parseInt : Integer 타입으로 변경 
//두줄을 한줄로 만드는 방법
int age = Integer.parseInt(request.getParameter("age"));
//절대경로
String url = "http://localhost:8181/JUL17/JUL17/JSP_03_reSend.jsp";

if(age>=20) {
	
	//response 객체가 제공하는 sendRedirect()메서드의 매개값으로 이동시킬 URL 주소를 적으면 해당 페이지로 강제 이동합니다.
   response.sendRedirect(url);

}else{
	response.sendRedirect("JSP_03_Send02.jsp");
	
}


%>