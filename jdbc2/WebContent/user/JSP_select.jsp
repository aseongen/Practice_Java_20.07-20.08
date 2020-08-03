<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	String uid = "week";
	String upw = "week";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	
	String sql="select * from member22";
	
	Connection conn = null;
	ResultSet rs = null;
	Statement stmt = null;
	
	try{
		Class.forName("oracle.jdbc.OracleDriver");
		conn = DriverManager.getConnection(url,uid,upw);
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		
		while(rs.next()){
			String id = rs.getString("id");
			String pw = rs.getString("pw");
			String name = rs.getString("name");
			String email = rs.getString("email");
		
			out.println("아이디 : " + id + " 패스워드: " + pw + " 이름: " + name + " 이메일: " + email +"<br/>");
		}
		
	}catch(Exception e) {e.printStackTrace();}
	finally{
		try{
			   if(stmt != null) stmt.close();
	           if(conn != null) conn.close();
	           if(rs != null) rs.close();
	           
		}catch(Exception e) {e.printStackTrace();}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>