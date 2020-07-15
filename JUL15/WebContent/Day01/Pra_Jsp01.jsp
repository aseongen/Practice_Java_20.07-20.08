<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

<% for(int i=0; i<2 ;i++){ %>
	<h2>이클립스와 톰캣으로 JSP 파일 렌더링하기</h2>
	<p>
		안녕하세요 오늘은 2020년 07월 15일 수요일입니다.<br /> 
		<i> 스크립트릿을 연습을 하고 있다. </i> <br/>
	</p><hr/>
<% } %>

<h2>#구구단 2단</h2>
<%
  for(int hang=1; hang<=9 ; hang++){
	  out.println("2 x " + hang + " = " + (2*hang) + "<br/>");
  }

%>

<h2>#반복문과 조건문을 이용하여 구구단 홀수단 (3,5,7,9) 출력하세요  </h2>
<%
 for(int dan =2; dan<=9 ; dan++){
	 if(dan % 2 != 0){
		 out.println("<h2> 구구단 " + dan + "단 <h2>");
		 for(int hang =1; hang<=9; hang++){
			 out.println(dan +" x " + hang + " = " + (dan*hang) + "<br/>");
		 }
	 }
 }
%>

</body>
</html>