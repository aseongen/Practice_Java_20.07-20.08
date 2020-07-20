<%@ page contentType="text/html; charset=UTF-8"%>
<!-- 중간 페이지,  -->
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	//String + 변수이름 -> 자유, getParametre("name") ->고정
	String pw = request.getParameter("pw");
	String nick = request.getParameter("nick");

	if (id.equals("kkk7777") && pw.equals("7777")) {
		session.setAttribute("user_id", id);
		session.setAttribute("user_nick", nick);
		
		response.sendRedirect("JSP02_Welcome.jsp");
	} else {
%>
<!-- 자바스크립트  -->

<!-- HTML 내부에 자바스크립트 코드를 사용하려면 <Script> 태그를 사용합니다.
   - JS 내장함수 alert() 는 브라우저에 경고창을 띄운다.
   - JS 내장 객체 history가  제공하는 back() 메서드는 뒤로가기 기능을 수행한다. -->

<script type="text/javascript">
	alert("로그인에 실패했습니다.");
	history.back();
</script>

<%
	}
%>