package com.spring.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.web.model.UserVO;

@Controller("resCon")
@RequestMapping("/response")
public class ResponseController {

	@GetMapping("/res-ex01")
	public void resEx01() {
		
	}
	
	//Model 객체를 사용하여 화면에 데이터 전송하기 
	/*@GetMapping("/test")
	public void test(@RequestParam("age") int age, Model model) {
	//reqeustParam 받은 age를 int age 변수에 넣어서 출력 숫자는 res-ex01에서 다시 모델에 저장해서 test.jsp 로 전달
		model.addAttribute("nick", "뽀삐");
		model.addAttribute("age", age);
	
	}
	*/
	
	//2. @ModelAttribute 를 사용한 화면에 데이터 전송처리
	@GetMapping("/test")
	public void test(@ModelAttribute("age") int age, Model model) {
	//reqeustParam 받은 age를 int age 변수에 넣어서 출력 숫자는 res-ex01에서 다시 모델에 저장해서 test.jsp 로 전달
		model.addAttribute("nick", "뽀삐");
//		model.addAttribute("age", age);
	
	}
	
	//3. ModelAndView 객체릴 활용한 처리
	@GetMapping("/test2")
	public ModelAndView test1() {
		return new ModelAndView("/response/test2","userName","김철수");
	}
	
	//요청파라미터란?
	//클라이언트가 서버쪽으로 전송하는 데이터를 요청 
	
	//res-ex02.jsp 파일을 열람하는 요청메서드 작성 
	@GetMapping("/res-ex02")
	public void resEx02() {
		
	}
	@PostMapping("/join")
	public String join(UserVO user, Model model) {
		
		model.addAttribute("user",user);
		
		return "response/test3";
	}
	
	
}
