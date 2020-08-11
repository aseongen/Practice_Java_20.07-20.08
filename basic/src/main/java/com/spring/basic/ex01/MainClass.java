package com.spring.basic.ex01;

import org.springframework.context.support.GenericXmlApplicationContext;

public class MainClass {

	public static void main(String[] args) {
		
		/*Chef chef = new Chef();
		Restaurant res = new Restaurant(chef);
		Hotel hotel = new Hotel(new Restaurant(new Chef()));
		hotel.reserveRestaurant();
		*/
		
		GenericXmlApplicationContext ct 
		 = new GenericXmlApplicationContext("classpath:test-config.xml");
		//해당 설정 파일 처럼 행동해라 
		
		Hotel hotel = ct.getBean("hotel", Hotel.class);
		hotel.reserveRestaurant();
	}
}
