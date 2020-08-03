package kr.co.koo.jdbc.basic;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class pra_jdbcInsert {
	public static void main(String[] args) {

     String url = "jdbc:oracle:thin:@localhost:1521:xe";
     String uid = "week";
     String upw = "week";
	
     Connection con = null;
     Statement st = null;
     
     try {
    	 Class.forName("oralce.jdbc.OracleDriver");
         con = DriverManager.getConnection(url,upw,uid);
         st = con.createStatement();
         String sql="INSERT INTO MEMBER222 values('jsp11','jsp11','난난','dkf@naver.com')";

         int resultNum = st.executeUpdate(sql);
         if (resultNum == 1) {
				System.out.println("DB에 회원정보 저장 성공");
			} else {
				System.out.println("DB에 회원정보 저장 실패!");
			}
    	 
     }catch(Exception e) {e.printStackTrace();}
     finally {
    	 try {
    		  if(con != null) con.close();
              if(st != null) st.close();
    	 }catch (Exception e) {
           
    	 }
     }
     
	
	}
}
