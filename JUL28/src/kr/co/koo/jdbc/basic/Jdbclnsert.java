package kr.co.koo.jdbc.basic;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Jdbclnsert {

	/*
	 * db 연동순서 1. db 사용자 계정명과 암호, DB URL 등 초기 데이터 변수를 설정
	 */

	String driver = "oracle.jdbc.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "week";
	String psw = "week";
	
	Connection con = null;
	PreparedStatement pt = null;
	ResultSet rs = null;
	String sql = null;


	public boolean idSearch(String id) {
		try {
         Class.forName(driver);
         
         //3.DB 연동을 위한 클래스들의 객체를 생성
         /* #a - Connectin 객체
          * :DB와의 연결을 위한 객체. Connection 객체를 생성하려면  직접 new 연산자를 통해 객체를 생성할 수 없고,
          * DrvierManager 클래스가 제공하는 정적 메서드 getConnection()을 호출하여 객체를 생성한다.          * 
          */
         con = DriverManager.getConnection(url, user, psw);
         //getConnection : db 연결된 객체를 반환해 준다. 
         System.out.println(con);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;

	}
	// 2.JDBC 커넥터 드라이버 호출

}
