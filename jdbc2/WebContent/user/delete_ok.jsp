<%@page import="kr.co.koo.jdbc.user.model.UserDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>

<%
	String id = (String)session.getAttribute("login_id");
// 세션 아이디 키값이 login_id인가봐
    UserDAO dao = UserDAO.getInstance();
    int rn = dao.userDelete(id);

    if(rn==1){
    	session.invalidate();
    	response.sendRedirect("login_form.jsp");
    // 주소가 바뀌어 있었어~
    	
    }else{
    	response.sendRedirect("login_success.jsp");
    }
    

	/*String uid = "week";
	String upw = "week";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";

	Connection conn = null;
	Statement stmt = null;
	
	String sql = "Delete from users where id='" + id +"'";
	
	//삭제  성공시 login_form.jsp 로 실패시 login_welcome.jsp 리다이랙팅
	try{
		Class.forName("oracle.jdbc.OracleDrvier");
		conn = DriverManager.getConnection(url, uid,upw);
		stmt = conn.createStatement();
		int rn = stmt.executeUpdate(sql);
		
		if(rn == 1){
		  session.invalidate(); //데이터를 삭제해 세션을 지워버림
		  response.sendRedirect("login_form.jsp");
		  
		}else {
			response.sendRedirect("login_welcome.jsp");
		}
		
	} catch(Exception e) {e.printStackTrace();}
	finally{
		try{
			if(conn != null) conn.close();
			if(stmt != null) stmt.close();
			
		}catch(Exception e){e.printStackTrace(); }
	}
	*/
	
	
%>


