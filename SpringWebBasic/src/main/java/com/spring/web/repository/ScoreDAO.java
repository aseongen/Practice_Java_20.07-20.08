package com.spring.web.repository;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.spring.web.model.ScoreVO;

//add -> interface -> IScoreDAO
//Component == controller == Repository == Service 중 1가지 사용하면 됨 => 빈 등록

@Repository
public class ScoreDAO implements IScoreDAO {
	
	//학생들의 점수 정보를 저장할 리스트 생성(DB 대용) // scoreList -> DB테이블 이다
	private List<ScoreVO> scoreList = new ArrayList<>();
	
	@Override
	public void insertScore(ScoreVO scores) {
    System.out.println("Repository param: " + scores); 
    //scores가 정상적으로 작동되는지 확인 
    scoreList.add(scores); // DB인 scoreList에 해당 받은 정보를 주입 
	}
	
	//1. 점수 전체 조회를 처리하는 Repository
	@Override
	public List<ScoreVO> selectAllScores() {
		return scoreList;//점수들 객체 전부 리턴
		//컨틀롤러 -> service -> dao 순으로 점수 입력한 값을 받아 저장하면
		//해당 점수 입력한 값들을 조회할 때는 역방향으로 흘러간다.
	}

	@Override
	public void deleteScore(int stuNum) {
       scoreList.remove(stuNum -1);
	}

}
