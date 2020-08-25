package com.spring.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.spring.web.model.BoardVO;
import com.spring.web.repository.IBoardDAO;

@Service
@Repository
public class BoardService implements IBoardService {

	@Autowired
	private IBoardDAO dao;
	
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
		int index = boardNo - 1;
		dao.deleteArticle(index);
	}

	@Override
	public BoardVO getContent(int boardNo) {
		BoardVO contents = dao.getContent(boardNo - 1); //글번호 한개를 받아서 인덱스를 차단
		return contents;
	}

	@Override
	public void modifyArticle(BoardVO article, int boardNo) {
		dao.modifyArticle(article, boardNo-1);
	}

}




