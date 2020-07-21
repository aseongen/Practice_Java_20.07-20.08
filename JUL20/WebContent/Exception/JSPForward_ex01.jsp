<%@ page contentType="text/html; charset=UTF-8"%>
<%--
 *jsp action tag  사용법
 -<jsp:forward 속성=값,...></jsp:forward>
 -닫는 태그는 태그 내부에 추가적으로 종속된 태그가 없다면 닫는 태그를 생략하고 열린태그 끝부분은 />로 마감할 수 있다.
 ex)<jsp:forward 속성=값,.../>

 --%>
<jsp:forward page="forward_ex02.jsp"></jsp:forward>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> </title>
</head>
<body>

<h3>forward_ex02페이지입니다.</h3>
<p>포워드 기능에 의해 이 메시지를 보실 수 없습니다.</p>
<!-- 실행시 JSPForward_ex02가 실행된다.
   sendRedirect 와 큰 차이가 있다. -> 나중에
   => 강제로 페이지를 잃어버림 -->



</body>
</html>