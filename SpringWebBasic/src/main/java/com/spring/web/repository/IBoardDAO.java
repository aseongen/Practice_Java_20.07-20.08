package com.spring.web.repository;

import java.util.List;

import com.spring.web.model.BoardVO;

public interface IBoardDAO {
	
	//게시글 목록 가져오기
	List<BoardVO> getArticles();

	// 게시글 등록기능
	void insertArticle(BoardVO article); // BoardVO의 기능을 Article 에 insert 한다

	// 게시글 삭제
	void deleteArticle(int index); // 글번호로 삭제할 예정

	// 게시글 내용보기
	BoardVO getContent(int index); // 번호로 내용을 선택하고, 특정 게시글의 내용을 확인하고 싶을때

	// 게시글 수정
	void modifyArticle(BoardVO article, int index);// 제목, 작성자, 내용 등 어떻게 수정할건지 -> 몇번글 수정할건지도 알려줘

}
