<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%! String name, phone1, phone2, phone3, gender; %>
<%
	String uid = "week";
	String upw = "week";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String id =(String)session.getAttribute("login_id");
	
	
	String sql="select * from users where id ='" + id +"'";
	
	Connection conn = null;
	ResultSet rs = null;
	Statement stmt = null;
	
	try{
		Class.forName("oracle.jdbc.OracleDriver");
		conn = DriverManager.getConnection(url,uid,upw);
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		
		if(rs.next()){
        name = rs.getString("name");			
        phone1 = rs.getString("phone1");			
        phone2 = rs.getString("phone2");			
        phone3 = rs.getString("phone3");			
        gender = rs.getString("gender");	 		
		}
		
	}catch(Exception e) {e.printStackTrace();}
	finally{
		try{
			   if(stmt != null) stmt.close();
	           if(conn != null) conn.close();
	           if(rs != null) rs.close();
	           
		}catch(Exception e) {e.printStackTrace();}
	}
	System.out.print(name);
	System.out.print(phone1);
	System.out.print(phone2);
	System.out.print(gender);
	System.out.print(gender);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="update_ok.jsp" method="post">
		이름: <input type="text" name="name" size="10" value="<%=name%>"><br> 
		아이디: <%=session.getAttribute("login_id") %><br> 
		전화번호: 
		<select name="phone1">
			<option>010</option>
			<option>011</option>
			<option>016</option>
			<option>019</option>
		 </select> - 
		 <input type="text" name="phone2" size="5" value="<%=phone2 %>"> - 
		 <input type="text" name="phone3" size="5" value="<%=phone3 %>"> <br> 
		
		<!-- 성별이 "여" or "남" 으로 선택되어있다면 사전에 고정으로 체크박스에 체크되어있음 -->
		성별:
		<% if(gender.equals("여")) { %>
		<input type="radio" name="gender" value="남">남 &nbsp;
		<input type="radio" name="gender" value="여" checked>여 <br>
		
		<% } else {  %>
		
		<input type="radio" name="gender" value="남" checked>남 &nbsp;
		<input type="radio" name="gender" value="여">여 <br>
		<% } %>
		
		<input type="submit" value="정보수정">
	</form>
	
</body>
</html>