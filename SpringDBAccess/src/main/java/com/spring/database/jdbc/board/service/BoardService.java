package com.spring.database.jdbc.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.database.jdbc.board.model.BoardVO;
import com.spring.database.jdbc.board.repository.IBoardDAO;
import com.spring.database.jdbc.board.repository.IBoardMapper;

@Service
public class BoardService implements IBoardService {

	//JDBC Template을 이용한 SQL처리
//	@Autowired
//	private IBoardDAO dao;
	
	//MyBatis를 이용한 SQL처리
	@Autowired
	private IBoardMapper dao;
	
	@Override
	public List<BoardVO> getArticles() {
		return dao.getArticles();
	}

	@Override
	public void insertArticle(BoardVO article) {
		dao.insertArticle(article);
	}

	@Override
	public void deleteArticle(int boardNo) {
		dao.deleteArticle(boardNo);
	}

	@Override
	public BoardVO getContent(int boardNo) {
		BoardVO contents = dao.getContent(boardNo);
		return contents;
	}

	@Override
	public void modifyArticle(BoardVO article) {
		dao.modifyArticle(article);
	}

	@Override
	public List<BoardVO> getSearchList(String keyword) {
		keyword = "%" + keyword + "%";
		return dao.getSearchList(keyword);
	}
	
}









