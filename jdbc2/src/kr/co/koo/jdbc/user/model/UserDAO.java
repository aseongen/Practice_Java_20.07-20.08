package kr.co.koo.jdbc.user.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

//DAO 클래스는DB 작업을 전담처리합니다
public class UserDAO {

	private String uid = "week";
	private String upw = "week";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";

	// 객체를 하나만 사용하게 제한 하는 방법 => 싱글톤 패턴 클래스 생성
	// 1. 클래스 외부에서 객체를 생성할 수 없도록 생성자에 private 제한을 붙임
	private UserDAO() {
		try {
			Class.forName("oracle.jdbc.OracleDriver");

		} catch (Exception e) {e.printStackTrace();}

	}

	// 2. 자신의 클래스 내부에서 스스로의 객체를 1개 생성함.
	private static UserDAO dao = new UserDAO();

	// 3. 외부에서 객체 생성을 요구할 시 공개된 메서드를 통해 미리 만들어둔 단 하나의 객체를 리턴함.
	public static UserDAO getInstance() {
		if (dao != null) {
			dao = new UserDAO();
		}
		return dao;
	}

	// UserDAO 에서는 회원관리에 필요한 DB연동 로직들을 메서드로 나열하여 작성

	// DB에 회원가입 데이터를Isnert 하는메서드 선언

	public int join(UserVO users) {
		String sql = "Insert Into users values(?,?,?,?,?,?,?)";

		Connection conn = null;
		PreparedStatement pstmt = null;
		int rn = 0;

		try {
			conn = DriverManager.getConnection(url, uid, upw);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, users.getName());
			pstmt.setString(2, users.getId());
			pstmt.setString(3, users.getPw());
			pstmt.setString(4, users.getPhone1());
			pstmt.setString(5, users.getPhone2());
			pstmt.setString(6, users.getPhone3());
			pstmt.setString(7, users.getGender());

			rn = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null)	conn.close();
				if (pstmt != null)	pstmt.close();
			} catch (Exception e) {	e.printStackTrace();}
		}
		return rn;
	}

	// DB로부터 모든 회원정보를 가져오는 메서드 선언
	public List<UserVO> userSelectAll(){
			
		    List<UserVO> userList = new ArrayList<>(); //회원 객체들 보관 
		
			String sql ="select * from users";
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null; //select 문 
			
			try {
				conn = DriverManager.getConnection(url,upw,uid);
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					
					/* String name = rs.getString("name");
			        String id =rs.getString("id");
					String pw =rs.getString("pw");
					String phone1 =rs.getString("phone1");
					String phone2 =rs.getString("phone2");
					String phone3 =rs.getString("phone3");
					String gender =rs.getString("gender");  => 이 부분을 하단처럼 변경*/
					
				 UserVO users = new UserVO(
					rs.getString("name"),
					rs.getString("id"),
					rs.getString("pw"),
					rs.getString("phone1"),
					rs.getString("phone2"),
					rs.getString("phone3"),
				    rs.getString("gender"));
					
					userList.add(users);
				}
		
			}catch(Exception e) {e.printStackTrace();}
			finally {
				try{
					if(conn != null) conn.close();
					if(pstmt != null) pstmt.close();
				}catch(Exception e) {e.printStackTrace();}
			}
			return userList;
 			
  }
	//회원 탈퇴를 처리하는 메서드 선언
	public int userDelete(String id){
		int rn = 0;
		
		String sql = "delete from users where id=?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DriverManager.getConnection(url, uid, upw);
			pstmt = conn.prepareStatement(sql);
			 
			pstmt.setString(1, id);
			
			rn = pstmt.executeUpdate();
			
		}catch(Exception e) {e.printStackTrace();}
		finally {
			try {
				if(conn != null) conn.close();
				if(pstmt != null) pstmt.close();
			}catch(Exception e) {e.printStackTrace();}
		}
		return rn;
		
	}
}
