<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> </title>
</head>
<body>
<!-- Declaration 선언)
  - JSP 페이지 내에서 사용되는 변수 또는 메서드를 선언할 때 사용
  - 여기 선언된 변수 및 메서드는 전역의 의미로 사용된다.
  - 클래스를 작성했던 위치이기 때문에 메인에서 작성한 코드는 해당 부분에 작성이 안되다.
  - 클래스 선언부에서는 import 작성이 불가 -> Declaration 역시 불가
  - Basic 클래스 확인  -->
  
<%! 
 public int i; //i 초기화 : 기본값 0 
 public String str = "홍길동";
 
 public int add(int n1, int n2){
	 return n1 + n2;
 }
 //Math.random();
 
%>
<%

  double d = Math.random();
  int result = add(4,7);
  int j=0;
  i++;
  j++;
  
  out.println("i의 값: " + i + "<br/>");
  out.println("j의 값: " + j + "<br/>");
  out.println("result 의 값: " + result + "<br/>");
  out.println("d 의 값: " + d + "<br/>");
  
  /* 실행 할때만다 i의 값은 증가하지만 j의 값은 증가하지 않는다. why?
   * Client -> WAS : 
   * WAS 내부에서 jsp 파일을 .java 클래스화 된다. ->이걸 컴파일하고  .jsp 로 읽어들인다.
   
   * i, j 가 처음에는 같이 ++ 된다 이후에는 i 가 재사용이 되어서 i++실행되는 반면
   * j는 i의 재사용으로 인해 계속 1이 호출된다.  
     => JSP 의 특징 : 웹서버와 통신시에 자동으로 Servlet로 변화된다.
  */
  
%>

</body>
</html>