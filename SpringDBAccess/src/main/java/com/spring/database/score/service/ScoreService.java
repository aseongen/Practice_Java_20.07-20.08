package com.spring.database.score.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.database.jdbc.score.model.ScoreVO;
import com.spring.database.score.repository.IScoreDAO;

//add -> interface -> IScoreDAO//
//controller - Service -> Repository : 컨트롤과 리포지터리 사이에 서비스가 생김 
//-> 따라서 의존관계 즉 Autowired 주입해줘야 한다.
@Service
public class ScoreService implements IScoreService {

	@Autowired //ScoreService 와 dao 는 Autowired로 의존관계 성립
	private IScoreDAO dao;
	
	@Override
	public void insertScore(ScoreVO scores) {
		scores.calcData();
		dao.insertScore(scores);
	}

	@Override
	public List<ScoreVO> selectAllScores() {
		//List<ScoreVO> list = dao.selectAllScores();
		//return list;
		return dao.selectAllScores();
	}

	@Override
	public void deleteScore(int stuNum) {
//		dao.deleteScore(stuNum - 1);
		dao.deleteScore(stuNum);
	}

	@Override
	public ScoreVO selectOne(int stuNum) {
		return dao.selectOne(stuNum);
	}

}

