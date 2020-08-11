package com.spring.basic.ex04;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

public class Book {
/* 
 * #Resource 
 * - 빈을 자동 주입하는 어노테이션이다.
 * - 필드, 메서드에만 적용이 가능하며 생성자에서는 적용 불가능
 * - name 속성을 통해 특정 bean id를 지정할 수 있다.
 */
//	@Autowired
//	@Qualifier("paper2")
	@Resource(name="paper2")
	private Paper paper;
	
	public void setPaper(Paper paper) {
		this.paper = paper;
	}
	
	public Paper getPaper() {
		return paper;
	}
	
}
