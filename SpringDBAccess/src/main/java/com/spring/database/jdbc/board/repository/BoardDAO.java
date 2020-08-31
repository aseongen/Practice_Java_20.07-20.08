package com.spring.database.jdbc.board.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.spring.database.jdbc.board.model.BoardVO;

@Repository
public class BoardDAO implements IBoardDAO {

	@Autowired
	private JdbcTemplate template; //템플릿 사용을 위해 의존성 주입

	//내부 클래스 선언
	class BoardMapper implements RowMapper<BoardVO> {

		@Override
		public BoardVO mapRow(ResultSet rs, int rowNum) throws SQLException {
			BoardVO article = new BoardVO();
			article.setBoardNo(rs.getInt("board_no"));
			article.setWriter(rs.getString("writer"));
			article.setTitle(rs.getString("title"));
			article.setContent(rs.getString("content"));
			return article;
		}

	}	

	@Override
	public List<BoardVO> getArticles() {
		String sql = "SELECT * FROM jdbc_board ORDER BY board_no DESC";
		return template.query(sql, new BoardMapper());
	}

	@Override
	public void insertArticle(BoardVO article) {
		String sql = "INSERT INTO jdbc_board VALUES (jdbc_seq.nextval,?,?,?)";
		
		template.update(sql, article.getWriter()
				, article.getTitle(), article.getContent());
	}

	@Override
	public void deleteArticle(int index) {
		String sql = "DELETE FROM jdbc_board WHERE board_no=?";
		template.update(sql, index);
	}

	@Override
	public BoardVO getContent(int index) {
		String sql = "SELECT * FROM jdbc_board WHERE board_no=?";
		return template.queryForObject(sql, new BoardMapper(), index);
	}

	@Override
	public void modifyArticle(BoardVO article) {
		String sql = "UPDATE jdbc_board SET "
				+ "writer=?, title=?, content=? "
				+ "WHERE board_no=?";
		template.update(sql, article.getWriter(), 
				article.getTitle(), article.getContent(),
				article.getBoardNo());

	}
	
	@Override
	public List<BoardVO> getSearchList(String keyword) {
		System.out.println(keyword);
		String sql = "SELECT * FROM jdbc_board "
				+ "WHERE writer LIKE ? "
				+ "ORDER BY board_no DESC";
		return template.query(sql, new BoardMapper(), keyword);
	}


}











