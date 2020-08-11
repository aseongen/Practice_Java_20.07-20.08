package com.spring.basic;

import org.springframework.context.support.GenericXmlApplicationContext;

public class HelloSpring {

	public static void main(String[] args) {

		//System.out.println("안뇽"); //console test
		
		//SpringTest 호출하려면 생성을 먼저 해야 한다.
		//SpringTest st = new SpringTest();
		//st.hello(); 
		
		GenericXmlApplicationContext ct =
				new GenericXmlApplicationContext("classpath:test-config.xml");
		
		SpringTest st = ct.getBean("test", SpringTest.class);
		st.hello();
		
		ct.close();
		
	}
}
