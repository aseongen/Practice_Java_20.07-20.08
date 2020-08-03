package kr.co.koo.jdbc.basic;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

//게시물 저장
public class jdbcInsert {

	public static void main(String[] args) {

		// DB 연동순서
		// 1.DB 사용자 계정명과 암호, DB URL 등 초기 데이터 변수를 설정
		String url = "jdbc:oracle:thin:@localhost:1521:xe";// 오라클 접속주소,1521은 포트번호,xe는디비명
		String uid = "week";// 오라클 접속사용자
		String upw = "week";// 사용자 비번
		
		Connection conn=null;//데이터베이스 연결 참조변수
		Statement st=null;//쿼리문 수행 참조변수 
		
		try {
			// 2.JDBC 커넥터 드라이버호출
			Class.forName("oracle.jdbc.OracleDriver");// oracle.jdbc는 패키지명,OracleDriver는 오라클jdbc 드라이버 클래스명

			// 3.DB연동을 위한 클래스들의 객체 생성.
			/* a- Connection 객체 : DB와의 연결을 위한 객체 Connection 객체를 생성하려면 
			 * 직접 new 연산자를 통해 객체를 생성 할 수 없고, 
			 * DriverManager 클래스가 제공하는 정적 메서드 getConnection()을 호출하여 객체를 생성한다.
			 */
			conn = DriverManager.getConnection(url, uid, upw);
			System.out.println(conn);
			/* b- Statement 객체 sQL 문 실행을 위한 객체 Statement 객체는 Connection 객체가 제공하는
			 * CreateStatement()메서드를 호출하여 생성
			 */
		    st = conn.createStatement();

			/* c - SQL문 작성 SQL문은 String 형태로 작성한다.
			 */
			String sql = "INSERT INTO member22 values('jsp00','jsp00','김제이에스피','jjj12@nav.com')";

			/* d - Statement 객체를 통한 SQL문 실행 
			 * 1. insert, update, delete 명령일 경우 executeUpdate()를 호출한다. 
			 * 2. select 명령일 경우 executeQuery() 를 호출합니다. 
			 * 3. executeUpdate 는 샐행 성공시 성공한 쿼리의 개수를 실패시 0을 리턴합ㄴ디ㅏ.
			 */
			int resultNum = st.executeUpdate(sql);
			
			if (resultNum == 1) {
				System.out.println("DB에 회원정보 저장 성공");
			} else {
				System.out.println("DB에 회원정보 저장 실패!");
			}

		} catch (Exception e) {e.printStackTrace();}
		finally {
			try {
	              if(st != null) st.close();
	              if(conn != null) conn.close();
	              
				}catch(Exception e) {e.printStackTrace();}
			}

	}
}
