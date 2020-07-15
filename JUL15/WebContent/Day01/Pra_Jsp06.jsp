<%@ page import="java.util.Random"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%!//Declaration
	//jsp 파일에서 사용할 멤버변수, 메서드를 선언할 때 사용
	int total;

	int randomNumber() {
		//랜덤 정수 1~10까지를 발생시켜서 리턴해주세요 
		// return (int) (Math.random()*10 ) +1;
		Random r = new Random();
		return r.nextInt(10) + 1; //next(10) ->0 ~ 9까지 가져온다  따라서 +1

	}

	String randomColor() {
		/* 0.0 이상 1.0미만의  실수 난수를 발생시켜
		난수값이 0.66 이상이면 "빨강", 0.33 이상  "노랑", 그 외는 "파랑"리턴하는 함수  */
		
		double d = Math.random();

		if (d >= 0.66) {
			return "빨강";
			
		} else if (d >= 0.33) {
			return "노랑";
			
		} else {
			return "파랑";
		}
	}  %>
	
<%
	//Scriptlet
	//지역변수 및 메서드 내부의 코드를 작성하는 태그
	//페이지 요청이 발생할 때마다 실행할 로직 발생 

	int each = 0;
	total++;
	each++;

	int rn = randomNumber();
	String rc = randomColor();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<h2>오늘의 운세!</h2>
	<!-- p태그는 문단을 나눌때 사용하는 태그입니다. -->
	<p>
		페이지 누적 요청수: <%=total%>, 
		페이지 개별 요청수: <%=each%><br />
	</p>
	
	<h3>오늘의 행운 숫자와 행운의 색깔</h3>
	
	<p>
		행운의 숫자 : <strong><%=rn%></strong><br/> 
		행운의 색깔: <em><%=rc%></em>
	</p>
	
<%-- List 인터페이스
1. 순차적으로 저장 
2. 중복 객체 저장 가능, 저장순서 보장
3. index로 관리

List<String > list = new ArrayList<> () ;

추가: list.add()
개수: list.size()
참조: list.get(index)
제거: list.remove(객체 or index)
인덱스 번호 알아보기:   list.indexOf(객체)
객체 유무 :list.content(객체)
전부초기화: list.clear()
어디에 있는것을 어떻게 바꿀건지 list.set(어디에 있는거 : index, 어떻게 바꿀거야)
Collections. sort():오름차순
           . reverseorder():내림차순
 --%>
</body>
</html>