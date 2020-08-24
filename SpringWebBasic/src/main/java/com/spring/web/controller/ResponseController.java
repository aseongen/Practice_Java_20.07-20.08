package com.spring.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
//퀴즈
		//퀴즈화면처리
		@GetMapping("/res-quiz")
		public void res_quiz() {}
		
		//커맨드객체와  Model을 사용한 방식
		/*@PostMapping("/res-login")
		public String resLogin(UserVO vo, Model model) {
			String id = vo.getUserId();
			String pw = vo.getUserPw();
			
			model.addAttribute("userId", id); //아이디를 모델에 추가
			
			if(id.equals("kim123") && pw.equals("kkk1234")) {
				return "response/res-quiz-success";
			} else {
				return "response/res-quiz-fail";
			}
		}*/
		
		//@ModelAttribute를 사용한 방식
		@PostMapping("/res-login")
		public String resLogin(@ModelAttribute("userId") String id
							, @RequestParam("userPw") String pw) {	
		
			if(id.equals("kim123") && pw.equals("kkk1234")) {
				return "response/res-quiz-success";
			} else {
				return "response/res-quiz-fail";
			}
		}
		
		///////////////////////////////////////////////////////////
		
		//Redirect처리
		//로그인 화면 요청처리
		@GetMapping("/login")
		public String login() {
			System.out.println("/login : GET요청 발생!");
			return "response/res-redirect-form";
		}
		
		//로그인 검증처리
		@PostMapping("/login")
		public String login(@ModelAttribute("userId") String id
							, @RequestParam("userPw") String pw
							, @RequestParam("userPwChk") String pwChk
							, RedirectAttributes ra) {
			
			System.out.println("/login : POST요청 발생!");
			System.out.println("ID: " + id);
			System.out.println("PW: " + pw);
			System.out.println("CHK: " + pwChk);
			
			if(id.equals("")) {
				//session.setAttribute("msg", "아이디는 필수값이에요!");
				//model.addAttribute("msg", "아이디는 필수값이에요!");
				ra.addFlashAttribute("msg", "아이디는 필수값이에요!");
				return "redirect:/response/login";
			} else if(!pw.equals(pwChk)) {
				//session.setAttribute("msg", "비밀번호 확인란을 체크하세요!");
				//model.addAttribute("msg", "비밀번호 확인란을 체크하세요!");
				ra.addFlashAttribute("msg", "비밀번호 확인란을 체크하세요!");
				return "redirect:/response/login";
			} else if(id.equals("abc123") && pw.equals("1234")) {
				return "response/res-quiz-success";
			} else {		
				return null;
			}
		}
		

	}
	
