package com.spring.database.test;

import java.sql.Connection;
import java.sql.DriverManager;

import javax.sql.DataSource;

import org.junit.Test;

public class DbConnectTest {

	private String driver = "oracle.jdbc.OracleDriver";
	// 버전:  8. 대 db에서 cj 가 추가됨

	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String uid = "week";
	private String upw = "week";

	// DB연결 테스트
	@Test
	public void connectTest() {

		Connection conn = null;
		DataSource ds = null;
		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, uid, upw);
			System.out.println(conn);
			System.out.println("DB 커넥션 성공");
			System.out.println("conn: " + conn);
		} catch (Exception e) {e.printStackTrace();}
		finally {
			try {
				 if(conn != null) conn.close();
			} catch (Exception e) {	e.printStackTrace();}
		}
	}
}
