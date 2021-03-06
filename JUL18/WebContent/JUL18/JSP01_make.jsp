<%@ page contentType="text/html; charset=UTF-8"%>
<!-- 세션 (session)
- 세션도 쿠키와 유사하게 서버와의 관계를 유지하기 위한 수단이다.
- 단, 쿠키와 달리 클라이언트의 특정 위해 저장되는 것이 아니라, 서버상에 각체 형태로 존재하다.
- 서버당 하나의 세션 객체를 가질 수 있다.
- 세션 객체는 브라우저 창을 종료하면 삭제된다.
- 따라서, 세션은 서버에서만 접근이 가능하여 보안이 좋고, 저장할 수 있는 데이터에 한계가 없다.
- 세션은 클라이언트의 요청이 발생하면 자동생성이 되어 고유한 ID 값을 클라이언트에 넘겨주며 이것은 쿠키에 저장한다.
- JSP 에서는 session 이라는 내장 객체를 지원하여 세션의 속성을 설정할 수 있다.

      =>req
    클라이언트     WAS 
      <=res
      
  WAS : 에서 브라우저당 한개가 자동 생성되고, 브라우저 종료 or 세션 유효시간 만료시 자동삭제된다. 
                 세션은 내장객체로 지원되며, 서버 내부에서 작동된다.     
  
 -->
 <%
 /* 
 - 세션은 쿠키와 마찬가지로 http 통신 데이터를 유지하기 위한 수단으로 사용한다.
 - 세션에 데이터를 저장할 때는 JSP 내장 객체 session 이 지원하는 setAttribute() 메서드 사용
 - 해당 메서드의 매개값으로 세션의 이름을 정하고, 두번째 매개값으로 세션에 저장할 값을 정해준다.
 */
  session.setAttribute("nickname", "홍길동");
  session.setAttribute("hobbys", new String[] {"축구","게임","독서"});
 //세션은 데이터들을 언제든지 사용할 수 있다. "nickname","hobbys" 
 //-> 세션의 유효시간이 만료되기 직전까지, 브라우저 종료전까지 유지
 
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> </title>
</head>
<body>
<a href="JSP01_mk.jsp">세션 데이터 활용하기</a>
</body>
</html>