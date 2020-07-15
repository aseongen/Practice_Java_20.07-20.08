<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import =" java.util.*" %>
<%
  List<Integer> lotto = new ArrayList<>();
  while(lotto.size()<6){
	  int rn = (int ) (Math.random()*45) +1;
      //contains(): 리스트 내부에 해당 객체가 존재하면 true를 리턴
      
      if(!lotto.contains(rn)){
    	  lotto.add(rn);
      }
  }

//리스트의 오름차 정렬방법
Collections.sort(lotto);
%>

<!DOCTYPE html>
<html>
<head> 
<meta charset="UTF-8">
<title> </title>
</head>
<body>
<h1>로또번호 생성결과</h1>
<p>이번주 로또는 이 번호다!! </p>

<%
 for(int num : lotto){
	 out.println(num + "&nbsp;");//&nbsp : 공백 
	 Thread.sleep(700);//CPU를 잠시 멈추는 메서드 0.7초마다 출력되기
	 out.flush(); // 브라우저의 출력 버퍼를 비우는 메서드.
 }

%>

</body>
</html>