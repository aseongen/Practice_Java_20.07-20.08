package kr.co.koo.jdbc.basic;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

/* 데이터베이스와 JAVA 의 연결순서
 * 1. JDBC 드라이버 로드
 * 2. 데이터베이스 connection 객체 생성 
 * 3. 쿼리문 실행을 위한 Statement 객체 생성
 * 4. 쿼리문을 실행
 * 5. ResultSet 객체를 통해 쿼리문 실행 결과값을 소비
 * 6. Statement 객체 종료
 * 7. 데이터베이스 Connection 객체 종료.
 */

public class JdbcSelect {
	public JdbcSelect() {

		String uid = "week";
		String upw = "week";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";

		Connection con = null;
		Statement st = null;
        ResultSet rs = null;
//게시물 가져오기 
		try {

			Class.forName("oracle.jdbc.oracleDriver");
			con = DriverManager.getConnection(url,upw,uid);
			st = con.createStatement();
			String sql = "select * from member222";
			
			 st.executeQuery(sql);//String type
			//executeQuery : DB에 명령
			 //ResultSet : 명령에 대한 반환값. 반환해주는 값은 테이블을 보시면서 해야 이해할 듯 
			while(rs.next()) {
				/* - select 의 실행 결과의 컬럼 레코드를 읽어오려면 
				 * getString(), getInt() 등의 메서드를 사용합니다.
				 * - 해당 메서드의 매개값으로 읽어올 테이블의 컬럼명을 지정합니다.
				 * 
				 * 
				 */
			 String id = rs.getString("id");
			 String pw = rs.getString("pw");
			 String name = rs.getString("name");
			 String email = rs.getString("email");
			 System.out.println("----------------");
			 System.out.printf("#아이디 : %s 비번: %s, 이름: %s , 이메일: %s \n"
					 ,id,pw,name,email);
		}
		   System.out.println("------------------");
		} catch (Exception e) {e.printStackTrace();}
		finally {
			try {
				if (con != null) con.close();
				if (st != null)	st.close();
				if (rs != null)	rs.close();
			} catch (Exception e) {e.printStackTrace();}
		}

	}

}
