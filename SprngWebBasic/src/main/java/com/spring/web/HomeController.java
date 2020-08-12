package com.spring.web;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	public HomeController() {
		System.out.println("RequestCon 작동!");
	}
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		//session.setAttribute // request.setAttribute
		model.addAttribute("serverTime", formattedDate );
		
		return "home"; //home -> home.jsp 파일이다
	}
	
	//http://localhost:8080/web/test url 입력시 실행
	//test.jsp를 열기위한 요청 메서드 구성
	@RequestMapping(value="/test",method=RequestMethod.GET)
	// /test 요청이 get로 들어오면 하단 실행
    public String test() {
       System.out.println("/test 요청이 들어옴: GET방식!!!");
    	return "test";
    }
	
	//@RequestMapping(value="/request/basic01", method=RequestMethod.GET) -> 회사에서는 이 방법을 조금 더 사용한다.
	@GetMapping("/request/basic01")
	public String basicGet() {
		System.out.println("/request/basic01 요청이 들어옴: GET ");
		return "request/req-ex01";
	}
	
//	@RequestMapping(value="/request/basic01", method=RequestMethod.POST)
	@PostMapping("/request/basic01")
	public String basicPost() {
		System.out.println("/request/basic01 요청이 들어옴: POST ");
		return "request/req-ex01";
	}
	
	
}
