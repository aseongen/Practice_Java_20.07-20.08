<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="kr.co.koo.jspbasic.user.UserBean" %>
 <%--UserBean 을 Action 태그로 변경하는 방법  --%> 
 <%--16~17 줄을 한줄로 불러 액션태그로 사용할 수 있다. 
 scope 생략 가능 => page로 처리되서 빈을 지금 이 페이지에서만 사용할  수 있다.--%>
 
<jsp:useBean id="user" class="kr.co.koo.jspbasic.user.UserBean" scope="request"/>
<%--
*파라미터의 이름과 자바빈 클래스의 멤버변수명이 일치할 경우 
액션태그 setProperty의 속성 property 값을 *로 지정하면
자동으로 파라미터값을 읽어서 자바빈 클래스 변수에 저장합니다--%>
<jsp:setProperty name="user" property="*"/>

<!--  
<jsp:setProperty name="user" property ="id" value="<%=  request.getParameter("id")%>"/>
<jsp:setProperty name="user" property ="pw" value="<%=  request.getParameter("pw")%>"/>
<jsp:setProperty name="user" property ="name" value="<%=  request.getParameter("name")%>"/>
<jsp:setProperty name="user" property ="email" value="<%=  request.getParameter("email")%>"/>-->

<%
request.setCharacterEncoding("utf-8");

// String id = request.getParameter("id");
// String pw = request.getParameter("pw");
// String name = request.getParameter("name");
// String email = request.getParameter("email");

 //user.setId(request.getParameter("id"));
// user.setId(pw);
// user.setId(name);
// user.setId(email);
 
 //UserBean 을 Action 태그로 변경하는 방법
 //UserBean user = new UserBean(id, pw, name, email);
 //request.setAttribute("user", user);
 
 /*request.setAttribute("user_id", id);
 request.setAttribute("user_pw", pw);
 request.setAttribute("user_name", name);
 request.setAttribute("user_email", email);*/

%> 

<!-- URL : JUL22/bean_make.jsp?id=abc&pw=1234&name=하하&email=abc@naver.com 
클래스 실행후 URL 직접 입력 => 파라미터가 아닌 직접 값을 넣어주었다.
bean_make 클래스에서 객체를 각각 선언해주고 ->request 객체에 값을 할당하고 출력함
=> 그리고 해당 페이지로 forward 해줌  -->

<jsp:forward page="bean_use.jsp"/>