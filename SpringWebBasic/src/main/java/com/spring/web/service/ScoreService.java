package com.spring.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.web.model.ScoreVO;
import com.spring.web.repository.IScoreDAO;

//add -> interface -> IScoreDAO//
//controller - Service -> Repository : 컨트롤과 리포지터리 사이에 서비스가 생김 
//-> 따라서 의존관계 즉 Autowired 주입해줘야 한다.
@Service
public class ScoreService implements IScoreService {

	@Autowired //ScoreService 와 dao 는 Autowired로 의존관계 성립
	private IScoreDAO dao;
	
	@Override
	public void insertScore(ScoreVO scores) {
//		scores.setTotal(scores.getKor()+scores.getEng()+scores.getMath());
		//너무 길어서 차라리 총점 평균을 사전 VO에서 메서드로 만들어 호출만 하자
		scores.calcData();
		dao.insertScore(scores);
	}

	@Override
	public List<ScoreVO> selectAllScores() {
//		List<ScoreVO> list = dao.selectAllScores();
//		return dao.selectAllScores(); : 
//		           selectAllScores : dao의 service 점수 전체를 조회하는 메서드를 가져오기
//		return list; 
		return dao.selectAllScores(); //2. doa의 점수 전체 조회 하는 메서드 리턴
	}

	@Override
	public void deleteScore(int stuNum) {
     dao.deleteScore(stuNum);
	}

}
