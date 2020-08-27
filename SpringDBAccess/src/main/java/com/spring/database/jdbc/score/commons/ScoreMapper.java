package com.spring.database.jdbc.score.commons;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.spring.database.jdbc.score.model.ScoreVO;

//jdbc template 에서 ResultTest 사용을 편하게 하기위한 클래스 생성
public class ScoreMapper implements RowMapper<ScoreVO>{

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
