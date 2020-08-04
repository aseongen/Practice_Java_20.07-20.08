<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	//1.폼데이터 처리
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	//2.SQL 문 작성(select 문으로 가입 당시의 패스워드를 조회)
	//String sql = "select pw, name from users " + "where id ='" + id + "'";
	String sql = "select pw, name from users where id =?";

	//3.DB 연동에 필요한 변수들 선언
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String uid = "week";
	String upw = "week";

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null; //select 문은 resultSet 필요

	try {
		Class.forName("oracle.jdbc.OracleDriver");
		conn = DriverManager.getConnection(url, uid, upw);
	
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1,id);
		
		rs = pstmt.executeQuery();

		if (rs.next()) {
			String dbPw = rs.getString("pw");
			String dbName = rs.getString("name");

			if (pw.equals(dbPw)) {
				
				session.setAttribute("login_id", id);
				session.setAttribute("login_pw", pw);
				session.setAttribute("user_name", dbName);
				response.sendRedirect("login_success.jsp");
				
			} else {
				response.sendRedirect("login_pw_fail.jsp");
			}
		} else {
			response.sendRedirect("login_id_fail.jsp");
		}
	} catch (Exception e) {e.printStackTrace();} 
	finally {
		try {

			if (pstmt != null)pstmt.close();
			if (conn != null)conn.close();

		} catch (Exception e) {e.printStackTrace();}
	}
	//4.JDBC로직 작성

	//5. ResultSet통해 결과값 소비후 결과에 맞는 페이지 안내

	//6. 로그인 성공시 id, name 세션처리
	
%>