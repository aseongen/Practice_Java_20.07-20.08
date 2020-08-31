package com.spring.database.score.repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.spring.database.jdbc.score.commons.ScoreMapper;
import com.spring.database.jdbc.score.model.ScoreVO;

//add -> interface -> IScoreDAO
//Component == controller == Repository == Service 중 1가지 사용하면 됨 => 빈 등록

@Repository("sDao1")
public class ScoreDAO implements IScoreDAO {
	
	 class ScoreMapper implements RowMapper<ScoreVO>{
     //클래스 안에 클래스를 만들어서 사용한다. ->클래스를 만들어주지 않아도 된다.
		@Override
		public ScoreVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		
			//mapRow 역할: ResultSet을 넣어주면 테이블 결과를 넣어준다.(전체)
			ScoreVO score = new ScoreVO();
			score.setStuId(rs.getInt("stu_id"));
			score.setStuName(rs.getString("stu_name"));
			score.setKor(rs.getInt("kor"));
			score.setEng(rs.getInt("math"));
			score.setMath(rs.getInt("math"));
			score.setTotal(rs.getInt("total"));
			score.setAverage(rs.getFloat("average"));
			return score;
		}
	}
	
	/*
	//#전통적 방식의 JDBC
	private String driver = "oracle.jdbc.OracleDriver";
	private String url= "jdbc:oracle:thin:@localhost:1521:xe";
	private String uid = "week";
	private String upw = "week";*/
/*	
	@Override
	public void insertScore(ScoreVO scores) {
    System.out.println("Repository param: " + scores); 
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String sql = "INSERT INTO scores (stuName, kor, eng, math, total, average) VALUES (?,?,?,?,?,?)";
	
	try {
		Class.forName(driver);
		conn = DriverManager.getConnection(url, uid, upw);
		pstmt = conn.prepareStatement(sql);
		System.out.println(conn);
		System.out.println(pstmt);
		
		pstmt.setString(1, scores.getStu_name());
		pstmt.setInt(2, scores.getKor());
		pstmt.setInt(3, scores.getEng());
		pstmt.setInt(4, scores.getMath());
		pstmt.setInt(5, scores.getTotal());
		pstmt.setFloat(6, scores.getAverage());
		
		pstmt.executeUpdate();
		System.out.println("점수 등록 성공!");
		
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		try {
			conn.close(); pstmt.close();
		} catch (Exception e2) {
			e2.printStackTrace();
		}
	}

}*/
	
	//#Spring- jdbc방식의 처리:jdbcTemplate 사용
	@Autowired //
	private JdbcTemplate template;
	
	@Override
	public void insertScore(ScoreVO scores) {
		String sql = "INSERT INTO scores VALUES (scores_seq.nextval,?,?,?,?,?,?)";
		template.update(sql,scores.getStuName(),scores.getKor(),scores.getEng(),scores.getMath(),scores.getTotal(),scores.getAverage());
		//template 메서드 기능 
	}

	//1. 점수 전체 조회를 처리하는 Repository
/*
	@Override
	public List<ScoreVO> selectAllScores() {
		
		List<ScoreVO> list = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM scores";
		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, uid, upw);
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ScoreVO vo = new ScoreVO();
				vo.setStuId(rs.getInt("stu_id"));
				vo.setStuName(rs.getString("stu_name"));
				vo.setKor(rs.getInt("kor"));
				vo.setEng(rs.getInt("eng"));
				vo.setMath(rs.getInt("math"));
				vo.setTotal(rs.getInt("total"));
				vo.setAverage(rs.getFloat("average"));
				
				list.add(vo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close(); pstmt.close(); rs.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return list;
	}
*/
	@Override
	public List<ScoreVO> selectAllScores() {
		String sql = "SELECT * FROM scores";
		return template.query(sql, new ScoreMapper());
		/*return template.query(sql, 
				(rs,rowNum) -> {
				new RowMapper<ScoreVO>() {
			@Override
			public ScoreVO mapRow(ResultSet rs, int rowNum) throws SQLException {
				//람다식 => 클래스를 만들지 말고 아예 익명클래스로 작성 해서 진행
				//mapRow 역할: ResultSet을 넣어주면 테이블 결과를 넣어준다.(전체) 
				ScoreVO score = new ScoreVO();
				score.setStuId(rs.getInt("stu_id"));
				score.setStuName(rs.getString("stu_name"));
				score.setKor(rs.getInt("kor"));
				score.setEng(rs.getInt("math"));
				score.setMath(rs.getInt("math"));
				score.setTotal(rs.getInt("total"));
				score.setAverage(rs.getFloat("average"));
				return score;
		}); */
		
/*		List<ScoreVO> list = template.query(sql, new ScoreMapper()); 
        * query : rowMapper을 가져올것
		* 기존 목록 가져올때 while 돌리는대 이것을 rowMapper이 역할을 한다.
		ScoreMapper sm = new ScoreMapper();
		return template.query(sql, new RowMapper<ScoreVO>() {
			
		}); */
	}
	
	@Override
	public void deleteScore(int stuNum) {		
		String sql = "DELETE FROM scores WHERE stu_id=?";
		template.update(sql, stuNum);	
	}

/*	@Override
	public ScoreVO selectOne(int stuNum) {
		
		ScoreVO score = new ScoreVO();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM scores WHERE stu_id=?";
		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, uid, upw);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, stuNum);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				score.setStuId(rs.getInt("stu_id"));
				score.setStuName(rs.getString("stu_name"));
				score.setKor(rs.getInt("kor"));
				score.setEng(rs.getInt("eng"));
				score.setMath(rs.getInt("math"));
				score.setTotal(rs.getInt("total"));
				score.setAverage(rs.getFloat("average"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close(); pstmt.close(); rs.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return score;
	} */
	
	@Override
	public ScoreVO selectOne(int stuNum) {

		String sql = "SELECT * FROM scores WHERE stu_id=?";
		
		//queryForObject : Single row를 리턴할 때 사용한다.
		//query는 multi row를 리턴할 때 사용합니다.
		//scoreMapper -> DAO에서만 사용예정 
		return template.queryForObject(sql, new ScoreMapper(), stuNum);
		
	}
}