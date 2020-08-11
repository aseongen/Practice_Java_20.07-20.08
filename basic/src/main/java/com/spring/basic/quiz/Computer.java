package com.spring.basic.quiz;

import org.springframework.beans.factory.annotation.Autowired;

public class Computer {

   @Autowired
   private Monitor monitor;
   @Autowired
   private keyboard keyboard;
   @Autowired
   private Mouse mouse;
   
   //
   
  /*  @Autowired
   * public Computer(Monitor monitor, com.spring.basic.quiz.keyboard keyboard, Mouse mouse) {
	super();
	this.monitor = monitor;
	this.keyboard = keyboard;
	this.mouse = mouse;
} 하단과 같은 방법이고 이 자체에 @Autowired하면 한번에 적용된다.*/

public void computerInfo() {
	   System.out.println("***컴퓨터 정보***");
	   monitor.info();
	   keyboard.info();
	   mouse.info();
   }
	
}
