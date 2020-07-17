<%@ page contentType="text/html; charset=UTF-8"%>
<!-- # 쿠키 (Cookie)
 - 웹 브라우저에서 서버로 어떤 데이터를 요청하면, 서버측에서는 알맞은 로직을 수행한 후 데이터를 웹 브라우저에 응답한다.
 - 그리고 HTTP 프로토콜은 응답 후에 웹 브라우저와의 관계를 종료합니다.
 - 연결이 끊어졌을 때, 어떤 정보를 지속적으로 유지하기 위한 수단으로 쿠키라는 방식을 사용한다.
 - 쿠키는 서버에서 생성하여, 서버가 아닌 클라이언트측 (local)에 정보를 저장한다.
 - 서버에서 요청할 때마다 쿠키의 속성값을 참조 또는 변경할 수 있다.
 - 쿠키는 개당 4kb로 용량이 제한적이며,300개까지 (1.2MB) 데이터 정보를 가질 수 있다.
 - 쿠키 문법: 쿠키 클래스에서 쿠키 생성 -> setter 메서드로 쿠키의 속성 설정 ->response 객체에 쿠키 탑재
    -> 로컬 환경에 저장
    
           =>req 
    Client        WAS
           =>res
           
    : 웹프로그래밍 : 요청과 응답의 반복적인 관계   (HTTP 프로토콜 사용)
      ->단점: 로그인페이지라고 가정하면 로그인 한 이후에 해당 정보가 유지되지 않고, 로그아웃이 되버린다.
                  즉, 유지되지 않는다. 이때 사용하는 것이 쿠키이다.
    : 쿠키는 정보를 담고 있다. 클라이언트에서 웹으로 쿠키 정보를 전달해준다. 
    : 서버는 쿠키가 있다면 이라는 전제하에 해당 정보를 교환하고 제공한다. 쿠키가 있다면 계속해서 해당 정보를 제공한다.
    
    : 쿠키는 서버에서 생성해야 한다.
  -->
<%
	/*
	 #쿠키 생성 방법
	 1. 쿠키 객체를 생성  - 생성자의 매개값으로 쿠키의 이름과 저장할 데이터를 입력
	*/
	//( A , B ) : A, B : 둘다 String , Cookie 는 생성자가 없다.
	Cookie apple = new Cookie("apple_Cookie", "사과맛쿠키");
	Cookie banana = new Cookie("banana_Cookie", "바나나쿠키");

	//2. 쿠키  클래스의 setter 메서드로 쿠키의 속성들을 설정
	apple.setMaxAge(20);//쿠키의 유효시간 설정(초) : 60초 X 60초
	banana.setMaxAge(60 * 60); 
	
	//3. http 응답시 response 객체에 생성된 쿠키를 탑재하여 클라이언트로 전송
	response.addCookie(apple);
	response.addCookie(banana);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

<a href="JSP01_cookieCheck.jsp">쿠키 확인하기</a>

</body>
</html>