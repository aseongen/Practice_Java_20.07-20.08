<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String strCm = request.getParameter("cm");
	String strKg = request.getParameter("Kg");

	System.out.print(strCm);
	System.out.print(strKg);
	
	double cm = Double.parseDouble(strCm);
	double Kg = Double.parseDouble(strKg);
	
	System.out.print(cm);
	System.out.print(Kg);
	
	//bmi 지수 계산 공식 [체중/ 신장(m) * 신장(m)]
	double bmi = Kg / (cm / 100 * cm / 100);
	System.out.println(bmi);
	bmi = Math.round(bmi * 1000) / 1000.0;
	System.out.println(bmi);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<!-- bmi 지수 : [체중 /신장*신장]
       bmi 지수가 23을 추과하면 "당신은 과체중입니다."
               18.5 미만이면: "당신은 저체중입니다.
                                  나머지는 "당신은 정상체중입니다"

    *문자열 내부에 들어있는 데이터를 기본데이터 타입으로 변환하는 방법
          포장 클래스에 들어있는 parse + 기본타입이름() 메서드 활용
     ex)String -> int
        Integer   -->
        
	<h2>체질량 지수 (BMI) 계산</h2>
	<hr/>
	
	<p>
		- 신장 : <%=strCm %>cm<br/>
	    - 체중 : <%=strKg %>Kg<br />
	</p>

	<p>BMI지수 :<b><%=bmi%> </b><br/>
	
	<% if(bmi >23) { %>과체중입니다.
	<% }else if (bmi<18.5) { %> 당신은 저체중입니다.
	<% } else { %> 당신은 정상체중입니다.
	<% } %>
	<!-- 그냥 실행하면 에러남 
	URL:http://localhost:8081/JUL16/JSP_03.jsp?cm=150&kg=40 입력해야함-->
	
    </p>
</body>
</html>