package kr.co.koo.jdbc.basic;

import java.sql.*;
import java.util.Scanner;

public class jdbcSelect2 {

	public static void main(String[] args) {
		/*
		 * 회원의 ID를 입력받아 해당 ID의 회원정보를 모두 출력하는
		 * JDBC프로그래밍 코드를 작성하세요.
		 */

		Scanner sc = new Scanner(System.in);
		System.out.println("조회할 회원의 ID를 입력하세요.");
		System.out.print("> ");
		String userId = sc.next();

		String url = "jdbc:mysql://localhost:3306/jsp_practice";
		String uid = "jsp";
		String upw = "jsp";

		String sql = "SELECT * FROM member WHERE id='" + userId + "'";

		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null; 

		try {
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection(url, uid, upw);
			stmt = conn.createStatement();
		
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {				
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String name = rs.getString("name");
				String email = rs.getString("email");
				
				System.out.println("==========회원 정보=========");
				System.out.println("아이디: " + id);
				System.out.println("비밀번호: " + pw);
				System.out.println("이름: " + name);
				System.out.println("이메일: " + email);
				System.out.println("=========================");
			} else {
				System.out.println("해당 회원 정보는 존재하지 않습니다.");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
				stmt.close();
				rs.close();
				sc.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}

}
