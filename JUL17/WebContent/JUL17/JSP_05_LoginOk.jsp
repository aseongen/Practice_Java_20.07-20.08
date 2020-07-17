<%@ page contentType="text/html; charset=UTF-8"%>
<!-- 중계페이지 -->

<%-- 1. 이 페이지는 중계 페이지로서 아이디값과 비밀번호값을 받아서 처리한다.
     2.  ID: 'abc1234' 이고, PW : 'xyz9876' 이다.
       ID가 일치하지 않을 경우 'JSP_04_IdFail.jsp' 로 리다이렉팅 -> '존재하지 않은 회원입니다.
       PW가 일치하지 않을 경우 'JSP_04_PwFail.jsp 로 리다이렉팅 -> '비밀번호가 틀렸습니다.'출력하기
     3. ID와 PW가 전부 일치하면 'JSP_04_Welcome.jsp'로 리다이렉팅-> '회원님 반갑습니다.'   --%>

<%
	request.setCharacterEncoding("utf-8");
	String paID = request.getParameter("id");
	String paPW = request.getParameter("pw");

	if (paID.equals("abc1234")) {
		
		if (paPW.equals("xyz9876")) {
			response.sendRedirect("./JSP_05_Welcome.jsp");
			
		} else {
			response.sendRedirect("./JSP_05_PwFail.jsp");
		}

	} else {
		response.sendRedirect("./JSP_05_IdFail.jsp");
	}
%>




