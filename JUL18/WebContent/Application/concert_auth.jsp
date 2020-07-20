<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
	UUID uuid = UUID.randomUUID();//인증번호 랜덤으로 만드는 객체 
	System.out.println(uuid.toString());//윈도우창에서 F5 확인 될때마다 console창에 계속 주소가 찍힌다.
    //878a370a-b539-4150-b414-324c5c13863d =>5개로 나눠져서 출력된다.
	
	String[] uuids = uuid.toString().split("-");//uuid 를 "-" 기준으로 split 된다.
	System.out.println(Arrays.toString(uuids));//[72017885, 120d, 41db, 8884, b04bf21af77a]
	System.out.println(uuids[1]);//120d  =>배열로 랜덤으로 추출된다.
	
	session.setAttribute("auth_code", uuids[1]);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>회원 인증페이지</h2>
	<h1>인증문자: <del><%= uuids[1] %></del></h1><!-- del: 글자 가운데 줄삽입 -->
	<form action="concert_auth_check.jsp">
		<small>위의 인증문자를 입력해주세요!</small>
		<input type="text" name="code" size="5">
		<input type="submit" value="확인">
	</form>
</body>
</html>



