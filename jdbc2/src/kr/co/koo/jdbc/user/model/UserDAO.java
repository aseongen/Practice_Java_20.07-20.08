package kr.co.koo.jdbc.user.model;

import java.sql.*;
import java.util.*;

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

		} catch (Exception e) {
			e.printStackTrace();
		}

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
	
	//UserDAO 에서는 회원관리에 필요한 DB연동 로직들을 메서드로 나열하여 작성
	
}
