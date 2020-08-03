<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<%
/* 1. 폼태그에서 넘어온 데이터들(파라미터)를 각각 변수에 저장.
 * 2. 해당 데이터를 sql문을 통해 DB에 전송
 * 3. 전송이 완료됐을시 executeUpdate()가 1을 리턴하면 세션에 변경된 이름을 저장한 후
 *    update_sucess.jsp 로 리다이렉트, 0을 리턴하면 login_form.jsp 로 리다이렉트
 */

  request.setCharacterEncoding("utf-8");
  String id =(String)session.getAttribute("login_id");
  String name = request.getParameter("name");
  String phone1 = request.getParameter("phone1");
  String phone2 = request.getParameter("phone2");
  String phone3 = request.getParameter("phone3");
  String gender = request.getParameter("gender");
  
    String uid = "week";
	String upw = "week";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	
	Connection conn = null;
	PreparedStatement pstmt = null;

	/*String sql = "update users set name='" + name + "', phone1='" 
			+ "', phone2 = "+phone2 + "', phone3 = " + phone3 
			+ "', gender = " + gender + "' where id = '" + id + "'";*/
	String sql ="update users set name=?, phone1=?, phone2=?, phone3=?, gender=? where id=? ";
	
	try{
		Class.forName("oracle.jdbc.OracleDriver");
		conn = DriverManager.getConnection(url, uid,upw);
		pstmt = conn.prepareStatement(sql);
		int rn = pstmt.executeUpdate();
		
		if(rn==1){
			session.setAttribute("user_name", name);
			response.sendRedirect("update_success.jsp");
		}else{
			response.sendRedirect("login_form.jsp");
		}
		
	} catch(Exception e) {e.printStackTrace();}
	finally { 
		try{
			if(conn != null) conn.close();
			if(pstmt != null) pstmt.close();
		}catch(Exception e) {e.printStackTrace();}
	}

%>