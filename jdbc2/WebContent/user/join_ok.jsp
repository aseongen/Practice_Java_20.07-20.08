<%@page import="kr.co.koo.jdbc.user.model.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<!-- Join form 에서 실행 // 회원관리 전체 로직-->
<%
	//1. 폼데이터 처리 
	request.setCharacterEncoding("utf-8");

	/*String name = request.getParameter("name");
	 String id = request.getParameter("id");
	 String pw = request.getParameter("pw");
	 String phone1 = request.getParameter("phone1");
	 String phone2 = request.getParameter("phone2");
	 String phone3 = request.getParameter("phone3");
	 String gender = request.getParameter("gender");*/

	//2.JDBC 로직 작성
	/* String uid = "week";
	 String upw = "week";
	 String url = "jdbc:oracle:thin:@localhost:1521:xe";
	 
	 Connection conn = null;
	 PreparedStatement pstmt = null;
	 
	 //String sql = "INSERT INTO users VALUES ('" 
	//		+ name + "', '" + id + "', '" + pw 
	//		+ "', '" + phone1 + "', '" + phone2 
	//		+ "', '"+ phone3 + "', '" + gender + "')"; //
			
	String sql = "INSERT INTO users VALUES(?,?,?,?,?,?,?)";
			
	 System.out.println(sql);
	 
	 try{
	   Class.forName("oracle.jdbc.OracleDriver");
	   conn = DriverManager.getConnection(url,uid,upw);
	   //stmt = conn.createStatement();
	   pstmt = conn.prepareStatement(sql);
	   pstmt.setString(1, name);
	   pstmt.setString(2, id);
	   pstmt.setString(3, pw);
	   pstmt.setString(4, phone1);
	   pstmt.setString(5, phone2);
	   pstmt.setString(6, phone3);
	   pstmt.setString(7, gender);
	   
	   //int rn = stmt.executeUpdate(sql);
	   int rn = pstmt.executeUpdate();
	   if(rn==1){
		   session.setAttribute("user_name",name); //name변수에 SQL name 값을 세션으로 저장해줌
		   response.sendRedirect("join_success.jsp");
		   
	   }else{
		   response.sendRedirect("join_form.jsp");
		   //실패시 다시 폼으로 재전송
	   }
	 }catch(Exception e) {e.printStackTrace();}
	finally {
		try{
			
	      if(pstmt != null ) pstmt.close();
			  if(conn != null) conn.close();
			  
		}catch(Exception e){e.printStackTrace();}
	}  
	 */
%>
<%-- request.getParamter("id).... 다해야한다...
-> UserVO users = new UserVO();
-> Users.set~~ 
7개를 다 만들어줘야 하는데 이 과정을 2줄로 요약함--%>
<jsp:useBean id="users" class="kr.co.koo.jdbc.user.model.UserVO"></jsp:useBean>
<%-- users 만들고 UserVO 내용 전부를 users에 넣는다.
예를 들면)  name 변수, id, pw 등등 내용을 넣는다.  --%>
<jsp:setProperty name="users" property="*" />

<%
	//UserDAO 입력후 Ctrl + Space -> inport 된다.
	//Join_ok 클래스 하단과 동일 코드임
	UserDAO dao = UserDAO.getInstance(); //미리 만들어놓은 단 한개의 객체를 리턴 받음
	int rn = dao.join(users); // 디비 연동 권한을 제공함
	
	if (rn == 1) {
		session.setAttribute("user_name", users.getName()); //name변수에 SQL name 값을 세션으로 저장해줌
		response.sendRedirect("join_success.jsp");

	} else {
		response.sendRedirect("join_form.jsp");
		//실패시 다시 폼으로 재전송
	}
%>



