package com.spring.database.jdbc.score.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ScoreVO {

	private int stuId;
	private String stuName;
	private int kor;
	private int eng;
	private int math;
	private int total;
	private float average;
	
	//총점, 평균을 구하는 메서드
		public void calcData() {
			this.total = this.kor + this.eng + this.math;
			this.average = (float) (Math.round((this.total/3.0) *100)/100.0);
			//소수점 둘째 자리까지 파싱하는 방법 
			//ex)(this.total/3.0): 88.4323345456 ->88.4323345456 *100 ->8843.23345
			//(Math.round) : 8843 -> /100.0 -> 88.43
		}
	
	@Override
	public String toString() {
		return "ScoreVO [stu_id=" + stuId + ", stu_name=" + stuName + ", kor=" + kor + ", eng=" + eng + ", math="
				+ math + ", total=" + total + ", average=" + average + "]";
	}
	
	
	
}
