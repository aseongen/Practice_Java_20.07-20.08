<%@ page contentType="text/html; charset=UTF-8"%>
<!-- 
 데이터 저장 범위 (scope)
 - page : 1개의 페이지
 - request: 유입된 페이지
 - session : 브라우저 종료 전까지 
 - application : 서버 종류 전까지 , 모든 페이지에서 데이터 공유 가능  
 -->

 
 <%
  int count =0;
//첫실행은 1부터 실행 -> null 나올것 -> count++
//2회차 실행: 다시 count 0이 되서 if 문이 실행되지 않지만 session 값이 고정이여서 누적된다.
//session 이 아닌 request 로 변환시에는 count++ 가 실행되지 않는다.
 if(application.getAttribute("visit") != null){
	 
	 count = (Integer) application.getAttribute("visit");
	 
 }
 count ++;
 
 application.setAttribute("visit", count);
 %>
 