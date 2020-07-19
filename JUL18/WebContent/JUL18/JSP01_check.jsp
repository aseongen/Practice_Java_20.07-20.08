<%@page import="java.util.Arrays"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
 /*
 - 세션에 저장된 데이터는 브라우저 창이 종료될 때까지 혹은 세션의 유효시간이 만료되기 전까지 웹 어플리케이션의 모든
    jsp 페이지에서 사용할 수 있다.
    
 - 세션에 저장된 데이터를 가져오려면 session 객체의 getAttribute () 메서드를 사용해 매개값으로 가져올 
       데이터의 세션명을 적는다.
       
 - 쿠키와 세션은 하나의 페이지의 데이터를 다른 페이지에서도 이용하고 싶을 때 사용하는 방식이다. 
 */
 
 // String nick = session.getAttribute("nickname");
 //getAttribute: Object 타입, "nickname" : String 타입이므로 다운캐스팅을 진행해야한다.
 
 //#세션 정보 가져오기
  String nick = (String)session.getAttribute("nickname" );//다운캐스팅
  String [] hobbys=(String[])session.getAttribute("hobbys" );//hobbys는 배열
  
  
  out.println(nick + "<br/>");
  out.println(Arrays.toString(hobbys)+"<br/>");
  out.println("-------------------------------------<br/>");
  
  //세션의 유효시간 설정
  session.setMaxInactiveInterval(3600); //60 * 60 다 가능 => 1시간
  
  int sTime = session.getMaxInactiveInterval(); //default 값: 1800초
  out.println("세션의 유효시간: " + sTime + "초<br/>");
  out.println("------------------------------------<br/>"); 
  
  //특정 세션 데이터 삭제
  session.removeAttribute("nick");
  nick = (String) session.getAttribute("nick");
  out.println("삭제후 nick 의 값: " + nick + "<br/>"); 
  out.println("------------------------------<br/>"); 
  //이전에는 홍길동이었으나. 삭제 후  null 값으로 확인됨.
  
  //모든 세션 데이터 삭제
  session.invalidate();
  
  if(request.isRequestedSessionIdValid()){
	  out.println("유효한 세션이 존재함");
	  
  }else{
	  out.println("유효한 세션이 존재하지 않음.");
	  
  }
 
%>