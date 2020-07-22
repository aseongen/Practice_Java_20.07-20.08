<%-- 
- 자바빈은 데이터 베이스와의 반복적인 작업을 효율적으로 처리하기 위해 사용한다
- JSP에서는 액션태그를 사용하여 자바빈을 사용할 수 있는 방법이 있다.
- JSP 액션 태그로 자바빈 사용하는 방법
  ex) <jsp:useBean id ="자바빈 객체 이름" class="자바빈이 위치한 실제 경로" 
        scpe="객체를 사용할 범위"/>
  1. id - jsp 페이지에서 자바빈 객체에 접근할 때 사용할 이름을 지정함.
  2. class - 패키지 이름을 포함한 자바바니 클래스의 완전한 경로를 입력함
  3. scope - 자바빈 객체를 저장할 영역을 지정함.
  --a. page: 하나의 JSP 페이지를 처리할 때 사용하는 영역
  --b. request: 하나의 요청을 처리할 때 사용되는 영역
  --c. session:하나의 웹 브라우저와 관련된 영역
  --d. application: 하나의 웹 어플리케이션과 관련된 영역
  
-JSP 액션태그로 setter과 getter 메서드를 사용할 수 있다.
 1.setter 사용법
  ex)<jsp:setProperty name ="자바빈 id" property ="자바빈 클래스의 변수명" value="할당값"/>
   ----a.name:값을변경할자바빈객체의이름을지정합니다.useBean태그에서id속성에지정한값을그대로사용합니다. 
   --b.property:값을지정할프로퍼티의이름을지정합니다.자바빈클래스의변수명을적어줍니다. 
   --c.value:프로퍼티의값을지정합니다.표현식이나EL도사용할수있습니다. 
 2.getter사용방법
  ex)<jsp:getPropertyname="자바빈id"property="변수명"/>
   --a.name:useBean태그에서id속성에지정한값을사용합니다.
   --b.property:출력할프로퍼티의이름을지정합니다.자바빈클래스의변수명을적습니다.
   
--%>

<%@page import="kr.co.koo.jspbasic.user.UserBean"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<jsp:useBean id="user" class="kr.co.koo.jspbasic.user.UserBean" scope="request"/>
	<!-- UserBean으로 처리하는 방법 -->
	<%//UserBean user = (UserBean) request.getAttribute("user");%>
	<%--#아이디:<%user.getId()%><br/> --%>
	
	#아이디 : <jsp:getProperty name="user" property="id"/><br /> 
	#비밀번호 :	 <%=user.getPw()%><br /> 
	#이름 : <%=user.getName()%><br /> 
	#이메일 : <%=user.getEmail()%><br />

	<!--  
#아이디 :request.getAttribute("user_id")d") %><br/>
#비밀번호 :request.getAttribute("user_pw")w") %><br/>
#이름 :request.getAttribute("user_name")e") %><br/>
#이메일 :request.getAttribute("user_email")l") %><br/>-->

</body>
</html>