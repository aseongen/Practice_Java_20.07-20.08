<%@ page contentType="text/html; charset=UTF-8"%>

<%
	String name = request.getParameter("name");//Ex01
	String email = request.getParameter("email");//Ex01
	String nick = request.getParameter("nick"); //Ex02
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

	#이름: <%=name%><br /> 
	#이메일: <%=email%><br /> <!-- 이름과 이메일은 input 태그로 작성해서 넘어오고 -->
	#별명: <%=nick%><br /><!-- 별명은 지정된 파라미터로 동일하게 찍힌다. -->

</body>
</html>

<!-- 
#action

   client       ->>req         WAS
 page01.jsp             page02.jsp in page01.jsp
                              +
                           page03.jsp
                          
#sendRedirect)

  client       ->>req(1)           WAS
page01.jsp   <-response(2)  page02.jsp   =>요청페이지
                            in page01.jsp
        |                      + 
        |==>>>req(3)        page03.jsp   =>위임페이지 
      <<---response         in page02.jsp in page01.jsp
      
 - page02.jsp 에서 전달된 데이터를 받아서 바로 다시 page01.jsp 로 돌아간다
 - 다시 page01.jsp에서 page0.jsp에 요청을 보내고 1+2 정보를 보낸다.
 - page03.jsp는 그부분에 대한응답을 보낸다. 
 
** 즉, 처음 (1)에 대한 정보를(3)정보가 같더라도 활용할 수 없다. 
** sendRedirect의 경우 page02 에서 사용한 것은 단편적이다.
   page03.jsp 에서 사용하고 싶을 경우 다시 page01.jsp 에서 요청한 후 가져올 수 있다.

#forward
   client                         WAS
 page01.jsp     ->>req(1)    page02.jsp  =>요청페이지
                             in page01.jsp
        |                        | (2)
        | <<---response(3)  page03.jsp =>위임페이지
  page01.jsp 에서 요청 한 내용을 page02.jsp에 보내고 이곳에서 수정 혹은 추가한 내용을 바로 page03.jsp 로 보냄
  
 -->
 
 
 
 
 