package com.spring.database.mybatis.score.repository;

import java.util.List;

import com.spring.database.mybatis.score.model.ScoreVO;

public interface IScoreMapper {

	//점수 관리 프로그램 -> 관련된 기능들을 해당 인터페이스에 모두 넣어줌
	//점수 등록 기능
	void insertScore(ScoreVO scores);
	
	//점수 전체 조회 기능
	List<ScoreVO> selectAllScores();
	
	//점수 삭제 기능
	void deleteScore(int stuNum);
	
	//점수 개별 조회 기능
	ScoreVO selectOne(int stuNum);
}
