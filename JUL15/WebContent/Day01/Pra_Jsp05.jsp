<%@page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html; charset=UTF-8" import="java.io.*" %>
<%--Directive : 지시자 --%>
<%-- 외부 패키지 import 방법 --%>
<%--1. <%@ %> import 선언해주기
    2. <%@ ~~UTF-8 옆에 import=" " %> 작성해주기 --%>
    
<%@ page import="java.util.Date" %>
<%
  // java.util.Date date = new  Date();
 
  Date date = new Date();
  SimpleDateFormat sdf = new SimpleDateFormat("yyy년 MM월 dd일");
  String dayInfo = sdf.format(date);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> </title>
</head>
<body>
<p>오늘은 <%=dayInfo %> 입니다.</p>
<%-- <%= %> : 표현식 : 결과값을 출력할 때 사용 --%>
</body>
</html>