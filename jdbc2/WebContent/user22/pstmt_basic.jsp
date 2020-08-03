<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	String uid = "week";
	String upw = "week";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String sql = "Insert into member22 values(?,?,?,?)";
	
	try{
		Class.forName("oracle.jdbc.OracleDriver");
		conn = DriverManager.getConnection(url,uid,upw);
		/*
	     - pstmt 객체는 Connection이 제공하는 prepareStatement()메서드를 호출합니다.
	               매개값에 sql을 전달합니다. 
		*/
		pstmt = conn.prepareStatement(sql);
		/*
		 - pstmt 객체를 생성했다면 sql 문의 ? 값들을 채워줍니다.
		 - ?는 첫번째 물음표부터 1번의 인덱스 값을 가지며 순차적으로 인덱스가 1씩 증가합니다.
		 - DB테이블의 컬럼 데이터타입에 따라 setString(), setInt() 등의 메서드를 사용하여 ?를 채운다.
		*/
		
		pstmt.setString(1, "chicken1234");
		pstmt.setString(2, "ccc1234");
		pstmt.setString(3, "닭튀김");
		pstmt.setString(4, "ch@naver.com");
		
		/*
		 - ? 값을 모두 입력했다면 sql 문의 종류에 따라 executeQuery(), executeUpdate()호출
		 - 단, stmt와는 달리 매개값으로 sql을 전달하지 않는다. 
		*/

		int rn = pstmt.executeUpdate();
		
		if(rn==1){
			out.print("<h3>회원정보 입력 성공 </h3>");
		}else{
			out.print("<h3>회원정보 입력 실패 </h3>");
				
		}
	}catch(Exception e){e.printStackTrace();}
	finally { 
		try{
			if(conn != null) conn.close();
			if(pstmt != null) pstmt.close();
		}catch(Exception e){e.printStackTrace();}
	}
%>



